package arb.documentation.concepts.stochastic.prediction;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AppliesTo;
import arb.documentation.concepts.stochastic.Approach;
import arb.language.RegularTerm;

/**
 * In the Hida approach to {@link LinearLeastSquaresPrediction}, RKHS methods
 * are applied in the frequency domain and translated back to the 'time domain'
 * via an isomorphism.";
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AppliesTo(LeastSquaresPrediction.class)
public class HidaApproach implements
                          Approach,
                          RegularTerm,
                          LinearLeastSquaresPrediction
{

  @Override
  public String getDefinition()
  {
    return "In the Hida approach, RKHS methods are applied in the frequency domain "
           + "and translated back to the 'time domain' via an isomorphism.";
  }

}
