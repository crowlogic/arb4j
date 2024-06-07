package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealSquareRoot implements
                            RealFunction
{

  public static final RealSquareRoot instance = new RealSquareRoot();

  public static enum Branch
  {
   Positive,
   Negative
  };

  public Branch branch = Branch.Positive;

  public RealSquareRoot()
  {
  }
  
  public RealSquareRoot(Branch branch)
  {
    this.branch = branch;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    t.sqrt(bits, res);
    return branch == Branch.Positive ? res : res.neg();
  }

}
