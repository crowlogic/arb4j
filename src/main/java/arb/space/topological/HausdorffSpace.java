package arb.space.topological;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @param <X>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface HausdorffSpace<X>
                               extends
                               TopologicalSpace<X>
{
  boolean isSeparable(int bits, X x, X y);
}
