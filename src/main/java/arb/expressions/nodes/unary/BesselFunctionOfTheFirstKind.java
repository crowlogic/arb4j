package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoSTack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.polynomials.quasi.QuasiPolynomial;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;

/**
 * Implements the {@link RealBesselFunctionOfTheFirstKind} by generating calls
 * directly to {@link arblib#arb_hypgeom_bessel_j(Real, Real, Real, int)}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselFunctionOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>>
                                         extends
                                         FunctionCall<D, R, F>
{

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(order, arg);

  }

  @Override
  public String toString()
  {
    return String.format("J(%s,%s)", order, arg);
  }

  Node<D, R, F>  order;

  public boolean scalar;

  public BesselFunctionOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("J",
          null,
          expression);

    order = expression.resolve();

    expression.require(',');

    arg = expression.resolve();

    expression.require(')');

    scalar = expression.hasScalarCodomain();

  }

  @Override
  public MethodVisitor generate(Class<?> resultType, MethodVisitor mv)
  {
    if (Expression.trace)
    {
      err.printf("J.generate(ν=%s, resultType=%s\n)\n", order, resultType);
    }
    var scalarType = scalarType(resultType);

    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    order.generate(scalarType, mv);

    if (!scalar)
    {
      generateQuasiPolynomial(mv, resultType);
    }
    else
    {
      generateScalar(mv, resultType, scalarType);
    }

    return mv;
  }

  public void generateQuasiPolynomial(MethodVisitor mv, Class<?> resultType)
  {
    if (!QuasiPolynomial.class.isAssignableFrom(resultType))
    {
      throw new CompilerException("The result type of " + expression
                    + " must be a QuasiPolynomial because the Bessel functions of the first kind at half-integer orders are "
                    + "not polynomials but rather rational functions or quasi-polynomials because they can not be represented by rational multiples of powers of the independent variable");
    }

    assert false : "TODO: generate Bessel function of the first kind of order=" + order;
    
    expression.allocateIntermediateVariable(mv, resultType);
  }

  public void generateScalar(MethodVisitor mv, Class<?> resultType, Class<?> scalarType)
  {
    arg.generate(resultType, mv);
    loadBitsParameterOntoSTack(mv);

    invokeStaticMethod(mv,
                       arblib.class,
                       "arb_hypgeom_bessel_j",
                       Void.class,
                       Real.class,
                       Real.class,
                       Real.class,
                       int.class);

    generatedType = scalarType;
  }
}