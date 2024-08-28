package arb.expressions.nodes.binary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.indent;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class BinaryOperationNode<D, R, F extends Function<? extends D, ? extends R>>
                                         extends
                                         Node<D, R, F>
{

  public static final int initializerBits = 128;

  @Override
  public char symbol()
  {
    return symbol.charAt(0);
  }

  @Override
  public boolean isConstant()
  {
    return left.isConstant() && right.isConstant();
  }

  @Override
  public boolean isScalar()
  {
    return (left == null || left.isScalar()) && (right == null || right.isScalar());
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public String typeset()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    var dependsOnLeft  = left != null && left.dependsOn(variable);
    var dependsOnRight = right != null && right.dependsOn(variable);
    return dependsOnLeft || dependsOnRight;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(left, operation, right, symbol);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    BinaryOperationNode<?, ?, ?> other = (BinaryOperationNode<?, ?, ?>) obj;
    return Objects.equals(left, other.left) && Objects.equals(operation, other.operation)
                  && Objects.equals(right, other.right) && Objects.equals(symbol, other.symbol);
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    if (left != null)
    {
      left.accept(t);
    }
    if (right != null)
    {
      right.accept(t);
    }
    t.accept(this);
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String name, Node<E, S, G> transformation)
  {
    if (Expression.trace)
    {
      logSubstitution(name, transformation, "BEFORE");
    }
    left  = left.substitute(name, transformation);
    right = right.substitute(name, transformation);
    expression.updateStringRepresentation();
    if (Expression.trace)
    {
      logSubstitution(name, transformation, "AFTER");

    }
    return this;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         void
         logSubstitution(String name, Node<E, S, G> transformation, String tense)
  {
    System.err.format("BinaryOperation %s(Expression[#%s]).substitute(name=%s, transformation=%s)) into this=%s of type %s\n",
                      tense,
                      System.identityHashCode(expression),
                      name,
                      transformation,
                      this,
                      getClass().getSimpleName());
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(left == null ? new LiteralConstantNode<>(expression,
                                                            "0")
                                : left,
                   right == null ? new LiteralConstantNode<>(expression,
                                                             "0")
                                 : right);
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return (left.isLeaf() && !right.isLeaf()) || (!left.isLeaf() && right.isLeaf());
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  public String stringFormat(Node<?, ?, ?> side)
  {
    return (side == null || side.isLeaf()) ? "%s" : "(%s)";
  }

  @Override
  public String toString()
  {
    return String.format(String.format("%s%s%s", stringFormat(left), "%s", stringFormat(right)),
                         left == null ? "0" : left,
                         symbol,
                         right == null ? "0" : right);
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

  private String       symbol;

  private String       intermediateVariableFieldName;

  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  public BinaryOperationNode(Expression<D, R, F> expression,
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
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      System.out.println(formatGenerationParameters(resultType));
    }
    generatedType = resultType;

    left.generate(mv, left.type());

    right.generate(mv, right.type());

    return invokeMethod(mv, operation, resultType);
  }

  public String formatGenerationParameters(Class<?> resultType)
  {
    return String.format("BinaryOperation.generate( this=%s,\n%sleft=%s,\n%sleft.type=%s,\n%soperation=%s,\n%sright=%s,\n%sright.type=%s,\n%sresultType=%s )\n\n",
                         this,
                         indent(26),
                         left,
                         indent(26),
                         left.type(),
                         indent(26),
                         operation,
                         indent(26),
                         right,
                         indent(26),
                         right.type(),
                         indent(26),
                         resultType);
  }

  public MethodVisitor invokeMethod(MethodVisitor mv, String operator, Class<?> resultType)
  {
    if (expression.insideInitializer)
    {
      mv.visitLdcInsn(initializerBits);
    }
    else
    {
      loadBitsParameterOntoStack(mv);
    }
    loadResult(mv, resultType);

    var leftType = left.getGeneratedType();
    leftType = leftType != null ? leftType : left.type();
    var rightType = right.type();
    if (Object.class.equals(leftType))
    {
      leftType = expression.coDomainType;
    }
    invokeBinaryOperationMethod(mv, operator, leftType, rightType, resultType);

    return mv;
  }

  public boolean loadResult(MethodVisitor mv, Class<?> resultType)
  {
    Node<D, R, F> reusableNode;

    if (isResult)
    {
      checkClassCast(loadResultParameter(mv), resultType);
      intermediateVariableFieldName = "result";
    }
    else if ((reusableNode = getAReusableNode()) != null)
    {
      boolean rightReusable = reusableNode == right;
      if (rightReusable)
      {
        prepareStackForReusingRightSide(mv);
        intermediateVariableFieldName = "right";
      }
      else
      {
        prepareStackForReusingLeftSide(mv);
        intermediateVariableFieldName = "left";
      }
    }
    else
    {
      intermediateVariableFieldName = expression.allocateIntermediateVariable(mv, resultType);
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
    var leftType  = left.type();
    var rightType = right.type();
    assert leftType != null : "lhs type is  null where lhs is " + left + " and a=" + a + " b=" + b;
    assert rightType != null : "rhs type is null where rhs is " + right + " and a=" + a + " b=" + b;

    return (leftType.equals(a) && rightType.equals(b))
                  || (leftType.equals(b) && rightType.equals(a));
  }

  Class<?>                                                       type;

  public static final HashMap<Class<?>, Map<Class<?>, Class<?>>> typeMap = new HashMap<>();

  /**
   * This is implemented as a symmetric equality which means that leftType and
   * rightType can be exchanged and the result is the same
   * 
   * @param leftType
   * @param rightType
   * @param resultantType
   */
  public static void mapTypes(Class<?> leftType, Class<?> rightType, Class<?> resultantType)
  {
    typeMap.computeIfAbsent(leftType, k -> new HashMap<>()).put(rightType, resultantType);
    typeMap.computeIfAbsent(rightType, k -> new HashMap<>()).put(leftType, resultantType);
  }

  static
  {
    assert Integer.class.equals(arb.Integer.class) : "there is most likely a missing import statement for arb.Integer";

    mapScalarType(Real.class, RealPolynomial.class);
    mapScalarType(Complex.class, ComplexPolynomial.class);

    mapTypes(Integer.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Integer.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Fraction.class, Integer.class, Fraction.class);
    mapTypes(Fraction.class, Real.class, Real.class);
    mapTypes(Fraction.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Fraction.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Fraction.class, RealPolynomial.class, RealPolynomial.class);
    mapTypes(Fraction.class, ComplexPolynomial.class, ComplexPolynomial.class);
    mapTypes(Real.class, Complex.class, Complex.class);
    mapTypes(Real.class, ComplexPolynomial.class, ComplexPolynomial.class);
    mapTypes(Real.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Real.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(RealPolynomial.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Complex.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Integer.class, IntegerPolynomial.class, IntegerPolynomial.class);
  }

  public static void mapScalarType(Class<?> scalarType, Class<?> polynomialType)
  {
    mapTypes(scalarType, polynomialType, polynomialType);
    mapTypes(Integer.class, scalarType, scalarType);
    mapTypes(Integer.class, polynomialType, polynomialType);
    mapTypes(int.class, scalarType, scalarType);
    mapTypes(int.class, polynomialType, polynomialType);
    mapTypes(Fraction.class, scalarType, scalarType);
    mapTypes(Fraction.class, polynomialType, polynomialType);
  }

  @Override
  public Class<?> type()
  {
    if (type != null)
    {
      return type;
    }

    assert right != null : "rhs is null: " + this + " for expr=" + expression;
    var leftType  = left.type();
    var rightType = right.type();
    assert leftType != null : String.format("leftType is null where this=%s\\n", this);
    assert rightType != null : String.format("rightType is null where this=%s\\n", this);

    if (leftType.equals(rightType))
    {
      boolean integerDivision = operation.equals("div") && leftType.equals(Integer.class);
      type = integerDivision ? Fraction.class : leftType;
    }
    else
    {
      Map<Class<?>, Class<?>> innerTypeMap = typeMap.get(leftType);
      if (innerTypeMap != null)
      {
        type = innerTypeMap.get(rightType);
      }
      if (type == null)
      {
        innerTypeMap = typeMap.get(rightType);
        if (innerTypeMap != null)
        {
          type = innerTypeMap.get(leftType);
        }
      }
    }

    if (type == null)
    {
      throw new CompilerException(String.format("Could not determine resultant type for this=%s where left.type=%s and right.type=%s in %s",
                                                this,
                                                leftType,
                                                rightType,
                                                toString()));
    }

    return type;
  }

  public abstract boolean isCommutative();

  @Override
  public String getIntermediateValueFieldName()
  {
    return intermediateVariableFieldName;
  }
}
