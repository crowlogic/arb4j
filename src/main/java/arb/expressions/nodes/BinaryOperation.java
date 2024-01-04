package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

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

  public final boolean          cast;

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
    cast           = !parser.rangeType.equals(type());
    assert left != null && right != null : "one or more of the operands to this were missing: " + this;
  }

  @Override
  public final MethodVisitor generate(MethodVisitor mv)
  {
    if (cast)
    {
      expression.checkClassCast(Compiler.loadResult(mv), expression.rangeType);
    }
    

 //   assert false : " TODO: check left and right for the need to cast";
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
    Class<?> resultType       = type();
    Class<?> targetResultType = expression.rangeType;

    loadBits(mv);
    loadResult(mv, resultType, targetResultType);

    invokeBinaryOperationMethod(mv, operator, left.type(), right.type(), resultType);
    if (cast)
    {
      Compiler.invokeSetMethod(mv, targetResultType, resultType);
    }
    return mv;
  }

  void invokeBinaryOperationMethod(MethodVisitor mv,
                                   String operator,
                                   Class<?> leftType,
                                   Class<?> rightType,
                                   Class<?> returnType)
  {
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(leftType),
                       operator,
                       String.format("(%sI%s)%s",
                                     rightType.descriptorString(),
                                     returnType.descriptorString(),
                                     returnType.descriptorString()),
                       false);
  }

  private boolean loadResult(MethodVisitor mv, Class<?> resultType, Class<?> targetResultType)
  {
    Node<D, R, F> reusableNode;

    if (isResult)
    {

      if (cast)
      {
        // expression.loadFieldOntoStack(mv, intermediary, resultType);
        // expression.checkClassCast(loadResult(mv), expression.rangeType);
        // expression.checkClassCast(loadResult(mv), targetResultType);

        expression.reserveIntermediateVariable(mv, depth, resultType);
      }
      else
      {
        expression.checkClassCast(Compiler.loadResult(mv), resultType);

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

//    if (!left.type().equals(type()))
//    {
//      throw new UnsupportedOperationException(String.format("FIXME: stopping point at '%s', do type-casting here, left.type=%s != type=%s\n",
//                                                            typeset(),
//                                                            left.type(),
//                                                            type()));
//    }
    return cast;
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
      // produce real values when integers are divided so that precision isn't lost..
      // technically that could be accomplished by using the remainder field as well..
      // remains to be determined what the best way to prefer a result-type thru the
      // API and have that be used to generate the optimal structures
      boolean integerDivision = operation.equals("div") && left.type().equals(Integer.class);
      return integerDivision ? Real.class : left.type();
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
