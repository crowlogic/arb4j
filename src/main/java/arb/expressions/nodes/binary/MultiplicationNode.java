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

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return left.integrate(variable).mul(right.integrate(variable)).simplify();
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
    // Simplify children first
    if (left != null)
    {
      left = left.simplify();
    }
    if (right != null)
    {
      right = right.simplify();
    }

    // Check for zero multiplication
    if (left.isZero() || right.isZero())
    {
      return zero();
    }

    // Check for identity multiplication
    if (left.isOne())
    {
      return right;
    }
    if (right.isOne())
    {
      return left;
    }
    if (left.isNegOne())
    {
      return right.neg();
    }
    if (right.isNegOne())
    {
      return left.neg();
    }

    // Try delta function simplification
    var deltaSimplification = simplifyDeltaMultiplication();
    if (deltaSimplification != null)
    {
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
        return leftFunction.arg;
      }
    }

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
