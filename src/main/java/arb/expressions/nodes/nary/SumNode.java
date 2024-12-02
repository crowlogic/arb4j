package arb.expressions.nodes.nary;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Parse represent and generate bytecodes for the sum operator where the syntax
 * is Σf(k){k=a…b} and the characters between the Σ and { characters are
 * compiled as a sub-expression as a function from the {@link Integer} index
 * variable to whatever type is output by default or requested by whatever is
 * requesting its generation
 * 
 * 
 * @param <D> domain
 * @param <C> codomain
 * @param <F> {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SumNode<D, C, F extends Function<? extends D, ? extends C>> extends
                    NAryOperationNode<D, C, F>
{

  public SumNode(Expression<D, C, F> expression)
  {
    super(expression,
          "additiveIdentity",
          "sum",
          "add",
          "Σ");
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement ∫[∑ᵢ₌₁ⁿfᵢ(x)]dx = ∑ᵢ₌₁ⁿ[∫fᵢ(x)dx]";
    return null;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement ∂[∑ᵢ₌₁ⁿfᵢ(x)]/∂x = ∑ᵢ₌₁ⁿ[∂fᵢ(x)/∂x]";
    return null;
  }
}
