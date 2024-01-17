package arb;

import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public interface OrthogonalBasis<X, VE> extends
                                Iterable<VE>
{

  RealFunction getOrthogonalMeasure();

  Domain<X> getDomain();

}
