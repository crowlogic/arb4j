package arb.expressions.nodes.binary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.invokeBinaryOperationMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.utensils.Utensils.indent;

import java.util.ArrayList;
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
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * 
 * @param <D> domain
 * @param <C> codomain
 * @param <F> {@link Function}
 * 
 * @author Stephen Andrew Crowley ©2024
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class BinaryOperationNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                         Node<D, C, F>
{

  public static final int                                        initializerBits = 128;

  public static final HashMap<Class<?>, Map<Class<?>, Class<?>>> typeMap         = new HashMap<>();

  static
  {
    assert Integer.class.equals(arb.Integer.class) : "import statement for arb.Integer is missing";
    initializeTypeMaps();
  }

  protected static void initializeTypeMaps()
  {
    mapPolynomialType(Real.class, RealPolynomial.class);
    mapPolynomialType(Complex.class, ComplexPolynomial.class);
    mapTypes(Integer.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Integer.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Integer.class, IntegerPolynomial.class, IntegerPolynomial.class);
    mapTypes(Fraction.class, Integer.class, Fraction.class);
    mapTypes(Fraction.class, Real.class, Real.class);
    mapTypes(Fraction.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Fraction.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Fraction.class, RealPolynomial.class, RealPolynomial.class);
    mapTypes(Fraction.class, ComplexPolynomial.class, ComplexPolynomial.class);
    mapTypes(AlgebraicNumber.class, Fraction.class, AlgebraicNumber.class);
    mapTypes(AlgebraicNumber.class, Integer.class, AlgebraicNumber.class);
    mapTypes(AlgebraicNumber.class, Real.class, Real.class);
    mapTypes(AlgebraicNumber.class, Complex.class, Complex.class);
    mapTypes(AlgebraicNumber.class, RealPolynomial.class, RealPolynomial.class);
    mapTypes(AlgebraicNumber.class, ComplexPolynomial.class, ComplexPolynomial.class);    
    mapTypes(Real.class, Complex.class, Complex.class);
    mapTypes(Real.class, ComplexPolynomial.class, ComplexPolynomial.class);
    mapTypes(Real.class, RationalFunction.class, RationalFunction.class);
    mapTypes(Real.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Complex.class, RationalFunction.class, ComplexRationalFunction.class);
    mapTypes(Complex.class, ComplexRationalFunction.class, ComplexRationalFunction.class);
    mapTypes(ComplexRationalFunction.class, RationalFunction.class, ComplexRationalFunction.class);
    mapTypes(IntegerPolynomial.class, Complex.class, ComplexPolynomial.class);
    mapTypes(IntegerPolynomial.class, ComplexPolynomial.class, ComplexPolynomial.class);
    mapTypes(RealPolynomial.class, Complex.class, ComplexPolynomial.class);
    mapTypes(RealPolynomial.class, ComplexPolynomial.class, ComplexPolynomial.class);
    mapTypes(RealPolynomial.class, RationalFunction.class, RationalFunction.class);
    mapTypes(RealFunction.class, Integer.class, RealFunction.class);
    mapTypes(RealFunction.class, Real.class, RealFunction.class);
    mapTypes(RealFunction.class, Fraction.class, RealFunction.class);
    mapTypes(ComplexFunction.class, Complex.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Real.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Integer.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Fraction.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, RealFunction.class, ComplexFunction.class);
  }

  public static void mapPolynomialType(Class<?> scalarType, Class<?> polynomialType)
  {
    mapTypes(scalarType, polynomialType, polynomialType);
    mapTypes(Integer.class, scalarType, scalarType);
    mapTypes(Integer.class, polynomialType, polynomialType);
    mapTypes(int.class, scalarType, scalarType);
    mapTypes(int.class, polynomialType, polynomialType);
    mapTypes(Fraction.class, scalarType, scalarType);
    mapTypes(Fraction.class, polynomialType, polynomialType);
  }

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

  public Node<D, C, F> left;

  public String        operation;

  public Node<D, C, F> right;

  private String       symbol;

  Class<?>             type;

  public BinaryOperationNode(Expression<D, C, F> expression,
                             Node<D, C, F> left,
                             String operation,
                             Node<D, C, F> right,
                             String symbol)
  {
    super(expression);

    this.right     = right;
    this.operation = operation;
    this.left      = left;
    this.symbol    = symbol;
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
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

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    return (left != null && left.dependsOn(variable)) || (right != null && right.dependsOn(variable));
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

    if (!Objects.equals(operation, other.operation) || !Objects.equals(symbol, other.symbol)
                  || !Objects.equals(type(), other.generatedType))
    {
      return false;
    }

    if (isCommutative())
    {
      return type().equals(other.type()) && ((Objects.equals(left, other.left) && Objects.equals(right, other.right))
                    || (Objects.equals(left, other.right) && Objects.equals(right, other.left)));
    }
    return type().equals(other.generatedType) && Objects.equals(left, other.left) && Objects.equals(right, other.right);
  }

  @Override
  public int hashCode()
  {
    int hash = 0;
    if (isCommutative())
    {
      // For commutative operations, order doesn't matter and since the sum is
      // order-independent thats what is used as the hash
      int operationHash = Objects.hash(operation, symbol, generatedType);
      int operandsHash  = left.hashCode() + right.hashCode();
      hash = operationHash + operandsHash;
    }
    else
    {
      hash = Objects.hash(left, operation, right, symbol, generatedType);
    }

    return hash;
  }

  public String formatGenerationParameters(Class<?> resultType)
  {
    return String.format("BinaryOperation.generate( this=%s,\n%sleft=%s    (%s %s)\n%soperation=%s,\n%sright=%s    (%s %s),"
                         + " \n%sresultType=%s  fieldName=%s )\n\n",
                         this,
                         indent(26),
                         left,
                         left.type().getSimpleName(),
                         left.getClass().getSimpleName(),
                         indent(26),
                         operation,
                         indent(26),
                         right,
                         right.type().getSimpleName(),
                         right.getClass().getSimpleName(),
                         indent(26),
                         resultType,
                         fieldName);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert left != null : "lhs is null";
    assert right != null : "rhs is null";

    generatedType = resultType;

    String existingVar = expression.generatedNodes.get(this);
    if (existingVar != null)
    {
      fieldName = existingVar;
      expression.loadThisFieldOntoStack(mv, existingVar, resultType);
    }
    else
    {
      left.generate(mv, left.type());
      right.generate(mv, right.type());
      invokeMethod(mv, operation, resultType);
    }

    if (Expression.trace)
    {
      System.out.println(formatGenerationParameters(resultType));
    }

    return mv;

  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {

    var b = new ArrayList<Node<D, C, F>>();
    if (left != null)
    {
      b.add(left);
    }
    if (right != null)
    {
      b.add(right);
    }
    return b;
  }

  public Class<?> getGeneratedType()
  {
    return generatedType;
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
    loadOutput(mv, resultType);

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

  public abstract boolean isCommutative();

  @Override
  public boolean isLiteralConstant()
  {
    return left.isLiteralConstant() && right.isLiteralConstant();
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return (left == null || left.isScalar()) && (right == null || right.isScalar());
  }

  public boolean loadOutput(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
    {
      cast(loadResultParameter(mv), resultType);
      fieldName = "result";
    }
    else
    {
      if (fieldName == null)
      {
        fieldName = expression.allocateIntermediateVariable(mv, resultType);
        expression.generatedNodes.put(this, fieldName);
      }
      return true;
    }
    return false;
  }

  public <E, S, G extends Function<? extends E, ? extends S>> void logSubstitution(String name,
                                                                                   Node<E, S, G> transformation,
                                                                                   String tense)
  {
    System.err.format("BinaryOperation %s(Expression[#%s]).substitute(name=%s, transformation=%s)) into this=%s of type %s\n",
                      tense,
                      System.identityHashCode(expression),
                      name,
                      transformation,
                      this,
                      getClass().getSimpleName());
  }

  public String stringFormat(Node<?, ?, ?> side)
  {
    return side.isLeaf() ? "%s" : "(%s)";
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String name,
                                                                                       Node<E, S, G> transformation)
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

  @Override
  public char symbol()
  {
    return symbol.charAt(0);
  }

  @Override
  public String toString()
  {
    boolean needsImprovement = isCommutative() || (left.isLeaf() && right.isLeaf());
    String  string           = needsImprovement ? String.format("%s%s%s", left, symbol, right)
                                                : String.format(String.format("%s%s%s",
                                                                              stringFormat(left),
                                                                              "%s",
                                                                              stringFormat(right)),
                                                                left == null ? "0" : left,
                                                                symbol,
                                                                right == null ? "0" : right);
    return string;
  }

  public String toString(int depth)
  {
    return toString();
  }

  @Override
  public Class<?> type()
  {
    if (type != null)
    {
      return type;
    }

    assert left != null : "lhs is null: " + this + " for expr=" + expression;

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
      var innerTypeMap = typeMap.get(leftType);
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
      throw new CompilerException(String.format("Could not determine resultant type for this=%s where left=%s with left.type=%s and right=%s with right.type=%s in %s at position=%s where this.operation=%s",
                                                this,
                                                left,
                                                leftType,
                                                right,
                                                rightType,
                                                toString(),
                                                position,
                                                operation));

    }

    return type;
  }

  /**
   * symmetric type equality
   * 
   * @param a
   * @param b
   * @return true if ({@link #left},{@link #right}) in { (a,b) , (b,a) }
   */
  public boolean typesSymmetricallyEqual(Class<?> a, Class<?> b)
  {
    assert a != null : "a is null";
    assert b != null : "b is null";
    assert left != null : "lhs is null";
    assert right != null : "rhs is null";
    var leftType  = left.type();
    var rightType = right.type();
    assert leftType != null : "lhs type is  null where lhs is " + left + " and a=" + a + " b=" + b;
    assert rightType != null : "rhs type is null where rhs is " + right + " and a=" + a + " b=" + b;

    return (leftType.equals(a) && rightType.equals(b)) || (leftType.equals(b) && rightType.equals(a));
  }

  @Override
  public Node<D, C, F> simplify()
  {
    left  = left.simplify();
    right = right.simplify();
    return this;
  }
}
