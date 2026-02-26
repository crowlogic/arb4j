package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;
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
public class SubtractionNode<D, R, F extends Function<? extends D, ? extends R>> extends
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
    return (T) leftValue.sub(rightValue, bits, Utensils.newInstance(resultType));
  }

  public static final Logger logger = LoggerFactory.getLogger(SubtractionNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

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
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return left.integral(variable).sub(right.integral(variable)).simplify();
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public Node<D, R, F> simplify()
  {
    // Rewrite a - (-b) as a + b BEFORE simplifying children,
    // because NegationNode.simplify() folds NegationNode(literal) into
    // a negative LiteralConstant, destroying the NegationNode structure.
    if (right instanceof NegationNode<D, R, F> rightNegation)
    {
      return left.add(rightNegation.arg).simplify();
    }

    left  = left.simplify();
    right = right.simplify();

    if (left.isZero())
    {
      return right.neg();
    }

    if (right.isZero())
    {
      return left;
    }
    if (left instanceof LiteralConstantNode lconst && right instanceof LiteralConstantNode rconst)
    {
      if (lconst.isInt && rconst.isInt)
      {
        try ( var lint = new Integer(lconst.stringValue); var rint = new Integer(rconst.stringValue);)
        {
          var difference = lint.sub(rint, 0, rint);
          return expression.newLiteralConstant(difference.toString());
        }
      }
      else if (lconst.isFraction && rconst.isFraction)
      {
        var lint = lconst.fractionValue;
        var rint = rconst.fractionValue;

        try ( Fraction diff = lint.sub(rint, 0, new Fraction()))
        {
          if (diff.getDenominator().isOne())
          {
            return expression.newConstant(diff.getNumerator());
          }
          return expression.newFractionLiteralConstant(diff);
        }
      }
      return this;
    }

    return this;

  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return left.spliceInto(newExpression).sub(right.spliceInto(newExpression));
  }

  @Override
  public boolean isZero()
  {
    return (left.isZero() && right.isZero()) || left.equals(right);
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
}
