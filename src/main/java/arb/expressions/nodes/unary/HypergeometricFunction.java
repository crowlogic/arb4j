package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.ACONST_NULL;
import static org.objectweb.asm.Opcodes.GETSTATIC;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.NEW;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.ComplexQuasiPolynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.RealQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Vector;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexHypergeometricPolynomial;
import arb.functions.polynomials.RealHypergeometricPolynomial;
import arb.functions.polynomials.quasi.QuasiPolynomial;
import arb.functions.real.RealPolynomialNullaryFunction;

/**
 * The numerator α and the denominator β parameters cab ve specified via the
 * {@link Vector} syntax like F([1,n,1+n],[1],x) or symbolically like F(α,β,x)
 * where α and β are {@link Real}s or {@link RealPolynomial}s for instance where
 * if they are {@link RealPolynomial}s then the coeffecients of the polynomial
 * are regarded as the parameters of the numerator or denominator
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricFunction<D, R, F extends Function<? extends D, ? extends R>>
                                   extends
                                   FunctionCall<D, R, F>
{

  Node<D, R, F> α;

  Node<D, R, F> β;

  public HypergeometricFunction(Expression<D, R, F> expression)
  {
    super("pFq",
          null,
          expression);
    α = expression.resolve();
    expression.require(',');
    β = expression.resolve();
    expression.require(',', ';');
    arg = expression.resolve();
    expression.require(')');

//    boolean dependsOnInput = α.dependsOn(expression.independentVariable)
//                  || β.dependsOn(expression.independentVariable);
  }

  /**
   * FIXME: substitute the {@link Node} for arg via
   * {@link Node#spliceInto(Expression)} instead of turning it back into a string
   * and re-parsing it (not like these will be called in tight-loop but the less
   * string parsing the better)
   */
  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    if (Expression.trace)
    {
      err.printf("pFq.generate(resultType=%s\n)\n", resultType);
    }
    Class<?> scalarType        = Compiler.scalarType(resultType);

    boolean  isQuasiPolynomial = QuasiPolynomial.class.isAssignableFrom(resultType);
    if (Expression.trace)
    {
      err.printf("pFq.isQuasiPolynomial=%s\n", isQuasiPolynomial);
    }

    constructAndEvaluateHypergeometricPolynomial(resultType, mv, scalarType, isQuasiPolynomial);

    return mv;
  }

  public HypergeometricFunction<D, R, F> constructAndEvaluateHypergeometricPolynomial(Class<?> resultType,
                                                                                      MethodVisitor mv,
                                                                                      Class<?> scalarType,
                                                                                      boolean quasi)
  {
    constructHypergeometricPolynomial(mv, scalarType, quasi);
    evaluateHypergeometricPolynomial(resultType, mv);
    return this;
  }

  public HypergeometricFunction<D, R, F> evaluateHypergeometricPolynomial(Class<?> resultType, MethodVisitor mv)
  {
    mv.visitInsn(ACONST_NULL);
    mv.visitLdcInsn(1);
    loadBitsParameterOntoSTack(mv);
    checkClassCast(Compiler.loadResultParameter(mv), resultType);
    invokeMethod(mv,
                 INVOKEVIRTUAL,
                 RealPolynomial.class.equals(resultType) ? RealHypergeometricPolynomial.class : ComplexHypergeometricPolynomial.class,
                 "evaluate",
                 resultType,
                 Object.class,
                 int.class,
                 int.class,
                 resultType);
    return this;
  }

  public void loadStaticFieldOntoStack(MethodVisitor methodVisitor, String name, Class<?> fieldType)
  {
    methodVisitor.visitFieldInsn(GETSTATIC, Type.getInternalName(fieldType), name, fieldType.descriptorString());
  }

  public void constructHypergeometricPolynomial(MethodVisitor mv, Class<?> scalarType, boolean quasi)
  {
    boolean isReal                        = Real.class.equals(scalarType);
    var     hypergeometricPolynomialClass = isReal ? (quasi ? RealQuasiPolynomial.class : RealHypergeometricPolynomial.class) : (quasi ? ComplexQuasiPolynomial.class : ComplexHypergeometricPolynomial.class);
    mv.visitTypeInsn(NEW, Type.getInternalName(hypergeometricPolynomialClass));
    duplicateTopOfTheStack(mv);

    α.generate(scalarType, mv);
    β.generate(scalarType, mv);

    mv.visitLdcInsn(arg.toString());
    Class<?> nullaryFunctionClass = isReal ? (quasi ? RealQuasiPolynomial.class : RealPolynomialNullaryFunction.class) : (quasi ? ComplexQuasiPolynomial.class : ComplexPolynomialNullaryFunction.class);
    invokeStaticMethod(mv, nullaryFunctionClass, "parse", Expression.class, String.class);
    invokeConstructor(mv, hypergeometricPolynomialClass, scalarType, scalarType, Expression.class);
  }

}
