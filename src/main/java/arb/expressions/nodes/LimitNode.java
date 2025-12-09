package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.VariableReference;
import arb.functions.Function;

/**
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class LimitNode<D, C, F extends Function<? extends D, ? extends C>>
                      extends
                      Node<D, C, F>
{

  private Node<D, C, F>              operand;
  private VariableReference<D, C, F> limitingVariableReference;
  private VariableNode<D, C, F>      limitingVariableNode;
  private Node<D, C, F>              point;

  public LimitNode(Expression<D, C, F> expression)
  {
    super(expression);
    operand                   = expression.resolve();
    limitingVariableReference = expression.require(',').parseVariableReference();
    limitingVariableNode      = new VariableNode<>(expression,
                                                   limitingVariableReference,
                                                   expression.position,
                                                   true);
    expression.require('=');
    point = expression.resolve();
    expression.require(')');
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    assert false : "Consumer<Consumer<Node<D,C,F>>>.accept has yet to be implemented as of Nov 25, 2025 12:10:17 PM";

  }

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    assert false : "Node<D,C,F>.dependsOn has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return false;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    assert false : "Node<D,C,F>.differentiate has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "Node<D,C,F>.generate has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public List<? extends Node<D, C, F>> getBranches()
  {
    assert false : "Node<D,C,F>.getBranches has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    assert false : "Node<D,C,F>.integrate has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    assert false : "Node<D,C,F>.isLeaf has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return false;
  }

  @Override
  public boolean isScalar()
  {
    assert false : "Node<D,C,F>.isScalar has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return false;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "Node<D,C,F>.spliceInto has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable, Node<E, S, G> arg)
  {
    assert false : "Node<D,C,F>.substitute has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public char symbol()
  {
    assert false : "Node<D,C,F>.symbol has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return 0;
  }

  @Override
  public <E> Class<? extends E> type()
  {
    assert false : "Node<D,C,F>.type has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

  @Override
  public String typeset()
  {
    assert false : "Node<D,C,F>.typeset has yet to be implemented as of Nov 25, 2025 12:10:17 PM";
    return null;
  }

}
