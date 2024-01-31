package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

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
    return String.format("Product[factor=%s, indexVar=%s, startIndex=%s, endIndex=%s]",
                         factor,
                         indexVar,
                         startIndex,
                         endIndex);
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
    startIndex.generate(classVisitor, mv, Integer.class);
    endIndex.generate(classVisitor, mv, Integer.class);
    Type   intType                = Type.getType(Integer.class);
    String produceMethodSignature = Type.getMethodDescriptor(Type.getType(Real.class), intType, intType);
    mv.visitMethodInsn(INVOKEVIRTUAL, Type.getInternalName(Product.class), "produce", produceMethodSignature, false);
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
    return toString();
  }

  @Override
  public Class<Real> type()
  {
    return Real.class;
  }

}
