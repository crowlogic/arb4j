package arb.expressions.nodes.nary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  public Product(Expression<D, R, F> expression, int depth)
  {
    super(expression,
          depth);
    assert false : "TODO: construct Product whose syntax is like this ∏αₖ₍ₙ₎{k=1…p} where αₖ₍ₙ₎=α[k].risingFactorial(n) in this example";
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String toString(int depth)
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

}
