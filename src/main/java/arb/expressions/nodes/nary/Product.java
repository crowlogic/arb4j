package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.ASTORE;
import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.IF_ICMPGE;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;

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
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {
    Label loopStartLabel = new Label();
    Label loopEndLabel   = new Label();

    index.generate(classVisitor, mv, Integer.class);
    mv.visitVarInsn(ASTORE, indexVarIndex);

    startIndex.generate(classVisitor, mv, Integer.class);
    mv.visitVarInsn(ASTORE, startIndexVarIndex);

    endIndex.generate(classVisitor, mv, Integer.class);
    mv.visitVarInsn(ASTORE, endIndexVarIndex);

    mv.visitLabel(loopStartLabel);

    /**
     * Load indexVar and endIndex for comparison Assuming methods in arb.Integer to
     * compare two instances, e.g., compareTo
     */
    mv.visitVarInsn(ALOAD, indexVarIndex);
    mv.visitVarInsn(ALOAD, endIndexVarIndex);
    /** Assuming compareTo returns an int comparison result */
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
    mv.visitJumpInsn(IF_ICMPGE, loopEndLabel);

    /**
     * Load the factor and multiply with the current product Assuming
     * factor.generate(...) correctly handles the multiplication and leaves the
     * result on the stack
     */
    factor.generate(classVisitor, mv, factor.type());

    /**
     * Assuming a method to multiply two arb.Integer instances This might involve
     * loading the product accumulator, invoking the multiplication, and storing the
     * result back
     */
    mv.visitVarInsn(ALOAD, productVarIndex);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "multiply", "(Larb/Integer;)Larb/Integer;", false);
    mv.visitVarInsn(ASTORE, productVarIndex);

    /**
     * Increment the indexVar Assuming indexVar is already an arb.Integer object and
     * there's a method to increment
     */
    mv.visitVarInsn(ALOAD, indexVarIndex);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
    mv.visitVarInsn(ASTORE, indexVarIndex);

    mv.visitJumpInsn(GOTO, loopStartLabel);

    mv.visitLabel(loopEndLabel);

    /**
     * At this point, the product is stored in the variable at productVarIndex
     * Depending on the method's expected behavior, you might need to return or
     * process the product further
     */

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
