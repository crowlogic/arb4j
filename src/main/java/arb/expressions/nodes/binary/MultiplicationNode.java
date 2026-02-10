package arb.expressions.nodes.binary;

import static arb.expressions.nodes.binary.Integration.*;
import static java.lang.String.format;

import java.util.ArrayList;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Integer;
import arb.Polynomial;
import arb.Quaternion;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.FunctionalEvaluationNode;
import arb.functions.Function;

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

  /**
   * Integrates a product using integration by parts when applicable.
   * 
   * For products of the form p(x)·f(x) where p(x) is a polynomial and f(x) is
   * exp, sin, cos, or log, uses the tabular method:
   * 
   * ∫ u dv = uv - ∫ v du
   * 
   * The tabular method repeatedly differentiates the polynomial (which eventually
   * becomes zero) while integrating the transcendental function.
   * 
   * @param variable The variable of integration
   * @return The integrated expression
   */
  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // Simplify first -- catches e.g. (x-a)*δ(x-a) = 0
    Node<D, R, F> simplified = this.simplify();
    if (simplified.isZero())
    {
      return simplified;
    }
    if (!simplified.equals(this))
    {
      return simplified.integrate(variable);
    }

    // Flatten the product tree into individual factors
    var factors = new ArrayList<Node<D, R, F>>();
    collectFactors(this, factors);

    // Separate constant factors (don't depend on integration variable) from the
    // rest
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

    // If we have constant factors, pull them out: ∫ c·f(t) dt = c · ∫ f(t) dt
    if (!constantFactors.isEmpty() && !variableFactors.isEmpty())
    {
      var constantProduct = buildProduct(constantFactors);
      var variableProduct = buildProduct(variableFactors);
      return constantProduct.mul(variableProduct.integrate(variable)).simplify();
    }

    // Try step function integration: ∫ f(x)·θ(x) dx = θ(x) · ∫ f(x) dx (#841)
    var stepResult = tryStepFunctionIntegration(variableFactors, variable);
    if (stepResult != null)
    {
      return stepResult.simplify();
    }

    // All factors depend on the variable -- try IBP on all 2-partitions
    var ibpResult = tryIntegrationByPartsOnFactors(variableFactors, variable);
    if (ibpResult != null)
    {
      Node<D, R, F> simplifiedIbpResult = ibpResult.simplify();
      assert simplifiedIbpResult != null : "simplifiedIbpResult is null for " + this;
      return simplifiedIbpResult;
    }

    // Check if one factor is a FunctionalEvaluationNode whose function type
    // implements Polynomial (RealPolynomial or ComplexPolynomial), evaluated at
    // the integration variable. If so, all remaining factors become the cofactor
    // and we delegate to PolynomialIntegralNode which handles the multiplication
    // and integration at runtime via Polynomial.mul + Polynomial.integral (#835)
    var polyFactor = identifyPolynomialFunctionEvaluation(variableFactors, variable);
    if (polyFactor != null)
    {
      @SuppressWarnings("unchecked")
      var funcEval     = (FunctionalEvaluationNode<D, R, F>) polyFactor;
      var otherFactors = new ArrayList<>(variableFactors);
      otherFactors.remove(polyFactor);
      var cofactor = otherFactors.isEmpty() ? null : buildProduct(otherFactors);

      return new PolynomialIntegralNode<>(expression,
                                          funcEval.getFunctionNode(),
                                          cofactor,
                                          variable);
    }

    throw new CompilerException("TODO: quit being an idiot and implement support to integrate "
                                + this);
  }

  /**
   * @return true if {@link Expression#coDomainType} is not a {@link Quaternion}
   */
  @Override
  public boolean isCommutative()
  {
    return !expression.coDomainType.equals(Quaternion.class);
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
                        left,
                        right);
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
                          oldLeft,
                          left);
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
                          oldRight,
                          right);
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
                          right);
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
                          left);
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
                          deltaSimplification);
      }
      simplifyDepth--;
      return deltaSimplification;
    }

    if (left instanceof LiteralConstantNode<D, R, F> leftConstant
                  && right instanceof LiteralConstantNode<D, R, F> rightConstant)
    {
      if (leftConstant.isInt && rightConstant.isInt)
      {
        try ( var lint = new Integer(leftConstant.value);
              var rint = new Integer(rightConstant.value))
        {
          var product = lint.mul(rint, 0, rint);
          if (traceSimplify)
          {
            System.err.printf("%s[%d]   integer folding: %s * %s = %s%n",
                              depthIndent(),
                              simplifyDepth,
                              leftConstant.value,
                              rightConstant.value,
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
                        this);
    }
    simplifyDepth--;
    return this;
  }

  /**
   * Simplifies expressions of the form (x-a)^n * δ(x-a) = 0
   * 
   * Implements the mathematical rule that any polynomial in (x-a) multiplied by
   * δ(x-a) equals zero, since the polynomial vanishes at the delta function's
   * singularity point x=a.
   * 
   * @return zero() if the pattern matches, null otherwise
   */
  private Node<D, R, F> simplifyDeltaMultiplication()
  {
    // Check if either operand is a delta function
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
      return null; // No delta function present
    }

    // Extract the delta function's argument
    var                   deltaArg = delta.arg;

    // Find the variable involved
    VariableNode<D, R, F> variable = multiplier.extractVariable();
    if (variable == null)
    {
      variable = deltaArg.extractVariable();
    }
    if (variable == null)
    {
      return null; // No variable found
    }

    // Extract shift from delta argument: δ(x) has shift=0, δ(x-a) has shift=a
    Node<D, R, F> deltaShift = Integration.extractShiftFromDeltaArg(deltaArg, variable);
    if (deltaShift == null)
    {
      return null; // Delta argument doesn't match expected pattern
    }

    // Check if multiplier is a polynomial in (x - deltaShift)
    if (isPolynomialInShiftedVariable(multiplier, variable, deltaShift))
    {
      return zero();
    }

    return null;
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
