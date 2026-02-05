package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("unchecked")
public class DivisionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         BinaryOperationNode<D, R, F>
{

  @Override
  public boolean isZero()
  {
    return left == null || left.isZero();
  }

  static
  {
    assert arb.Integer.class.equals(Integer.class) : "you forgot to import arb.Integer";
  }

  public DivisionNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "div",
          right,
          "/");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    var lhs     = left.differentiate(variable).mul(right);
    var rhs     = right.differentiate(variable).mul(left);
    var divisor = right.pow(2);
    return lhs.sub(rhs).div(divisor).simplify();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> requestedResultType)
  {
    throwExceptionIfRequestedTypeDoesNotContainTheCoDomain(requestedResultType);
    return super.generate(mv, requestedResultType);
  }

  /**
   * Extract ax² + bx + c. Handles terms like x², -x², 5x², x, 3, etc.
   */
  private QuadraticCoefficients<D, R, F>
          extractQuadraticCoefficients(Node<D, R, F> node, VariableNode<D, R, F> variable)
  {
    Node<D, R, F>                 coeffA = null;
    Node<D, R, F>                 coeffB = null;
    Node<D, R, F>                 coeffC = null;

    java.util.List<Node<D, R, F>> terms  = flattenAdditiveTerms(node);

    for (var term : terms)
    {
      if (isQuadraticIn(term, variable))
      {
        var coeff = extractQuadraticCoefficient(term, variable);
        coeffA = coeffA == null ? coeff : coeffA.add(coeff);
      }
      else if (isLinearIn(term, variable))
      {
        var coeff = extractLinearCoefficient(term, variable);
        coeffB = coeffB == null ? coeff : coeffB.add(coeff);
      }
      else if (term.isIndependentOf(variable))
      {
        coeffC = coeffC == null ? term : coeffC;
      }
      else
      {
        return null;
      }
    }

    if (coeffA == null)
    {
      coeffA = zero();
    }
    if (coeffB == null)
    {
      coeffB = zero();
    }
    if (coeffC == null)
    {
      coeffC = zero();
    }

    if (coeffA.isZero() && coeffB.isZero())
    {
      return null;
    }

    return new QuadraticCoefficients<>(coeffA,
                                       coeffB,
                                       coeffC,
                                       variable);
  }

  /**
   * Robust check for quadratic terms. Returns true for: x², -x², 5*x², x²*5
   */
  private boolean isQuadraticIn(Node<D, R, F> term, VariableNode<D, R, F> variable)
  {
    // Case A: strictly x²
    if (term.isVariableSquared(variable))
    {
      return true;
    }

    // Case B: c * x² or x² * c
    if (term instanceof MultiplicationNode<D, R, F> mul)
    {
      // Check if one side is x² and the other is constant
      boolean leftIsSquare = mul.left.isVariableSquared(variable);
      boolean rightIsConst = mul.right.isIndependentOf(variable);

      if (leftIsSquare && rightIsConst)
      {
        return true;
      }

      boolean rightIsSquare = mul.right.isVariableSquared(variable);
      boolean leftIsConst   = mul.left.isIndependentOf(variable);

      if (rightIsSquare && leftIsConst)
      {
        return true;
      }
    }

    return false;
  }

  /**
   * Extracts the 'a' from 'ax²'.
   */
  private Node<D, R, F> extractQuadraticCoefficient(Node<D, R, F> term,
                                                    VariableNode<D, R, F> variable)
  {
    // If it's just x², coefficient is 1
    if (term.isVariableSquared(variable))
    {
      return one();
    }

    // If it's c*x², coefficient is c
    if (term instanceof MultiplicationNode<D, R, F> mul)
    {
      if (mul.left.isVariableSquared(variable))
      {
        return mul.right;
      }
      if (mul.right.isVariableSquared(variable))
      {
        return mul.left;
      }
    }

    // Should not happen if isQuadraticIn checked out, but default to 0
    return zero();
  }

  /**
   * Flatten ax + by + ... - cz into a list of terms with signs. Handles
   * AdditionNode and SubtractionNode recursively.
   */
  private java.util.List<Node<D, R, F>> flattenAdditiveTerms(Node<D, R, F> node)
  {
    java.util.List<Node<D, R, F>> terms = new java.util.ArrayList<>();

    if (node instanceof AdditionNode<D, R, F> add)
    {
      terms.addAll(flattenAdditiveTerms(add.left));
      terms.addAll(flattenAdditiveTerms(add.right));
    }
    else if (node instanceof SubtractionNode<D, R, F> sub)
    {
      terms.addAll(flattenAdditiveTerms(sub.left));
      // Right side of subtraction is negated
      Node<D, R, F> negatedRight = sub.right.mul(negativeOne());
      terms.addAll(flattenAdditiveTerms(negatedRight));
    }
    else
    {
      terms.add(node);
    }

    return terms;
  }

  /**
   * Check if term is exactly x or a constant multiple of x.
   */
  private boolean isLinearIn(Node<D, R, F> term, VariableNode<D, R, F> variable)
  {
    if (term.equals(variable))
    {
      return true;
    }

    if (term instanceof MultiplicationNode<D, R, F> mul)
    {
      return (mul.left.isIndependentOf(variable) && mul.right.equals(variable))
                    || (mul.right.isIndependentOf(variable) && mul.left.equals(variable));
    }

    return false;
  }

  /**
   * Extract coefficient c from cx (or c·x).
   */
  private Node<D, R, F> extractLinearCoefficient(Node<D, R, F> term, VariableNode<D, R, F> variable)
  {
    if (term.equals(variable))
    {
      return one();
    }

    if (term instanceof MultiplicationNode<D, R, F> mul)
    {
      if (mul.left.equals(variable) && mul.right.isIndependentOf(variable))
      {
        return mul.right;
      }
      if (mul.right.equals(variable) && mul.left.isIndependentOf(variable))
      {
        return mul.left;
      }
    }

    return zero();
  }

  /**
   * TODO: generalize this to include more simplifcaiton<br>
   * The indefinite integral ∫ 1⁄(1−x²)^(1⁄k)dx has a closed form involving the
   * **Gauss hypergeometric function** ₂F₁, and for some k (e.g. k = 2), yields
   * elementary functions like arcsin. <br>
   * The general result is: ∫ 1⁄(1−x²)^(1⁄k)dx = x · ₂F₁(½, 1⁄k; 3⁄2; x²) + C For
   * k = 2 you recover the standard arcsin: ∫ 1⁄√(1−x²)dx = arcsin(x) + C For
   * other values of k, this hypergeometric form is generally the best you can do
   * in terms of closed form. There is no universal elementary antiderivative
   * except in special rational cases.[1]
   *
   * So: – For arbitrary k, output the result as above using the ₂F₁ function. –
   * For k = 2, the result reduces to `arcsin(x)`; for k = 1, to −ln|1−x²|.
   */
  private Node<D, R, F> integrateOneOverSqrtQuadratic(VariableNode<D, R, F> variable)
  {
    if (!left.isOne() || !right.isSquareRoot())
      return null;

    var sqrtArg = right.getSquareRootArg();
    var coeffs  = extractQuadraticCoefficients(sqrtArg, variable);
    if (coeffs == null)
      return null;

    var a         = coeffs.a;
    var b         = coeffs.b;
    var c         = coeffs.c;
    var x         = variable;
    var four      = expression.literal(4);
    // Complete the square, for a x^2 + b x + c:
    // Let shift = b / (2 * a)
    var shift     = b.div(two().mul(a)).simplify();
    var u         = x.add(shift).simplify();

    // Constant under root
    var constTerm = c.sub(b.pow(2).div(four.mul(a))).simplify();
    var k         = constTerm.sqrt().simplify();

    // Affine normalization, argument: u / k
    var argument  = u.div(k).simplify();

    // Antiderivative: arcsin(u / k)
    return argument.arcsin().simplify();

  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // NEW: General ∫ 1/√(quadratic) via completing the square
    Node<D, R, F> sqrtQuadResult = integrateOneOverSqrtQuadratic(variable);
    if (sqrtQuadResult != null)
    {
      return sqrtQuadResult;
    }

    // If denominator is constant: ∫f(x)/c dx = (1/c)∫f(x)dx
    if (right.isIndependentOf(variable))
    {
      return left.integrate(variable).div(right).simplify();
    }

    if (isSincFunction(variable))
    {
      return new SineIntegralNode<D, R, F>(expression,
                                           variable,
                                           0);
    }

    throw new UnsupportedOperationException("Integration of "
                                            + this
                                            + " with respect to "
                                            + variable
                                            + " not implemented");
  }

  private boolean isSincFunction(VariableNode<D, R, F> variable)
  {
    return right.equals(variable) && left.equals(variable.sin());
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public boolean isHalf()
  {
    return left.isOne() && right.isLiteralConstant() && right.toString().equals("2");
  }

  @Override
  public Node<D, R, F> simplify()
  {
    super.simplify();
    
    if (right.isOne())
    {
      return left;
    }
    if (left.equals(right))
    {
      return one();
    }

    if (left instanceof NegationNode leftNeg && right instanceof NegationNode rightNeg)
    {
      return leftNeg.arg.simplify().div(rightNeg.arg.simplify()).simplify();
    }

    if (right instanceof NegationNode rightNeg)
    {
      return left.div(rightNeg.arg).neg();
    }

    if (left instanceof ExponentiationNode<D, R, F> leftExp
                  && right instanceof ExponentiationNode<D, R, F> rightExp)
    {
      var leftBase  = leftExp.left;
      var rightBase = rightExp.left;
      if (leftBase.equals(rightBase))
      {
        var exponentDifference = leftExp.right.sub(rightExp.right).simplify();
        return leftBase.pow(exponentDifference).simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      if (leftFunction.isExponential() && rightFunction.functionName.equals("exp"))
      {
        var exponentSum = leftFunction.arg.sub(rightFunction.arg).simplify();
        return exponentSum.exp();
      }
    }

    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).div(right.spliceInto(newExpression));
  }

  /**
   * Make an API that will definitively evaluate what types can be transformed to
   * what without information loss
   * 
   * @param resultType
   */
  private void throwExceptionIfRequestedTypeDoesNotContainTheCoDomain(Class<?> resultType)
  {
    if (resultType.equals(Integer.class) && type().equals(Fraction.class))
    {
      throw new IllegalArgumentException(String.format("type() = %s is not assignable to resultType = %s",
                                                       type(),
                                                       resultType));
    }
    if (resultType.equals(Real.class) && type().equals(RealPolynomial.class))
    {
      throw new IllegalArgumentException(String.format("type() = %s is not assignable to resultType = %s for node=%s",
                                                       type(),
                                                       resultType,
                                                       this));
    }
  }

  @Override
  public Class<?> type()
  {
    if (left != null && right != null && left.type().equals(Integer.class)
                  && right.type().equals(Integer.class))
    {
      return Fraction.class;
    }
    else
    {
      return super.type();
    }
  }

  @Override
  public String typeset()
  {
    return format("\\frac{%s}{%s}", left.typeset(), right.typeset());
  }

}
