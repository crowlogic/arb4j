package arb.hypotheses;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.references.Reference;
import arb.logic.Conjecture;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface HilbertPólyaConjecture extends
                                        Conjecture,
                                        RiemannHypothesis
{

  @Override
  default Stream<? extends Reference> getReferences()
  {
    return Stream.of(Bibliography.riemannHypothesisEquivalents.referToTheorem("10.45"));
  }

}
