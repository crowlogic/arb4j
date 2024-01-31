package arb.expressions.nodes.nary;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.Real;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  @Override
  public String toString()
  {
    return typeset();
  }

  public Variable<D, R, F> indexVar;
  public Node<D, R, F>     startIndex;
  public Node<D, R, F>     endIndex;
  private Node<D, R, F>    factor;

  public Product(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> node)
  {
    super(expression);
    factor = node;

  }

  @Override
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {

    assert startIndex.type().equals(Integer.class) : "startIndex must be an Integer but it is a "
                  + startIndex.type();
    assert endIndex.type().equals(Integer.class) : "endIndex must be an Integer but it is a " + endIndex.type();
    Label loopStartLabel = new Label();
    Label loopEndLabel   = new Label();

    // TODO; store startIndex in local variable index 1 and store endIndex in local
    // variable index 2
    startIndex.generate(classVisitor, mv, Integer.class);
    endIndex.generate(classVisitor, mv, Integer.class);

    mv.visitLabel(loopStartLabel);
    factor.generate(classVisitor, mv, factor.type());
    mv.visitLabel(loopEndLabel);

    assert false : "TODO: generate calculation " + this;
    return mv;
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {

    return mv;
  }

  @Override
  public String typeset()
  {
    return String.format("\\prod_{%s = %s}^{%s}{%s}",
                         indexVar.typeset(),
                         startIndex.typeset(),
                         endIndex.typeset(),
                         factor.typeset());
  }

  @Override
  public Class<Real> type()
  {
    return Real.class;
  }

}
