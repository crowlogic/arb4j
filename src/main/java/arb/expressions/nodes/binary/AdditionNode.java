package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Field;
import arb.Fraction;
import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.NegationNode;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class AdditionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         BinaryOperationNode<D, R, F>
{
  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (result == null)
    {
      result = Utensils.newInstance(resultType);
    }
    T leftValue  = left.evaluate(resultType, bits, Utensils.newInstance(resultType));
    T rightValue = right.evaluate(resultType, bits, Utensils.newInstance(resultType));
    return leftValue.add(rightValue, bits, result);
  }

  public AdditionNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "add",
          right,
          "+");
  }

  /**
   * Đ^(α)(f + g) = Đ^(α)(f) + Đ^(α)(g)
   */
  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    return left.fractionalDerivative(null, α).add(right.fractionalDerivative(null, α));
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return left.differentiate(variable).add(right.differentiate(variable));
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return left.integral(variable).add(right.integral(variable));
  }

  @Override
  public boolean isCommutative()
  {
    return true;
  }

  @Override
  public Node<D, R, F> simplify()
  {
    var folded = super.simplify();
    if (folded != this)
    {
      return folded;
    }

    if (left.isZero())
    {
      return right;
    }

    if (right.isZero())
    {
      return left;
    }

    if (left.equals(right))
    {
      return left.mul(two());
    }

    if (left.isLiteralConstant() && left.asLiteralConstant().isFraction
                  && right.isLiteralConstant() && right.asLiteralConstant().isFraction)
    {
      Fraction lf = left.asLiteralConstant().fractionValue;
      Fraction rf = right.asLiteralConstant().fractionValue;
      try (Fraction sum = lf.add(rf, 0, new Fraction()))
      {
        if (sum.getDenominator().isOne())
        {
          return expression.newConstant(sum.getNumerator());
        }
        return expression.newFractionLiteralConstant(sum);
      }
    }

    return this;
  }



  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).add(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return format("\\left(%s + %s\\right)", left.typeset(), right.typeset());
  }

  public static final Logger logger = LoggerFactory.getLogger(AdditionNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public boolean isZero()
  {
    if (left.isZero() && right.isZero())
    {
      return true;
    }
    if (left instanceof NegationNode<D, R, F> neg && neg.arg.equals(right))
    {
      return true;
    }
    if (right instanceof NegationNode<D, R, F> neg && neg.arg.equals(left))
    {
      return true;
    }
    return false;
  }

}
