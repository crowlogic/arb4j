package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.List;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.functions.real.SphericalBesselFunction;

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
 * Rₙ,ᵥ(z) = Γ(n+v)/Γ(v)(2/z)ⁿ₂F₃([-n/2,½-n/2];[v,-n,1-v-n];-z²)
 * 
 * where ₂F₃ is a generalized hypergeometric function. The "Lommel polynomials"
 * are actually rational functions of z, not polynomial in z itself; but rather "polynomial
 * in 1/z".
 * </pre>
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class SphericalBesselFunctionNodeOfTheFirstKind<D,
              R,
              F extends Function<? extends D, ? extends R>> extends
                                                      FunctionNode<D, R, F>
{

  final private String functionFieldName;

  Node<D, R, F>        order;

  public boolean       scalar;

  public SphericalBesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
  {
    this(expression,
         expression.resolve(),
         expression.require(',').resolve());
    expression.require(')');
  }

  public SphericalBesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression,
                                                   Node<D, R, F> order,
                                                   Node<D, R, F> arg)
  {
    super("j",
          null,
          expression);
    this.order  = order;
    this.arg    = arg;
    this.scalar = expression.hasScalarCodomain();
    if (!scalar && !expression.coDomainType.equals(RealFunction.class))
    {
      throw new CompilerException(String.format("%ss can not be represented as %ss",
                                                SphericalBesselFunction.class.getSimpleName(),
                                                expression.coDomainType.getSimpleName()));
    }

    functionFieldName =
                      expression.newIntermediateVariable("j", SphericalBesselFunction.class, true);

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    boolean isNullaryFunction = expression.domainType.equals(Object.class);

    expression.insideInitializer = false;
    if (Expression.trace)
    {
      logger.debug(String.format("j.generate(ν=%s, resultType=%s\n)\n", order, resultType));
    }
    generatedType = resultType;
    return isNullaryFunction ? generateNullaryFunctionInvocation(mv, resultType)
                             : generateEvaluateFunctionInvocation(mv);
  }

  public void generateArgument(MethodVisitor mv, Class<?> resultType)
  {
    arg.generate(mv, resultType);
    if (!arg.getGeneratedType().equals(resultType))
    {
      arg.generateCastTo(mv, resultType);
    }
  }

  protected MethodVisitor generateEvaluateFunctionInvocation(MethodVisitor mv)
  {
    loadSphericalBesselFunctionOntoStack(mv);
    cast(loadInputParameter(mv), expression.domainType);
    loadOrderParameter(mv);
    loadBitsOntoStack(mv);
    loadOutputVariableOntoStack(mv, expression.coDomainType);
    return cast(invokeEvaluationMethod(mv, expression.domainType), expression.coDomainType);
  }

  protected MethodVisitor generateNullaryFunctionInvocation(MethodVisitor mv, Class<?> resultType)
  {
    loadSphericalBesselFunctionOntoStack(mv);
    generateArgument(mv, resultType);
    loadOrderParameter(mv);
    loadBitsOntoStack(mv);
    loadOutputVariableOntoStack(mv, expression.coDomainType);
    return cast(invokeEvaluationMethod(mv, resultType), expression.coDomainType);
  }

  public void generateOrder(MethodVisitor mv)
  {
    order.generate(mv, Integer.class);
    if (!order.getGeneratedType().equals(Integer.class))
    {
      order.generateCastTo(mv, Integer.class);
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

  public void loadFunctionFieldOntoStack(MethodVisitor mv)
  {
    assert functionFieldName != null : "functionFieldName is null for " + this;
    expression.loadThisFieldOntoStack(mv, functionFieldName, SphericalBesselFunction.class);
  }

  public void loadSphericalBesselFunctionOntoStack(MethodVisitor mv)
  {
    loadFunctionFieldOntoStack(mv);
    generateOrder(mv);
    Compiler.invokeVirtualMethod(mv,
                                 SphericalBesselFunction.class,
                                 "setOrder",
                                 SphericalBesselFunction.class,
                                 Integer.class);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new SphericalBesselFunctionNodeOfTheFirstKind<>(newExpression,
                                                           order.spliceInto(newExpression),
                                                           arg.spliceInto(newExpression));
  }

  @Override
  public String toString()
  {
    return String.format("j(%s,%s)", order, arg);
  }

  @Override
  public Class<?> type()
  {
    if (RealFunction.class.equals(expression.coDomainType))
    {
      return expression.coDomainType;
    }
    var scalarType = Compiler.scalarType(expression.coDomainType);
    return scalarType;
  }

  @Override
  public String typeset()
  {
    return format("j_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return order.dependsOn(variable) || arg.dependsOn(variable);
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: return 1/2*2^(1/2)*(J(n+1/2,z)*(-1+n)*LommelS1(-3/2,n-1/2,z)-LommelS1(-1/2,n+1/2,z)*J(n-1/2,z))*Pi^(1/2)*z where "
                   + "[LommelS1(a, b, z) = z^(a + 1)*hypergeom([1], [3/2 + b/2 + a/2, 3/2 - b/2 + a/2], -z^2/4)/((a - b + 1)*(a + b + 1)), "
                   + "And(And(And(-a + b - 1 <> 0, a + b + 1 <> 0), (3/2 - b/2 + a/2)";
    return null;
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: return -1/2*((n+1)*J(n+1/2,z)-J(n-1/2,z)*z)*2^(1/2)/z^(3/2)*Pi^(1/2)";
    return null;
  }
}