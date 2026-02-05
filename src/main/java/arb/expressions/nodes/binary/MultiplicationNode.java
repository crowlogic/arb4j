package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.Quaternion;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;

/**
 * Represents a multiplication operation node in the expression tree.
 * Implements integration by parts for polynomial × exp/trig products.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
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
    var a   = left.differentiate(variable).mul(right).simplify();
    var b   = right.differentiate(variable).mul(left).simplify();
    var sum = a.add(b).simplify();
    return sum;
  }

  /**
   * Integrates a product using integration by parts when applicable.
   * 
   * For products of the form p(x)·f(x) where p(x) is a polynomial and
   * f(x) is exp, sin, cos, or log, uses the tabular method:
   * 
   * ∫ u dv = uv - ∫ v du
   * 
   * The tabular method repeatedly differentiates the polynomial (which
   * eventually becomes zero) while integrating the transcendental function.
   * 
   * @param variable The variable of integration
   * @return The integrated expression
   */
  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // Try integration by parts if one factor is polynomial-like
    var ibpResult = tryIntegrationByParts(variable);
    if (ibpResult != null)
    {
      return ibpResult.simplify();
    }

    // Handle constant × function: ∫ c·f(x) dx = c · ∫ f(x) dx
    if (left.isScalar() && !left.dependsOn(variable))
    {
      return left.mul(right.integrate(variable)).simplify();
    }
    if (right.isScalar() && !right.dependsOn(variable))
    {
      return right.mul(left.integrate(variable)).simplify();
    }

    // Fallback: This is mathematically incorrect but preserves old behavior
    // TODO: Implement more general integration strategies
    return left.integrate(variable).mul(right.integrate(variable)).simplify();
  }

  /**
   * Attempts integration by parts using the tabular method.
   * 
   * Identifies which factor should be u (differentiated) and which should be
   * dv (integrated). Polynomials are preferred for u since they differentiate
   * to zero after finitely many steps.
   * 
   * @param variable The variable of integration
   * @return The result of integration by parts, or null if not applicable
   */
  private Node<D, R, F> tryIntegrationByParts(VariableNode<D, R, F> variable)
  {
    Node<D, R, F> u  = null; // Will be differentiated
    Node<D, R, F> dv = null; // Will be integrated

    // Strategy: polynomial × transcendental → u = polynomial, dv = transcendental
    if (isPolynomialLike(left, variable) && isEasilyIntegrable(right))
    {
      u  = left;
      dv = right;
    }
    else if (isPolynomialLike(right, variable) && isEasilyIntegrable(left))
    {
      u  = right;
      dv = left;
    }
    // Strategy: polynomial × log → u = log, dv = polynomial (LIATE rule)
    else if (isLogarithmic(left) && isPolynomialLike(right, variable))
    {
      u  = left;
      dv = right;
    }
    else if (isLogarithmic(right) && isPolynomialLike(left, variable))
    {
      u  = right;
      dv = left;
    }
    else
    {
      return null; // Integration by parts not applicable
    }

    // Apply tabular method: ∫ u dv = uv - ∫ v du
    return applyTabularMethod(u, dv, variable);
  }

  /**
   * Applies the tabular method for integration by parts.
   * 
   * Creates alternating sum: u·v - u'·v₁ + u''·v₂ - u'''·v₃ + ...
   * where v, v₁, v₂, ... are successive integrals of dv.
   * 
   * Continues until u differentiates to zero (for polynomials) or
   * until a maximum iteration count is reached.
   * 
   * @param u        The factor to differentiate
   * @param dv       The factor to integrate
   * @param variable The variable of integration
   * @return The integrated result
   */
  private Node<D, R, F> applyTabularMethod(Node<D, R, F> u,
                                           Node<D, R, F> dv,
                                           VariableNode<D, R, F> variable)
  {
    Node<D, R, F> result = zero();
    Node<D, R, F> currentU = u;
    Node<D, R, F> currentV = dv.integrate(variable);
    int sign = 1;
    int maxIterations = 20; // Prevent infinite loops for non-polynomial u
    int iteration = 0;

    while (!currentU.isZero() && iteration < maxIterations)
    {
      // Add term: ±u·v
      Node<D, R, F> term = currentU.mul(currentV).simplify();
      if (sign > 0)
      {
        result = result.add(term);
      }
      else
      {
        result = result.sub(term);
      }

      // Prepare for next iteration
      currentU = currentU.differentiate(variable).simplify();
      if (!currentU.isZero())
      {
        currentV = currentV.integrate(variable).simplify();
      }
      sign = -sign;
      iteration++;
    }

    return result;
  }

  /**
   * Checks if a node represents a polynomial-like expression in the given variable.
   * 
   * Polynomial-like includes:
   * - Constants
   * - The variable itself (x)
   * - Powers of the variable (x^n for constant n)
   * - Sums and products of the above
   * 
   * @param node     The node to check
   * @param variable The variable
   * @return true if the node is polynomial-like
   */
  private boolean isPolynomialLike(Node<D, R, F> node, VariableNode<D, R, F> variable)
  {
    // Constants are polynomial (degree 0)
    if (node.isScalar() && !node.dependsOn(variable))
    {
      return true;
    }

    // The variable itself is polynomial (degree 1)
    if (node.equals(variable))
    {
      return true;
    }

    // x^n where n is a non-negative integer constant
    if (node instanceof ExponentiationNode<?, ?, ?>)
    {
      var exp = (ExponentiationNode<D, R, F>) node;
      if (exp.left.equals(variable) && isNonNegativeIntegerConstant(exp.right))
      {
        return true;
      }
      // Also handle (polynomial)^n
      if (isPolynomialLike(exp.left, variable) && isNonNegativeIntegerConstant(exp.right))
      {
        return true;
      }
    }

    // Sum of polynomials is polynomial
    if (node instanceof AdditionNode<?, ?, ?> || node instanceof SubtractionNode<?, ?, ?>)
    {
      var binary = (BinaryOperationNode<D, R, F>) node;
      return isPolynomialLike(binary.left, variable) && isPolynomialLike(binary.right, variable);
    }

    // Product of polynomials is polynomial
    if (node instanceof MultiplicationNode<?, ?, ?>)
    {
      var mult = (MultiplicationNode<D, R, F>) node;
      return isPolynomialLike(mult.left, variable) && isPolynomialLike(mult.right, variable);
    }

    // Constant times polynomial
    if (node instanceof MultiplicationNode<?, ?, ?>)
    {
      var mult = (MultiplicationNode<D, R, F>) node;
      if ((mult.left.isScalar() && !mult.left.dependsOn(variable))
                    || (mult.right.isScalar() && !mult.right.dependsOn(variable)))
      {
        return isPolynomialLike(mult.left, variable) || isPolynomialLike(mult.right, variable);
      }
    }

    return false;
  }

  /**
   * Checks if a node represents a non-negative integer constant.
   */
  private boolean isNonNegativeIntegerConstant(Node<D, R, F> node)
  {
    if (node instanceof LiteralConstantNode<?, ?, ?>)
    {
      var lit = (LiteralConstantNode<D, R, F>) node;
      if (lit.isInt)
      {
        try
        {
          int val = java.lang.Integer.parseInt(lit.value);
          return val >= 0;
        }
        catch (NumberFormatException e)
        {
          return false;
        }
      }
    }
    return false;
  }

  /**
   * Checks if a node is easily integrable (exp, sin, cos).
   * These functions have straightforward antiderivatives.
   */
  private boolean isEasilyIntegrable(Node<D, R, F> node)
  {
    if (node instanceof FunctionNode<?, ?, ?>)
    {
      var func = (FunctionNode<D, R, F>) node;
      String name = func.functionName;
      return "exp".equals(name) || "sin".equals(name) || "cos".equals(name)
                    || "sinh".equals(name) || "cosh".equals(name);
    }
    return false;
  }

  /**
   * Checks if a node is a logarithmic function.
   * Log requires special handling in integration by parts (LIATE rule).
   */
  private boolean isLogarithmic(Node<D, R, F> node)
  {
    if (node instanceof FunctionNode<?, ?, ?>)
    {
      var func = (FunctionNode<D, R, F>) node;
      return "log".equals(func.functionName) || "ln".equals(func.functionName);
    }
    return false;
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

    // Simplify children first
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

    // Check for zero multiplication
    if (left.isZero() || right.isZero())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   -> returning zero()%n", depthIndent(), simplifyDepth);
      }
      simplifyDepth--;
      return zero();
    }

    // Check for identity multiplication
    if (left.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isOne() -> returning right=%s%n", depthIndent(), simplifyDepth, right);
      }
      simplifyDepth--;
      return right;
    }
    if (right.isOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isOne() -> returning left=%s%n", depthIndent(), simplifyDepth, left);
      }
      simplifyDepth--;
      return left;
    }
    if (left.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   left.isNegOne() -> returning right.neg()%n", depthIndent(), simplifyDepth);
      }
      simplifyDepth--;
      return right.neg();
    }
    if (right.isNegOne())
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   right.isNegOne() -> returning left.neg()%n", depthIndent(), simplifyDepth);
      }
      simplifyDepth--;
      return left.neg();
    }

    // Try delta function simplification
    var deltaSimplification = simplifyDeltaMultiplication();
    if (deltaSimplification != null)
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   delta simplification -> %s%n", depthIndent(), simplifyDepth, deltaSimplification);
      }
      simplifyDepth--;
      return deltaSimplification;
    }

    // Constant folding for integer literals
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
            System.err.printf("%s[%d]   integer folding: %s * %s = %s%n", depthIndent(), simplifyDepth, leftConstant.value, rightConstant.value, product);
          }
          simplifyDepth--;
          return expression.newLiteralConstant(product.toString());
        }
      }
    }

    // Exponent addition: x^a * x^b = x^(a+b)
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
          System.err.printf("%s[%d]   exponent addition: base^(%s+%s)%n", depthIndent(), simplifyDepth, leftPower, rightPower);
        }
        simplifyDepth--;
        return leftBase.pow(power).simplify();
      }
    }

    // Exponential function multiplication: exp(a) * exp(b) = exp(a+b)
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
          System.err.printf("%s[%d]   exp multiplication: exp(%s+%s)%n", depthIndent(), simplifyDepth, leftFunction.arg, rightFunction.arg);
        }
        simplifyDepth--;
        return exponentSum.exp().simplify();
      }
    }

    // Square root multiplication: sqrt(x) * sqrt(x) = x
    if (left instanceof FunctionNode<D, R, F> leftFunction
                  && right instanceof FunctionNode<D, R, F> rightFunction)
    {
      var leftIsSquareRootFunction = leftFunction.is("sqrt");
      var functionsAreEqual        = leftFunction.equals(rightFunction);

      if (leftIsSquareRootFunction && functionsAreEqual)
      {
        if (traceSimplify)
        {
          System.err.printf("%s[%d]   sqrt*sqrt -> arg%n", depthIndent(), simplifyDepth);
        }
        simplifyDepth--;
        return leftFunction.arg;
      }
    }

    if (traceSimplify)
    {
      System.err.printf("%s[%d] EXIT MultiplicationNode.simplify() calling super%n", depthIndent(), simplifyDepth);
    }
    simplifyDepth--;
    return super.simplify();
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
