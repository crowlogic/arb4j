package arb.expressions.nodes.binary;

import arb.Fraction;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents the binary exponentiation operation: left^right<br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExponentiationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{

  public String format(Node<D, R, F> side)
  {
    return side.isLeaf() ? "%s" : "(%s)";
  }

  @Override
  public String typeset()
  {
    return String.format(String.format("{%s}^{%s}", format(left), format(right)), left.typeset(), right.typeset());
  }

  public ExponentiationNode(Expression<D, R, F> expression, Node<D, R, F> base, Node<D, R, F> exponent)
  {
    super(expression,
          base,
          "pow",
          exponent,
          "^");
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).pow(right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {

    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // For f(x)^g(x), the derivative is:
    // f(x)^g(x) * (g(x) * f'(x)/f(x) + g'(x) * ln(f(x)))

    // Create ln(f(x))
    Node<D, R, F> lnBase = left.log();

    // First term: g(x) * f'(x)/f(x)
    Node<D, R, F> term1 = right.mul(left.differentiate(variable)).div(left);

    // Second term: g'(x) * ln(f(x))
    Node<D, R, F> term2 = right.differentiate(variable).mul(lnBase);

    // Combine terms and multiply by original expression
    return this.mul(term1.add(term2));
  }

  @Override
  public Class<?> type()
  {
    if (type != null)
    {
      return type;
    }
    if (right.isPossiblyNegative())
    {
      var superType = super.type();
      if (Integer.class.equals(superType))
      {
        type = Fraction.class;
      }
      else
      {
        type = superType;
      }
    }
    else
    {
      type = super.type();

    }
    return type;

  }

  @Override
  public Node<D, R, F> simplify()
  {
    super.simplify();
    if (right.isLiteralConstant() && right.asLiteralConstant().value.equals("1"))
    {
      return left;
    }
    if (right.isLiteralConstant() && right.asLiteralConstant().value.equals("0"))
    {
      return expression.newLiteralConstant(1);
    }
    if (left.isLiteralConstant() && right.isLiteralConstant())
    {

      var lconst = left.asLiteralConstant();
      var rconst = right.asLiteralConstant();
      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = new Integer(lconst.value); var rint = new Integer(rconst.value);)
        {
          var power = lint.pow(rint, 0, rint);
          return expression.newLiteralConstant(power.toString());
        }
      }
    }
    return this;
  }
}