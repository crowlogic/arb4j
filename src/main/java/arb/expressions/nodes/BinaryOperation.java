package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Real;
import arb.expressions.Expression;
import arb.functions.Function;

public abstract class BinaryOperation<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
                                     extends
                                     Node<D, R, F>
{

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    if (right.isReusable())
    {
      prepareStackForReusingRightSide(mv);
    }
    else if (left.isReusable())
    {
      prepareStackForReusingLeftSide(mv);
    }
    else
    {
      throw new IllegalArgumentException("Neither side is reusable: " + this);
    }
    return null;
  }

  protected final Node<D, R, F> right, left;

  private String                operation;

  public BinaryOperation(Expression<D, R, F> parser, Node<D, R, F> left, String operation, Node<D, R, F> right)
  {
    super(parser);

    this.right     = right;
    this.operation = operation;
    this.left      = left;
    assert left != null && right != null : "one or more of the operands to this were missing: " + this;
  }

  @Override
  public final MethodVisitor generate(MethodVisitor mv)
  {
    left.generate(mv);
    right.generate(mv);
    generateInvocation(mv, operation, expression.rangeClassInternalName);
    return mv;
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
  public MethodVisitor generateInvocation(MethodVisitor mv, String operator, String resultClassInternalName)
  {
    loadBits(mv);
    Node<D, R, F> reusableNode;
    if (isLast)
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
      allocateIntermediateVariable(mv);
    }

    return invokeOperator(mv, operator);
  }

  public MethodVisitor invokeOperator(MethodVisitor mv, String operator)
  {
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
    return String.format(depth < 0 ? "%s%s[%s left=%s,%s right=%s%s]" : "%s%s[\n%s left=\n %s,\n%s right=\n %s\n%s]",
                         indent,
                         getClass().getSimpleName(),
                         childIndent,
                         left == null ? null : left.toString(depth < 0 ? depth : (depth + 2)),
                         childIndent,
                         right == null ? null : right.toString(depth < 0 ? depth : (depth + 2)),
                         indent);
  }
}
