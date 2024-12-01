package arb.expressions.nodes;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.scilab.forge.jlatexmath.LaTeXAtom;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.binary.AdditionNode;
import arb.expressions.nodes.binary.DivisionNode;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.expressions.nodes.binary.MultiplicationNode;
import arb.expressions.nodes.binary.SubtractionNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.NegationNode;
import arb.functions.Function;

/**
 * <pre>
 * Represents the abstract base class for all nodes within a syntax tree in
 * symbolic computation systems. This class is a fundamental part of the
 * framework, facilitating the construction, manipulation, and evaluation of
 * symbolic expressions. Nodes in the tree can perform a variety of operations
 * such as differentiation, integration, and algebraic simplifications,
 * employing generics to accommodate different data and function types.
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
public abstract class Node<D, R, F extends Function<? extends D, ? extends R>> implements
                          Typesettable,
                          Consumer<Consumer<Node<D, R, F>>>
{

  public Node<D, R, F> simplify()
  {
    return this;
  }

  @Override
  public Object clone()
  {
    assert false : "TODO";
    return null;
  }

  public abstract boolean isScalar();

  public abstract Node<D, R, F> integrate(VariableNode<D, R, F> variable);

  public abstract Node<D, R, F> differentiate(VariableNode<D, R, F> variable);

  public abstract List<? extends Node<D, R, F>> getBranches();

  /**
   * @return true if this node has any subnodes
   */
  public abstract boolean isLeaf();

  public Expression<D, R, F> expression;

  public boolean             isResult = false;

  public final int           position;

  public Node(Expression<D, R, F> expression)
  {
    this.expression = expression;
    this.position   = expression.position;
  }

  public abstract MethodVisitor generate(MethodVisitor mv, Class<?> resultType);

  public Class<?> generatedType;

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public int bits = 128;

  /**
   * 
   * @return the {@link LaTeXAtom} string that represents this node
   */
  public abstract String typeset();

  /**
   * 
   * @return the type that this node results in when evaluated, should usually be
   *         one of {@link Real}, {@link Complex}, {@link RealPolynomial}, or
   *         {@link RealMatrix}, {@link ComplexMatrix}, {@link ComplexPolynomial},
   *         or {@link Integer}
   */
  public abstract <C> Class<? extends C> type();

  /**
   * Instantiates the target type instance then calls set on it with the source
   * instance then sets generatedType to to the requested type so that downstream
   * it is none the wiser that a type conversion was done in the first place. A
   * possible optimization would be to declare the types as their intended target
   * type so that no conversion was needed but this would require messing with
   * parts of the code that are currently working and i've adopted a
   * dont-fix-it-if-it-isnt-broken policy when it comes to deciding what to work
   * on next
   * 
   * 
   * @param methodVisitor
   * @param type
   * @return
   */
  public Class<?> generateCastTo(MethodVisitor methodVisitor, Class<?> type)
  {
    assert generatedType != null : "generatedType of "
                                   + this
                                   + " is null where this.class="
                                   + getClass()
                                   + " and casting to "
                                   + type
                                   + " is requested";
    assert !generatedType.equals(type) : String.format("tried to cast from and to the same type %s\n", generatedType);
    checkClassCast(methodVisitor, generatedType);
    expression.allocateIntermediateVariable(methodVisitor, type);
    Compiler.swap(methodVisitor);
    invokeSetMethod(methodVisitor, generatedType, type);
    generatedType = type;
    return generatedType;
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                                Node<E, S, G> arg);

  public boolean isVariable()
  {
    return false;
  }

  public boolean isVariableNamed(String variable)
  {
    return isVariable() && asVariable().isNamed(variable);
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression);

  public VariableNode<D, R, F> asVariable()
  {
    assert isVariable() : this + " isn't a Variable";
    return (VariableNode<D, R, F>) this;
  }

  public FunctionNode<D, R, F> asFunction()
  {
    assert isLiteralConstant() : this + " isn't a Variable";
    return (FunctionNode<D, R, F>) this;
  }

  public LiteralConstantNode<D, R, F> asLiteralConstant()
  {
    assert isLiteralConstant() : this + " isn't a Variable";
    return (LiteralConstantNode<D, R, F>) this;
  }

  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: implement in " + getClass();
    return false;
  }

  public abstract char symbol();

  public abstract boolean isLiteralConstant();

  public int dim()
  {
    return 1;
  }

  public abstract String getIntermediateValueFieldName();

  protected void loadBitsOntoStack(MethodVisitor mv)
  {
    if (expression.insideInitializer)
    {
      mv.visitLdcInsn(128);
    }
    else
    {
      loadBitsParameterOntoStack(mv);
    }
  }

  public boolean isPossiblyNegative()
  {
    return false;
  }

  public Node<D, R, F> pow(Node<D, R, F> exponent)
  {
    return new ExponentiationNode<>(expression,
                                    this,
                                    exponent);
  }

  public Node<D, R, F> sub(Node<D, R, F> subtrahend)
  {
    return new SubtractionNode<>(expression,
                                 this,
                                 subtrahend);
  }

  public Node<D, R, F> add(Node<D, R, F> addend)
  {
    return new AdditionNode<>(expression,
                              this,
                              addend);
  }

  public Node<D, R, F> div(Node<D, R, F> divisor)
  {
    return new DivisionNode<>(expression,
                              this,
                              divisor);
  }

  public Node<D, R, F> mul(Node<D, R, F> multiplicand)
  {
    return new MultiplicationNode<>(expression,
                                    this,
                                    multiplicand);
  }

  public Node<D, R, F> pow(int i)
  {
    return pow(LiteralConstantNode.of(expression, i));
  }

  public Node<D, R, F> neg()
  {
    return new NegationNode<>(expression,
                              this);
  }

  public Node<D, R, F> sub(int i)
  {
    return sub(new LiteralConstantNode<>(expression,
                                         java.lang.Integer.toString(i)));
  }

}
