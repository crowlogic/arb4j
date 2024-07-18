package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.ACONST_NULL;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.NEW;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.ComplexQuasiPolynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.RealRationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Vector;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexHypergeometricPolynomial;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;
import arb.functions.real.RealPolynomialNullaryFunction;
import arb.functions.real.RealRationalHypergeometricFunction;
import arb.functions.real.RealRationalNullaryFunction;

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

  @Override
  public String toString()
  {
    return String.format("pFq(%s,%s;%s)", α, β, arg);
  }

  @Override
  public String typeset()
  {
    return String.format("${_%sF_%s}\\left(%s, %s ; %s\\right)",
                         this.α.elements.size(),
                         this.β.elements.size(),
                         this.α.typeset(),
                         this.β.typeset(),
                         arg.typeset());
  }

  Vector<D, R, F>  α;

  Vector<D, R, F>  β;

  private Class<?> hypergeometricClass;

  public HypergeometricFunction(Expression<D, R, F> expression)
  {
    super("pFq",
          null,
          expression);
    α = (Vector<D, R, F>) expression.resolve();
    expression.require(',');
    β = (Vector<D, R, F>) expression.resolve();
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
    Class<?> scalarType = Compiler.scalarType(resultType);

    boolean  isRational = RealRationalFunction.class.isAssignableFrom(resultType);
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
    loadBitsParameterOntoSTack(mv);
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
    if (!isReal && rational)
    {
      assert false : "todo: implement ComplexRationalFunction, scalarType=" + scalarType;
    }
    hypergeometricClass = isReal ? (rational ? RealRationalHypergeometricFunction.class : RealPolynomialHypergeometricFunction.class) : (rational ? Object.class : ComplexHypergeometricPolynomial.class);
    mv.visitTypeInsn(NEW, Type.getInternalName(hypergeometricClass));
    duplicateTopOfTheStack(mv);

    α.generate(scalarType, mv);
    β.generate(scalarType, mv);

    mv.visitLdcInsn(arg.toString());
    Class<?> nullaryFunctionClass = isReal ? (rational ? RealRationalNullaryFunction.class : RealPolynomialNullaryFunction.class) : (rational ? ComplexQuasiPolynomial.class : ComplexPolynomialNullaryFunction.class);
    invokeStaticMethod(mv, nullaryFunctionClass, "parse", Expression.class, String.class);
    invokeConstructor(mv, hypergeometricClass, scalarType, scalarType, Expression.class);
  }

}
