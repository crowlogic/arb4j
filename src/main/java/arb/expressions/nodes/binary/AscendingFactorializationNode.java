// src/main/java/arb/expressions/nodes/binary/AscendingFactorializationNode.java
package arb.expressions.nodes.binary;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * The rising factorial, ironically, denoted as x₍ₙ₎, for a {@link Field} x and
 * a non-negative integer n is defined by the product:
 *
 * x₍ₙ₎ = x⋰n = ∏x+k{k=0..n-1}
 *
 * x₍₀₎ = 1
 *
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class AscendingFactorializationNode<D, R, F extends Function<? extends D, ? extends R>>
                                          extends
                                          BinaryOperationNode<D, R, F>
{
  public static final Logger logger = LoggerFactory.getLogger(AscendingFactorializationNode.class);

  @Override
  public boolean isZero()
  {
    // x₍₀₎ = 1 by definition, never zero
    return right.isZero() ? false : left.isZero();
  }

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  public AscendingFactorializationNode(Node<D, R, F> left,
                                       Node<D, R, F> right,
                                       Expression<D, R, F> expression)
  {
    super(expression,
          left,
          "ascendingFactorial",
          right,
          "⋰");
  }

  @Override
  protected BinaryOperationNode<D, R, F> reconstructWith(Node<D, R, F> newLeft,
                                                         Node<D, R, F> newRight)
  {
    return new AscendingFactorializationNode<>(newLeft,
                                               newRight,
                                               expression);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // Case 1: Diff(pochhammer(f(x),y),x)
    if (right.isIndependentOf(variable))
    {
      // diff(f(x),x)*pochhammer(f(x),y)*(Psi(y+f(x))-Psi(f(x)))
      var dfx     = left.differentiate(variable);
      var psiSum  = right.add(left).digamma();
      var psiLeft = left.digamma();
      var psiDiff = psiSum.sub(psiLeft);
      return dfx.mul(this).mul(psiDiff);
    }
    // Case 2: Diff(pochhammer(x,f(y)),y)
    else if (left.isIndependentOf(variable))
    {
      // diff(f(y),y)*pochhammer(x,f(y))*Psi(f(y)+x)
      var dfy     = right.differentiate(variable);
      var psiTerm = right.add(left).digamma();
      return dfy.mul(this).mul(psiTerm);
    }
    // Case 3: Both terms depend on the variable
    else
    {
      throw new UnsupportedOperationException("TODO: implement Differentiation of Pochhammer symbol with both terms dependent on the variable is not implemented: "
                                              + this);
    }
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
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
    return new AscendingFactorializationNode<E, S, G>(left.spliceInto(newExpression),
                                                      right.spliceInto(newExpression),
                                                      newExpression);
  }

  @Override
  public Class<?> type()
  {
    var thisType = super.type();
    if (Fraction.class.equals(thisType))
    {
      thisType = Real.class;
    }
    return thisType;
  }

  @Override
  public String typeset()
  {
    return String.format("(%s)_{%s}", left.typeset(), right.typeset());
  }

}
