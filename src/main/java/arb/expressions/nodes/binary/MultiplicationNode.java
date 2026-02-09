package arb.expressions.nodes.binary;

import static java.lang.String.format;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Integer;
import arb.Quaternion;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;

/**
 * Represents a multiplication operation node in the expression tree. Implements
 * integration by parts for polynomial × exp/trig products.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  public static final Logger logger = LoggerFactory.getLogger(MultiplicationNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public boolean isZero()
  {
    return left.isZero() || right.isZero();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    return super.generate(mv, resultType);
  }

  public MultiplicationNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "mul",
          right,
          "*");
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    var a   = left.differentiate(variable).mul(right);
    var b   = right.differentiate(variable).mul(left);
    var sum = a.add(b);
    return sum;
  }

  /**
   * Integrates a product using integration by parts when applicable.
   * 
   * For products of the form p(x)·f(x) where p(x) is a polynomial and f(x) is
   * exp, sin, cos, or log, uses the tabular method:
   * 
   * ∫ u dv = uv - ∫ v du
   * 
   * The tabular method repeatedly differentiates the polynomial (which eventually
   * becomes zero) while integrating the transcendental function.
   * 
   * @param variable The variable of integration
   * @return The integrated expression
   */
  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // Simplify first -- catches e.g. (x-a)*δ(x-a) = 0
    Node<D, R, F> simplified = this.simplify();
    if (simplified.isZero())
    {
      return simplified;
    }
    if (!simplified.equals(this))
    {
      return simplified.integrate(variable);
    }

    // Flatten the product tree into individual factors
    var factors = new ArrayList<Node<D, R, F>>();
    collectFactors(this, factors);

    // Separate constant factors (don't depend on integration variable) from the
    // rest
    var constantFactors = new ArrayList<Node<D, R, F>>();
    var variableFactors = new ArrayList<Node<D, R, F>>();
    for (var factor : factors)
    {
      if (factor.isScalar() && !factor.dependsOn(variable))
      {
        constantFactors.add(factor);
      }
      else
      {
        variableFactors.add(factor);
      }
    }

    // If we have constant factors, pull them out: ∫ c·f(t) dt = c · ∫ f(t) dt
    if (!constantFactors.isEmpty() && !variableFactors.isEmpty())
    {
      var constantProduct = buildProduct(constantFactors);
      var variableProduct = buildProduct(variableFactors);
      return constantProduct.mul(variableProduct.integrate(variable)).simplify();
    }

    // Try step function integration: ∫ f(x)·θ(x) dx = θ(x) · ∫ f(x) dx  (#841)
    var stepResult = tryStepFunctionIntegration(variableFactors, variable);
    if (stepResult != null)
    {
      return stepResult.simplify();
    }

    // All factors depend on the variable -- try IBP on all 2-partitions
    var ibpResult = tryIntegrationByPartsOnFactors(variableFactors, variable);
    if (ibpResult != null)
    {
      Node<D, R, F> simplifiedIbpResult = ibpResult.simplify();
      assert simplifiedIbpResult != null : "simplifiedIbpResult is null for " + this;
      return simplifiedIbpResult;
    }

    return new IntegralNode<D, R, F>(expression,
                                     this,
                                     variable);
  }

  /**
   * Recursively flattens a multiplication tree into a list of non-multiplication
   * leaf factors.
   */
  private static <D, R, F extends Function<? extends D, ? extends R>>
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
   * Builds a single product node from a list of factors via left-association.
   * Returns the single factor if the list has one element.
   */
  private Node<D, R, F> buildProduct(java.util.List<Node<D, R, F>> factors)
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
  private Node<D, R, F> tryStepFunctionIntegration(java.util.List<Node<D, R, F>> factors,
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
    return thetaNode.mul(product.integrate(variable));
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
  private Node<D, R, F> tryIntegrationByPartsOnFactors(java.util.List<Node<D, R, F>> factors,
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
  private Node<D, R, F>
          applySingleStepIBP(Node<D, R, F> u, Node<D, R, F> dv, VariableNode<D, R, F> variable)
  {
    if (Expression.traceNodes)
    {
      logger.debug("applySingleStepIBP: u={}, dv={}, variable={}", u, dv, variable);
    }

    var v  = dv.integrate(variable).simplify();
    var du = u.differentiate(variable).simplify();

    if (Expression.traceNodes)
    {
      logger.debug("applySingleStepIBP: v={}, du={}", v, du);
    }

    // ∫ u dv = u·v - ∫ v·du dx
    var uvTerm             = u.mul(v).simplify();
    var remainingIntegrand = v.mul(du).simplify();
    var remainingIntegral  = remainingIntegrand.integrate(variable).simplify();

    if (Expression.traceNodes)
    {
      logger.debug("applySingleStepIBP: uvTerm={}, remainingIntegral={}",
                   uvTerm,
                   remainingIntegral);
    }

    return uvTerm.sub(remainingIntegral).simplify();
  }

  /**
   * Attempts integration by parts using the tabular method.
   * 
   * Identifies which factor should be u (differentiated) and which should be dv
   * (integrated). Polynomials are preferred for u since they differentiate to
   * zero after finitely many steps.
   * 
   * @param variable The variable of integration
   * @return The result of integration by parts, or null if not applicable
   */
  private Node<D, R, F> tryIntegrationByParts(VariableNode<D, R, F> variable)
  {
    Node<D, R, F> u                    = null;
    Node<D, R, F> dv                   = null;
    boolean       useTabular           = true;

    boolean       isLeftPolynomialLike = left.isPolynomialLike(variable);
    boolean       isRightPolynomialLike;

    if (isLeftPolynomialLike && right.isEasilyIntegrable())
    {
      u  = left;
      dv = right;
    }
    else if ((isRightPolynomialLike = right.isPolynomialLike(variable))
                  && left.isEasilyIntegrable())
    {
      u  = right;
      dv = left;
    }
    else if (left.isLogarithmic() && (isRightPolynomialLike = right.isPolynomialLike(variable)))
    {
      u          = left;
      dv         = right;
      useTabular = false;
    }
    else if (right.isLogarithmic() && isLeftPolynomialLike)
    {
      u          = right;
      dv         = left;
      useTabular = false;
    }
    else
    {
      return null;
    }

    return useTabular ? applyTabularMethod(u, dv, variable) : applySingleStepIBP(u, dv, variable);
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
  private Node<D, R, F>
          applyTabularMethod(Node<D, R, F> u, Node<D, R, F> dv, VariableNode<D, R, F> variable)
  {
    final AtomicReference<Node<D, R, F>> result        = new AtomicReference<>(zero());
    final AtomicReference<Node<D, R, F>> currentU      = new AtomicReference<>(u);
    final AtomicReference<Node<D, R, F>> currentV      =
                                                  new AtomicReference<>(dv.integrate(variable));

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
  private int applyTabularIteration(AtomicReference<Node<D, R, F>> result,
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
      var nextV = v.integrate(variable).simplify();
      currentV.set(nextV);
      if (Expression.traceNodes)
      {
        logger.debug("  tabular[{}] nextV={}", iteration, nextV);
      }
    }

    return -sign;
  }

  /**
   * @return true if {@link Expression#coDomainType} is not a {@link Quaternion}
   */
  @Override
  public boolean isCommutative()
  {
    return !expression.coDomainType.equals(Quaternion.class);
  }

  @Override
  public Node<D, R, F> simplify()
  {
    simplifyDepth++;
    if (traceSimplify)
    {
      System.err.printf("%s[%d] ENTER MultiplicationNode.simplify() this=%s left=%s right=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        System.identityHashCode(this),
                        left,
                        right);
    }

    if (left != null)
    {
      var oldLeft = left;
      left = left.simplify();
      if (traceSimplify && left != oldLeft)
      {
        System.err.printf("%s[%d]   left changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          oldLeft,
                          left);
      }
    }
    if (right != null)
    {
      var oldRight = right;
      right = right.simplify();
      if (traceSimplify && right != oldRight)
      {
        System.err.printf("%s[%d]   right changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          oldRight,
                          right);
      }
    }

    if (left.isZero() || right.isZero())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   -> returning zero()%n", depthIndent(), simplifyDepth);
      }
      simplifyDepth--;
      return zero();
    }

    if (left.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isOne() -> returning right=%s%n",
                          depthIndent(),
                          simplifyDepth,
                          right);
      }
      simplifyDepth--;
      return right;
    }
    if (right.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isOne() -> returning left=%s%n",
                          depthIndent(),
                          simplifyDepth,
                          left);
      }
      simplifyDepth--;
      return left;
    }
    if (left.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isNegOne() -> returning right.neg()%n",
                          depthIndent(),
                          simplifyDepth);
      }
      simplifyDepth--;
      return right.neg();
    }
    if (right.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isNegOne() -> returning left.neg()%n",
                          depthIndent(),
                          simplifyDepth);
      }
      simplifyDepth--;
      return left.neg();
    }

    var deltaSimplification = simplifyDeltaMultiplication();
    if (deltaSimplification != null)
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   delta simplification -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          deltaSimplification);
      }
      simplifyDepth--;
      return deltaSimplification;
    }

    if (left instanceof LiteralConstantNode<D, R, F> leftConstant
                  && right instanceof LiteralConstantNode<D, R, F> rightConstant)
    {
      if (leftConstant.isInt && rightConstant.isInt)
      {
        try ( var lint = new Integer(leftConstant.value);
              var rint = new Integer(rightConstant.value))
        {
          var product = lint.mul(rint, 0, rint);
          if (traceSimplify)
          {
            System.err.printf("%s[%d]   integer folding: %s * %s = %s%n",
                              depthIndent(),
                              simplifyDepth,
                              leftConstant.value,
                              rightConstant.value,
                              product);
          }
          simplifyDepth--;
          return expression.newLiteralConstant(product.toString());
        }
      }
    }

    if (left instanceof ExponentiationNode<D, R, F> leftExp
                  && right instanceof ExponentiationNode<D, R, F> rightExp)
    {
      var leftBase  = leftExp.left;
      var rightBase = rightExp.left;
      if (leftBase.equals(rightBase))
      {
        var rightPower = rightExp.right;
        var leftPower  = leftExp.right;
        var power      = leftPower.add(rightPower).simplify();
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   exponent addition: base^(%s+%s)%n",
                            depthIndent(),
                            simplifyDepth,
                            leftPower,
                            rightPower);
        }
        simplifyDepth--;
        return leftBase.pow(power).simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsExponentialFunction  = leftFunction.is("exp");
      var rightIsExponentialFunction = rightFunction.is("exp");

      if (leftIsExponentialFunction && rightIsExponentialFunction)
      {
        var exponentSum = leftFunction.arg.add(rightFunction.arg).simplify();
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   exp multiplication: exp(%s+%s)%n",
                            depthIndent(),
                            simplifyDepth,
                            leftFunction.arg,
                            rightFunction.arg);
        }
        simplifyDepth--;
        return exponentSum.exp().simplify();
      }
    }

    if (left instanceof FunctionNode<D, R, F> leftFunction2
                  && right instanceof FunctionNode<D, R, F> rightFunction2)
    {
      var leftIsSquareRootFunction = leftFunction2.is("sqrt");
      var functionsAreEqual        = leftFunction2.equals(rightFunction2);

      if (leftIsSquareRootFunction && functionsAreEqual)
      {
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   sqrt*sqrt -> arg%n", depthIndent(), simplifyDepth);
        }
        simplifyDepth--;
        return leftFunction2.arg;
      }
    }

    // Combine fractions: (a/b) * (c/d) → (a*c)/(b*d)
    if (left instanceof DivisionNode<D, R, F> leftDiv
                  && right instanceof DivisionNode<D, R, F> rightDiv)
    {
      var numerator   = leftDiv.left.mul(rightDiv.left).simplify();
      var denominator = leftDiv.right.mul(rightDiv.right).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   fraction combine: (%s/%s)*(%s/%s) → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          leftDiv.left,
                          leftDiv.right,
                          rightDiv.left,
                          rightDiv.right,
                          numerator,
                          denominator);
      }
      simplifyDepth--;
      return numerator.div(denominator).simplify();
    }

    // Pull fraction right: expr * (a/b) → (expr*a)/b
    if (right instanceof DivisionNode<D, R, F> rightDiv)
    {
      var numerator = left.mul(rightDiv.left).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   pull fraction right: %s*(%s/%s) → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          left,
                          rightDiv.left,
                          rightDiv.right,
                          numerator,
                          rightDiv.right);
      }
      simplifyDepth--;
      return numerator.div(rightDiv.right).simplify();
    }

    // Pull fraction left: (a/b) * expr → (a*expr)/b
    if (left instanceof DivisionNode<D, R, F> leftDiv)
    {
      var numerator = leftDiv.left.mul(right).simplify();
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   pull fraction left: (%s/%s)*%s → %s/%s%n",
                          depthIndent(),
                          simplifyDepth,
                          leftDiv.left,
                          leftDiv.right,
                          right,
                          numerator,
                          leftDiv.right);
      }
      simplifyDepth--;
      return numerator.div(leftDiv.right).simplify();
    }

    if (traceSimplify)
    {
      System.err.printf("%s[%d] EXIT MultiplicationNode.simplify() returning this=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        this);
    }
    simplifyDepth--;
    return this;
  }

  /**
   * Simplifies expressions of the form (x-a)^n * δ(x-a) = 0
   * 
   * Implements the mathematical rule that any polynomial in (x-a) multiplied by
   * δ(x-a) equals zero, since the polynomial vanishes at the delta function's
   * singularity point x=a.
   * 
   * @return zero() if the pattern matches, null otherwise
   */
  private Node<D, R, F> simplifyDeltaMultiplication()
  {
    // Check if either operand is a delta function
    FunctionNode<D, R, F> delta      = null;
    Node<D, R, F>         multiplier = null;

    if (left.isFunction() && left.asFunction().is("δ"))
    {
      delta      = left.asFunction();
      multiplier = right;
    }
    else if (right.isFunction() && right.asFunction().is("δ"))
    {
      delta      = right.asFunction();
      multiplier = left;
    }
    else
    {
      return null; // No delta function present
    }

    // Extract the delta function's argument
    var                   deltaArg = delta.arg;

    // Find the variable involved
    VariableNode<D, R, F> variable = extractVariable(multiplier);
    if (variable == null)
    {
      variable = extractVariable(deltaArg);
    }
    if (variable == null)
    {
      return null; // No variable found
    }

    // Extract shift from delta argument: δ(x) has shift=0, δ(x-a) has shift=a
    Node<D, R, F> deltaShift = extractShiftFromDeltaArg(variable, deltaArg);
    if (deltaShift == null)
    {
      return null; // Delta argument doesn't match expected pattern
    }

    // Check if multiplier is a polynomial in (x - deltaShift)
    if (isPolynomialInShiftedVariable(multiplier, variable, deltaShift))
    {
      return zero();
    }

    return null;
  }

  /**
   * Extracts the shift value 'a' from a delta function argument.
   * 
   * δ(x) returns 0 (zero node) δ(x-a) returns a δ(x+a) returns -a
   * 
   * @param variable The variable node (e.g., x)
   * @param deltaArg The delta function's argument
   * @return The shift node, or null if pattern doesn't match
   */
  private Node<D, R, F> extractShiftFromDeltaArg(VariableNode<D, R, F> variable,
                                                 Node<D, R, F> deltaArg)
  {
    // Case 1: δ(x) - direct variable, shift = 0
    if (deltaArg.equals(variable))
    {
      return zero();
    }

    // Case 2: δ(x-a) or δ(x+a) - binary subtraction/addition
    if (deltaArg instanceof BinaryOperationNode<?, ?, ?>)
    {
      var binaryOp = (BinaryOperationNode<D, R, F>) deltaArg;

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
  private boolean isPolynomialInShiftedVariable(Node<D, R, F> node,
                                                VariableNode<D, R, F> variable,
                                                Node<D, R, F> shift)
  {
    // Direct match: (x-a) where shift=a
    if (isShiftedVariable(node, variable, shift))
    {
      return true;
    }

    // Power: (x-a)^n
    if (node instanceof ExponentiationNode<?, ?, ?>)
    {
      var exp = (ExponentiationNode<D, R, F>) node;
      return isShiftedVariable(exp.left, variable, shift) && exp.right.isScalar();
    }

    // Product: terms containing (x-a)
    if (node instanceof MultiplicationNode<?, ?, ?>)
    {
      var mult = (MultiplicationNode<D, R, F>) node;
      return isPolynomialInShiftedVariable(mult.left, variable, shift)
                    || isPolynomialInShiftedVariable(mult.right, variable, shift);
    }

    // Sum: any term containing (x-a)
    if (node instanceof AdditionNode<?, ?, ?> || node instanceof SubtractionNode<?, ?, ?>)
    {
      var binary = (BinaryOperationNode<D, R, F>) node;
      return isPolynomialInShiftedVariable(binary.left, variable, shift)
                    || isPolynomialInShiftedVariable(binary.right, variable, shift);
    }

    // Variable itself: x with shift=0
    if (node.equals(variable) && shift.isZero())
    {
      return true;
    }

    return false;
  }

  /**
   * Checks if a node represents (variable - shift).
   * 
   * @param node     The node to check
   * @param variable The variable
   * @param shift    The expected shift
   * @return true if node equals (variable - shift)
   */
  private boolean
          isShiftedVariable(Node<D, R, F> node, VariableNode<D, R, F> variable, Node<D, R, F> shift)
  {
    // Direct variable match when shift is zero
    if (shift.isZero() && node.equals(variable))
    {
      return true;
    }

    // Check for (x-a) structure
    if (node instanceof SubtractionNode<?, ?, ?>)
    {
      var sub = (SubtractionNode<D, R, F>) node;
      return sub.left.equals(variable) && sub.right.equals(shift);
    }

    // Check for (x+a) when shift is -a
    if (node instanceof AdditionNode<?, ?, ?>)
    {
      var add = (AdditionNode<D, R, F>) node;
      if (add.left.equals(variable) && shift instanceof NegationNode<?, ?, ?>)
      {
        var negShift = (NegationNode<D, R, F>) shift;
        return add.right.equals(negShift.arg);
      }
    }

    return false;
  }

  /**
   * Extracts a variable node from a tree by traversing its structure.
   * 
   * @param node The node to search
   * @return The first VariableNode found, or null
   */
  private VariableNode<D, R, F> extractVariable(Node<D, R, F> node)
  {
    if (node.isVariable())
    {
      return node.asVariable();
    }

    if (node instanceof BinaryOperationNode<?, ?, ?>)
    {
      var binary  = (BinaryOperationNode<D, R, F>) node;
      var leftVar = extractVariable(binary.left);
      if (leftVar != null)
      {
        return leftVar;
      }
      return extractVariable(binary.right);
    }

    if (node instanceof FunctionNode<?, ?, ?>)
    {
      var func = (FunctionNode<D, R, F>) node;
      return extractVariable(func.arg);
    }

    if (node instanceof UnaryOperationNode<?, ?, ?>)
    {
      var unary = (UnaryOperationNode<D, R, F>) node;
      return extractVariable(unary.arg);
    }

    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert left != null : this + ".left is null";
    assert right != null : this + ".right is null";
    return left.spliceInto(newExpression).mul(right.spliceInto(newExpression));
  }

  @Override
  public String typeset()
  {
    return format("\\left(%s \\cdot %s\\right)", left.typeset(), right.typeset());
  }
}
