package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNode<D, R, F extends Function<? extends D, ? extends R>> extends
                           Node<D, R, F>
{

  public DerivativeNode(Expression<D, R, F> expression)
  {
    super(expression);
    assert false : "TODO: implement derivative operator";
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    assert false : "TODO";
  }

  @Override
  public boolean isScalar()
  {
    assert false : "TODO";
    return false;
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Node<D, R, F> derivative(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    assert false : "TODO";
    return false;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean isReusable()
  {
    assert false : "TODO";
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public String typeset()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    assert false : "TODO";
    return false;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public char symbol()
  {
    assert false : "TODO";
    return ' ';
  }

  @Override
  public boolean isConstant()
  {
    assert false : "TODO";
    return false;
  }

  @Override
  public String getIntermediateValueFieldName()
  {
    assert false : "TODO";
    return null;
  }

}
