package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.IFGE;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
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

  @Override
  public MethodVisitor generate(ClassVisitor classVisitor, MethodVisitor mv, Class<?> resultType)
  {
    factor.generate(classVisitor, mv, RealPolynomial.class);
    return mv;
//    loadOutputVariableOntoStack(mv, expression, Real.class); // Prepare the stack for the result
//
//    Label loopStart = new Label();
//    Label afterLoop = new Label();
//    mv.visitLabel(loopStart);
//
//    // Generate start and end index values onto the stack
//    startIndex.generate(classVisitor, mv, Integer.class); // Load start index
//    endIndex.generate(classVisitor, mv, Integer.class); // Load end index
//
//    // Compare start index with end index
//    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
//    mv.visitJumpInsn(IFGE, afterLoop); // Exit loop if start index >= end index
//
//    // Apply the 'factor' within the loop
//    factor.generate(classVisitor, mv, Real.class); // Apply factor to the product
//
//    // Increment the index logic here
//    // Assuming an increment method or operation updates the index within the factor
//    // or elsewhere
//
//    mv.visitJumpInsn(GOTO, loopStart);
//    mv.visitLabel(afterLoop);
//
//    // Finalization code if needed
//
//    return mv; // Return MethodVisitor for potential further modifications
  }

  protected void loadOutputVariableOntoStack(MethodVisitor mv, Expression<D, R, F> expression, Class<?> resultType)
  {
    if (isReusable())
    {
      // Logic for direct reuse
    }
    else
    {
      // Reserve an intermediate variable if the result can't be reused
      expression.reserveIntermediateVariable(mv, resultType);
    }
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
