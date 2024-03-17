package arb.expressions.nodes.binary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.loadBitsParameter;
import static arb.expressions.Compiler.prepareStackForReusingLeftSide;
import static arb.expressions.Compiler.prepareStackForReusingRightSide;
import static arb.utensils.Utensils.indent;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.unary.Factorialization;
import arb.functions.Function;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class BinaryOperation<D, R, F extends Function<D, R>> extends
                                     Node<D, R, F>
{

  @Override
  public boolean hasSingleLeaf()
  {
    return left.isLeaf() && right.isLeaf();
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  public String stringFormat(Node<?, ?, ?> side)
  {
    return (side.isLeaf() || side.hasSingleLeaf() ) ? "%s" : "(%s)";
  }

  @Override
  public String toString()
  {
    return String.format(String.format("%s%s%s", stringFormat(left), "%s", stringFormat(right)),
                         left == null ? "∅" : left, symbol, right == null ? "∅" : right);
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

  public String        operation;

  public Class<?>      generatedType;

  private String       symbol;

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public BinaryOperation(Expression<D, R, F> expression,
                         Node<D, R, F> left,
                         String operation,
                         Node<D, R, F> right,
                         String symbol)
  {
    super(expression);

    this.right     = right;
    this.operation = operation;
    this.left      = left;
    this.symbol    = symbol;
    assert right != null : "the right-hand-side of a binary operator should never be null";
    if (left == null)
    {
      Class<? extends Object> rhsType = right.type();
      if (Integer.class.equals(rhsType) || Real.class.equals(rhsType))
      {
        left = new LiteralConstant<>(expression, Real.class.equals(rhsType) ? "0.0" : "0");
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
    if (expression.traceGenerator)
    {
      System.out.format("BinaryOperation.generate( this=%s,\n%sleft=%s,\n%sleft.type=%s,\n%soperation=%s,\n%sright=%s,\n%sright.type=%s,\n%sresultType=%s )\n\n",
                        this, indent(26), left, indent(26), left.type(), indent(26), operation, indent(26), right,
                        indent(26), right.type(), indent(26), resultType);
    }
    generatedType = resultType;

    left.generate(mv, left.type());
    right.generate(mv, right.type());
    return invokeMethod(mv, operation, resultType);
  }

  /**
   * FIXME: this
   * 
   * @param mv
   * @param operator
   * @param resultType
   * @return
   */
  public MethodVisitor invokeMethod(MethodVisitor mv, String operator, Class<?> resultType)
  {
    loadBitsParameter(mv);
    loadResult(mv, resultType);

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
    if (expression.traceGenerator)
    {
      String.format("%s.invokeBinaryOperationMethod(operator=%s, leftType=%s, rightType=%s, returnType=%s)\n",
                    getClass().getSimpleName(), operator, leftType, rightType, returnType);
    }
    mv.visitMethodInsn(INVOKEVIRTUAL, Type.getInternalName(leftType), operator,
                       String.format("(%sI%s)%s", rightType.descriptorString(), returnType.descriptorString(),
                                     returnType.descriptorString()),
                       false);
  }

  private boolean loadResult(MethodVisitor mv, Class<?> resultType)
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
    assert a != null : "a is null";
    assert b != null : "b is null";
    assert left != null : "lhs is null";
    assert right != null : "rhs is null";
    Class<? extends Object> leftType  = left.type();
    Class<? extends Object> rightType = right.type();
    assert leftType != null : "lhs type is  null where lhs is " + left + " and a=" + a + " b=" + b;
    assert rightType != null : "rhs type is null where rhs is " + right + " and a=" + a + " b=" + b;

    return (leftType.equals(a) && rightType.equals(b)) || (leftType.equals(b) && rightType.equals(a));
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
    assert false : String.format("TODO: handle resultant type for left=%s and right=%s in %s", left.type(),
                                 right.type(), typeset());
    return null;
  }

  public abstract boolean isCommutative();
}
