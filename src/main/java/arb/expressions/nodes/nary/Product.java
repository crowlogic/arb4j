package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.IF_ICMPGE;
import static org.objectweb.asm.Opcodes.ILOAD;
import static org.objectweb.asm.Opcodes.IRETURN;
import static org.objectweb.asm.Opcodes.ISTORE;

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

  int indexVarIndex      = 0;
  int startIndexVarIndex = 1;
  int endIndexVarindex   = 2;
  int productVarIndex    = 3;

  public void generateLoopClass(ClassVisitor cv, MethodVisitor mv)
  {
    Label loopStart = new Label();
    Label loopEnd   = new Label();

    instantiateNewIndexVariable(mv);
    loadStartIndex(mv);
    callIntegerSetMethod(mv);

    mv.visitVarInsn(ISTORE, productVarIndex);

    mv.visitLabel(loopStart);

    mv.visitVarInsn(ALOAD, indexVarIndex);
    mv.visitVarInsn(ALOAD, endIndexVarindex);
    mv.visitJumpInsn(IF_ICMPGE, loopEnd);

    factor.generate(cv, mv, factor.type());
    multiplyAccumulator(cv, mv);

    mv.visitLabel(loopEnd);

    mv.visitVarInsn(ALOAD, productVarIndex);
    callIntegerIncrementMethod(cv, mv);

    mv.visitJumpInsn(GOTO, loopStart);

    mv.visitLabel(loopEnd);
    mv.visitVarInsn(ILOAD, productVarIndex);
    mv.visitInsn(IRETURN);

    mv.visitMaxs(-1, -1);
    mv.visitEnd();

  }

  private void callIntegerIncrementMethod(ClassVisitor cv, MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
  }

  private void multiplyAccumulator(ClassVisitor cv, MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
  }

  private void callIntegerSetMethod(MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
  }

  private void loadStartIndex(MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
  }

  private void instantiateNewIndexVariable(MethodVisitor mv)
  {
    // TODO Auto-generated method stub
    assert false : "TODO: Auto-generated method stub";
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
