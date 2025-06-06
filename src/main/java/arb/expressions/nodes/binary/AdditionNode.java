package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.Fraction;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AdditionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         BinaryOperationNode<D, R, F>
{

  @Override
  public String typeset()
  {
    return format("\\left(%s + %s\\right)", left.typeset(), right.typeset());
  }

  public AdditionNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "add",
          right,
          "+");
  }

  @Override
  public boolean isCommutative()
  {
    return true;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).add(right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return left.differentiate(variable).add(right.differentiate(variable));
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return left.integrate(variable).add(right.integrate(variable));
  }

  @Override
  public Node<D, R, F> simplify()
  {
    super.simplify();
    if (left.isConstant() && left.toString().equals("0"))
    {
      return right;
    }

    if (right.isConstant() && right.toString().equals("0"))
    {
      return left;
    }
    if (left instanceof LiteralConstantNode lconst && right instanceof LiteralConstantNode rconst)
    {
      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = new Integer(lconst.value); var rint = new Integer(rconst.value);)
        {
          var sum = lint.add(rint, 0, rint);
          return expression.newLiteralConstant(sum.toString());
        }
      }
      else if (lconst.isFraction && rconst.isFraction)
      {
        var lint = lconst.fractionValue;
        var rint = rconst.fractionValue;

        try ( Fraction sum = lint.add(rint, 0, new Fraction()))
        {
          var numerator   = expression.newLiteralConstant(sum.getNumerator().toString());
          var denominator = expression.newLiteralConstant(sum.getDenominator().toString());
          return numerator.div(denominator);
        }
      }

      return this;
    }
    else
    {
      return this;
    }
  }

}