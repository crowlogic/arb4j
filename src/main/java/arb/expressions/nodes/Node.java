package arb.expressions.nodes;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.scilab.forge.jlatexmath.LaTeXAtom;

import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.ExpressionTree;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.unary.AbsoluteValueNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.NegationNode;
import arb.functions.Function;
import arb.utensils.text.latex.Latex;

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

  public int                 bits     = 128;

  public Expression<D, R, F> expression;

  public Class<?>            generatedType;

  public boolean             isResult = false;

  public final int           position;

  public Node(Expression<D, R, F> expression)
  {
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

  public Node<D, R, F> apply(String functionName)
  {
    return new FunctionNode<>(functionName,
                              this,
                              expression);
  }

  public BinaryOperationNode<D, R, F> asBinaryOperationNode()
  {
    assert this instanceof BinaryOperationNode : this + " isn't a BinaryOperationNode";
    return (BinaryOperationNode<D, R, F>) this;
  }

  public FunctionNode<D, R, F> asFunction()
  {
    assert this instanceof FunctionNode : this + " isn't a FunctionNode";
    return (FunctionNode<D, R, F>) this;
  }

  public LiteralConstantNode<D, R, F> asLiteralConstant()
  {
    assert this instanceof LiteralConstantNode : this + " isn't a Literal constant";
    return (LiteralConstantNode<D, R, F>) this;
  }

  public VariableNode<D, R, F> asVariable()
  {
    assert isVariable() : this + " isn't a Variable";
    return (VariableNode<D, R, F>) this;
  }

  @Override
  public Object clone()
  {
    assert false : "TODO";
    return null;
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

  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: implement in " + getClass();
    return false;
  }

  public abstract Node<D, R, F> differentiate(VariableNode<D, R, F> variable);

  public <N extends Node<D, R, F>> N digamma()
  {
    return (N) apply("digamma");
  }

  public int dim()
  {
    return 1;
  }

  public Node<D, R, F> div(int i)
  {
    return div(expression.newLiteralConstant(i));
  }

  public <N extends Node<D, R, F>> N div(Node<D, R, F> divisor)
  {
    return (N) new DivisionNode<>(expression,
                                  this,
                                  divisor);
  }

  public abstract MethodVisitor generate(MethodVisitor mv, Class<?> resultType);

  public Class<?> generateCastTo(MethodVisitor methodVisitor, Class<?> type)
  {
    cast(methodVisitor, generatedType);
    expression.allocateIntermediateVariable(methodVisitor, type);
    Compiler.swap(methodVisitor);
    invokeSetMethod(methodVisitor, generatedType, type);
    return generatedType = type;
  }

  public abstract List<? extends Node<D, R, F>> getBranches();

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public String fieldName;

  public final String getFieldName()
  {
    return isResult ? "result" : fieldName;
  }

  public abstract Node<D, R, F> integrate(VariableNode<D, R, F> variable);

  public boolean isIndependentOf(VariableNode<D, R, F> variable)
  {
    return !dependsOn(variable);
  }

  /**
   * @return true if this node does not have any subnodes
   */
  public abstract boolean isLeaf();

  public abstract boolean isLiteralConstant();

  public boolean isPossiblyNegative()
  {
    return false;
  }

  public abstract boolean isScalar();

  public boolean isVariable()
  {
    return false;
  }

  public boolean isVariableNamed(String variable)
  {
    return isVariable() && asVariable().isNamed(variable);
  }

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

  public Node<D, R, F> log()
  {
    return apply("log");
  }

  public <N extends Node<D, R, F>> N mul(Node<D, R, F> multiplicand)
  {
    return (N) new MultiplicationNode<>(expression,
                                        this,
                                        multiplicand);
  }

  public <N extends Node<D, R, F>> N neg()
  {
    return (N) new NegationNode<>(expression,
                                  this);
  }

  public Node<D, R, F> pow(int i)
  {
    return pow(expression.newLiteralConstant(i));
  }

  public <N extends Node<D, R, F>> N pow(Node<D, R, F> exponent)
  {
    return (N) new ExponentiationNode<>(expression,
                                        this,
                                        exponent);
  }

  public Node<D, R, F> pow(String exponent)
  {
    return new LiteralConstantNode<>(expression,
                                     exponent);
  }

  public Node<D, R, F> sec()
  {
    return apply("sec");
  }

  public Node<D, R, F> simplify()
  {
    return this;
  }

  public Node<D, R, F> sin()
  {
    return apply("sin");
  }

  public Node<D, R, F> sinh()
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
    return sub(expression.newLiteralConstant(i));
  }

  public <N extends Node<D, R, F>> N sub(Node<D, R, F> subtrahend)
  {
    return (N) new SubtractionNode<>(expression,
                                     this,
                                     subtrahend);
  }

  public abstract <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                                Node<E, S, G> arg);

  public abstract char symbol();

  public Node<D, R, F> tan()
  {
    return apply("tan");
  }

  public Node<D, R, F> tanh()
  {
    return apply("tanh");
  }

  /**
   * 
   * @return the type that this node leaves on the stack when
   *         this{@link #generate(MethodVisitor, Class)} is called
   */
  public abstract <C> Class<? extends C> type();

  /**
   * 
   * @return the string that represents this node in {@link Latex} format
   */
  public abstract String typeset();

}
