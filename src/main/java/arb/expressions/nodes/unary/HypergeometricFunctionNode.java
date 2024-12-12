package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.ACONST_NULL;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VectorNode;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexPolynomialHypergeometricFunction;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.rational.ComplexRationalHypergeometricFunction;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.functions.rational.RationalHypergeometricFunction;
import arb.functions.rational.RationalNullaryFunction;

/**
 * https://github.com/crowlogic/arb4j/issues/527
 * 
 * Refactor the current hypergeometric function implementation to use function
 * references for arguments. Current Approach
 * 
 * Perform substitution on the hypergeometric function argument. Traverse and
 * replace expression references. Rename variables as necessary.
 * 
 * Proposed Refactor
 * 
 * Use a function reference in the hypergeometric function definition. Compile
 * the function statically. Pass function references for instances, avoiding
 * substitutions and recompilations.
 * 
 * This change aims to improve performance and maintainability.
 * 
 * The numerator α and the denominator β parameters can be specified via the
 * {@link VectorNode} syntax like F([1,n,1+n],[1],x) or symbolically like
 * F(α,β,x) where α and β are {@link Real}s or {@link RealPolynomial}s for
 * instance where if they are {@link RealPolynomial}s then the coeffecients of
 * the polynomial are regarded as the parameters of the numerator or denominator
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                       FunctionNode<D, R, F>
{

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    assert newExpression != null : "newExpression is null";
    assert false : "TODO: splice "
                   + this
                   + " into "
                   + newExpression.getClass()
                   + "(hashcode="
                   + System.identityHashCode(newExpression)
                   + ")";

    return null;
  }

  @Override
  public String toString()
  {
    return String.format("pFq(%s,%s;%s)", α, β, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("{_%sF_%s}\\left(%s, %s ; %s\\right)",
                         α.dim(),
                         β.dim(),
                         α.typeset(),
                         β.typeset(),
                         arg.typeset());
  }

  public final Node<D, R, F> α;

  public final Node<D, R, F> β;

  public final Class<?>      hypergeometricFunctionClass;

  public final boolean       dependsOnInput;

  public final String        hypergeometricFunctionFieldName;

  public final String        elementFieldName;

  public final boolean       isRational;

  public final boolean       isReal;

  public final boolean       isComplex;

  public final Class<?>      scalarType;

  public final Class<?>      nullaryFunctionClass;

  public final boolean       isNullaryFunctionOrHasScalarCodomain;

  public boolean             hasScalarCodomain;

  private Class<?>           elementType;

  private Class<? extends R> coDomaintype;

  public HypergeometricFunctionNode(Expression<D, R, F> expression)
  {
    super("pFq",
          null,
          expression);
    α   = expression.resolve();
    β   = expression.require(',').resolve();
    arg = expression.require(',', ';').resolve();
    expression.require(')');
    coDomaintype                         = expression.coDomainType;
    scalarType                           = Compiler.scalarType(coDomaintype);

    isRational                           = RationalFunction.class.isAssignableFrom(coDomaintype)
                  || ComplexRationalFunction.class.isAssignableFrom(coDomaintype);

    isReal                               =
           Real.class.equals(scalarType) || Fraction.class.equals(scalarType) || Integer.class.equals(scalarType);

    isComplex                            = Complex.class.equals(scalarType) || ComplexFraction.class.equals(scalarType);

    hasScalarCodomain                    = expression.hasScalarCodomain();

    isNullaryFunctionOrHasScalarCodomain = expression.isNullaryFunction() || hasScalarCodomain;

    var rationalClass       = isReal ? RationalHypergeometricFunction.class
                                     : isComplex ? ComplexRationalHypergeometricFunction.class : null;

    var realPolynomialClass = RealPolynomialHypergeometricFunction.class;

    var polynomialClass     =
                        isReal ? realPolynomialClass : isComplex ? ComplexPolynomialHypergeometricFunction.class : null;

    hypergeometricFunctionClass = isRational ? rationalClass : polynomialClass;

    var rationalNullaryClass   = isReal ? RationalNullaryFunction.class
                                        : isComplex ? ComplexRationalNullaryFunction.class : null;

    var polynomialNullaryClass = isReal ? RealPolynomialNullaryFunction.class
                                        : isComplex ? ComplexPolynomialNullaryFunction.class : null;

    nullaryFunctionClass            = isRational ? rationalNullaryClass : polynomialNullaryClass;

    hypergeometricFunctionFieldName = expression.newIntermediateVariable("hyp", hypergeometricFunctionClass, true);

    dependsOnInput                  = α.dependsOn(expression.independentVariable)
                  || α.dependsOn(expression.indeterminateVariable) || β.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.indeterminateVariable);

    if (isNullaryFunctionOrHasScalarCodomain)
    {
      elementType = coDomaintype;
      if (nullaryFunctionClass.equals(RationalNullaryFunction.class))
      {
        elementType = RationalFunction.class;
      }
      if (nullaryFunctionClass.equals(ComplexRationalNullaryFunction.class))
      {
        elementType = ComplexRationalFunction.class;
      }
      else if (nullaryFunctionClass.equals(RealPolynomialNullaryFunction.class))
      {
        elementType = RealPolynomial.class;
      }
      else if (nullaryFunctionClass.equals(ComplexPolynomialNullaryFunction.class))
      {
        elementType = ComplexPolynomial.class;
      }
      elementFieldName = expression.newIntermediateVariable("element", elementType);
      if (Expression.trace)
      {
        System.err.format("elementFieldName=%s of type %s", elementFieldName, elementType);

      }
    }
    else
    {
      elementFieldName = null;
    }

    if (!dependsOnInput)
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }

  }

  public void generateHypergeometricFunctionInitializer(MethodVisitor mv)
  {
    expression.insideInitializer = true;
    loadHypergeometricFunctionOntoStack(mv);
    initializeHypergeometricFunction(mv);
    if (isNullaryFunctionOrHasScalarCodomain)
    {
      loadHypergeometricFunctionOntoStack(mv);
      mv.visitInsn(ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);

      invokeVirtualMethod(mv,
                          hypergeometricFunctionClass,
                          "evaluate",
                          Object.class,
                          Object.class,
                          int.class,
                          int.class,
                          Object.class);

    }
  }

  /**
   * FIXME: use a function reference instead of variable substitution and compile
   * the expression in the static intializer
   * 
   * 
   * HOW: See {@link LommelPolynomialNode} for an example
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    expression.insideInitializer = false;

    if (Expression.trace)
    {
      err.printf("pFq.generate(resultType=%s dependsOnInput=%s)\n", resultType, dependsOnInput);
    }

    boolean loadedHypergeometricFunction = false;

    if (dependsOnInput)
    {
      loadedHypergeometricFunction = true;
      loadHypergeometricFunctionOntoStack(mv);
      initializeHypergeometricFunction(mv);
    }

    if (!isNullaryFunctionOrHasScalarCodomain)
    {
      if (!loadedHypergeometricFunction)
      {
        loadHypergeometricFunctionOntoStack(mv);
      }

      mv.visitInsn(ACONST_NULL);
      mv.visitLdcInsn(1);
      loadBitsOntoStack(mv);
      loadOutputOntoStack(mv, resultType);
      invokeVirtualMethod(mv,
                          hypergeometricFunctionClass,
                          "evaluate",
                          Object.class,
                          Object.class,
                          int.class,
                          int.class,
                          Object.class);
      checkClassCast(mv, resultType);

    }
    else
    {
      if (resultType.equals(elementType))
      {
        loadOutputOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);

        Compiler.invokeSetMethod(mv, resultType, resultType);
      }
      else
      {
        assert resultType.equals(coDomaintype) : String.format("TODO: handle resultType = %s != coDomainType = %s",
                                                               resultType,
                                                               coDomaintype);
        loadOutputOntoStack(mv, resultType);
        expression.loadThisFieldOntoStack(mv, elementFieldName, elementType);
        checkClassCast(mv, elementType);
        loadInputParameter(mv);
        checkClassCast(mv, expression.domainType);
        loadOrderParameter(mv);
        loadBitsOntoStack(mv);
        loadOutputOntoStack(mv, resultType);
        invokeVirtualMethod(mv,
                            elementType,
                            "evaluate",
                            resultType,
                            expression.domainType,
                            int.class,
                            int.class,
                            coDomaintype);
        checkClassCast(mv, resultType);

      }

    }
    return mv;
  }

  protected MethodVisitor initializeHypergeometricFunction(MethodVisitor mv)
  {
    if (expression.trace)
    {
      System.err.format("initializeHypergeometricFunction(alpha=%s, beta=%s, arg=%s)\n", α, β, arg);
    }
    α.generate(mv, scalarType);
    // assert scalarType.equals(α.getGeneratedType());
    β.generate(mv, scalarType);
    // assert scalarType.equals(β.getGeneratedType());
    mv.visitLdcInsn(arg.toString());
    invokeArgumentParsingMethod(mv);
    invokeHypergeometricFunctionInitializationMethod(mv);
    return mv;
  }

  protected void invokeArgumentParsingMethod(MethodVisitor mv)
  {
    invokeStaticMethod(mv, nullaryFunctionClass, "parse", Expression.class, String.class);
  }

  protected void invokeHypergeometricFunctionInitializationMethod(MethodVisitor mv)
  {
    invokeVirtualMethod(mv,
                        hypergeometricFunctionClass,
                        "init",
                        hypergeometricFunctionClass,
                        scalarType,
                        scalarType,
                        Expression.class);
  }

  protected void loadHypergeometricFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, hypergeometricFunctionFieldName, hypergeometricFunctionClass);
  }

  protected void loadOutputOntoStack(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
    {

      checkClassCast(loadResultParameter(mv), resultType);

    }
    else
    {

      expression.allocateIntermediateVariable(mv, resultType);
    }
  }

  @Override
  public String getIntermediateValueFieldName()
  {
    return hypergeometricFunctionFieldName;
  }

}
