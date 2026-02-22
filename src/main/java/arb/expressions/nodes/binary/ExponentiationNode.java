package arb.expressions.nodes.binary;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents the binary exponentiation operation: left^right<br>
 * 
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ExponentiationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  /**
   * Đ^(α)(t^k) = Γ(k+1)/Γ(k+1-α) * t^(k-α)
   */
  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    if (left instanceof VariableNode<D, R, F> varNode && !right.dependsOn(varNode))
    {
      var k        = right;
      var kPlusOne = k.add(one()).simplify();
      var numer    = kPlusOne.Γ();
      var denom    = kPlusOne.sub(α).Γ();
      var newPower = k.sub(α);
      var lhs      = numer.div(denom);
      var rhs      = left.pow(newPower);
      return lhs.mul(rhs);
    }
    else
    {
      return super.fractionalDerivative(variable, α);
    }
  }

  @Override
  public boolean isZero()
  {
    return left.isZero() && !right.isZero();
  }

  public static final Logger logger = LoggerFactory.getLogger(ExponentiationNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public boolean isEasilyIntegrable()
  {
    return true;
  }

  @Override
  public boolean isPolynomialLike(VariableNode<D, R, F> variable)
  {
    if (left.equals(variable) && right.isNonNegativeIntegerConstant())
    {
      return true;
    }
    if (left.isPolynomialLike(variable) && right.isNonNegativeIntegerConstant())
    {
      return true;
    }
    return false;
  }

  public ExponentiationNode(Expression<D, R, F> expression,
                            Node<D, R, F> base,
                            Node<D, R, F> exponent)
  {
    super(expression,
          base,
          "pow",
          exponent,
          "^");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    if (!right.dependsOn(variable))
    {
      var newExponent = right.sub(one());
      return right.mul(left.pow(newExponent)).mul(left.differentiate(variable));
    }

    if (!left.dependsOn(variable))
    {
      return mul(right.differentiate(variable).mul(left.log()));
    }

    var term1 = right.mul(left.differentiate(variable)).div(left);
    var term2 = right.differentiate(variable).mul(left.log());
    return mul(term1.add(term2));
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    return true;
  }

  /**
   * Override evaluate for pow because Fraction.pow takes (Integer, int, Fraction)
   * not (Fraction, Fraction), and non-integer exponents cannot be folded into
   * Fraction.
   */
  @Override
  @SuppressWarnings("unchecked")
  public <T> T evaluate(Class<T> resultType, T result)
  {
    if (resultType.equals(Fraction.class))
    {
      if (!(right instanceof LiteralConstantNode<D, R, F> rightConst) || !rightConst.isInt)
      {
        throw new UnsupportedOperationException("cannot fold non-integer exponent "
                                                + right
                                                + " into Fraction");
      }

      Fraction res = (Fraction) result;
      try (Fraction base = new Fraction();
           Integer exp = new Integer())
      {
        left.evaluate(Fraction.class, base);
        right.evaluate(Integer.class, exp);
        base.pow(exp, 0, res);
        return (T) res;
      }
    }

    throw new UnsupportedOperationException("ExponentiationNode.evaluate not implemented for "
                                            + resultType.getName()
                                            + " on "
                                            + this);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    return super.generate(mv, resultType);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    if (left.equals(variable) && !right.dependsOn(variable))
    {
      if (right.isNegOne())
      {
        return left.log();
      }
      var newExponent = right.add(one());
      return left.pow(newExponent).div(newExponent);
    }

    if (!left.dependsOn(variable) && right.equals(variable))
    {
      return div(left.log());
    }

    if (left.equals(variable) && right.isNonNegativeIntegerConstant())
    {
      var newExponent = right.add(one());
      return left.pow(newExponent).div(newExponent);
    }

    throw new UnsupportedOperationException("Cannot integrate " + this);
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public Node<D, R, F> simplify()
  {
    var result = super.simplify();
    if (result != this)
    {
      return result;
    }

    if (right.isZero())
    {
      return one();
    }

    if (right.isOne())
    {
      return left;
    }

    if (left.isOne())
    {
      return one();
    }

    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).pow(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    String baseStr = left.typeset();
    String expStr  = right.typeset();
    if (right.isHalf())
    {
      return String.format("\\sqrt{%s}", baseStr);
    }
    return String.format("{%s}^{%s}", baseStr, expStr);
  }
}
