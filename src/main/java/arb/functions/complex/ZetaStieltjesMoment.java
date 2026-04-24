package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaStieltjesMoment implements
                                 ComplexSequence
{
  Real           C = Real.named("C").set(3);
  Real           ε = Real.named("ε").set("0.1", 128);

  public Context context = new Context(C, ε);

  public final ComplexFunctionSequence Θ =
      ComplexFunctionSequence.express("Θ",
                                      "j➔t➔diff(ϑ(t)+C·t,t^j)",
                                      context);

  public final ComplexFunctionSequence Ζ =
      ComplexFunctionSequence.express("Ζ",
                                      "a➔s➔diff(ζ(1/2+ⅈ·s),s^a)",
                                      context);

  public final ComplexSequence M =
      ComplexSequence.express("M",
                              "b→Σ b!/Π m(ℓ)!{ℓ=0…b}·Π(Θ(2·ℓ+1)(0)/(2·ℓ+1)!)^m(ℓ){ℓ=0…b}{m∶ℓ=0…b,ℓ=0…b}",
                              context);

  public final ComplexSequence N =
      ComplexSequence.express("N",
                              "c→Σ (2·c)!/Π p(ℓ)!{ℓ=0…2·c}·Π(Θ(2·ℓ+1)(0)/(2·ℓ+1)!)^p(ℓ){ℓ=0…2·c}{p∶ℓ=0…2·c,ℓ=0…2·c}",
                              context);

  public final ComplexSequence μ =
      ComplexSequence.express("μ",
                              "n→(-ⅈ)^n·n!/Θ(1)(0)^(n+1/2)·Σ ⅈ^a·Ζ(a)(0)/a!·ⅈ^b·M(b)/b!·Π(-ε-j){j=0…c-1}·N(2·c)/c!·Π(-(n+1)-j){j=0…(Σ k{q=1…(n-a-b-2·c)/2})-1}/(Σ k{q=1…(n-a-b-2·c)/2})!·Π(Θ(2·q+1)(0)/((2·q+1)!·Θ(1)(0)))^k/k!{q=1…(n-a-b-2·c)/2,k∶q=0…(n-a-b-2·c)/(2·q)}{a=0…n,b=0…n-a,c=0…(n-a-b)/2}",
                              context);

  @Override
  public Complex evaluate(Integer n, int order, int bits, Complex res)
  {
    return μ.evaluate(n, order, bits, res);
  }

  @Override
  public String toString()
  {
    return μ.toString();
  }
}
