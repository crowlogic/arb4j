package arb.expressions.nodes.unary;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.functions.sequences.LommelPolynomials;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomial<D, C, F extends Function<? extends D, ? extends C>>
                             extends
                             Node<D, C, F>
{

  public LommelPolynomial(Expression<D, C, F> expression)
  {
    super(expression);
    assert false : "TODO: implement Lommel polynomials via " + LommelPolynomials.class;
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
  }

  @Override
  public boolean isScalar()
  {
    return false;
  }

  @Override
  public Node<D, C, F> integral(Variable<D, C, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Node<D, C, F> derivative(Variable<D, C, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public List<? extends Node<D, C, F>> getBranches()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public boolean isLeaf()
  {
    assert false : "TODO: Auto-generated method stub";
    return false;
  }

  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public boolean isReusable()
  {
    assert false : "TODO: Auto-generated method stub";
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String typeset()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    assert false : "TODO: Auto-generated method stub";
    return false;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable,
                                                                                       Node<E, S, G> arg)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public char symbol()
  {
    assert false : "TODO: Auto-generated method stub";
    return 'R';
  }

  @Override
  public boolean isConstant()
  {
    assert false : "TODO: Auto-generated method stub";
    return false;
  }

  @Override
  public String getIntermediateValueFieldName()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
