package arb.expressions.nodes.binary;

import arb.AlgebraicNumber;
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

  @Override
  public boolean isSquareRoot()
  {
    return right.isHalf();
  }

  @Override
  public Node<D, R, F> getSquareRootArg()
  {
    assert isSquareRoot() : this + " is not a square root";
    return left;
  }

  @Override
  public boolean isVariableSquared(VariableNode<D, R, F> variable)
  {
    return left.equals(variable) && right.isLiteralConstant() && "2".equals(right.toString());
  }

  @Override
  public int hashCode()
  {
    return super.hashCode();
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

  public String format(Node<D, R, F> side)
  {
    return side.isLeaf() ? "%s" : "(%s)";
  }

  @Override
  public String typeset()
  {
    return String.format(String.format("{%s}^{%s}", format(left), format(right)),
                         left.typeset(),
                         right.typeset());
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
    if (right.dependsOn(variable))
    {
      throw new UnsupportedOperationException("TODO: support the special cases where the exponent in "
                                              + this
                                              + " depends on "
                                              + variable);
    }

    return left.pow(right.add(one())).div(right.add(one()));
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // diff( f(x)^g(x), x) = f(x)^g(x) * (g(x) * f'(x)/f(x) + g'(x) * ln(f(x)))
    // f=this.left
    // f=this.right

    // First term: g(x) * f'(x)/f(x)
    var term1 = right.mul(left.differentiate(variable)).div(left);

    // Second term: g'(x) * ln(f(x))
    var term2 = right.differentiate(variable).mul(left.log());

    // Combine terms and multiply by original expression
    return mul(term1.add(term2));
  }

  @Override
  public Class<?> type()
  {
    if (type != null)
    {
      return type;
    }

    // Check if base is integer and exponent is a (fraction or integer to handle
    // possibility of negative values)
    if ((Integer.class.equals(left.type())
                  && (Fraction.class.equals(right.type()) || Integer.class.equals(right.type())))
                  || (left.type().equals(Fraction.class) && right.type().equals(Fraction.class)))
    {
      return type = AlgebraicNumber.class;
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