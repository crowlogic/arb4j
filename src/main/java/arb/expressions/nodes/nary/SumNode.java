package arb.expressions.nodes.nary;

import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.VariableReference;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;

/**
 * Parse represent and generate bytecodes for the sum operator where the syntax
 * is Σ{k=a…b}f(k): the limit specification {k=a…b} comes first, binding the
 * index variable k and its lower and upper limits, followed by the operand body
 * f(k), which is compiled as a sub-expression as a function from the
 * {@link Integer} index variable to whatever type is output by default or
 * requested by whatever is requesting its generation.
 *
 * @param <D> domain
 * @param <C> codomain
 * @param <F> {@link Function}
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class SumNode<D, C, F extends Function<? extends D, ? extends C>> extends
                    NAryOperationNode<D, C, F>
{

  @Override
  public boolean isZero()
  {
    return operandExpression != null && operandExpression.rootNode.isZero();
  }

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
   * Constructor used by {@link #createSimilarNode} so that
   * {@link NAryOperationNode#spliceInto(Expression)} and
   * {@link NAryOperationNode#wrapTransformedOperand(Expression)} preserve the
   * {@link SumNode} type — and therefore this node's {@link #differentiate} and
   * {@link #integral} overrides — instead of collapsing to a bare
   * {@link NAryOperationNode}.
   */
  public SumNode(Expression<D, C, F> expression,
                 Expression<Integer, C, Sequence<C>> operandExpression,
                 Node<D, C, F> lowerLimit,
                 Node<D, C, F> upperLimit)
  {
    super(expression,
          "additiveIdentity",
          "sum",
          "add",
          "Σ",
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
    return new SumNode<>(newExpression,
                         operand,
                         lower,
                         upper);
  }

  /**
   * Linearity of integration over finite sums:
   * ∫[Σᵢ₌ₐᵇ fᵢ(x)]dx = Σᵢ₌ₐᵇ [∫fᵢ(x)dx]
   *
   * <p>Valid for all bounded sums (finite number of terms). For unbounded
   * sums, this requires the Dominated Convergence Theorem.</p>
   *
   * <p>The term-by-term antiderivative is wrapped back into a fully-wired
   * summation node by {@link NAryOperationNode#wrapTransformedOperand}, which
   * copies the index-variable field name, operand function field name and its
   * mapping, so the returned node is directly compilable.</p>
   *
   * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
   */
  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    Expression<Integer, C, Sequence<C>>   integratedOperand = operandExpression.deepCloneExpression();
    VariableNode<Integer, C, Sequence<C>> probe             =
                                                new VariableNode<>(integratedOperand,
                                                                   new VariableReference<>(variable.getName()),
                                                                   false);
    integratedOperand.rootNode = integratedOperand.rootNode.integral(probe).simplify();
    return wrapTransformedOperand(integratedOperand);
  }

  /**
   * Linearity of differentiation over finite sums:
   * ∂/∂x [Σᵢ₌ₐᵇ fᵢ(x)] = Σᵢ₌ₐᵇ [∂fᵢ(x)/∂x]
   *
   * <p>Valid for all bounded sums (finite number of terms). For unbounded
   * sums, this requires uniform convergence of the differentiated series.</p>
   *
   * <p>The term-by-term derivative is wrapped back into a fully-wired summation
   * node by {@link NAryOperationNode#wrapTransformedOperand}.</p>
   *
   * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
   */
  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    Expression<Integer, C, Sequence<C>>   differentiatedOperand = operandExpression.deepCloneExpression();
    VariableNode<Integer, C, Sequence<C>> probe                 =
                                                new VariableNode<>(differentiatedOperand,
                                                                   new VariableReference<>(variable.getName()),
                                                                   false);
    differentiatedOperand.rootNode = differentiatedOperand.rootNode.differentiate(probe).simplify();
    return wrapTransformedOperand(differentiatedOperand);
  }
}
