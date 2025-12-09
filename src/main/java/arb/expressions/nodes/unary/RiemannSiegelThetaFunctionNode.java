package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.*;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Evaluates the Riemann-Siegel theta function ϑ(t) and its derivatives
 * up to a specified order simultaneously using polynomial series expansion.
 * 
 * The Riemann-Siegel theta function is defined as:
 * 
 * ϑ(t) = Im[log(Γ(1/4 + it/2) / √π)] - t/2 · log(π)
 * 
 * This implementation leverages the ARB library's efficient polynomial series
 * evaluation routine arb_poly_riemann_siegel_theta_series which computes
 * all derivatives in a single pass.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 * @see PolySeriesFunctionNode for the base implementation pattern
 */
public class RiemannSiegelThetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>>
                                           extends
                                           PolySeriesFunctionNode<D, C, F>
{
  /**
   * Creates a new Riemann-Siegel theta function node.
   * The derivative order defaults to 0 (function value only).
   *
   * @param expression the expression context
   */
  public RiemannSiegelThetaFunctionNode(Expression<D, C, F> expression)
  {
    super("ϑ",
          expression);
  }

  /**
   * Creates a Riemann-Siegel theta function node with specified derivative order.
   *
   * @param expression the expression context
   * @param arg the argument node (the point at which to evaluate)
   * @param order the maximum derivative order to compute
   */
  private RiemannSiegelThetaFunctionNode(Expression<D, C, F> expression, 
                                         Node<D, C, F> arg, 
                                         int order)
  {
    super("ϑ",
          expression,
          arg,
          order);
  }

  // ============================================================================
  // Abstract Method Implementation
  // ============================================================================
  
  /**
   * Invokes the ARB/FLINT Riemann-Siegel theta series evaluation function.
   * 
   * This method generates bytecode to call:
   * - arb_poly_riemann_siegel_theta_series() for Real arithmetic
   * - acb_poly_riemann_siegel_theta_series() for Complex arithmetic
   * 
   * These functions evaluate the Riemann-Siegel theta function and all its
   * derivatives up to the specified order in a single pass, computing the
   * Taylor series expansion around the provided argument.
   *
   * @param mv                the MethodVisitor for bytecode generation
   * @param scalarType        the scalar type (Real or Complex)
   * @param isComplex         whether using Complex (true) or Real (false) arithmetic
   * @param polynomialLength  the number of coefficients/derivatives to compute
   * @param resultPolySlot    local variable slot containing result polynomial
   * @param argumentPolySlot  local variable slot containing argument polynomial h(x) = t + x
   */
  @Override
  protected void invokeSeriesEvaluationFunction(MethodVisitor mv,
                                               Class<?> scalarType,
                                               boolean isComplex,
                                               int polynomialLength,
                                               int resultPolySlot,
                                               int argumentPolySlot)
  {
    // Determine the polynomial class type
    Class<?> polynomialClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;
    
    // Load the result polynomial reference onto the stack
    mv.visitVarInsn(Opcodes.ALOAD, resultPolySlot);
    
    // Load the argument polynomial reference onto the stack
    mv.visitVarInsn(Opcodes.ALOAD, argumentPolySlot);
    
    // Push the derivative order (polynomial length - 1)
    pushInt(mv, polynomialLength - 1);
    
    // Load the precision parameter (bits) from the calling context
    loadBitsParameterOntoStack(mv);
    
    // Invoke the appropriate ARB/FLINT series function
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? "acb_poly_riemann_siegel_theta_series" 
                                 : "arb_poly_riemann_siegel_theta_series",
                       Void.class,
                       polynomialClass,  // result polynomial
                       polynomialClass,  // argument polynomial
                       int.class,        // order
                       int.class);       // bits
  }

  // ============================================================================
  // Derivative and Integral Operations
  // ============================================================================
  
  /**
   * Creates a new RiemannSiegelThetaFunctionNode with increased derivative order.
   *
   * @param variable the differentiation variable (typically t)
   * @return a new RiemannSiegelThetaFunctionNode with derivativeOrder + 1
   */
  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return new RiemannSiegelThetaFunctionNode<>(expression,
                                                arg,
                                                derivativeOrder + 1);
  }

  /**
   * Creates a new RiemannSiegelThetaFunctionNode with decreased derivative order.
   *
   * @param variable the integration variable (typically t)
   * @return a new RiemannSiegelThetaFunctionNode with derivativeOrder - 1
   */
  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    return new RiemannSiegelThetaFunctionNode<>(expression,
                                                arg,
                                                derivativeOrder - 1);
  }

  // ============================================================================
  // Generic Type Splicing
  // ============================================================================
  
  /**
   * Splices this node into a new expression context with potentially different type parameters.
   *
   * @param <E> domain type parameter for new expression
   * @param <S> codomain type parameter for new expression
   * @param <G> function type parameter for new expression
   * @param newExpression the new expression context
   * @return a new RiemannSiegelThetaFunctionNode in the new context
   */
  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new RiemannSiegelThetaFunctionNode<E, S, G>(newExpression,
                                                       arg.spliceInto(newExpression),
                                                       derivativeOrder);
  }

  // ============================================================================
  // String Representations
  // ============================================================================
  
  /**
   * Returns a compact string representation of the node.
   *
   * @return string representation suitable for debugging and logging
   */
  @Override
  public String toString()
  {
    return derivativeOrder == 0 ? "ϑ(" + arg + ")" : "ϑ^(" + derivativeOrder + ")(" + arg + ')';
  }

  /**
   * Returns a LaTeX representation of the node suitable for mathematical typesetting.
   *
   * @return LaTeX-formatted string representation
   */
  @Override
  public String typeset()
  {
    return String.format("\\vartheta(%s)",
                         arg == null ? "" : arg.typeset());
  }
}
