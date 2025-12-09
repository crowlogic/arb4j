package arb.equations;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexEquation extends
                             Equation<Complex, Complex, ComplexFunction>
{

  public ComplexEquation(String equationString)
  {
    super(Complex.class,
          Complex.class,
          ComplexFunction.class,
          equationString);
  }

  public ComplexEquation(ComplexFunction leftSide, ComplexFunction rightSide)
  {
    super(Complex.class,
          Complex.class,
          ComplexFunction.class,
          leftSide,
          rightSide);
  }

  public ComplexEquation(Context context)
  {
    super(Complex.class, Complex.class, ComplexFunction.class,context);
  }

  public ComplexEquation initialize(String equationString, Context context)
  {
    initialize(Complex.class, Complex.class, ComplexFunction.class, equationString, context);
    return this;
  }

  public void initialize(String equationString)
  {
    initialize(equationString, new Context());
  }

}
