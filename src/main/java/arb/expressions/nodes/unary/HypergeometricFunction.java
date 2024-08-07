package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.ACONST_NULL;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.NEW;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.Complex;
import arb.RationalFunction;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Vector;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexPolynomialHypergeometricFunction;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;
import arb.functions.real.RationalHypergeometricFunction;
import arb.functions.real.RationalNullaryFunction;
import arb.functions.real.RealPolynomialNullaryFunction;

/**
 * The numerator α and the denominator β parameters can be specified via the
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

  @Override
  public String toString()
  {
    return String.format("pFq(%s,%s;%s)", α, β, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("${_%sF_%s}\\left(%s, %s ; %s\\right)",
                         this.α.dim(),
                         this.β.dim(),
                         this.α.typeset(),
                         this.β.typeset(),
                         arg.typeset());
  }

  Node<D, R, F>    α;

  Node<D, R, F>    β;

  private Class<?> hypergeometricClass;

  private boolean  dependsOnInput;

  public HypergeometricFunction(Expression<D, R, F> expression)
  {
    super("pFq",
          null,
          expression);
    α   = expression.resolve();
    β   = expression.require(',').resolve();
    arg = expression.require(',', ';').resolve();
    expression.require(')');

    dependsOnInput = α.dependsOn(expression.independentVariable) || β.dependsOn(expression.independentVariable);
  }

  /**
   * FIXME: substitute the {@link Node} for arg via
   * {@link Node#spliceInto(Expression)} instead of turning it back into a string
   * and re-parsing it (not like these will be called in tight-loop but the less
   * string parsing the better)
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      err.printf("pFq.generate(resultType=%s dependsOnInput=%s\n)\n", resultType, dependsOnInput);
    }
    Class<?> scalarType = Compiler.scalarType(resultType);

    boolean  isRational = RationalFunction.class.isAssignableFrom(resultType);
    if (Expression.trace)
    {
      err.printf("pFq.isRational=%s\n", isRational);
    }

    constructFiniteHypergeometricSeries(mv, scalarType, isRational);
    evaluateHypergeometricPolynomial(resultType, mv);
    return mv;
  }

  public void generateReferenceToThisVariableRepresentingTheIndeterminantOfAPolynomial(MethodVisitor mv,
                                                                                       Class<?> resultType)
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

  public HypergeometricFunction<D, R, F> evaluateHypergeometricPolynomial(Class<?> resultType, MethodVisitor mv)
  {
    mv.visitInsn(ACONST_NULL);
    mv.visitLdcInsn(1);
    loadBitsParameterOntoStack(mv, expression);
    generateReferenceToThisVariableRepresentingTheIndeterminantOfAPolynomial(mv, resultType);
    // checkClassCast(Compiler.loadResultParameter(mv), resultType);
    invokeMethod(mv,
                 INVOKEVIRTUAL,
                 hypergeometricClass,
                 "evaluate",
                 resultType,
                 Object.class,
                 int.class,
                 int.class,
                 resultType);
    return this;
  }

  public void constructFiniteHypergeometricSeries(MethodVisitor mv, Class<?> scalarType, boolean rational)
  {
    boolean isReal = Real.class.equals(scalarType);

    hypergeometricClass = rational ? RationalHypergeometricFunction.class
                                   : isReal ? RealPolynomialHypergeometricFunction.class
                                   : ComplexPolynomialHypergeometricFunction.class;

    mv.visitTypeInsn(NEW, Type.getInternalName(hypergeometricClass));
    duplicateTopOfTheStack(mv);

    α.generate(mv, scalarType);
    β.generate(mv, scalarType);

    mv.visitLdcInsn(arg.toString());
    Class<?> nullaryFunctionClass = rational ? RationalNullaryFunction.class
                                             : isReal ? RealPolynomialNullaryFunction.class
                                             : ComplexPolynomialNullaryFunction.class;
    invokeStaticMethod(mv, nullaryFunctionClass, "parse", Expression.class, String.class);
    invokeConstructor(mv, hypergeometricClass, scalarType, scalarType, Expression.class);
  }

}
