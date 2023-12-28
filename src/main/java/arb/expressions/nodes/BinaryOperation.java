package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Real;
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
    return invokeMethod(mv, operation, expression.rangeClassInternalName);
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
  public MethodVisitor invokeMethod(MethodVisitor mv, String operator, String resultClassInternalName)
  {
    loadBits(mv);
    Node<D, R, F> reusableNode;
    if (isResult)
    {
      expression.checkClassCast(loadResult(mv), false);
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
      expression.reserveIntermediateVariable(mv, depth, null);
    }

    String rcd = expression.rangeClassDescriptor;
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       expression.rangeClassInternalName,
                       operator,
                       String.format("(%sI%s)%s", rcd, rcd, rcd),
                       false);

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
    String indent      = depth < 0 ? "" : indent(depth);
    String childIndent = depth < 0 ? "" : indent(depth + 1);
    return String.format(depth < 0 ? "%s%s[depth=%d %s left=%s,%s right=%s%s]" : "%s%s[\n%s left=\n %s,\n%s right=\n %s\n%s]",
                         indent,
                         getClass().getSimpleName(),
                         depth,
                         childIndent,
                         left == null ? null : left.toString(depth < 0 ? depth : (depth + 2)),
                         childIndent,
                         right == null ? null : right.toString(depth < 0 ? depth : (depth + 2)),
                         indent);
  }
}
