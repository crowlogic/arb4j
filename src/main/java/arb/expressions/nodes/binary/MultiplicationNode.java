package arb.expressions.nodes.binary;

import static arb.expressions.nodes.binary.Integration.*;
import static java.lang.String.format;

import java.util.ArrayList;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.FunctionalEvaluationNode;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * Represents a multiplication operation node in the expression tree. Implements
 * integration by parts for polynomial × exp/trig products.
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (result == null)
    {
      result = Utensils.newInstance(resultType);
    }
    T leftValue = left.evaluate(resultType, bits, Utensils.newInstance(resultType));
    T rightValue = right.evaluate(resultType, bits, Utensils.newInstance(resultType));
    return (T) leftValue.mul(rightValue, bits, Utensils.newInstance(resultType));
  }

  public static final Logger logger = LoggerFactory.getLogger(MultiplicationNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public boolean isZero()
  {
    return left.isZero() || right.isZero();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    return super.generate(mv, resultType);
  }

  public MultiplicationNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "mul",
          right,
          "*");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    var a   = left.differentiate(variable).mul(right);
    var b   = right.differentiate(variable).mul(left);
    var sum = a.add(b);
    return sum;
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    // Simplify first -- catches e.g. (x-a)*δ(x-a) = 0
    Node<D, R, F> simplified = this.simplify();
    if (simplified.isZero())
    {
      return simplified;
    }
    if (!simplified.equals(this))
    {
      return simplified.integral(variable);
    }

    // Flatten the product tree into individual factors
    var factors = new ArrayList<Node<D, R, F>>();
    collectFactors(this, factors);

    // constant factors are ones that don't depend on integration variable and
    // can thus be pulled out of the integrand , resulting in a more efficient
    // equivalent computation
    var constantFactors = new ArrayList<Node<D, R, F>>();
    var variableFactors = new ArrayList<Node<D, R, F>>();
    for (var factor : factors)
    {
      if (factor.isScalar() && !factor.dependsOn(variable))
      {
        constantFactors.add(factor);
      }
      else
      {
        variableFactors.add(factor);
      }
    }

    // Pull out constant factors: ∫ c·f(t) dt = c · ∫ f(t) dt
    if (!constantFactors.isEmpty() && !variableFactors.isEmpty())
    {
      var constantProduct = buildProduct(constantFactors);
      var variableProduct = buildProduct(variableFactors);
      return constantProduct.mul(variableProduct.integral(variable)).simplify();
    }

    // If any factor is a Polynomial-typed function application at the integration
    // variable, multiply the polynomial by the remaining cofactor at the polynomial
    // level and integrate the product analytically via PolynomialIntegralNode.
    FunctionalEvaluationNode<D, R, F> polyFactor   = null;
    var                               cofactorList = new ArrayList<Node<D, R, F>>();
    for (var f : variableFactors)
    {
      // FIXME: handle the case when the argument to the FunctionalEvaluationNode is
      // some function of the variable rather than strictly equal to the variable
      // itself
      if (polyFactor == null && f instanceof FunctionalEvaluationNode<D, R, F> fe
                    && Polynomial.class.isAssignableFrom(fe.getFunctionNode().type())
                    && fe.arg.equals(variable))
      {
        polyFactor = fe;
      }
      else
      {
        cofactorList.add(f);
      }
    }
    if (polyFactor != null)
    {
      var cofactor = cofactorList.isEmpty() ? null : buildProduct(cofactorList);
      return new PolynomialIntegralNode<>(expression,
                                          polyFactor.getFunctionNode(),
                                          cofactor,
                                          variable);
    }

    // Try step function integration: ∫ f(x)·θ(x) dx = θ(x) · ∫ f(x) dx (#841)
    var stepResult = integrateStepFunction(variableFactors, variable);
    if (stepResult != null)
    {
      return stepResult.simplify();
    }

    // All factors depend on the variable -- try IBP on all 2-partitions
    var ibpResult = integrateByParts(variableFactors, variable);
    if (ibpResult != null)
    {
      Node<D, R, F> simplifiedIbpResult = ibpResult.simplify();
      assert simplifiedIbpResult != null : "simplifiedIbpResult is null for " + this;
      return simplifiedIbpResult;
    }

    throw new CompilerException(String.format("TODO: support for integration of %s where %s is a %s-valued %s and %s is a %s-valued %s in %s",
                                              this,
                                              left,
                                              left.type().getSimpleName(),
                                              left.getClass().getSimpleName(),
                                              right,
                                              right.type().getSimpleName(),
                                              right.getClass().getSimpleName(),
                                              expression));
  }

  /**
   * @return true if {@link Expression#coDomainType} is not a {@link Quaternion}
   */
  @Override
  public boolean isCommutative()
  {
    return !expression.coDomainType.equals(Quaternion.class);
  }

  private String debugNode(Node<D, R, F> n)
  {
    if (n == null)
    {
      return "null";
    }

    String cls = n.getClass().getSimpleName();
    int    id  = System.identityHashCode(n);
    String s   = String.valueOf(n);

    String extra = "";
    if (n instanceof LiteralConstantNode<?, ?, ?> lc)
    {
      extra = ", stringValue=" + lc.stringValue
                    + ", isInt=" + lc.isInt
                    + ", isFraction=" + lc.isFraction
                    + ", isDecimal=" + lc.isDecimal;
    }

    Class<?> t = null;
    try
    {
      t = n.type();
    }
    catch (Throwable ignored)
    {
      // debug only; never let tracing change semantics
      t = null;
    }

    return t == null ? (cls + "@" + id + "(" + s + extra + ")")
                     : (cls + "@" + id + "<" + t.getSimpleName() + ">(" + s + extra + ")");
  }

  @Override
  public Node<D, R, F> simplify()
  {
    simplifyDepth++;
    if (traceSimplify)
    {
      System.err.printf("%s[%d] ENTER MultiplicationNode.simplify() this=%s left=%s right=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        System.identityHashCode(this),
                        debugNode(left),
                        debugNode(right));
    }

    if (left != null)
    {
      var oldLeft = left;
      left = left.simplify();
      if (traceSimplify && left != oldLeft)
      {
        System.err.printf("%s[%d]   left changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          debugNode(oldLeft),
                          debugNode(left));
      }
    }
    if (right != null)
    {
      var oldRight = right;
      right = right.simplify();
      if (traceSimplify && right != oldRight)
      {
        System.err.printf("%s[%d]   right changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          debugNode(oldRight),
                          debugNode(right));
      }
    }

    if (left.isZero() || right.isZero())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   -> returning zero()%n", depthIndent(), simplifyDepth);
      }
      simplifyDepth--;
      return zero();
    }

    if (left.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isOne() -> returning right=%s%n",
                          depthIndent(),
                          simplifyDepth,
                          debugNode(right));
      }
      simplifyDepth--;
      return right;
    }
    if (right.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isOne() -> returning left=%s%n",
                          depthIndent(),
                          simplifyDepth,
                          debugNode(left));
      }
      simplifyDepth--;
      return left;
    }
    if (left.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isNegOne() -> returning right.neg()%n",
                          depthIndent(),
                          simplifyDepth);
      }
      simplifyDepth--;
      return right.neg();
    }
    if (right.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isNegOne() -> returning left.neg()%n",
                          depthIndent(),
                          simplifyDepth);
      }
      simplifyDepth--;
      return left.neg();
    }

    var deltaSimplification = simplifyDeltaMultiplication();
    if (deltaSimplification != null)
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   delta simplification -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          debugNode(deltaSimplification));
      }
      simplifyDepth--;
      return deltaSimplification;
    }

    if (left instanceof LiteralConstantNode<D, R, F> leftConstant
                  && right instanceof LiteralConstantNode<D, R, F> rightConstant)
    {
      if (leftConstant.isInt && rightConstant.isInt)
      {
        try ( var lint = new Integer(leftConstant.stringValue);
              var rint = new Integer(rightConstant.stringValue))
        {
          var product = lint.mul(rint, 0, rint);
          if (traceSimplify)
          {
            System.err.printf("%s[%d]   integer folding: %s * %s = %s%n",
                              depthIndent(),
                              simplifyDepth,
                              leftConstant.stringValue,
                              rightConstant.stringValue,
                              product);
          }
          simplifyDepth--;
          return expression.newLiteralConstant(product.toString());
        }
      }
    }

    if (left instanceof ExponentiationNode<D, R, F> leftExp
                  && right instanceof ExponentiationNode<D, R, F> rightExp)
    {
      var leftBase  = leftExp.left;
      var rightBase = rightExp.left;
      if (leftBase.equals(rightBase))
      {
        var rightPower = rightExp.right;
        var leftPower  = leftExp.right;
        var power      = leftPower.add(rightPower).simplify();
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   exponent addition: base^(%s+%s)%n",
                            depthIndent(),
                            simplifyDepth,
                            leftPower,
                            rightPower);
        }
        simplifyDepth--;
        return leftBase.pow(power).simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsExponentialFunction  = leftFunction.is("exp");
      var rightIsExponentialFunction = rightFunction.is("exp");

      if (leftIsExponentialFunction && rightIsExponentialFunction)
      {
        var exponentSum = leftFunction.arg.add(rightFunction.arg).simplify();
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   exp multiplication: exp(%s+%s)%n",
                            depthIndent(),
                            simplifyDepth,
                            leftFunction.arg,
                            rightFunction.arg);
        }
        simplifyDepth--;
        return exponentSum.exp().simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction2
                  && right instanceof FunctionNode<D, R, F> rightFunction2)
    {
      var leftIsSquareRootFunction = leftFunction2.is("sqrt");
      var functionsAreEqual        = leftFunction2.equals(rightFunction2);

      if (leftIsSquareRootFunction && functionsAreEqual)
      {
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   sqrt*sqrt -> arg%n", depthIndent(), simplifyDepth);
        }
        simplifyDepth--;
        return leftFunction2.arg;
      }
    }

    // Combine fractions: (a/b) * (c/d) → (a*c)/(b*d)
    if (left instanceof DivisionNode<D, R, F> leftDiv
                  && right instanceof DivisionNode<D, R, F> rightDiv)
    {
      var numerator   = leftDiv.left.mul(rightDiv.left).simplify();
      var denominator = leftDiv.right.mul(rightDiv.right).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   fraction combine: (%s/%s)*(%s/%s) → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          leftDiv.left,
                          leftDiv.right,
                          rightDiv.left,
                          rightDiv.right,
                          numerator,
                          denominator);
      }
      simplifyDepth--;
      return numerator.div(denominator).simplify();
    }

    // Pull fraction right: expr * (a/b) → (expr*a)/b
    if (right instanceof DivisionNode<D, R, F> rightDiv)
    {
      var numerator = left.mul(rightDiv.left).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   pull fraction right: %s*(%s/%s) → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          left,
                          rightDiv.left,
                          rightDiv.right,
                          numerator,
                          rightDiv.right);
      }
      simplifyDepth--;
      return numerator.div(rightDiv.right).simplify();
    }

    // Pull fraction left: (a/b) * expr → (a*expr)/b
    if (left instanceof DivisionNode<D, R, F> leftDiv)
    {
      var numerator = leftDiv.left.mul(right).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   pull fraction left: (%s/%s)*%s → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          leftDiv.left,
                          leftDiv.right,
                          right,
                          numerator,
                          leftDiv.right);
      }
      simplifyDepth--;
      return numerator.div(leftDiv.right).simplify();
    }

    if (traceSimplify)
    {
      System.err.printf("%s[%d] EXIT MultiplicationNode.simplify() returning this=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        debugNode(this));
    }
    simplifyDepth--;
    return this;
  }

  /**
   * Applies the sifting property of the Dirac delta function: f(x) * δ(x-a) =
   * f(a) * δ(x-a)
   *
   * Substitutes the delta function's root into the multiplier to obtain the
   * constant f(a). Returns f(a)*δ(x-a), or zero when f(a)=0.
   *
   * @return the simplified node, or null if no delta function is present or the
   *         argument pattern is unrecognized
   */
   private Node<D, R, F> simplifyDeltaMultiplication()
  {
    FunctionNode<D, R, F> delta      = null;
    Node<D, R, F>         multiplier = null;

    if (left.isFunction() && left.asFunction().isDeltaFunction())
    {
      delta      = left.asFunction();
      multiplier = right;
    }
    else if (right.isFunction() && right.asFunction().isDeltaFunction())
    {
      delta      = right.asFunction();
      multiplier = left;
    }
    else
    {
      return null;
    }

    var                   deltaArg   = delta.arg;

    VariableNode<D, R, F> variable   = multiplier.expression.getIndependentVariable();

    Node<D, R, F>         deltaShift = Integration.extractShiftFromDeltaArg(deltaArg, variable);
    if (deltaShift == null)
    {
      return null;
    }

    var evaluated = multiplier.substitute(variable.getName(), deltaShift).simplify();

    if (evaluated.isZero())
    {
      return zero();
    }

    return evaluated.simplify().mul(delta);
  }


  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert left != null : this + ".left is null";
    assert right != null : this + ".right is null";
    return left.spliceInto(newExpression).mul(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return format("\\left(%s \\cdot %s\\right)", left.typeset(), right.typeset());
  }
}
