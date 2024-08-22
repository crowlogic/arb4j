package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.invokeVirtualMethod;
import static arb.expressions.Compiler.loadResultParameter;
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
import arb.functions.sequences.LommelPolynomialSequence;

/**
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
                                       FunctionCallNode<D, R, F>
{

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

  public final boolean       isRational;

  public final boolean       isReal;

  public final boolean       isComplex;

  public final Class<?>      scalarType;

  public final Class<?>      nullaryFunctionClass;

  public HypergeometricFunctionNode(Expression<D, R, F> expression)
  {
    super("pFq",
          null,
          expression);
    α   = expression.resolve();
    β   = expression.require(',').resolve();
    arg = expression.require(',', ';').resolve();
    expression.require(')');
    scalarType                  = Compiler.scalarType(expression.coDomainType);
    isRational                  = RationalFunction.class.isAssignableFrom(expression.coDomainType)
                  || ComplexRationalFunction.class.isAssignableFrom(expression.coDomainType);

    isReal                      = Real.class.equals(scalarType) || Fraction.class.equals(scalarType)
                  || Integer.class.equals(scalarType);
    isComplex                   =
              Complex.class.equals(scalarType) || ComplexFraction.class.equals(scalarType);

    hypergeometricFunctionClass =
                                isRational ? (isReal ? RationalHypergeometricFunction.class
                                                     : isComplex ? ComplexRationalHypergeometricFunction.class
                                                     : null)
                                           : isReal ? RealPolynomialHypergeometricFunction.class
                                           : isComplex ? ComplexPolynomialHypergeometricFunction.class
                                           : null;
    assert hypergeometricFunctionClass != null : "hypergeometricFunctionClass="
                                                 + hypergeometricFunctionClass;

    nullaryFunctionClass = isRational
                                      ? (isReal ? RationalNullaryFunction.class
                                                : isComplex ? ComplexRationalNullaryFunction.class
                                                : null)
                                      : isReal ? RealPolynomialNullaryFunction.class
                                      : isComplex ? ComplexPolynomialNullaryFunction.class : null;
    assert nullaryFunctionClass != null : "nullaryFunctionClass=" + nullaryFunctionClass;

    hypergeometricFunctionFieldName =
                                    expression.newIntermediateVariable("hyp",
                                                                       hypergeometricFunctionClass,
                                                                       true);

    dependsOnInput                  = α.dependsOn(expression.independentVariable)
                  || α.dependsOn(expression.indeterminateVariable)
                  || β.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.indeterminateVariable);
    
    if ( !dependsOnInput )
    {
      expression.registerInitializer(this::generateHypergeometricFunctionInitializer);
    }

  }

  public void generateHypergeometricFunctionInitializer(MethodVisitor mv)
  {
    expression.insideInitializer = true;
    loadHypergeometricFunctionOntoStack(mv);
    initializeHypergeometricFunction(mv);
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
      err.printf("pFq.generate(resultType=%s dependsOnInput=%s\n)\n", resultType, dependsOnInput);
    }

    loadHypergeometricFunctionOntoStack(mv);

    if (dependsOnInput)
    {
      initializeHypergeometricFunction(mv);
    }

    invokeHypergeometricFunctionEvaluationMethod(mv, resultType);
    return mv;
  }

  protected MethodVisitor initializeHypergeometricFunction(MethodVisitor mv)
  {
    α.generate(mv, scalarType);
    β.generate(mv, scalarType);
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

  protected void invokeHypergeometricFunctionEvaluationMethod(MethodVisitor mv, Class<?> resultType)
  {
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

  protected void loadHypergeometricFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv,
                                      hypergeometricFunctionFieldName,
                                      hypergeometricFunctionClass);
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

}
