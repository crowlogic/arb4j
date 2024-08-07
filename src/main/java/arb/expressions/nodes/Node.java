package arb.expressions.nodes;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;

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
import arb.expressions.nodes.binary.Addition;
import arb.expressions.nodes.binary.BinaryOperation;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class Node<D, R, F extends Function<? extends D, ? extends R>> implements
                          Typesettable,
                          Consumer<Consumer<Node<D, R, F>>>,
                          Cloneable
{

  @Override
  public Object clone() 
  {
    assert false : "TODO";
    return null;
  }

  public abstract boolean isScalar();

  public abstract Node<D, R, F> integral(Variable<D, R, F> variable);

  public abstract Node<D, R, F> derivative(Variable<D, R, F> variable);

  public abstract List<? extends Node<D, R, F>> getBranches();

  /**
   * @return true if this node has any subnodes
   */
  public abstract boolean isLeaf();

  public Expression<D, R, F> expression;

  public boolean             isResult = false;

  public Node(Expression<D, R, F> expression)
  {
    this.expression = expression;
  }

  public abstract MethodVisitor generate(MethodVisitor mv, Class<?> resultType);

  protected Class<?> generatedType;

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public int bits = 128;

  /**
   * Determines whether this {@link Expression} {@link Node} is reusable. If it's
   * reusable, it means that the result generated by this {@link Node} can be
   * reliably used by the progenitor node in the {@link Expression} to store its
   * own result, thus saving heap allocations. The method should be overridden by
   * every subclass of {@link Node} to provide an appropriate response. For
   * {@link LiteralConstant} and {@link Variable} nodes, they would always return
   * false (since we cannot reuse them). For {@link BinaryOperation} nodes like
   * {@link Addition}, a method of determining whether they're reusable based on
   * the state of their operands would be in order. <br>
   * <br>
   * 
   * The advantage to not reusing nodes is that it would allow the production of a
   * {@link String} containing the expression representing the partially evaluated
   * function, something that could come in handy when it comes to understanding
   * intermediate results or debugging things or finding ways to optimize based on
   * the precision of intermediate variables as the call chain of the expression
   * is traversed and evaluated to determine the value
   *
   * @return true if the node this reusable, false otherwise.
   */
  public abstract boolean isReusable();

  public abstract MethodVisitor prepareStackForReuse(MethodVisitor mv);

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

  public abstract boolean hasSingleLeaf();

  /**
   * TODOL Instantiates the target type instance then calls set on it with the
   * source instance then sets generatedType to to the requested type so that
   * downstream it is none the wiser a type conversion was done in the first
   * place. A possible optimization would be to declare the types as their
   * intended target type in the first place but this would require messing with
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
    assert generatedType != null : "generatedType of " + this + " is null where this.class=" + getClass()
                  + " and casting to " + type + " is requested";
    assert !generatedType.equals(type) : String.format("tried to cast from and to the same type %s\n",
                                                       generatedType);
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

  public Variable<D, R, F> asVariable()
  {
    assert isVariable() : this + " isn't a Variable";
    return (Variable<D, R, F>) this;
  }

  public boolean dependsOn(Variable<D, R, F> variable)
  {
    assert false : "TODO: implement in " + getClass();
    return false;
  }

  public abstract char symbol();

  public abstract boolean isConstant();

  public int dim()
  {
    return 1;
  }

  public abstract String getIntermediateValueFieldName();

}
