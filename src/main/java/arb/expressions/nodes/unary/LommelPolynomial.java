package arb.expressions.nodes.unary;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomial<D, C, F extends Function<? extends D, ? extends C>>
                             extends
                             FunctionCall<D, C, F>
{

  Node<D, C, F> order;
  Node<D, C, F> index;

  public LommelPolynomial(Expression<D, C, F> expression)
  {
    super("R",
          null,
          expression);
    order = expression.resolve();
    index = expression.require(',').resolve();
    arg   = expression.require(';').resolve();
    expression.require(')');
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
  public List<Node<D, C, F>> getBranches()
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
    assert false : "TODO: Auto-generated method stub: "
                  + String.format("arg=%s\norder=%s\nindex=%s\n", this.arg, this.order, this.index);
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
