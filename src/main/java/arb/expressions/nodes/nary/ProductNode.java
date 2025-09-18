package arb.expressions.nodes.nary;

import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Computes the product operator where the syntax is Πf(k){k=a…b} and the
 * characters between the Π and { characters are compiled as a sub-expression as
 * a function from the {@link Integer} index variable to whatever type is output
 * by default or requested by whatever is requesting its generation
 * 
 * @param <D> domain
 * @param <C> codomain
 * @param <F> {@link Function}
 * 
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

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
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

}
