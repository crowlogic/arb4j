package arb.expressions.nodes.nary;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.real.ProductGenerator;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  public Product<D, R, F> indexVar;
  public Node<D, R, F>    startIndex;
  public Node<D, R, F>    endIndex;

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
  }

  @Override
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {
    var generator = new ProductGenerator<D, R, F>(classVisitor,
                                                  mv,
                                                  indexVar,
                                                  startIndex,
                                                  endIndex);
    generator.generateProductMethod();
    return mv;
  }

  @Override
  public boolean isReusable()
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return isResult;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return mv;
  }

  @Override
  public String typeset()
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <C> Class<? extends C> type()
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
