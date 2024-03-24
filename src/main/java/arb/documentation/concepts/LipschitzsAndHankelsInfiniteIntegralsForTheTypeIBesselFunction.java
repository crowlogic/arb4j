package arb.documentation.concepts;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.ChapterReferral;
import arb.documentation.Concept;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LipschitzsAndHankelsInfiniteIntegralsForTheTypeIBesselFunction implements
                                                                            Concept
{
  public ChapterReferral getChapterReferrals()
  {
    return Bibliography.besselFunctionTreatise.referToChapters("13.20", "13.21", "13.22", "13.23");
  }
}
