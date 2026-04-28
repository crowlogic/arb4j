package arb.expressions.nodes.unary;

import arb.Field;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class NegationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         FunctionNode<D, R, F>
{

  @SuppressWarnings("unchecked")
  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    return arg.evaluate(resultType, bits, Utensils.newInstance(resultType)).neg();
  }

  @Override
  public boolean isZero()
  {
    return arg.isZero();
  }

  @Override
  public boolean isNegativeInfinity()
  {
    return arg.isPositiveInfinity();
  }

  @Override
  public boolean isPositiveInfinity()
  {
    return arg.isNegativeInfinity();
  }

  @Override
  public boolean isNegOne()
  {
    return arg.isOne();
  }

  @Override
  public Node<D, R, F> simplify()
  {
    if (arg instanceof NegationNode<D, R, F> negArg)
    {
      return negArg.arg.simplify();
    }
    if (arg.isZero())
    {
      return arg = zero();
    }
    if (arg.isLiteralConstant())
    {
      LiteralConstantNode<D, R, F> lconst = arg.asLiteralConstant();
      if (lconst.isInt)
      {
        String negatedValue = lconst.stringValue.startsWith("-") ? lconst.stringValue.substring(1) : "-" + lconst.stringValue;
        return expression.newLiteralConstant(negatedValue);
      }
    }

    return arg.simplify().neg();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new NegationNode<E, S, G>(newExpression,
                                     arg.spliceInto(newExpression));
  }

  @Override
  public Class<?> type()
  {
    return arg.type();
  }

  @Override
  public String toString()
  {
    return String.format("-%s", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("-(%s)", arg.typeset());
  }

  @Override
  public boolean isBitless()
  {
    return true;
  }

  public NegationNode(Expression<D, R, F> expression, Node<D, R, F> argument)
  {
    super("neg",
          argument,
          expression);
  }

  @Override
  public char symbol()
  {
    return '-';
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return arg.integral(variable).neg();
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return arg.differentiate(variable).neg();
  }

  @Override
  public boolean hasClosedFormFractionalDerivative(VariableNode<D, R, F> variable)
  {
    return arg.hasClosedFormFractionalDerivative(variable);
  }

  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    if (arg.hasClosedFormFractionalDerivative(variable))
    {
      return arg.fractionalDerivative(variable, α).neg();
    }
    return super.fractionalDerivative(variable, α);
  }

  @Override
  public boolean hasClosedFormFractionalIntegral(VariableNode<D, R, F> variable)
  {
    return arg.hasClosedFormFractionalIntegral(variable);
  }

  /**
   * I^(μ)(−f) = −I^(μ)(f)
   */
  @Override
  public Node<D, R, F> fractionalIntegral(VariableNode<D, R, F> variable, Node<D, R, F> μ)
  {
    if (arg.hasClosedFormFractionalIntegral(variable))
    {
      return arg.fractionalIntegral(variable, μ).neg();
    }
    return super.fractionalIntegral(variable, μ);
  }

  @Override
  public boolean isLinearOperator(VariableNode<D, R, F> outerVar, VariableNode<D, R, F> innerVar)
  {
    return true;
  }

}
