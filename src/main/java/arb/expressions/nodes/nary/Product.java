package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.IFGE;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * 
 * @param <D>
 * @param <R>
 * @param <F>
 */
public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  @Override
  public String toString()
  {
    return typeset();
  }

  public Variable<D, R, F> index;
  public Node<D, R, F>     startIndex;
  public Node<D, R, F>     endIndex;
  private Node<D, R, F>    factor;

  public Product(Expression<D, R, F> expression, Node<D, R, F> node)
  {
    super(expression);
    factor = node;

  }

  int indexVarIndex      = 0;
  int startIndexVarIndex = 1;
  int endIndexVarIndex   = 2;
  int productVarIndex    = 3;

  @Override
  public MethodVisitor generate(ClassVisitor classWriter, MethodVisitor mv, Class<?> resultType)
  {

    loadResult(mv);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "one", "()Larb/Real;", false);

    /** Define the start of the loop */
    Label loopStart = new Label();
    Label afterLoop = new Label();
    mv.visitLabel(loopStart);

    /**
     * Assuming 'index' and 'endIndex' comparison logic here For demonstration,
     * let's assume 'index' is a field of type YourMutableIntegerClass and we're
     * comparing it to 'endIndex'
     */
    String owner        = expression.className;
    String integerClass = Type.getInternalName(Integer.class);
    getField(mv, owner, "index", integerClass); // Load 'index'
    getField(mv, owner, "endIndex", integerClass); // Load 'endIndex'
    mv.visitMethodInsn(INVOKEVIRTUAL, integerClass, "compareTo", "(LYourMutableIntegerClass;)I", false);
    mv.visitJumpInsn(IFGE, afterLoop); // If 'index' >= 'endIndex', jump to the end of the loop

    /**
     * Apply the 'factor' function to the Real instance, using the current 'index'
     * This assumes 'factor' is a method in 'YourClass' that operates on 'Real'
     */
    mv.visitVarInsn(ALOAD, 0); // Load 'this'
    loadResult(mv);
    getField(mv, owner, "index", integerClass); // Load 'index'
    mv.visitMethodInsn(INVOKEVIRTUAL, owner, "factor", "(Larb/Real;LYourMutableIntegerClass;)Larb/Real;", false);

    /** Increment 'index' */
    getField(mv, owner, "index", integerClass); // Load 'index'
    mv.visitMethodInsn(INVOKEVIRTUAL, integerClass, "increment", "()V", false);

    /** Jump back to the start of the loop */
    mv.visitJumpInsn(GOTO, loopStart);
    mv.visitLabel(afterLoop);

    return mv;
  }

  private void loadResult(MethodVisitor mv)
  {
    mv.visitVarInsn(ALOAD, 1); // Load the 'Real' instance
  }

  private static void getField(MethodVisitor mv, String owner, String name, String descriptor)
  {
    mv.visitVarInsn(ALOAD, 0); // Load 'this'
    mv.visitFieldInsn(GETFIELD, owner, name, descriptor);

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
                         index.typeset(),
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
