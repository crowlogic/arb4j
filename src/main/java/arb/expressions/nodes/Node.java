package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.scilab.forge.jlatexmath.LaTeXAtom;
import org.slf4j.Logger;

import arb.Field;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;

/**
 * <pre>
 * Represents the abstract base class for elements of the abstract {@link ExpressionTree} 
 * constituting an {@link Expression}. This class is a fundamental part of the framework, 
 * facilitating the construction, manipulation, and evaluation of symbolic express
 * ions. Nodes in the tree can perform a variety of operations such as differentiation, 
 * integration, and algebraic simplifications, employing generics to accommodate 
 * different data and function types.
 *
 * Each node can be a composite, containing other nodes, or a leaf, representing
 * terminal operations or values. The class supports dynamic type
 * transformations, code generation via the ASM framework, and optimization
 * techniques like subtree reuse to enhance performance and memory efficiency.
 * It also integrates typesetting capabilities, using JLaTeXMath for rendering
 * expressions in LaTeX format.
 *
 * Subclasses must implement functionality specific to the symbolic operations
 * they represent, including handling their computational branches, and must
 * provide methods for performing substitutions and cloning, even if not
 * implemented via the {@link Cloneable} interface.
 * </pre>
 * 
 * @param <D> the domain type of the node, defining the types of inputs this
 *            node accepts
 * @param <R> the range type of the node, defining the types of results this
 *            node produces
 * @param <F> the type of function encapsulated by this node, conforming to the
 *            {@link Function} interface
 *
 * @see Function
 * @see Expression
 * @see MethodVisitor
 * @see LaTeXAtom
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unchecked")
public abstract class Node<D, R, F extends Function<? extends D, ? extends R>> implements
                          Typesettable,
                          Consumer<Consumer<Node<D, R, F>>>
{
  public final <T extends Field<T>> T evaluate()
  {
    T result = (T) expression.newCoDomainInstance();
    Class<T> coDomainType = (Class<T>) expression.coDomainType;
    return evaluate(coDomainType, bits(), result);
  }

  public final <T extends Field<T>> T evaluate(T result)
  {
    return evaluate((Class<T>) result.getClass(), result.bits(), result);
  }

  public final <T extends Field<T>> T evaluate(int bits, T result)
  {
    return evaluate((Class<T>) result.getClass(), bits, result);
  }

  public Node<D, R, F> setIsResult(boolean isResult)
  {
    this.isResult = isResult;
    return this;
  }

  /**
   * Compute the Caputo fractional derivative of order α of this node.
   * 
   * Default: wraps in a CaputoFractionalDerivativeNode (the integral form).
   * Subclasses that have closed-form fractional derivatives override this.
   *
   * @param variable the variable to be fractionally differentiated with respect
   *                 to
   * @param order    the fractional order of differentiation
   * 
   * @return the node representing Đ^(α)(this)
   */
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> order)
  {
    return new CaputoFractionalDerivativeNode<D, R, F>(expression,
                                                       this,
                                                       variable,
                                                       order);
  }

  /**
   * Checks if a node is easily integrable (exp, sin, cos). These functions have
   * straightforward antiderivatives.
   */
  public boolean isEasilyIntegrable()
  {
    return false;
  }

  /**
   * Checks if a node represents a polynomial-like expression in the given
   * variable.
   * 
   * Polynomial-like includes: - Constants - The variable itself (x) - Powers of
   * the variable (x^n for constant n) - Sums and products of the above
   * 
   * @param variable The variable
   * @return true if the node is polynomial-like
   */
  public boolean isPolynomialLike(VariableNode<D, R, F> variable)
  {
    if (isScalar() && !dependsOn(variable))
    {
      return true;
    }

    if (equals(variable))
    {
      return true;
    }

    return false;
  }

  /**
   * Checks if a node is a logarithmic function. Log requires special handling in
   * integration by parts (LIATE rule).
   */
  public boolean isLogarithmic()
  {
    return false;
  }

  /**
   * Checks if a node represents a non-negative integer constant.
   */
  public boolean isNonNegativeIntegerConstant()
  {
    return false;
  }

  public String toStringWithoutIndependentVariableSpecified()
  {
    String str        = toString();
    int    arrowIndex = str.indexOf('➔');
    return arrowIndex == -1 ? str : str.substring(arrowIndex + 1);
  }

  /**
   * @return true if this node's evaluation is independent of all input parameters
   */
  public boolean isConstant()
  {
    if (isIndependentOfInput())
    {
      final boolean[] allConstant =
      { true };
      accept(node ->
      {
        if ((node != this && !node.isIndependentOfInput()) || node.isVariable())
        {
          allConstant[0] = false;
        }
      });
      return allConstant[0];
    }
    return false;
  }

  public boolean isIndependentOfInput()
  {
    return expression.isNullaryFunction() ? true
                                          : isIndependentOf(expression.getIndependentVariable());
  }

  public int bits()
  {
    return bits;
  }

  public int                 bits     = 128;

  public Expression<D, R, F> expression;

  public String              fieldName;

  public Class<?>            generatedType;

  public boolean             isResult = false;

  public final int           position;

  public Node(Expression<D, R, F> expression)
  {
    assert expression != null : "expression shan't be null";
    this.expression = expression;
    this.position   = expression.position;
  }

  public <N extends Node<D, R, F>> N abs()
  {
    return (N) new AbsoluteValueNode<>(expression,
                                       this);
  }

  public <N extends Node<D, R, F>> N add(Node<D, R, F> addend)
  {
    return (N) new AdditionNode<>(expression,
                                  this,
                                  addend);
  }

  public FunctionNode<D, R, F> apply(String functionName)
  {
    return new FunctionNode<>(functionName,
                              this,
                              expression);
  }

  public Node<D, R, F> arcsin()
  {
    return apply("arcsin");
  }

  public Node<D, R, F> arctan()
  {
    return apply("arctan");
  }

  public BinaryOperationNode<D, R, F> asBinaryOperation()
  {
    assert this instanceof BinaryOperationNode : this + " isn't a BinaryOperationNode";
    return (BinaryOperationNode<D, R, F>) this;
  }

  public FunctionNode<D, R, F> asFunction()
  {
    assert isFunction() : this + " isn't a FunctionNode";
    return (FunctionNode<D, R, F>) this;
  }

  public LiteralConstantNode<D, R, F> asLiteralConstant()
  {
    assert this instanceof LiteralConstantNode : this
                                                 + " isn't a Literal constant, it is a "
                                                 + this.getClass().getName();
    return (LiteralConstantNode<D, R, F>) this;
  }

  public VariableNode<D, R, F> asVariable()
  {
    assert isVariable() : this + " isn't a Variable";
    return (VariableNode<D, R, F>) this;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Node<?, ?, ?> other = (Node<?, ?, ?>) obj;
    return bits == other.bits && Objects.equals(expression, other.expression)
                  && Objects.equals(fieldName, other.fieldName)
                  && Objects.equals(generatedType, other.generatedType)
                  && isResult == other.isResult && position == other.position;
  }

  @Override
  public Object clone()
  {
    assert false : "dont use this, use spliceInto instead";
    return null;
  }

  public Node<D, R, F> δ()
  {
    return apply("δ");
  }

  public Node<D, R, F> θ()
  {
    return apply("θ");
  }

  public Node<D, R, F> cos()
  {
    return apply("cos");
  }

  public Node<D, R, F> cosh()
  {
    return apply("cosh");
  }

  public Node<D, R, F> cot()
  {
    return apply("cot");
  }

  public abstract boolean dependsOn(VariableNode<D, R, F> variable);

  public Node<D, R, F> derivative()
  {
    var variable = expression.getInputVariable();
    return differentiate(variable);
  }

  public abstract Node<D, R, F> differentiate(VariableNode<D, R, F> variable);

  public Node<D, R, F> digamma()
  {
    return apply("digamma");
  }

  public int dim()
  {
    return 1;
  }

  public DivisionNode<D, R, F> div(int i)
  {
    return div(expression.newConstant(i));
  }

  public DivisionNode<D, R, F> div(Node<D, R, F> divisor)
  {
    return new DivisionNode<>(expression,
                              this,
                              divisor);
  }

  public FunctionNode<D, R, F> exp()
  {
    return apply("exp");
  }

  public void loadOutputVariableOntoStack(MethodVisitor methodVisitor, Class<?> resultType)
  {
    if (isResult)
    {
      cast(expression.loadResultParameter(methodVisitor), resultType);
      fieldName = "result";
    }
    else
    {
      fieldName = expression.allocateIntermediateVariable(methodVisitor, resultType);
    }
  }

  public abstract MethodVisitor generate(MethodVisitor mv, Class<?> resultType);

  public abstract Logger getLogger();

  public Class<?> generateCastTo(MethodVisitor methodVisitor, Class<?> type)
  {
    if (Expression.traceNodes)
    {
      getLogger().debug(String.format("generateCastTo(type=%s) from generatedType=%s\n",
                                      type,
                                      generatedType));
    }
    cast(methodVisitor, generatedType);
    expression.allocateIntermediateVariable(methodVisitor, type);
    swap(methodVisitor);
    invokeSetMethod(methodVisitor, generatedType, type);
    return generatedType = type;
  }

  public abstract List<? extends Node<D, R, F>> getBranches();

  public String getFieldName()
  {
    return isResult ? "result" : fieldName;
  }

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public Node<D, R, F> getSquareRootArg()
  {
    assert false : "TODO: " + getClass() + " should implement this";
    return null;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(bits, expression, fieldName, generatedType, isResult, position);
  }

  public abstract Node<D, R, F> integral(VariableNode<D, R, F> variable);

  public boolean isHalf()
  {
    return false;
  }

  public boolean isIndependentOf(VariableNode<D, R, F> variable)
  {
    return !dependsOn(variable);
  }

  public abstract boolean isLeaf();

  public final boolean isLiteralConstant()
  {
    return this instanceof LiteralConstantNode;
  }

  public boolean isNegOne()
  {
    return false;
  }

  public boolean isOne()
  {
    return false;
  }

  public boolean isPossiblyNegative()
  {
    return true;
  }

  public boolean isScalar()
  {
    return Compiler.isScalar(type());
  }

  public boolean isSquareRoot()
  {
    return false;
  }

  public boolean isVariable()
  {
    return false;
  }

  public boolean isVariableNamed(String variable)
  {
    return isVariable() && asVariable().isNamed(variable);
  }

  public boolean isVariableSquared(VariableNode<D, R, F> variable)
  {
    return false;
  }

  public boolean isZero()
  {
    assert false : "TODO: " + getClass() + " needs to implement this";
    return false;
  }

  protected void loadBitsOntoStack(MethodVisitor mv)
  {
    if (expression.insideInitializerOrConstructor)
    {
      mv.visitLdcInsn(128);
    }
    else
    {
      expression.loadBitsParameterOntoStack(mv);
    }
  }

  public MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getFieldFromThis(mv, expression.className, fieldName, type);
  }

  public FunctionNode<D, R, F> log()
  {
    return apply("log");
  }

  public MultiplicationNode<D, R, F> mul(int i)
  {
    return mul(expression.newConstant(i));
  }

  public MultiplicationNode<D, R, F> mul(Node<D, R, F> multiplicand)
  {
    return new MultiplicationNode<>(expression,
                                    this,
                                    multiplicand);
  }

  public NegationNode<D, R, F> neg()
  {
    return new NegationNode<>(expression,
                              this);
  }

  public LiteralConstantNode<D, R, F> negativeOne()
  {
    return expression.negativeOne();
  }

  public LiteralConstantNode<D, R, F> one()
  {
    return expression.one();
  }

  public ExponentiationNode<D, R, F> pow(int i)
  {
    return pow(expression.newConstant(i));
  }

  public ExponentiationNode<D, R, F> pow(Node<D, R, F> exponent)
  {
    return new ExponentiationNode<>(expression,
                                    this,
                                    exponent);
  }

  public FunctionNode<D, R, F> sec()
  {
    return apply("sec");
  }

  /**
   * Simplifies this node. If the node is constant and not already a
   * {@link ConstantNode} or {@link LiteralConstantNode}, it is folded into a
   * {@link ConstantNode}.
   */
  public Node<D, R, F> simplify()
  {
    if (isConstant() && !(this instanceof ConstantNode))
    {
      return foldConstant();
    }
    return this;
  }

  /**
   * Replaces this constant subtree with a {@link ConstantNode} that computes the
   * value once in {@code initialize()} and loads the precomputed field during
   * evaluation. Subclasses may override to provide more specific folding (e.g.
   * reducing integer arithmetic to a {@link LiteralConstantNode}).
   *
   * @return a {@link ConstantNode} wrapping this subtree
   */
  public Node<D, R, F> foldConstant()
  {
    assert isConstant() : this + " is not constant, cannot fold";
    return new ConstantNode<>(expression, this);
  }

  public FunctionNode<D, R, F> arcsinh()
  {
    return apply("arcsinh");
  }

  public FunctionNode<D, R, F> sin()
  {
    return apply("sin");
  }

  public FunctionNode<D, R, F> sinh()
  {
    return apply("sinh");
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression);

  public Node<D, R, F> sqrt()
  {
    return apply("sqrt");
  }

  public Node<D, R, F> sub(int i)
  {
    return sub(expression.newConstant(i));
  }

  public <N extends Node<D, R, F>> N sub(Node<D, R, F> subtrahend)
  {
    return (N) new SubtractionNode<>(expression,
                                     this,
                                     subtrahend);
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg);

  public abstract char symbol();

  public Node<D, R, F> tan()
  {
    return apply("tan");
  }

  public Node<D, R, F> tanh()
  {
    return apply("tanh");
  }

  public LiteralConstantNode<D, R, F> three()
  {
    return expression.newConstant(3);
  }

  public LiteralConstantNode<D, R, F> two()
  {
    return expression.newConstant(2);
  }

  public boolean loadOutput(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
    {
      Compiler.cast(expression.loadResultParameter(mv), resultType);
      fieldName = "result";
    }
    else
    {
      if (fieldName == null)
      {
        fieldName = expression.allocateIntermediateVariable(mv, resultType);
      }
      return true;
    }
    return false;
  }

  public abstract <C> Class<? extends C> type();

  public abstract String typeset();

  public LiteralConstantNode<D, R, F> π()
  {
    return expression.newLiteralConstant("π");
  }

  public LiteralConstantNode<D, R, F> zero()
  {
    return expression.newConstant(0);
  }

  public boolean isFunction()
  {
    return this instanceof FunctionNode;
  }

  public boolean isNegativeInfinity()
  {
    return "-∞".equals(toString());
  }

  public boolean isPositiveInfinity()
  {
    return "∞".equals(toString());
  }

  protected boolean containsDeltaFunction()
  {
    boolean does[] = new boolean[]
    { false };

    accept(node ->
    {
      if (node.isFunction() && node.asFunction().is("δ"))
      {
        does[0] = true;
      }
    });
    return does[0];
  }

  public Node<D, R, F> Γ()
  {
    return apply("Γ");
  }

  public FunctionNode<D, R, F> ceil()
  {
    return apply("ceil");
  }

  public ExponentiationNode<D, R, F> square()
  {
    return pow(2);
  }

  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    assert isConstant() : "cannot evaluate the non-constant node "
                          + this
                          + " of class "
                          + getClass().getSimpleName()
                          + " at compile-time";
    throw new UnsupportedOperationException("#862: evaluate(Class<T>) not implemented for "
                                            + getClass().getSimpleName()
                                            + " node '"
                                            + this
                                            + "'");
  }
}
