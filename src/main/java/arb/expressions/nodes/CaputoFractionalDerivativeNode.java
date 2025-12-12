package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Caputo fractional derivative
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CaputoFractionalDerivativeNode<D, R, F extends Function<? extends D, ? extends R>>
                                           extends
                                           Node<D, R, F>
{

  Node<D, R, F> power;

  Node<D, R, F> operand;

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    super(expression);
    power   = expression.require('^').require('(').resolve();
    operand = expression.require(')').resolve();
  }

  
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : String.format("TODO: generate %s-th fractional derivative of %s",
                                 power,
                                 operand);
    return null;
  }

  

  @Override
  public boolean isLeaf()
  {
    return isResult;
  }

  @Override
  public boolean isScalar()
  {
    return isResult;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public char symbol()
  {
    return 'Đ';
  }



  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    assert false : "Consumer<Consumer<Node<D,R,F>>>.accept has yet to be implemented as of Dec 11, 2025 6:18:13 PM";
    
  }


  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    assert false : "Node<D,R,F>.dependsOn has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return false;
  }


  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    assert false : "Node<D,R,F>.differentiate has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return null;
  }


  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    assert false : "Node<D,R,F>.getBranches has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return null;
  }


  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "Node<D,R,F>.integrate has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return null;
  }


  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "Node<D,R,F>.spliceInto has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return null;
  }


  @Override
  public <C> Class<? extends C> type()
  {
    assert false : "Node<D,R,F>.type has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return null;
  }


  @Override
  public String typeset()
  {
    assert false : "Node<D,R,F>.typeset has yet to be implemented as of Dec 11, 2025 6:18:37 PM";
    return null;
  }

}
