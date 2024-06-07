package arb.documentation.concepts.stochastic.prediction;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AppliesTo;
import arb.documentation.concepts.stochastic.Approach;
import arb.language.RegularTerm;

/**
 * In the Cramer approach, the {@link LeastSquaresPrediction} question is
 * answered directly in the time domain
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AppliesTo(LeastSquaresPrediction.class)
public class CramerApproach implements
                            Approach,
                            RegularTerm,
                            LinearLeastSquaresPrediction
{

  @Override
  public String getDefinition()
  {
    return "In the Cramer approach, the least-squares prediction problem is addressed directly in the time domain.";
  }

}