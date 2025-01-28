package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

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
public class SubtractionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                            BinaryOperationNode<D, R, F>
{

  public SubtractionNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "sub",
          right,
          "-");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return left.differentiate(variable).sub(right.differentiate(variable));
  }

  private void fillInNullLeftHandSide()
  {
    if (left == null)
    {
      left = new LiteralConstantNode<>(expression,
                                       "0");
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    fillInNullLeftHandSide();
    return super.generate(mv, resultType);
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return left.integrate(variable).sub(right.integrate(variable));
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
    return left.spliceInto(newExpression).sub(right.spliceInto(newExpression));
  }

  @Override
  public Class<?> type()
  {
    fillInNullLeftHandSide();
    return super.type();
  }

  @Override
  public String typeset()
  {
    String lhs = left == null ? "" : left.typeset();
    return format("\\left(%s-%s\\right)", "0".equals(lhs) ? "" : lhs, right.typeset());
  }

  @Override
  public Node<D, R, F> simplify()
  {
    super.simplify();
    if (left.isLiteralConstant() && left.toString().equals("0"))
    {
      return right.neg();
    }

    if (right.isLiteralConstant() && right.toString().equals("0"))
    {
      return left;
    }
    if (left instanceof LiteralConstantNode lconst && right instanceof LiteralConstantNode rconst)
    {
      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = new Integer(lconst.value); var rint = new Integer(rconst.value);)
        {
          var difference = lint.sub(rint, 0, rint);
          return expression.newLiteralConstant(difference.toString());
        }
      }
      else if (lconst.isFraction && rconst.isFraction)
      {
        var lint = lconst.fractionValue;
        var rint = rconst.fractionValue;

        try ( Fraction sum = lint.sub(rint, 0, new Fraction()))
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