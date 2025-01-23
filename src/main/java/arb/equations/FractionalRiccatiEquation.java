package arb.equations;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;

/**
 * <h2>The Discriminant</h2>
 * <p>
 * The discriminant is a mathematical function that helps determine the nature
 * of roots in a quadratic equation. For a quadratic equation ax² + bx + c = 0,
 * the discriminant is defined by the formula D = b² - 4ac.
 * </p>
 * 
 * <h3>Discriminant and Root Nature</h3>
 * <p>
 * The discriminant reveals crucial information about the roots of a quadratic
 * equation:
 * </p>
 * <ul>
 * <li>If D > 0: Two distinct real roots</li>
 * <li>If D = 0: One repeated real root</li>
 * <li>If D < 0: No real roots (complex roots)</li>
 * </ul>
 * 
 * <h2>Relationship to Riccati Equation</h2>
 * <p>
 * The Riccati equation is a first-order ordinary differential equation that is
 * quadratic in the unknown function, expressed as:
 * </p>
 * <p>
 * y′(x) = =p(x) + q(x)y(x) + r(x)y²(x)
 * </p>
 * 
 * <h3>Fractional Riccati Differential Equation</h3>
 * <p>
 * In the fractional Riccati equation, the discriminant plays a similar role in
 * determining solution characteristics. For a fractional Riccati differential
 * equation, researchers analyze three cases based on the discriminant:
 * </p>
 * <ol>
 * <li>When discriminant △ = B² - 4AC > 0: The equation can be reformulated into
 * a specific solution form</li>
 * <li>When discriminant △ = 0: A special case with unique solution
 * properties</li>
 * <li>When discriminant △ < 0: The equation becomes more complex, requiring
 * advanced integration techniques</li>
 * </ol>
 * 
 * <p>
 * The discriminant provides a direct method to classify the solution space of
 * both standard and fractional Riccati equations.
 * </p>
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
