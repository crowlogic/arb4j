package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.Integer;
import arb.Quaternion;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
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
    var a = left.differentiate(variable).mul(right);
    var b = right.differentiate(variable).mul(left);
    return a.add(b);
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return left.integrate(variable).mul(right.integrate(variable));
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
    super.simplify();

    boolean leftIsConstant  = left.isLiteralConstant();
    boolean rightIsConstant = right.isLiteralConstant();

    if (leftIsConstant)
    {
      var leftString = left.toString();
      if (leftString.equals("0"))
      {
        return left;
      }
      if (leftString.equals("1"))
      {
        return right;
      }
    }

    if (rightIsConstant)
    {
      var rightString = right.toString();
      if (rightString.equals("0"))
      {
        return right;
      }
      if (rightString.equals("1"))
      {
        return left;
      }
    }

    if (leftIsConstant && rightIsConstant)
    {
      var lconst = left.asLiteralConstant();
      var rconst = right.asLiteralConstant();

      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = new Integer(lconst.value); var rint = new Integer(rconst.value);)
        {
          var product = lint.mul(rint, 0, rint);
          return expression.newLiteralConstant(product.toString());
        }
      }
    }

    return this;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).mul(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return format("%s \\cdot %s", left.typeset(), right.typeset());
  }

}