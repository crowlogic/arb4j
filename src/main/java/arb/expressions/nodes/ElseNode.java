package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.unary.WhenNode;
import arb.functions.Function;

/**
 * This appears in conjunction with the {@link WhenNode} node
 * 
 * @param <D>
 * @param <R>
 * @param <F>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ElseNode<D, R, F extends Function<? extends D, ? extends R>> extends
                 Node<D, R, F>
{

  public ElseNode(Expression<D, R, F> expression)
  {
    super(expression);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "not intended to be generated";
    return null;
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public String typeset()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return false;
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    return this;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new ElseNode<E, S, G>(newExpression);
  }

  @Override
  public Node<D, R, F>
         derivative(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean
         isScalar()
  {
    return true;
  }

  @Override
  public char
            symbol()
  {
   return '↮';
  }

  @Override
  public boolean isConstant()
  {
    assert false : "maybe";
    return true;
  }

  @Override
  public String getIntermediateValueFieldName()
  {
    return null;
  }
}
