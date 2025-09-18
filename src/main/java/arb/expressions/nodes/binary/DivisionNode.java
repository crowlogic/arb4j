package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.SineIntegralNode;
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

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // Fundamental pattern: 1/√(1-x²) → arcsin(x)
    if (isOneOverSqrtOneMinusXSquared(variable))
    {
      return variable.arcsin();
    }

    // Fundamental pattern: 1/(1+x²) → arctan(x)
    if (isOneOverOnePlusXSquared(variable))
    {
      return variable.arctan();
    }

    // If denominator is constant: ∫f(x)/c dx = (1/c)∫f(x)dx
    if (right.isIndependentOf(variable))
    {
      return left.integrate(variable).div(right).simplify();
    }

    if (isSincFunction(variable))
    {
      // return variable.apply("si");
      return new SineIntegralNode<D, R, F>(expression,

                                           variable,
                                           0);
    }

    // More complex rational functions would need additional logic
    throw new UnsupportedOperationException("Integration of "
                                            + this
                                            + " with respect to "
                                            + variable
                                            + " not implemented");
  }

  private boolean isSincFunction(VariableNode<D, R, F> variable)
  {
    return right.equals(variable) && left.equals(variable.apply("sin"));
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

  boolean isOneMinusXSquared(Node<D, R, F> node, VariableNode<D, R, F> variable)
  {
    if (!(node instanceof SubtractionNode sub))
      return false;

    return sub.left.isOne() && sub.right.isVariableSquared(variable);
  }

  boolean isOneOverOnePlusXSquared(VariableNode<D, R, F> variable)
  {
    return left.isOne() && isOnePlusXSquared(right, variable);
  }

  boolean isOneOverSqrtOneMinusXSquared(VariableNode<D, R, F> variable)
  {
    if (!left.isOne())
    {
      return false;
    }

    if (right.isSquareRoot())
    {

      // Check if sqrt argument is (1-x²)
      Node<D, R, F> squareRootArg = right.getSquareRootArg();
      return isOneMinusXSquared(squareRootArg, variable);
    }

    return false;
  }

  boolean isOnePlusXSquared(Node<D, R, F> node, VariableNode<D, R, F> variable)
  {
    if (!(node instanceof AdditionNode add))
    {
      return false;
    }

    return add.left.isOne() && add.right.isVariableSquared(variable);
  }

  @Override
  public Node<D, R, F> simplify()
  {
    Node<D, R, F> node = this;
    right = right.simplify();
    left  = left.simplify();
    node  = simplifyWhenEitherSideIsOne(node);
    node  = simplifyDivisionOfCommonBases(node);
    node  = simplifyExponentialDivision(node);
    return node;
  }

  Node<D, R, F> simplifyWhenEitherSideIsOne(Node<D, R, F> node)
  {
    if (right.isOne())
    {
      return left;
    }
    if (left.equals(right))
    {
      return one();
    }
    return node;
  }

  Node<D, R, F> simplifyDivisionOfCommonBases(Node<D, R, F> node)
  {
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
    return node;
  }

  Node<D, R, F> simplifyExponentialDivision(Node<D, R, F> node)
  {
    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      if (leftFunction.isExponential() && rightFunction.functionName.equals("exp"))
      {
        var exponentSum = leftFunction.arg.sub(rightFunction.arg).simplify();
        return exponentSum.exp();
      }
    }
    return node;
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
    if (left.type().equals(Integer.class) && right.type().equals(Integer.class))
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