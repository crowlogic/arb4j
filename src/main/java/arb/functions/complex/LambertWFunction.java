package arb.functions.complex;

import static arb.arblib.acb_lambertw;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * <pre>
 * The Lambert W function is a multi-valued function that returns the solution
 * to the equation W e^W = z, where z is a complex number.
 * 
 * By default the selected branch is the principal branch
 * 
 * Sets res to the Lambert W function where the index k selects the branch (with 0
 * giving the principal branch). The placement of branch cuts follows
 * <a href="doc-files/TheLambertWFunction.pdf">On The Lambert W Function</a>
 * 
 * The algorithm used to compute the Lambert W function is described in
 * <a href=
"doc-files/ArbitraryPrecisionLambertWFunctionComputation.pdf">Computing the Lambert W function in arbitrary-precision
complex interval arithmetic</a>
 * 
 * </pre>
 * 
 * @see <a href= "https://arblib.org/acb.html#lambert-w-function">the arblib
 *      documentation</a> for information about the flags parameter
 * @see ComplexFunction
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LambertWFunction implements
                              ComplexFunction
{
  // TOOD: make javadocs for flags param instead of referring elsewhere

  public LambertWFunction(long branch, int flags)
  {
    this.branch = branch;
    this.flags  = flags;
  }

  public LambertWFunction(long branch)
  {
    this.branch = branch;
    this.flags  = 0;
  }

  public LambertWFunction()
  {
    this(0);
  }

  long branch;
  int  flags;

  /**
   * Evaluates the Lambert W function for a given complex number.
   *
   * @param t     The complex number to evaluate the function for.
   * @param order The order of the function.
   * @param bits  The number of bits of precision to use for the evaluation.
   * @param res   A complex number that will hold the result of the evaluation.
   * @return The result of the evaluation, stored in the `res` parameter.
   */
  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    assert order <= 1;
    acb_lambertw(res, t, 0, 0, bits);
    return res;
  }
}
