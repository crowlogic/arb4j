package arb.expressions.nodes.binary;

import arb.Field;
import arb.Fraction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AscendingFactorializationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                          BinaryOperationNode<D, R, F>
{

  /**
   * <pre>
   * 1. Binary Operator Version: You've adapted the ascending factorial to be used
   * as an infix binary operator, which is an interesting and useful approach for
   * text representations.
   * 
   * 2. Standard Postfix Notation: As you mentioned, the ascending factorial is
   * typically written in postfix notation, like n₍ₖ₎ or n^(k) where n is the base
   * and k is the number of factors.
   * 
   * 3. Your Infix Notation: Your use of ⋰ as an infix operator (n ⋰ k) is a
   * clever way to represent this operation in a linear text format, making it
   * easier to parse in expressions.
   * 
   * 4. Expression Interpretation: In your expression (k+1)⋰(-½), you're using
   * this infix notation with a non-integer exponent, which suggests a generalized
   * form of the ascending factorial.
   * 
   * 5. Advantages: This infix notation integrates well with other mathematical
   * operations in complex expressions, as demonstrated in your text tree. It
   * allows for a more natural reading of the expression from left to right.
   * 
   * 6. Text Tree Benefits: Your text tree representation clearly shows the
   * hierarchical structure of the expression, with the ⋰ operator at the same
   * level as other binary operators like + and *.
   * 
   * This approach to notation is particularly useful for representing complex
   * mathematical expressions in plain text environments, programming languages,
   * or other contexts where standard mathematical notation might be difficult to
   * implement.
   * </pre>
   * 
   * @param left
   * @param right
   * @param expression
   */
  public AscendingFactorializationNode(Node<D, R, F> left, Node<D, R, F> right, Expression<D, R, F> expression)
  {
    super(expression,
          left,
          "ascendingFactorial",
          right,
          "⋰");
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
