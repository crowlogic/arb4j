package arb.functions.real;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class RiemannSiegelThetaFunction
                                        implements
                                        RealFunction,
                                        Typesettable,
                                        AutoCloseable,
                                        Initializable,
                                        Named
{

  public boolean        isInitialized;
  public Context        context;
  public RealPolynomial arg        = new RealPolynomial();
  public RealPolynomial resultPoly = new RealPolynomial();

  public static void main(String args[])
  {
    try ( RiemannSiegelThetaFunction t = new RiemannSiegelThetaFunction())
    {
      var f = t.evaluate(Real.valueOf(2.3),
                         20,
                         128,
                         Real.newVector(20));
      System.out.println("f=" + f);
    }
  }

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real result)
  {
    try ( RealPolynomial h = new RealPolynomial(order); RealPolynomial out = new RealPolynomial(order))
    {

      h.fitLength(order);
      h.setLength(order);

      // h(x) = t + x
      h.get(0).set(t); // constant term = t*x^0=t*1=t
      h.get(1).one(); // linear term = 1*x^1=1*x=x

      out.fitLength(order);
      out.setLength(order);

      arblib.arb_poly_riemann_siegel_theta_series(out,
                                                  h,
                                                  order,
                                                  bits);

      result.set(out.getCoeffs());
      // result.become(Real.newVector(order)).set(out.getCoeffs());
      return result;
    }
  }

  Real offset = new Real();

  @Override
  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_diffϑ(t)",
                            "diff(ϑ(t),t)",
                            this.context);
  }

  @Override
  public RealFunction integral()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_intnull",
                            "int(ϑ(t),t)");
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.arg.close();
    this.resultPoly.close();
  }

  @Override
  public String getName()
  {
    return "ϑ";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "t➔ϑ(t)";
  }

  @Override
  public String typeset()
  {
    return "\\\\vartheta(t)";
  }
}
