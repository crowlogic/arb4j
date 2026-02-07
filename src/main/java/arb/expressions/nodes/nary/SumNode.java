package arb.expressions.nodes.nary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Parse, represent and generate bytecodes for the sum operator.
 *
 * Syntax: Σk➔f(k){k=a…b} or sum(k➔f(k),k=a…b)
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
public class SumNode<D, C, F extends Function<? extends D, ? extends C>>
                    extends
                    NAryOperationNode<D, C, F>
{

  /**
   * Primary parsing constructor — called when the parser hits Σ or sum(.
   * Delegates to NAryOperationNode which does inline resolve().
   */
  public SumNode(Expression<D, C, F> expression, boolean functionForm)
  {
    super(expression,
          "additiveIdentity",
          "sum",
          "add",
          "Σ",
          functionForm);
    if (functionForm)
    {
      expression.require(')');
    }
  }

  public SumNode(Expression<D, C, F> expression)
  {
    this(expression,
         false);
  }

  /**
   * Splice constructor — called by spliceInto() to create a copy with
   * pre-built operandNode and limit nodes. No parsing happens here.
   */
  protected SumNode(Expression<D, C, F> expression,
                    Node<D, C, F> operandNode,
                    Node<D, C, F> lowerLimit,
                    Node<D, C, F> upperLimit,
                    String indexVariableFieldName)
  {
    super(expression,
          "additiveIdentity",
          "sum",
          "add",
          "Σ",
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
    return new SumNode<>(newExpression,
                         operandNode.spliceInto(newExpression),
                         lowerLimit.spliceInto(newExpression),
                         upperLimit.spliceInto(newExpression),
                         indexVariableFieldName);
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
