package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoSTack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * To express the spherical Bessel functions in terms of Lommel polynomials,
 * follow these steps:
 * 
 * <pre>
 * Let jₙ (x) is the spherical Bessel function of the first kind,
 * 
 * jₙ (z) = √(π/(2z)) Jₙ₊½ (x) = 1/√z (sin (z) Rₙ,½ (z) - cos (z) Rₙ₋₁,³/₂ (z))
 * 
 * where Rₙ,ᵥ (z) are the (misnamed) Lommel polynomials
 * 
 * Rₙ,ᵥ (z) = Γ(n + v)/Γ(v) (2/z)ⁿ ₂F₃ ([-n/2, 1/2 - n/2] ; [v, -n, 1 - v - n] ; -z²)
 * 
 * where ₂F₃ is a generalized hypergeometric function. The "Lommel polynomials"
 * are actually rational functions of z, not polynomial; but rather "polynomial
 * in 1/z".
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>>
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
    return String.format("j(%s,%s)", order, arg);
  }

  Node<D, R, F>  order;

  public boolean scalar;

  public SphericalBesselFunctionOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("j",
          null,
          expression);
    order  = expression.resolve();
    arg    = expression.require(',').resolve();
    scalar = expression.require(')').hasScalarCodomain();
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

    assert false : "TODO: generate spherical Bessel function *using Lommel Polynomials* of the first kind of order="
                  + order + " for " + this.expression.expression;

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

  @Override
  public String typeset()
  {
    return format("j_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }
}