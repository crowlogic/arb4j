package arb.expressions.nodes.nary;

import static java.lang.System.out;

import org.objectweb.asm.MethodVisitor;

import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format("Product[factor=%s, range=%s]", factor, range);
  }

  @Override
  public String typeset()
  {
    return String.format("product(%s,%s)", factor, range);
  }

  Node<D, R, F> factor;

  Range         range;

  public class Range
  {

    @Override
    public String toString()
    {
      return String.format("Range[%s…%s]", firstIndex.typeset(), lastIndex.typeset());
    }

    public Node<D, R, F> firstIndex;
    public Node<D, R, F> lastIndex;
  }

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    factor = expression.evaluate();
    factor.containedBy = this;
   // assert false: falling factorial should be the content.. (a_k)_f not a_k
    System.err.println("factor of " + this + " is " + factor );
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: Auto-generated method stub: resultType=" + resultType ;
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
