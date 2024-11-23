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
import arb.exceptions.CompilerException;
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
 * jₙ (z) = √(π/(2*z)) Jₙ₊₁⸝₂ (x) = (sin(z) Rₙ,₁⸝₂(z) - cos(z) Rₙ₋₁,₃⸝₂(z))/z
 * 
 * where Rₙ,ᵥ (z) are the misleadingly named Lommel polynomials
 * 
 * Rₙ,ᵥ (z) = Γ(n + v)/Γ(v) (2/z)ⁿ ₂F₃ ([-n/2, 1/2 - n/2] ; [v, -n, 1 - v - n] ; -z²)
 * 
 * where ₂F₃ is a generalized hypergeometric function. The "Lommel polynomials"
 * are actually rational functions of z, not polynomial in z itself; but rather "polynomial
 * in 1/z".
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionNodeOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>> extends
                                                      FunctionNode<D, R, F>
{

  private String functionFieldName;

  Node<D, R, F>  order;

  public boolean scalar;

  final boolean  useInitializer;

  public SphericalBesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
  {
    super("j",
          null,
          expression);
    order  = expression.resolve();
    arg    = expression.require(',').resolve();
    scalar = expression.require(')').hasScalarCodomain();
    if (!scalar)
    {
      throw new CompilerException(SphericalBesselFunction.class.getSimpleName()
                                  + "s can not be represented as "
                                  + expression.coDomainType.getSimpleName()
                                  + "s");
    }
    if (useInitializer = !order.dependsOn(expression.getIndependentVariable()))
    {
      expression.registerInitializer(this::generateInitializer);
    }

    functionFieldName = expression.newIntermediateVariable("j", SphericalBesselFunction.class, true);

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    boolean isNullaryFunction = expression.domainType.equals(Object.class);

    expression.insideInitializer = false;
    if (Expression.trace)
    {
      err.printf("j.generate(ν=%s, resultType=%s\n)\n", order, resultType);
    }
    return isNullaryFunction ? generateNullaryFunctionInvocation(mv, resultType)
                             : generateEvaluateFunctionInvocation(mv);
  }

  protected MethodVisitor generateEvaluateFunctionInvocation(MethodVisitor mv)
  {
    loadSphericalBesselFunctionOntoStack(mv);
    checkClassCast(loadInputParameter(mv), expression.domainType);
    loadOrderParameter(mv);
    loadBitsOntoStack(mv);
    loadOutputVariableOntoStack(mv, expression.coDomainType);
    return checkClassCast(invokeEvaluationMethod(mv, expression.domainType), expression.coDomainType);
  }

  public void generateInitializer(MethodVisitor mv)
  {
    assert useInitializer : "generateInitializer shouldn't be called if useInitializer isn't true";
    expression.insideInitializer = true;
    loadSphericalBesselFunctionOntoStack(mv);
    Compiler.getField(mv, SphericalBesselFunction.class, "n", Integer.class);
    generateOrder(mv);

    assert order.getGeneratedType()
                .equals(Integer.class) : "wanted " + Integer.class + " got " + order.getGeneratedType();

    Compiler.invokeMethod(mv, Integer.class, "set", Integer.class, false, Integer.class);

  }

  public void generateOrder(MethodVisitor mv)
  {
    order.generate(mv, Integer.class);
    if (!order.getGeneratedType().equals(Integer.class))
    {
      order.generateCastTo(mv, Integer.class);
    }
  }

  protected MethodVisitor generateNullaryFunctionInvocation(MethodVisitor mv, Class<?> resultType)
  {
    loadSphericalBesselFunctionOntoStack(mv);
    generateArgument(mv, resultType);
    loadOrderParameter(mv);
    loadBitsOntoStack(mv);
    loadOutputVariableOntoStack(mv, expression.coDomainType);
    return checkClassCast(invokeEvaluationMethod(mv, resultType), expression.coDomainType);
  }

  public void generateArgument(MethodVisitor mv, Class<?> resultType)
  {
    arg.generate(mv, resultType);
    if (!arg.getGeneratedType().equals(resultType))
    {
      arg.generateCastTo(mv, resultType);
    }
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(order, arg);

  }

  public MethodVisitor invokeEvaluationMethod(MethodVisitor mv, Class<?> outType)
  {
    return Compiler.invokeVirtualMethod(mv,
                                        SphericalBesselFunction.class,
                                        "evaluate",
                                        expression.coDomainType,
                                        outType,
                                        int.class,
                                        int.class,
                                        expression.coDomainType);
  }

  public void loadSphericalBesselFunctionOntoStack(MethodVisitor mv)
  {
    if (useInitializer)
    {
      loadFunctionFieldOntoStack(mv);
    }
    else
    {
      loadFunctionFieldOntoStack(mv);
      Compiler.getField(mv, SphericalBesselFunction.class, "n", Integer.class);
      generateOrder(mv);
      Compiler.invokeMethod(mv, Integer.class, "set", Integer.class, false, Integer.class);
      loadFunctionFieldOntoStack(mv);
    }
  }

  public void loadFunctionFieldOntoStack(MethodVisitor mv)
  {
    expression.loadThisFieldOntoStack(mv, functionFieldName, SphericalBesselFunction.class);
  }

  @Override
  public String toString()
  {
    return String.format("j(%s,%s)", order, arg);
  }

  @Override
  public Class<?> type()
  {
    var scalarType = Compiler.scalarType(expression.coDomainType);
    return scalarType;
  }

  @Override
  public String typeset()
  {
    return format("j_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }
}