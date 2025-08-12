package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.Integer;
import arb.Quaternion;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.FunctionNode;
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
    return a.add(b).simplify();
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

    boolean leftIsConstant  = left != null && left.isLiteralConstant();
    boolean rightIsConstant = right != null && right.isLiteralConstant();
    var     rightConstant   = rightIsConstant ? right.asLiteralConstant() : null;
    var     leftConstant    = leftIsConstant ? left.asLiteralConstant() : null;

    if (leftIsConstant)
    {
      if (leftConstant.isZero())
      {
        return left;
      }
      if (leftConstant.isOne())
      {
        return right;
      }
    }

    if (rightIsConstant)
    {
      if (rightConstant.isZero())
      {
        return right;
      }
      if (rightConstant.isOne())
      {
        return left;
      }
    }

    if (leftIsConstant && rightIsConstant)
    {
      var lconst = leftConstant;
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

    if (left instanceof ExponentiationNode<D, R, F> leftExp
                  && right instanceof ExponentiationNode<D, R, F> rightExp)
    {
      var leftBase  = leftExp.left;
      var rightBase = rightExp.left;
      if (leftBase.equals(rightBase))
      {
        var exponentSum = leftExp.right.add(rightExp.right).simplify();
        return leftBase.pow(exponentSum).simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsExponentialFunction  = leftFunction.functionName.equals("exp");
      var rightIsExponentialFunction = rightFunction.functionName.equals("exp");

      if (leftIsExponentialFunction && rightIsExponentialFunction)
      {
        var exponentSum = leftFunction.arg.add(rightFunction.arg).simplify();
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