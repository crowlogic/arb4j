package arb.expressions.nodes;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.functions.Function;

public class Else<D, R, F extends Function<D, R>> extends
                 Node<D, R, F>
{

  public Else(Expression<D, R, F> expression)
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

}
