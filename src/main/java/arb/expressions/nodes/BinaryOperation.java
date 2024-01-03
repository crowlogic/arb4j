package arb.expressions.nodes;

import static arb.expressions.Compiler.loadBits;
import static arb.expressions.Compiler.loadResult;
import static arb.expressions.Compiler.prepareStackForReusingLeftSide;
import static arb.expressions.Compiler.prepareStackForReusingRightSide;
import static java.lang.System.err;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public abstract class BinaryOperation<D, R, F extends Function<D, R>> extends
                                     Node<D, R, F>
{

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    if (right.isReusable())
    {
      return prepareStackForReusingRightSide(mv);
    }
    else if (left.isReusable())
    {
      return prepareStackForReusingLeftSide(mv);
    }
    else
    {
      throw new IllegalArgumentException("Neither side is reusable: " + this);
    }
  }

  protected final Node<D, R, F> right, left;

  private String                operation;

  public BinaryOperation(Expression<D, R, F> parser,
                         Node<D, R, F> left,
                         String operation,
                         Node<D, R, F> right,
                         int depth)
  {
    super(parser,
          depth + 1);

    this.right     = right;
    this.operation = operation;
    this.left      = left;
    this.depth     = depth;
    assert left != null && right != null : "one or more of the operands to this were missing: " + this;
  }

  @Override
  public final MethodVisitor generate(MethodVisitor mv)
  {
    left.generate(mv);
    right.generate(mv);
    return invokeMethod(mv, operation);
  }

  /**
   * Generates the bytecode to perform the operation.
   * 
   * Input Stack: (L, R)
   * 
   * Output Stack: (L, R, I, L) or (L, R, I, R) or (L,R,I,N) or (L,R,I,T) where N
   * is a newly allocated Real and T is the last argument passed to the
   * {@link Expression#evaluate(Real, int, int, Real)} method which is where the
   * result will be stored and returned
   * 
   * @return
   */
  public MethodVisitor invokeMethod(MethodVisitor mv, String operator)
  {
    Class<?> resultType = type();
    loadBits(mv);
    Node<D, R, F> reusableNode;
    String        intermediary     = null;
    Class<?>      targetResultType = expression.rangeType;

    if (isResult)
    {

      if (!targetResultType.equals(resultType))
      {

        intermediary = expression.reserveIntermediateVariable(mv, depth, resultType);
      }
      else
      {
        expression.checkClassCast(loadResult(mv), resultType);
      }

    }
    else if ((reusableNode = getAReusableNode()) != null)
    {
      boolean rightReusable = reusableNode == right;
      if (rightReusable)
      {
        prepareStackForReusingRightSide(mv);
      }
      else
      {
        prepareStackForReusingLeftSide(mv);
      }
    }
    else
    {
      expression.reserveIntermediateVariable(mv, depth, resultType);
    }

    if (!left.type().equals(type()))
    {
      throw new UnsupportedOperationException(String.format("FIXME: stopping point at '%s', do type-casting here, left.type=%s != type=%s\n",
                                                            typeset(),
                                                            left.type(),
                                                            type()));
    }
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(left.type()),
                       operator,
                       String.format("(%sI%s)%s",
                                     right.type().descriptorString(),
                                     type().descriptorString(),
                                     type().descriptorString()),
                       false);
    if (intermediary != null)
    {
      //expression.loadFieldOntoStack(mv, intermediary, resultType);
      expression.checkClassCast(loadResult(mv), expression.rangeType);
      Compiler.invokeSetMethod(mv, expression.rangeType, resultType);
     
    }
    return mv;
  }

  /**
   * Returns a reusable node if it exists, it will either be this{@link #left} or
   * this{@link #right} or null if neither are reusable
   */
  public Node<D, R, F> getAReusableNode()
  {
    if (right.isReusable())
    {
      return right;
    }
    else if (left.isReusable())
    {
      return left;
    }
    return null;
  }

  @Override
  public boolean isReusable()
  {
    return left.isReusable() || right.isReusable();
  }

  @Override
  public String toString()
  {
    return toString(0);
  }

  public String toString(int depth)
  {
    return typeset();
  }

  /**
   * symmetric type equality
   * 
   * @param a
   * @param b
   * @return true if (left,right) in { (a,b) , (b,a) }
   */
  public boolean typesSymmetryicallyEqual(Class<?> a, Class<?> b)
  {
    return (left.type().equals(a) && right.type().equals(b)) || (left.type().equals(b) && right.type().equals(a));
  }

  @Override
  public final Class<?> type()
  {
    if (left.type().equals(right.type()))
    {
      return left.type();
    }
    else if (typesSymmetryicallyEqual(Integer.class, Real.class))
    {
      return Real.class;
    }
    else if (typesSymmetryicallyEqual(Integer.class, RealPolynomial.class))
    {
      return RealPolynomial.class;
    }
    else if (typesSymmetryicallyEqual(Real.class, RealPolynomial.class))
    {
      return RealPolynomial.class;

    }
    assert false : String.format("TODO: handle resultant type for left=%s and right=%s in %s",
                                 left.type(),
                                 right.type(),
                                 typeset());
    return null;
  }
}
