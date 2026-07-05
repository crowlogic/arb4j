package arb.expressions.nodes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.VariableReference;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * The definite integral with variable upper limit of the gamma-ratio integrand
 *
 * <pre>
 *   F(x) = ∫₀ˣ Γ(t+r)/(Γ(r)·Γ(t+1))·pʳ·(1−p)ᵗ dt
 * </pre>
 *
 * has, by the Leibniz integral rule (the limits carry all dependence on x and
 * the integrand carries none),
 *
 * <pre>
 *   F′(x) = Γ(x+r)/(Γ(r)·Γ(x+1))·pʳ·(1−p)ˣ
 * </pre>
 *
 * exactly and symbolically — no parameter values enter. Compiling F itself
 * demands a primitive of the integrand, for which no rule is implemented, and
 * the compiler states exactly that.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegralNodeGammaRatioDensityTest extends
                                               TestCase
{
  public void testLeibnizDerivativeOfDefiniteIntegralIsTheIntegrandSymbolically()
  {
    Context context = new Context();
    context.registerVariable(Real.named("r"));
    context.registerVariable(Real.named("p"));

    Expression<Real, Real, RealFunction> F = RealFunction.parse("x➔∫t➔(Γ(t+r)/(Γ(r)*Γ(t+1))*(p^r)*((1-p)^t))dt∈(0,x)",
                                                                context,
                                                                false);
    VariableNode<Real, Real, RealFunction> x = new VariableNode<>(F,
                                                                  new VariableReference<>("x"),
                                                                  false);
    Node<Real, Real, RealFunction> derivative = F.rootNode.differentiate(x).simplify();

    Expression<Real, Real, RealFunction> density = RealFunction.parse("x➔Γ(x+r)/(Γ(r)*Γ(x+1))*(p^r)*((1-p)^x)",
                                                                      context);

    assertEquals(density.rootNode.toString(), derivative.toString());
  }

  public void testCompilingTheDefiniteIntegralStatesThatNoIntegrationRuleIsImplemented()
  {
    Context context = new Context();
    context.registerVariable(Real.named("r"));
    context.registerVariable(Real.named("p"));

    try
    {
      RealFunction.express("F", "x➔∫t➔(Γ(t+r)/(Γ(r)*Γ(t+1))*(p^r)*((1-p)^t))dt∈(0,x)", context);
      fail("compilation must state that no integration rule is implemented for the gamma-ratio integrand");
    }
    catch (UnsupportedOperationException stated)
    {
      assertTrue(stated.getMessage().contains("not implemented"));
    }
  }
}
