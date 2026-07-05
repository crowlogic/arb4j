package arb.expressions.nodes.nary;

import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;

/**
 * Computes the product operator where the syntax is Π{k=a…b}f(k): the limit
 * specification {k=a…b} comes first, binding the index variable k and its lower
 * and upper limits, followed by the operand body f(k), which is compiled as a
 * sub-expression as a function from the {@link Integer} index variable to
 * whatever type is output by default or requested by whatever is requesting its
 * generation.
 *
 * @param <D> domain
 * @param <C> codomain
 * @param <F> {@link Function}
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ProductNode<D, C, F extends Function<? extends D, ? extends C>> extends
                        NAryOperationNode<D, C, F>
{

  public ProductNode(Expression<D, C, F> expression)
  {
    super(expression,
          "multiplicativeIdentity",
          "prod",
          "mul",
          "Π");
  }

  /**
   * Constructor used by {@link #createSimilarNode} so that
   * {@link NAryOperationNode#spliceInto(Expression)} preserves the
   * {@link ProductNode} type instead of collapsing to a bare
   * {@link NAryOperationNode}.
   */
  public ProductNode(Expression<D, C, F> expression,
                     Expression<Integer, C, Sequence<C>> operandExpression,
                     Node<D, C, F> lowerLimit,
                     Node<D, C, F> upperLimit)
  {
    super(expression,
          "multiplicativeIdentity",
          "prod",
          "mul",
          "Π",
          operandExpression,
          lowerLimit,
          upperLimit);
  }

  @Override
  protected <E, S, G extends Function<? extends E, ? extends S>> NAryOperationNode<E, S, G>
            createSimilarNode(Expression<E, S, G> newExpression,
                              Expression<Integer, S, Sequence<S>> operand,
                              Node<E, S, G> lower,
                              Node<E, S, G> upper)
  {
    return new ProductNode<>(newExpression,
                             operand,
                             lower,
                             upper);
  }

  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement ∫∏ᵢ₌₁ⁿfᵢ(x)dx = ∑ₖ₌₁ⁿ[(-1)ᵏ⁺¹∑ᵢ₁₊...₊ᵢₙ₌ₖ(f₁⁽ⁱ¹⁾...fₙ⁽ⁱⁿ⁾)/(i₁!...iₙ!)∫xᵏdx]";
    return null;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement ∂/∂x[∏ᵢ₌₁ᵏfᵢ(x)] = ∑ᵢ₌₁ᵏ[(∂/∂x fᵢ(x))∏ⱼ₌₁,ⱼ≠ᵢᵏfⱼ(x)]";
    return null;
  }

  @Override
  public boolean isZero()
  {
    return operandExpression != null && operandExpression.rootNode.isZero();
  }

}
