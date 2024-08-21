package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

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
 * jₙ (z) = √(π/(2z)) Jₙ₊₁⸝₂ (x) = (sin(z) Rₙ,₁⸝₂(z) - cos(z) Rₙ₋₁,₃⸝₂(z))/z
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
public class SphericalBesselFunctionNodeOfTheFirstKind<D,
              R,
              F extends Function<? extends D, ? extends R>> extends
                                                      FunctionCallNode<D, R, F>
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

  public SphericalBesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("j",
          null,
          expression);
    order  = expression.resolve();
    arg    = expression.require(',').resolve();
    scalar = expression.require(')').hasScalarCodomain();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      err.printf("j.generate(ν=%s, resultType=%s\n)\n", order, resultType);
    }
    var scalarType = scalarType(resultType);

    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    order.generate(mv, scalarType);
    // ³⁄₂
    assert false : "TODO: wield the SphericalBesselFunctionSequence class the same way the HypergeometricFunctionNode uses the HypergeometricFunction";

    return mv;
  }

  @Override
  public String typeset()
  {
    return format("j_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }
}