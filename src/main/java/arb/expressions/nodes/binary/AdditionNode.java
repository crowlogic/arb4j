package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Fraction;
import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.NegationNode;
import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class AdditionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         BinaryOperationNode<D, R, F>
{

  public AdditionNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "add",
          right,
          "+");
  }

  static <D, R, F extends Function<? extends D, ? extends R>>
         boolean
         areIntegerDivisions(DivisionNode<D, R, F> leftDiv, DivisionNode<D, R, F> rightDiv)
  {
    return leftDiv.left.type().equals(Integer.class) && leftDiv.right.type().equals(Integer.class)
                  && rightDiv.left.type().equals(Integer.class)
                  && rightDiv.right.type().equals(Integer.class);
  }

  Node<D, R, F> combineFractions(DivisionNode<D, R, F> leftDiv, DivisionNode<D, R, F> rightDiv)
  {
    var a           = leftDiv.left;
    var b           = leftDiv.right;
    var c           = rightDiv.left;
    var d           = rightDiv.right;
    var ad          = a.mul(d);
    var bc          = b.mul(c);
    var numerator   = ad.add(bc);
    var denominator = b.mul(d);
    return numerator.div(denominator);
  }

  /**
   * Đ^(α)(f + g) = Đ^(α)(f) + Đ^(α)(g)
   */
  @Override
  public Node<D, R, F> fractionalDerivative(Node<D, R, F> α)
  {
    return left.fractionalDerivative(α).add(right.fractionalDerivative(α));
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
  public boolean isCommutative()
  {
    return true;
  }

  @Override
  public Node<D, R, F> simplify()
  {
    left  = left.simplify();
    right = right.simplify();

    if (left.isZero())
    {
      return right;
    }

    if (right.isZero())
    {
      return left;
    }
    if (left instanceof LiteralConstantNode<D, R, F> lconst
                  && right instanceof LiteralConstantNode<D, R, F> rconst)
    {
      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = lconst.asInteger(); var rint = rconst.asInteger())
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
    else if (left instanceof DivisionNode<D, R, F> leftDiv
                  && right instanceof DivisionNode<D, R, F> rightDiv)
    {
      if (areIntegerDivisions(leftDiv, rightDiv))
      {
        return combineFractions(leftDiv, rightDiv).simplify();
      }
    }

    // Rewrite a + (-b) as a - b, but do NOT re-simplify to avoid ping-pong
    if (right instanceof NegationNode<D, R, F> rightNegation)
    {
      return left.sub(rightNegation.arg);
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
