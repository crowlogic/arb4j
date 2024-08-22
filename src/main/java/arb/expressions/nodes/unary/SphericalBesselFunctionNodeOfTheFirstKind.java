package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.SphericalBesselFunctionSequence;
import arb.functions.sequences.LommelPolynomialSequence;

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
    return List.of(index, arg);

  }

  @Override
  public String toString()
  {
    return String.format("j(%s,%s)", index, arg);
  }

  Node<D, R, F>  index;

  public boolean scalar;

  private String sequenceFieldName;

  public SphericalBesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("j",
          null,
          expression);
    index  = expression.resolve();
    arg    = expression.require(',').resolve();
    scalar = expression.require(')').hasScalarCodomain();
    expression.registerInitializer(this::generateSequenceInitializer);

    sequenceFieldName = expression.newIntermediateVariable("sph",
                                                           SphericalBesselFunctionSequence.class,
                                                           true);
  }

  public void generateSequenceInitializer(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, sequenceFieldName, SphericalBesselFunctionSequence.class);
    expression.insideInitializer = true;
    index.generate(mv, Integer.class);

    if (!index.getGeneratedType().equals(Integer.class))
    {
      index.generateCastTo(mv, Integer.class);
    }

    assert index.getGeneratedType()
                .equals(Integer.class) : "wanted " + Integer.class + " got " + index.getGeneratedType();

    Compiler.invokeMethod(mv, Integer.class, "set", Integer.class, false, Integer.class);
    assert false : "TODO: wield the LommelPolynomialSequence class similarly to how the SphericalBesselFunctionNodeOfTheFirstKind wields the SphericalBesselFunctionSequence";

    expression.loadThisFieldOntoStack(mv, sequenceFieldName, LommelPolynomialSequence.class);
    index.generate(mv, Integer.class);
    mv.visitLdcInsn(0);
    mv.visitLdcInsn(128);
    expression.loadThisFieldOntoStack(mv, elementFieldName, RationalFunction.class);

    Compiler.invokeVirtualMethod(mv,
                                 LommelPolynomialSequence.class,
                                 "evaluate",
                                 RationalFunction.class,
                                 Integer.class,
                                 int.class,
                                 int.class,
                                 RationalFunction.class);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      err.printf("j.generate(ν=%s, resultType=%s\n)\n", index, resultType);
    }
    var scalarType = scalarType(resultType);

    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    index.generate(mv, scalarType);
    // ³⁄₂
    // assert false : "TODO: wield the SphericalBesselFunctionSequence class the
    // same way the HypergeometricFunctionNode uses the HypergeometricFunction";

    return mv;
  }

  @Override
  public String typeset()
  {
    return format("j_{%s}(%s)", index.typeset(), arg == null ? "" : arg.typeset());
  }
}