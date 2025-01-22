package arb.equations;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionalRiccatiEquation extends
                                       ComplexEquation
{

  public FractionalRiccatiEquation(Context context, Real alpha, String p, String q, String r)
  {
    super(context);
    context.registerVariable(alpha.setName("α"));
    ComplexFunction.express("p", p, context);
    ComplexFunction.express("q", q, context);
    ComplexFunction.express("r", r, context);
    initialize("t➔Dᵅy(t)=t➔p(t)+q(t)*y(t)+r(t)*y(t)²", context);
  }

  public FractionalRiccatiEquation(Real alpha, String p, String q, String r)
  {
    this(new Context(),
         alpha,
         p,
         q,
         r);
  }

 
}
