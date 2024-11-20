package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.loadInputParameter;
import static arb.expressions.Compiler.loadOrderParameter;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.SphericalBesselFunction;

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
public class SphericalBesselFunctionNodeOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>> extends
                                                      FunctionNode<D, R, F>
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

  private String functionFieldName;

  public SphericalBesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("j",
          null,
          expression);
    index  = expression.resolve();
    arg    = expression.require(',').resolve();
    scalar = expression.require(')').hasScalarCodomain();
    expression.registerInitializer(this::generateInitializer);

    functionFieldName = expression.newIntermediateVariable("j", SphericalBesselFunction.class, true);

  }

  public void generateInitializer(MethodVisitor mv)
  {
    expression.insideInitializer = true;
    loadSphericalBesselFunctionOntoStack(mv);
    Compiler.getField(mv, SphericalBesselFunction.class, "n", Integer.class);
    index.generate(mv, Integer.class);

    if (!index.getGeneratedType().equals(Integer.class))
    {
      index.generateCastTo(mv, Integer.class);
    }

    assert index.getGeneratedType()
                .equals(Integer.class) : "wanted " + Integer.class + " got " + index.getGeneratedType();

    Compiler.invokeMethod(mv, Integer.class, "set", Integer.class, false, Integer.class);

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    boolean isNullaryFunction = expression.domainType.equals(Object.class);

    expression.insideInitializer = false;
    if (Expression.trace)
    {
      err.printf("j.generate(ν=%s, resultType=%s\n)\n", index, resultType);
    }
    if (isNullaryFunction)
    {
      return generateNullaryFunctionInvocation(mv, resultType);
    }
    else
    {
      return generateFunction(mv);
    }
  }

  protected MethodVisitor generateFunction(MethodVisitor mv)
  {
    loadSphericalBesselFunctionOntoStack(mv);
    checkClassCast(loadInputParameter(mv), expression.domainType);
    loadOrderParameter(mv);
    loadBitsOntoStack(mv);
    loadOutputVariableOntoStack(mv, expression.coDomainType);

    Compiler.invokeVirtualMethod(mv,
                                 SphericalBesselFunction.class,
                                 "evaluate",
                                 expression.coDomainType,
                                 expression.domainType,
                                 int.class,
                                 int.class,
                                 expression.coDomainType);
    checkClassCast(mv, expression.coDomainType);
    return mv;
  }

  protected MethodVisitor generateNullaryFunctionInvocation(MethodVisitor mv, Class<?> resultType)
  {
    loadSphericalBesselFunctionOntoStack(mv);

    arg.generate(mv, resultType);
    if (!arg.getGeneratedType().equals(resultType))
    {
      arg.generateCastTo(mv, resultType);
    }
    loadOrderParameter(mv);
    loadBitsOntoStack(mv);
    loadOutputVariableOntoStack(mv, expression.coDomainType);

    Compiler.invokeVirtualMethod(mv,
                                 SphericalBesselFunction.class,
                                 "evaluate",
                                 expression.coDomainType,
                                 resultType,
                                 int.class,
                                 int.class,
                                 expression.coDomainType);
    checkClassCast(mv, expression.coDomainType);
    return mv;
  }

  public void loadSphericalBesselFunctionOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, functionFieldName, SphericalBesselFunction.class);
  }

  @Override
  public String typeset()
  {
    return format("j_{%s}(%s)", index.typeset(), arg == null ? "" : arg.typeset());
  }

  @Override
  public Class<?> type()
  {
    var scalarType = Compiler.scalarType(expression.coDomainType);
    return scalarType;
  }
}