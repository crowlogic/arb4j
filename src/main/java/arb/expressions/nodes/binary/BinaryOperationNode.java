package arb.expressions.nodes.binary;

import static arb.expressions.Compiler.invokeBinaryOperationMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.utensils.Utensils.indent;

import java.io.File;
import java.lang.reflect.Method;
import java.util.*;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.*;
import arb.functions.real.RealFunction;

/**
 * 
 * @param <D> domain
 * @param <R> codomain
 * @param <F> {@link Function}
 * 
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("unused")
public abstract class BinaryOperationNode<D, R, F extends Function<? extends D, ? extends R>>
                                         extends
                                         Node<D, R, F>
{

  @Override
  public boolean isConstant()
  {
    return (left == null || left.isConstant()) && (right == null || right.isConstant());
  }

  @Override
  public abstract Node<D, R, F> differentiate(VariableNode<D, R, F> variable);

  @Override
  public abstract Logger getLogger();

  @Override
  public abstract Node<D, R, F> integral(VariableNode<D, R, F> variable);

  @Override
  public abstract <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression);

  @Override
  public abstract String typeset();

  public static boolean                                          traceSimplify   =
                                                                               Boolean.valueOf(System.getProperty("arb4j.traceBinaryOperationSimplification",
                                                                                                                  "false"));

  public static int                                              simplifyDepth   = 0;

  public static final int                                        initializerBits = 128;

  public static final HashMap<Class<?>, Map<Class<?>, Class<?>>> typeMap         = new HashMap<>();

  static
  {
    assert Integer.class.equals(arb.Integer.class) : "import statement for arb.Integer is missing";
    initializeTypeMaps();
  }

  static String basicPad(Object label)
  {
    return String.format("%-60s ", label);
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
    mapTypes(AlgebraicNumber.class, ComplexRationalFunction.class, ComplexFunction.class);
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
    mapTypes(RealFunction.class, Complex.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Complex.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Real.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Integer.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, Fraction.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, RealFunction.class, ComplexFunction.class);
    mapTypes(ComplexFunction.class, AlgebraicNumber.class, ComplexFunction.class);
    mapTypes(RealToComplexFunction.class, Complex.class, RealToComplexFunction.class);
    mapTypes(RealToComplexFunction.class, Real.class, RealToComplexFunction.class);
    mapTypes(RealToComplexFunction.class, Integer.class, RealToComplexFunction.class);
    mapTypes(RealToComplexFunction.class, Fraction.class, RealToComplexFunction.class);
    mapTypes(RealToComplexFunction.class, RealFunction.class, RealToComplexFunction.class);
    mapTypes(RealToComplexFunction.class, AlgebraicNumber.class, RealToComplexFunction.class);
    mapTypes(ComplexSequence.class, Integer.class, ComplexSequence.class);
    mapTypes(ComplexSequence.class, Real.class, ComplexSequence.class);
    mapTypes(ComplexSequence.class, Complex.class, ComplexSequence.class);
    mapTypes(RealSequence.class, Integer.class, RealSequence.class);
    mapTypes(RealSequence.class, Real.class, RealSequence.class);
    mapTypes(RealSequence.class, Complex.class, ComplexSequence.class);
    mapTypes(ComplexSequence.class, ComplexFunction.class, ComplexFunctionSequence.class);
    mapTypes(ComplexFunctionSequence.class, Real.class, ComplexFunctionSequence.class);
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

  public static void mapTypes(Class<?> leftType, Class<?> rightType, Class<?> resultantType)
  {
    typeMap.computeIfAbsent(leftType, type -> new HashMap<>()).put(rightType, resultantType);
    typeMap.computeIfAbsent(rightType, type -> new HashMap<>()).put(leftType, resultantType);
  }

  static String pad(Object label)
  {
    return String.format("%-11s= ", label);
  }

  public Node<D, R, F> left;

  public Logger        log = LoggerFactory.getLogger(getClass());

  public String        operation;

  public Node<D, R, F> right;

  private String       symbol;

  Class<?>             type;

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

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return (left != null && left.dependsOn(variable))
                  || (right != null && right.dependsOn(variable));
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
                  || !Objects.equals(type(), other.type()))
    {
      return false;
    }

    if (isCommutative())
    {
      return (Objects.equals(left, other.left) && Objects.equals(right, other.right))
                    || (Objects.equals(left, other.right) && Objects.equals(right, other.left));
    }
    return Objects.equals(left, other.left) && Objects.equals(right, other.right);
  }

  /**
   * Compile-time evaluation of this binary operation node. Evaluates both
   * operands as Fraction, then reflectively invokes the method named by
   * {@link #operation} on Fraction, passing the right operand and the
   * pre-allocated result. No switch statement — the operation string is the
   * method name.
   */
  @Override
  @SuppressWarnings("unchecked")
  public <T> T evaluate(Class<T> resultType, T result)
  {
    if (resultType.equals(Fraction.class))
    {
      Fraction res = (Fraction) result;
      try (Fraction l = new Fraction();
           Fraction r = new Fraction())
      {
        left.evaluate(Fraction.class, l);
        right.evaluate(Fraction.class, r);
        Method method = resolveFractionMethod(operation, l, r, res);
        method.invoke(l, buildArgs(method, r, res));
        return (T) res;
      }
      catch (Exception e)
      {
        throw new CompilerException(String.format("constant folding failed for %s: %s",
                                                  this,
                                                  e.getMessage()),
                                    e);
      }
    }

    throw new UnsupportedOperationException("BinaryOperationNode.evaluate not implemented for "
                                            + resultType.getName()
                                            + " on "
                                            + this);
  }

  /**
   * Resolves the appropriate Fraction method for the given operation. Tries
   * (Fraction, Fraction) first, then (Fraction, int, Fraction) for methods that
   * require a precision parameter.
   */
  private static Method resolveFractionMethod(String operation,
                                              Fraction l,
                                              Fraction r,
                                              Fraction res)
                                              throws NoSuchMethodException
  {
    try
    {
      return Fraction.class.getMethod(operation, Fraction.class, Fraction.class);
    }
    catch (NoSuchMethodException e)
    {
      try
      {
        return Fraction.class.getMethod(operation, Fraction.class, int.class, Fraction.class);
      }
      catch (NoSuchMethodException e2)
      {
        try
        {
          return Fraction.class.getMethod(operation,
                                          Integer.class,
                                          int.class,
                                          Fraction.class);
        }
        catch (NoSuchMethodException e3)
        {
          throw new NoSuchMethodException("no Fraction."
                                          + operation
                                          + " method found with compatible signature");
        }
      }
    }
  }

  /**
   * Builds the argument array for the reflective method invocation based on the
   * resolved method's parameter types.
   */
  private static Object[] buildArgs(Method method, Fraction r, Fraction res)
  {
    Class<?>[] paramTypes = method.getParameterTypes();
    if (paramTypes.length == 2 && paramTypes[0] == Fraction.class
                  && paramTypes[1] == Fraction.class)
    {
      return new Object[]
      { r, res };
    }
    if (paramTypes.length == 3 && paramTypes[0] == Fraction.class && paramTypes[1] == int.class
                  && paramTypes[2] == Fraction.class)
    {
      return new Object[]
      { r, 0, res };
    }
    if (paramTypes.length == 3 && paramTypes[0] == Integer.class && paramTypes[1] == int.class
                  && paramTypes[2] == Fraction.class)
    {
      return new Object[]
      { r.getNumerator(), 0, res };
    }
    throw new IllegalArgumentException("unexpected parameter signature for Fraction."
                                       + method.getName());
  }

  /**
   * Attempts to fold this node into a single LiteralConstantNode if both
   * operands are literal constants. Uses {@link #evaluate(Class, Object)} to
   * perform the arithmetic polymorphically — no per-subclass overrides needed.
   * 
   * @return a folded LiteralConstantNode, or null if folding is not possible
   */
  protected Node<D, R, F> foldConstants()
  {
    if (!(left instanceof LiteralConstantNode) || !(right instanceof LiteralConstantNode))
    {
      return null;
    }

    try (Fraction result = new Fraction())
    {
      evaluate(Fraction.class, result);
      return new LiteralConstantNode<>(expression, result);
    }
    catch (Exception e)
    {
      return null;
    }
  }

  public String formatGenerationParameters(Class<?> resultType)
  {
    String IND = indent(2);

    return String.format("\n\ngenerate(\n"
                         + "%s%s%s    (%s),\n"
                         + "%s%s%s    (%s %s),\n"
                         + "%s%s%s    (%s %s),\n"
                         + "%s%s%s)\n",
                         IND,
                         pad("this"),
                         basicPad(this),
                         resultType.getSimpleName(),
                         IND,
                         pad("left"),
                         basicPad(left),
                         left.type().getSimpleName(),
                         left.getClass().getSimpleName(),
                         IND,
                         pad("right"),
                         basicPad(right),
                         right.type().getSimpleName(),
                         right.getClass().getSimpleName(),
                         IND,
                         pad("fieldName"),
                         fieldName);
  }

  public String formatSimplificationParameters()
  {
    return String.format("%s.simplify( this=%s )\n", getClass().getSimpleName(), this);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert left != null : "lhs is null";
    assert right != null : "rhs is null";

    generatedType = resultType;

    if (log.isDebugEnabled() && Expression.traceNodes)
    {
      log.debug("#{}: generate( this={}, left={}. right={} ) this.type={} resultType={}",
                System.identityHashCode(expression),
                this,
                left,
                right,
                this.type(),
                resultType);
      expression.logVariables();
    }

    if (!Compiler.canBeAssignedTo(type(), resultType))
    {
      File   file = expression.saveToFile();
      String msg  =
                 String.format("%s of type %s whose expression is '%s' cannot be represented as a %s. The expression was saved to %s\ndomain=%s\ncoDomain=%s\nfunctionClass=%s\nfunctionName=%s\nindterminateVars=%s\nindepenentVariable=%s\nexpression=%s\n",
                               getClass(),
                               type(),
                               this,
                               resultType,
                               file,
                               expression.domainType,
                               expression.coDomainType,
                               expression.functionClass,
                               expression.functionName,
                               expression.getIndeterminateVariables(),
                               expression.independentVariable,
                               expression);
      throwTypePromotionError(left.type(), right.type(), msg);

    }

    left.generate(mv, left.type());
    right.generate(mv, right.type());

    if (expression.insideInitializer)
    {
      mv.visitLdcInsn(initializerBits);
    }
    else
    {
      loadBitsParameterOntoStack(mv);
    }
    loadOutput(mv, resultType);

    if (Expression.traceNodes)
    {
      log.debug(formatGenerationParameters(resultType));
    }

    var leftType = left.getGeneratedType();
    leftType = leftType != null ? leftType : left.type();
    var rightType = right.type();
    if (Object.class.equals(leftType))
    {
      leftType = expression.coDomainType;
    }

    invokeBinaryOperationMethod(mv, operation, leftType, rightType, resultType);

    return mv;

  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    var b = new ArrayList<Node<D, R, F>>();
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

  @Override
  public int hashCode()
  {
    int hash = 0;
    if (isCommutative())
    {
      int operationHash = Objects.hash(operation, symbol, type());
      int operandsHash  = left.hashCode() + right.hashCode();
      hash = operationHash + operandsHash;
    }
    else
    {
      hash = Objects.hash(left, operation, right, symbol, type());
    }

    return hash;
  }

  public abstract boolean isCommutative();

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

  protected String depthIndent()
  {
    return "  ".repeat(simplifyDepth);
  }

  @Override
  public Node<D, R, F> simplify()
  {
    simplifyDepth++;
    if (traceSimplify)
    {
      System.err.printf("%s[%d] ENTER %s.simplify() this=%s left=%s right=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        getClass().getSimpleName(),
                        System.identityHashCode(this),
                        left,
                        right);
    }

    if (left != null)
    {
      var oldLeft = left;
      left = left.simplify();
      if (traceSimplify && left != oldLeft)
      {
        System.err.printf("%s[%d]   left changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          oldLeft,
                          left);
      }
    }
    if (right != null)
    {
      var oldRight = right;
      right = right.simplify();
      if (traceSimplify && right != oldRight)
      {
        System.err.printf("%s[%d]   right changed: %s -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          oldRight,
                          right);
      }
    }

    var folded = foldConstants();
    if (folded != null)
    {
      if (traceSimplify)
      {
        System.err.printf("%s[%d]   constant fold -> %s%n",
                          depthIndent(),
                          simplifyDepth,
                          folded);
      }
      simplifyDepth--;
      return folded;
    }

    if (traceSimplify)
    {
      System.err.printf("%s[%d] EXIT %s.simplify() returning this=%s%n",
                        depthIndent(),
                        simplifyDepth,
                        getClass().getSimpleName(),
                        this);
    }
    simplifyDepth--;

    return this;
  }

  public String stringFormat(Node<?, ?, ?> side)
  {
    return side != null && side.isLeaf() ? "%s" : "(%s)";
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String name, Node<E, S, G> transformation)
  {
    left  = left.substitute(name, transformation);
    right = right.substitute(name, transformation);
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
      throwTypePromotionError(leftType, rightType, "no type mapping");

    }

    return type;
  }

  public void throwTypePromotionError(Class<?> leftType, Class<?> rightType, String msg)
  {
    throw new CompilerException(String.format("Could not determine resultant type for this=%s where left=%s is a %s-valued %s and right=%s with is a %s-valued %s in %s at position=%s where this.operation=%s in %s: %s",
                                              this,
                                              left,
                                              leftType,
                                              left.getClass().getSimpleName(),
                                              right,
                                              rightType,
                                              right.getClass().getSimpleName(),
                                              toString(),
                                              position,
                                              operation,
                                              expression.toStringExtended(),
                                              msg));
  }

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

    return (leftType.equals(a) && rightType.equals(b))
                  || (leftType.equals(b) && rightType.equals(a));
  }

  @Override
  public boolean isPolynomialLike(VariableNode<D, R, F> variable)
  {
    return left.isPolynomialLike(variable) && right.isPolynomialLike(variable);
  }
}
