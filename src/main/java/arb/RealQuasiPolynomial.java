package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.functions.sequences.RealPolynomialSequence;
import arb.functions.sequences.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuasiPolynomial
                                 extends
                                 QuasiPolynomial<Real, RealPolynomial, RealFunction> implements
                                 RealFunction

{

  

  public static Expression<Integer, RealQuasiPolynomial, Sequence<RealQuasiPolynomial>>
         parseSequence(String className, String expression, Context context)
  {
    return Function.parse(className,
                          expression,
                          context,
                          Integer.class,
                          RealQuasiPolynomial.class,
                          Sequence.class,
                          null,
                          null);
  }

  @SuppressWarnings("resource")
  public RealQuasiPolynomial identity(RealQuasiPolynomial realQuasiPolynomial)
  {
    if (p != null)
    {
      p.close();
      p = new RealPolynomial().identity();
    }
    return this;
  }

  public RealQuasiPolynomial(RealPolynomial p, RealFunction f)
  {
    super();
    this.p = p;
    this.f = f;
  }

  public RealQuasiPolynomial(RealFunction f)
  {
    super();
    this.f = f;
  }

  public RealQuasiPolynomial()
  {
    super();
  }

  public RealQuasiPolynomial one()
  {
    p.identity();
    return this;
  }

  public RealQuasiPolynomial zero()
  {
    p.zero();
    return this;
  }

}
