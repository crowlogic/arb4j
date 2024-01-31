package arb.expressions.nodes.nary;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format("Product[factor=%s, k=%s..%s]", factor, startIndex, endIndex);
  }

  @Override
  public String typeset()
  {
    return String.format("product(%s,%s)", factor, startIndex, endIndex);
  }

  Node<D, R, F>           factor;

  public Product<D, R, F> indexVar;

  public Node<D, R, F>    startIndex;

  public Node<D, R, F>    endIndex;

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    factor             = expression.evaluate();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: generate code to evaluate " + this;
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
    return null;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    return factor.type();
  }

}
