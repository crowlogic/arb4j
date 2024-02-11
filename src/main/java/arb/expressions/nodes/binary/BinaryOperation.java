package arb.expressions.nodes.binary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.loadBitsParameter;
import static arb.expressions.Compiler.prepareStackForReusingLeftSide;
import static arb.expressions.Compiler.prepareStackForReusingRightSide;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public abstract class BinaryOperation<D, R, F extends Function<D, R>> extends
                                     Node<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format("BinaryOperation[left=%s, right=%s, operation=%s, generatedType=%s]",
                         left == null ? "∅" : left.typeset(),
                         right == null ? "∅" : right.typeset(),
                         operation,
                         generatedType != null ? generatedType.toString() : null);
  }

  public String toString(int depth)
  {
    return toString();
  }

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

  public Node<D, R, F> right;

  public Node<D, R, F> left;

  public String                operation;

  public Class<?>              generatedType;

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public BinaryOperation(Expression<D, R, F> expression,
                         Node<D, R, F> left,
                         String operation,
                         Node<D, R, F> right)
  {
    super(expression);

    this.right     = right;
    this.operation = operation;
    this.left      = left;
    assert right != null : "the right-hand-side of a binary operator should never be null";
    if (left == null)
    {
      Class<? extends Object> rhsType = right.type();
      if (Integer.class.equals(rhsType) || Real.class.equals(rhsType))
      {
        left = new LiteralConstant<>(expression,
                                     Real.class.equals(rhsType) ? "0.0" : "0");
      }
      else
      {
        throw new ExpressionCompilerException("Unhandled fill-in of left-hand-side of binary "
                      + "operation when the right hand side is of type " + right.type()
                      + ", this is where -x is translated to 0-x. that is what is meant by fill-in");
      }
    }
    assert left != null && right != null : "one or more of the operands to this were missing: " + this
                  + " set 0 value based on type here";
  }


  
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    generatedType = resultType;

    left.generate(mv, left.type());
    right.generate(mv, right.type());
    return invokeMethod(mv, operation, resultType);
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
   * @param resultType
   * 
   * @return
   */
  public MethodVisitor invokeMethod(MethodVisitor mv, String operator, Class<?> resultType)
  {
    Class<?> targetResultType = expression.rangeType;

    loadBitsParameter(mv);
    loadResult(mv, resultType, targetResultType);

    var leftGeneratedType = left.getGeneratedType();
    var overrideLeftType  = leftGeneratedType != null ? leftGeneratedType : left.type();
    invokeBinaryOperationMethod(mv, operator, overrideLeftType, right.type(), resultType);

    return mv;
  }

  void invokeBinaryOperationMethod(MethodVisitor mv,
                                   String operator,
                                   Class<?> leftType,
                                   Class<?> rightType,
                                   Class<?> returnType)
  {
    mv.visitMethodInsn(INVOKEVIRTUAL,
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
      checkClassCast(Compiler.loadResultParameter(mv), resultType);
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
      expression.reserveIntermediateVariable(mv, resultType);
      return true;

    }

    return false;
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

  /**
   * symmetric type equality
   * 
   * @param a
   * @param b
   * @return true if ({@link #left},{@link #right}) in { (a,b) , (b,a) }
   */
  public boolean typesSymmetryicallyEqual(Class<?> a, Class<?> b)
  {
    return (left.type().equals(a) && right.type().equals(b)) || (left.type().equals(b) && right.type().equals(a));
  }

  @Override
  public final Class<?> type()
  {
    assert left != null : "left is null: " + this + " for expr=" + expression;
    assert right != null : "right is null: " + this + " for expr=" + expression;
    
    if (left.type().equals(right.type()))
    {
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
    else if (typesSymmetryicallyEqual(int.class, RealPolynomial.class))
    {
      return RealPolynomial.class;
    }
    else if (typesSymmetryicallyEqual(int.class, Real.class))
    {
      return Real.class;
    }
    else if (typesSymmetryicallyEqual(Real.class, RealPolynomial.class))
    {
      return RealPolynomial.class;

    }
    assert Integer.class.equals(arb.Integer.class) : "you forgot to import arb.Integer";
    assert false : String.format("TODO: handle resultant type for left=%s and right=%s in %s",
                                 left.type(),
                                 right.type(),
                                 typeset());
    return null;
  }
}
