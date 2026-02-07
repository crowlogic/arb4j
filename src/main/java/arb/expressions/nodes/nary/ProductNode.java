package arb.expressions.nodes.nary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Parse, represent and generate bytecodes for the product operator.
 *
 * Syntax: Πk➔f(k){k=a…b}
 *
 * The operand body is parsed inline by the parent expression's parser
 * (via expression.resolve()), not extracted as a string.
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

  /**
   * Primary parsing constructor — called when the parser hits Π.
   */
  public ProductNode(Expression<D, C, F> expression)
  {
    super(expression,
          "multiplicativeIdentity",
          "prod",
          "mul",
          "Π",
          false);
  }

  /**
   * Splice constructor — pre-built nodes, no parsing.
   */
  protected ProductNode(Expression<D, C, F> expression,
                        Node<D, C, F> operandNode,
                        Node<D, C, F> lowerLimit,
                        Node<D, C, F> upperLimit,
                        String indexVariableFieldName)
  {
    super(expression,
          "multiplicativeIdentity",
          "prod",
          "mul",
          "Π",
          operandNode,
          lowerLimit,
          upperLimit,
          indexVariableFieldName);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new ProductNode<>(newExpression,
                             operandNode.spliceInto(newExpression),
                             lowerLimit.spliceInto(newExpression),
                             upperLimit.spliceInto(newExpression),
                             indexVariableFieldName);
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement ∫∏ᵢ₌₁ⁿfᵢ(x)dx";
    return null;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    assert false : "TODO: implement ∂/∂x[∏ᵢ₌₁ᵏfᵢ(x)] = ∑ᵢ₌₁ᵏ[(∂/∂x fᵢ(x))∏ⱼ₌₁,ⱼ≠ᵢᵏfⱼ(x)]";
    return null;
  }
}
