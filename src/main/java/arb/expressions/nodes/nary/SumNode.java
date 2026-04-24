package arb.expressions.nodes.nary;

import arb.Integer;
import arb.expressions.Expression;
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
   * Linearity of integration over finite sums:
   * ∫[Σᵢ₌ₐᵇ fᵢ(x)]dx = Σᵢ₌ₐᵇ [∫fᵢ(x)dx]
   *
   * <p>Valid for all bounded sums (finite number of terms). For unbounded
   * sums, this requires the Dominated Convergence Theorem.</p>
   *
   * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
   */
  @SuppressWarnings("unchecked")
  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {
    Expression<Integer, C, Sequence<C>> integratedOperand =
      (Expression<Integer, C, Sequence<C>>) (Expression<?, ?, ?>) operandExpression.cloneExpression();
    VariableNode<Integer, C, Sequence<C>> splicedVar =
      (VariableNode<Integer, C, Sequence<C>>) (VariableNode<?, ?, ?>) variable.spliceInto(operandExpression);
    integratedOperand.rootNode = operandExpression.rootNode.integral(splicedVar);
    integratedOperand.updateStringRepresentation();

    return new NAryOperationNode<>(expression,
                                   identity,
                                   prefix,
                                   operation,
                                   symbol,
                                   integratedOperand,
                                   lowerLimit,
                                   upperLimit);
  }

  /**
   * Linearity of differentiation over finite sums:
   * ∂/∂x [Σᵢ₌ₐᵇ fᵢ(x)] = Σᵢ₌ₐᵇ [∂fᵢ(x)/∂x]
   *
   * <p>Valid for all bounded sums (finite number of terms). For unbounded
   * sums, this requires uniform convergence of the differentiated series.</p>
   *
   * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
   */
  @SuppressWarnings("unchecked")
  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    Expression<Integer, C, Sequence<C>> differentiatedOperand =
      (Expression<Integer, C, Sequence<C>>) (Expression<?, ?, ?>) operandExpression.cloneExpression();
    VariableNode<Integer, C, Sequence<C>> splicedVar =
      (VariableNode<Integer, C, Sequence<C>>) (VariableNode<?, ?, ?>) variable.spliceInto(operandExpression);
    differentiatedOperand.rootNode = operandExpression.rootNode.differentiate(splicedVar);
    differentiatedOperand.updateStringRepresentation();

    return new NAryOperationNode<>(expression,
                                   identity,
                                   prefix,
                                   operation,
                                   symbol,
                                   differentiatedOperand,
                                   lowerLimit,
                                   upperLimit);
  }
}
