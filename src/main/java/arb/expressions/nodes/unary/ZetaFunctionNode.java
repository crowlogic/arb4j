package arb.expressions.nodes.unary;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             UnaryOperationNode<D, C, F>
{

  public ZetaFunctionNode(Node<D, C, F> arg)
  {
    super(arg);
    // TODO Auto-generated constructor stub
  }

  public ZetaFunctionNode(Expression<D, C, F> expression, Node<D, C, F> arg)
  {
    super(expression,
          arg);
    // TODO Auto-generated constructor stub
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    assert false : "todo";
    return null;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "todo";

    // Generate bytecode that calls the appropriate zeta function
    // Can use the RiemannζFunction.evaluate() with proper order
    return mv;
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    assert false : "todo";

    // TODO Auto-generated method stub

  }

  @Override
  public List<? extends Node<D, C, F>> getBranches()
  {
    assert false : "todo";

    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    assert false : "todo";

    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    assert false : "todo";

    // TODO Auto-generated method stub
    return false;
  }

  @Override
  public boolean isScalar()
  {
    assert false : "todo";
    return false;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "todo";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    assert false : "todo";
    return null;
  }

  @Override
  public char symbol()
  {
    assert false : "todo";
    return 0;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    assert false : "todo";
    return null;
  }

  @Override
  public String typeset()
  {
    assert false : "todo";
    return null;
  }
}