package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * General postfix index access: base[index].
 *
 * Works for any base Node (VariableNode, FunctionNode,
 * FunctionalEvaluationNode, etc.) by emitting base.generate(),
 * index.generate(), then base.get(index) via a virtual call, using the same
 * get(...) reflection pattern as VariableNode.generateIndexAccess.
 */
public class IndexAccessNode<D, R, F extends Function<? extends D, ? extends R>> extends
                            Node<D, R, F>
{
  public final Node<D, R, F> base;
  public final Node<D, R, F> index;

  private Class<?>           resolvedElementType;

  public IndexAccessNode(Expression<D, R, F> expression, Node<D, R, F> base, Node<D, R, F> index)
  {
    super(expression);
    this.base  = base;
    this.index = index;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
    base.accept(t);
    index.accept(t);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return base.dependsOn(variable) || index.dependsOn(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new CompilerException("differentiation of index access node not supported: " + this);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    // No special rule; delegate to base.integral and keep the same index.
    return new IndexAccessNode<>(expression,
                                 base.integral(variable),
                                 index);
  }

  @Override
  public int dim()
  {
    return 1;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Class<?> indexType = index.type();
    if (!Integer.class.equals(indexType))
    {
      throw new CompilerException("IndexAccessNode: unhandled index type " + indexType);
    }

    base.generate(mv, base.type());
    index.generate(mv, indexType);
    Compiler.generateVirtualMethodInvocation(mv, base.type(), "get", type(), indexType);

    if (isRootNode)
    {
      expression.generateSetResultInvocation(mv, resultType != null ? resultType : type());
    }

    return mv;
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(base, index);
  }

  @Override
  public Class<?> getGeneratedType()
  {
    return resolvedElementType != null ? resolvedElementType : type();
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return Compiler.isScalar(type());
  }

  /**
   * The element type of container[indexType], same reflection pattern as
   * VariableNode.resolveIndexedElementType.
   */
  private static Class<?> resolveIndexedElementType(Class<?> container, Class<?> indexType)
  {
    try
    {
      return container.getMethod("get", indexType).getReturnType();
    }
    catch (NoSuchMethodException e)
    {
      throw new CompilerException(container.getSimpleName() + " has no get(" + indexType.getSimpleName() + ") method for subscript access");
    }
  }

  @Override
  public char symbol()
  {
    return '[';
  }

  @Override
  public Class<?> type()
  {
    if (resolvedElementType != null)
    {
      return resolvedElementType;
    }
    Class<?> indexType = index.type();
    if (Integer.class.equals(indexType))
    {
      resolvedElementType = resolveIndexedElementType(base.type(), indexType);
      return resolvedElementType;
    }
    throw new CompilerException("IndexAccessNode.type(): unhandled index type " + indexType);
  }

  @Override
  public String typeset()
  {
    return base.typeset() + "_{" + index.typeset() + "}";
  }

  @Override
  public String toString()
  {
    return base.toString() + "[" + index.toString() + "]";
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> IndexAccessNode<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    // Splice both base and index into the new expression; mirror
    // VariableNode.spliceInto style.
    Node<E, S, G> newBase  = base.spliceInto(newExpression);
    Node<E, S, G> newIndex = index.spliceInto(newExpression);
    var           node     = new IndexAccessNode<E, S, G>(newExpression,
                                                          newBase,
                                                          newIndex);
    node.position   = this.position;
    node.fieldName  = this.fieldName;
    node.isRootNode = this.isRootNode;
    return node;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    // Substitute inside base and index, then rebuild this node if anything changed.
    Node<D, R, F> newBase  = base.substitute(variable, arg);
    Node<D, R, F> newIndex = index.substitute(variable, arg);
    if (newBase == base && newIndex == index)
    {
      return this;
    }
    return new IndexAccessNode<>(expression,
                                 newBase,
                                 newIndex);
  }
}