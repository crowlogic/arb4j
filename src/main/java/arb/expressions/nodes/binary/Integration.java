package arb.expressions.nodes.binary;

import java.util.concurrent.atomic.AtomicReference;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.NegationNode;
import arb.functions.Function;

/**
 * functions that {@link MultiplicationNode} uses for integration
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class Integration
{
  public static final Logger logger = LoggerFactory.getLogger(Integration.class);

  /**
   * Applies a single step of integration by parts: ∫ u dv = u·v - ∫ v·u' dx
   *
   * Used for the LIATE logarithmic case where u does not differentiate to zero
   * (so the tabular method is inapplicable), but a single IBP step reduces the
   * problem to a simpler integral that other rules can handle.
   *
   * For ∫ ln(x)·x dx: u = ln(x), dv = x dx → v = x²/2, u' = 1/x = ln(x)·(x²/2) -
   * ∫ (x²/2)·(1/x) dx = (x²/2)·ln(x) - ∫ x/2 dx = (x²/2)·ln(x) - x²/4
   *
   * @param u        The factor to differentiate (e.g., ln(x))
   * @param dv       The factor to integrate (e.g., x)
   * @param variable The variable of integration
   * @return The integrated result
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         applySingleStepIBP(Node<D, R, F> u, Node<D, R, F> dv, VariableNode<D, R, F> variable)
  {
    if (Expression.traceNodes)
    {
      logger.debug("applySingleStepIBP: u={}, dv={}, variable={}", u, dv, variable);
    }

    var v  = dv.integral(variable).simplify();
    var du = u.differentiate(variable).simplify();

    if (Expression.traceNodes)
    {
      logger.debug("applySingleStepIBP: v={}, du={}", v, du);
    }

    // ∫ u dv = u·v - ∫ v·du dx
    var uvTerm             = u.mul(v).simplify();
    var remainingIntegrand = v.mul(du).simplify();
    var remainingIntegral  = remainingIntegrand.integral(variable).simplify();

    if (Expression.traceNodes)
    {
      logger.debug("applySingleStepIBP: uvTerm={}, remainingIntegral={}",
                   uvTerm,
                   remainingIntegral);
    }

    return uvTerm.sub(remainingIntegral).simplify();
  }

  /**
   * Checks if a node represents (variable - shift).
   * 
   * @param node     The node to check
   * @param variable The variable
   * @param shift    The expected shift
   * @return true if node equals (variable - shift)
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         boolean
         isShiftedVariable(Node<D, R, F> node, VariableNode<D, R, F> variable, Node<D, R, F> shift)
  {
    // Direct variable match when shift is zero
    if (shift.isZero() && node.equals(variable))
    {
      return true;
    }

    // Check for (x-a) structure
    if (node instanceof SubtractionNode sub)
    {
      return sub.left.equals(variable) && sub.right.equals(shift);
    }

    // Check for (x+a) when shift is -a
    if (node instanceof AdditionNode add && add.left.equals(variable)
                  && shift instanceof NegationNode negShift)
    {
      return add.right.equals(negShift.arg);
    }

    return false;
  }

  /**
   * Applies the tabular method for integration by parts.
   * 
   * Creates alternating sum: u·v - u'·v₁ + u''·v₂ - u'''·v₃ + ... where v, v₁,
   * v₂, ... are successive integrals of dv.
   * 
   * Continues until u differentiates to zero (for polynomials) or until a maximum
   * iteration count is reached.
   * 
   * @param u        The factor to differentiate
   * @param dv       The factor to integrate
   * @param variable The variable of integration
   * @return The integrated result
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         applyTabularMethod(Node<D, R, F> u, Node<D, R, F> dv, VariableNode<D, R, F> variable)
  {
    final AtomicReference<Node<D, R, F>> result        = new AtomicReference<>(u.zero());
    final AtomicReference<Node<D, R, F>> currentU      = new AtomicReference<>(u);
    final AtomicReference<Node<D, R, F>> currentV      =
                                                  new AtomicReference<>(dv.integral(variable));

    int                                  sign          = 1;
    int                                  maxIterations = 20;
    int                                  iteration     = 0;

    if (Expression.traceNodes)
    {
      logger.debug("applyTabularMethod: start u={}, dv={}, variable={}, maxIterations={}",
                   u,
                   dv,
                   variable,
                   maxIterations);
    }

    while (!currentU.get().isZero() && iteration < maxIterations)
    {
      sign = applyTabularIteration(result, currentU, currentV, variable, sign, iteration);
      iteration++;
    }

    if (Expression.traceNodes)
    {
      logger.debug("applyTabularMethod: end iterations={}, currentU={}, currentV={}, result={}",
                   iteration,
                   currentU.get(),
                   currentV.get(),
                   result.get());
    }

    assert iteration < maxIterations : String.format(" iterations = %d < maxIterations = %d",
                                                     iteration,
                                                     maxIterations);
    return result.get();
  }

  /**
   * Builds a single product node from a list of factors via left-association.
   * Returns the single factor if the list has one element.
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         buildProduct(java.util.List<Node<D, R, F>> factors)
  {
    assert !factors.isEmpty();
    var result = factors.get(0);
    for (int i = 1; i < factors.size(); i++)
    {
      result = result.mul(factors.get(i));
    }
    return result;
  }

  /**
   * Recursively flattens a multiplication tree into a list of non-multiplication
   * leaf factors.
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         void
         collectFactors(Node<D, R, F> node, java.util.List<Node<D, R, F>> factors)
  {
    if (node instanceof MultiplicationNode<D, R, F> mul)
    {
      collectFactors(mul.left, factors);
      collectFactors(mul.right, factors);
    }
    else
    {
      factors.add(node);
    }
  }

  /**
   * Integrates a product containing a Heaviside step function θ(x).
   *
   * Uses the identity: ∫ f(x)·θ(x) dx = θ(x) · ∫ f(x) dx
   *
   * This works because θ(x) is piecewise constant (0 for x&lt;0, 1 for x&gt;0),
   * so on each piece the integral reduces to either 0 or ∫ f(x) dx.
   *
   * @param factors  The flattened list of variable-dependent factors
   * @param variable The integration variable
   * @return The integrated result, or null if no θ factor is present
   * @see <a href="https://github.com/crowlogic/arb4j/issues/841">#841</a>
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         tryStepFunctionIntegration(java.util.List<Node<D, R, F>> factors,
                                    VariableNode<D, R, F> variable)
  {
    FunctionNode<D, R, F> thetaNode = null;
    var                   remaining = new java.util.ArrayList<Node<D, R, F>>();

    for (var factor : factors)
    {
      if (thetaNode == null && factor instanceof FunctionNode<D, R, F> fn && fn.is("θ"))
      {
        thetaNode = fn;
      }
      else
      {
        remaining.add(factor);
      }
    }

    if (thetaNode == null || remaining.isEmpty())
    {
      return null;
    }

    if (Expression.traceNodes)
    {
      logger.debug("tryStepFunctionIntegration: θ found, integrating remaining {} factors (#841)",
                   remaining.size());
    }

    var product = buildProduct(remaining);
    return thetaNode.mul(product.integral(variable));
  }

  /**
   * Tries all 2-partitions of the factor list for integration by parts.
   *
   * For each partition (S, S̄) of factors into two non-empty subsets, checks
   * whether one subset's product is polynomial-like and the other's is easily
   * integrable (or vice versa per LIATE), then applies the appropriate method:
   * tabular for polynomial u (which differentiates to zero), single-step IBP for
   * logarithmic u (which does not).
   *
   * Uses bitmask enumeration over 2^n - 2 non-trivial partitions.
   *
   * @param factors  The flattened list of factors (all depend on the variable)
   * @param variable The integration variable
   * @return The integrated result, or null if no partition works
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         tryIntegrationByPartsOnFactors(java.util.List<Node<D, R, F>> factors,
                                        VariableNode<D, R, F> variable)
  {
    int n = factors.size();
    if (n < 2)
    {
      return null;
    }

    int limit = (1 << n) - 1;
    for (int mask = 1; mask < limit; mask++)
    {
      var groupA = new java.util.ArrayList<Node<D, R, F>>();
      var groupB = new java.util.ArrayList<Node<D, R, F>>();
      for (int i = 0; i < n; i++)
      {
        if ((mask & (1 << i)) != 0)
        {
          groupA.add(factors.get(i));
        }
        else
        {
          groupB.add(factors.get(i));
        }
      }

      var productA = buildProduct(groupA);
      var productB = buildProduct(groupB);

      // Strategy 1: A is polynomial-like, B is easily integrable → tabular
      if (productA.isPolynomialLike(variable) && productB.isEasilyIntegrable())
      {
        return applyTabularMethod(productA, productB, variable);
      }
      // Strategy 2: B is polynomial-like, A is easily integrable → tabular
      if (productB.isPolynomialLike(variable) && productA.isEasilyIntegrable())
      {
        return applyTabularMethod(productB, productA, variable);
      }
      // Strategy 3: LIATE — A is logarithmic, B is polynomial-like → single-step
      if (productA.isLogarithmic() && productB.isPolynomialLike(variable))
      {
        return applySingleStepIBP(productA, productB, variable);
      }
      // Strategy 4: LIATE — B is logarithmic, A is polynomial-like → single-step
      if (productB.isLogarithmic() && productA.isPolynomialLike(variable))
      {
        return applySingleStepIBP(productB, productA, variable);
      }
    }

    return null;
  }

  /**
   * Executes a single iteration of the tabular method for integration by parts.
   * 
   * Accumulates ±u·v into result, then advances u by differentiation and v by
   * integration for the next iteration.
   * 
   * @param result    Accumulated result across iterations
   * @param currentU  The current factor being differentiated
   * @param currentV  The current factor being integrated
   * @param variable  The variable of integration
   * @param sign      +1 or -1 for alternating signs
   * @param iteration Current iteration index (for logging)
   * @return The negated sign for the next iteration
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         int
         applyTabularIteration(AtomicReference<Node<D, R, F>> result,
                               AtomicReference<Node<D, R, F>> currentU,
                               AtomicReference<Node<D, R, F>> currentV,
                               VariableNode<D, R, F> variable,
                               int sign,
                               int iteration)
  {
    Node<D, R, F> u = currentU.get();
    Node<D, R, F> v = currentV.get();

    if (Expression.traceNodes)
    {
      logger.debug("  tabular[{}] enter sign={} u={} v={}", iteration, sign, u, v);
    }

    // Add term: ±u·v
    var term = u.mul(v).simplify();
    if (Expression.traceNodes)
    {
      logger.debug("  tabular[{}] term={}", iteration, term);
    }

    result.set((sign > 0) ? result.get().add(term) : result.get().sub(term));
    if (Expression.traceNodes)
    {
      logger.debug("  tabular[{}] result={}", iteration, result.get());
    }

    // Prepare for next iteration
    var nextU = u.differentiate(variable).simplify();
    currentU.set(nextU);
    if (Expression.traceNodes)
    {
      logger.debug("  tabular[{}] nextU={}", iteration, nextU);
    }

    if (!nextU.isZero())
    {
      var nextV = v.integral(variable).simplify();
      currentV.set(nextV);
      if (Expression.traceNodes)
      {
        logger.debug("  tabular[{}] nextV={}", iteration, nextV);
      }
    }

    return -sign;
  }

  /**
   * Checks if a node is a polynomial in (variable - shift).
   * 
   * This handles: - (x-a) itself - (x-a)^n for any constant n - Products and sums
   * involving (x-a)
   * 
   * @param node     The node to check
   * @param variable The variable
   * @param shift    The shift value
   * @return true if node is a polynomial in (variable - shift)
   */
  public static <D, R, F extends Function<? extends D, ? extends R>>
         boolean
         isPolynomialInShiftedVariable(Node<D, R, F> node,
                                       VariableNode<D, R, F> variable,
                                       Node<D, R, F> shift)
  {
    // Direct match: (x-a) where shift=a
    if (isShiftedVariable(node, variable, shift))
    {
      return true;
    }

    // Power: (x-a)^n
    if (node instanceof ExponentiationNode<D, R, F> exp)
    {
      return isShiftedVariable(exp.left, variable, shift) && exp.right.isScalar();
    }

    // Product: terms containing (x-a)
    if (node instanceof MultiplicationNode<D, R, F> mult)
    {
      return isPolynomialInShiftedVariable(mult.left, variable, shift)
                    || isPolynomialInShiftedVariable(mult.right, variable, shift);
    }

    // Sum: any term containing (x-a)
    if (node instanceof AdditionNode || node instanceof SubtractionNode)
    {
      var binaryOperationNode = node.asBinaryOperation();
      return isPolynomialInShiftedVariable(binaryOperationNode.left, variable, shift)
                    || isPolynomialInShiftedVariable(binaryOperationNode.right, variable, shift);
    }

    // Variable itself: x with shift=0
    if (node.equals(variable) && shift.isZero())
    {
      return true;
    }

    return false;
  }

  /**
   * Extracts the shift value 'a' from a delta function argument.
   * 
   * δ(x) returns 0 (zero node) δ(x-a) returns a δ(x+a) returns -a
   * 
   * @param deltaArg The delta function's argument
   * @param variable The variable node (e.g., x)
   * 
   * @return The shift node, or null if pattern doesn't match
   */
  static <D, R, F extends Function<? extends D, ? extends R>>
         Node<D, R, F>
         extractShiftFromDeltaArg(Node<D, R, F> deltaArg, VariableNode<D, R, F> variable)
  {
    // Case 1: δ(x) - direct variable, shift = 0
    if (deltaArg.equals(variable))
    {
      return variable.zero();
    }

    // Case 2: δ(x-a) or δ(x+a) - binary subtraction/addition
    if (deltaArg instanceof BinaryOperationNode<D, R, F> binaryOp)
    {
      if (binaryOp instanceof SubtractionNode)
      {
        // δ(x-a): left should be variable, right is the shift
        if (binaryOp.left.equals(variable) && binaryOp.right.isScalar())
        {
          return binaryOp.right;
        }
      }
      else if (binaryOp instanceof AdditionNode)
      {
        // δ(x+a): left should be variable, right is negative shift
        if (binaryOp.left.equals(variable) && binaryOp.right.isScalar())
        {
          return binaryOp.right.neg();
        }
      }
    }

    return null;
  }

}
