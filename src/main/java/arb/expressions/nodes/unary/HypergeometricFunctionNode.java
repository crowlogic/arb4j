package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.ACONST_NULL;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.MethodVisitor;

import arb.*;
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

  Node<D, R, F>        α;

  Node<D, R, F>        β;

  private Class<?>     hypergeometricFunctionClass;

  public boolean       dependsOnInput;

  private String       hypergeometricFunctionFieldName;

  public final boolean isRational;

  public final boolean isReal;

  public final boolean isComplex;

  private Class<?>     scalarType;

  public boolean       isComplexRational;

  public Class<?>      nullaryFunctionClass;

  public HypergeometricFunctionNode(Expression<D, R, F> expression)
  {
    super("pFq",
          null,
          expression);
    α   = expression.resolve();
    β   = expression.require(',').resolve();
    arg = expression.require(',', ';').resolve();
    expression.require(')');
    scalarType = Compiler.scalarType(expression.coDomainType);
    isRational = RationalFunction.class.isAssignableFrom(expression.coDomainType)
                  || ComplexRationalFunction.class.isAssignableFrom(expression.coDomainType);

    if (Expression.trace)
    {
      err.printf("pFq.isRational=%s\n", isRational);
    }

    isReal                      =
           Real.class.equals(scalarType) || Fraction.class.equals(scalarType);
    isComplex                   =
              Complex.class.equals(scalarType) || ComplexFraction.class.equals(scalarType);

    hypergeometricFunctionClass =
                                isRational ? (isReal ? RationalHypergeometricFunction.class
                                                     : isComplex ? ComplexRationalHypergeometricFunction.class
                                                     : null)
                                           : isReal ? RealPolynomialHypergeometricFunction.class
                                           : isComplex ? ComplexPolynomialHypergeometricFunction.class
                                           : null;
    assert hypergeometricFunctionClass != null : "scalarType=" + scalarType;

    nullaryFunctionClass            = isRational
                                                 ? (isReal ? RationalNullaryFunction.class
                                                           : ComplexRationalNullaryFunction.class)
                                                 : isReal ? RealPolynomialNullaryFunction.class
                                                 : ComplexPolynomialNullaryFunction.class;

    hypergeometricFunctionFieldName =
                                    expression.newIntermediateVariable("hyp",
                                                                       hypergeometricFunctionClass,
                                                                       true);

    dependsOnInput                  = α.dependsOn(expression.independentVariable)
                  || β.dependsOn(expression.independentVariable);
  }

  /**
   * FIXME: substitute the {@link Node} for arg via
   * {@link Node#spliceInto(Expression)} instead of turning it back into a string
   * and re-parsing it (not like these will be called in tight-loop but the less
   * string parsing the better)
   * 
   * HOW: See {@link LommelPolynomialNode} for an example
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      err.printf("pFq.generate(resultType=%s dependsOnInput=%s\n)\n", resultType, dependsOnInput);
    }

    expression.loadThisFieldOntoStack(mv,
                                      hypergeometricFunctionFieldName,
                                      hypergeometricFunctionClass);

    α.generate(mv, scalarType);
    β.generate(mv, scalarType);

    mv.visitLdcInsn(arg.toString());

    invokeStaticMethod(mv, nullaryFunctionClass, "parse", Expression.class, String.class);
    invokeVirtualMethod(mv,
                        hypergeometricFunctionClass,
                        "init",
                        hypergeometricFunctionClass,
                        scalarType,
                        scalarType,
                        Expression.class);
    mv.visitInsn(ACONST_NULL);
    mv.visitLdcInsn(1);
    loadBitsOntoStack(mv);
    loadOutputOntoStack(mv, resultType);
    invokeMethod(mv,
                 INVOKEVIRTUAL,
                 hypergeometricFunctionClass,
                 "evaluate",
                 resultType,
                 Object.class,
                 int.class,
                 int.class,
                 resultType);
    return mv;
  }

  public void loadOutputOntoStack(MethodVisitor mv, Class<?> resultType)
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

  public void loadBitsOntoStack(MethodVisitor mv)
  {
    if (expression.insideInitializer)
    {
      mv.visitLdcInsn(128);
    }
    else
    {
      loadBitsParameterOntoStack(mv);
    }
  }

}
