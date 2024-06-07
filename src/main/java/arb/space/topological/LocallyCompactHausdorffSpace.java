package arb.space.topological;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.groups.LocallyCompactTopologicalGroup;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LocallyCompactHausdorffSpace<X> extends
                                             LocallyCompactTopologicalSpace<X>,
                                             HausdorffSpace<X>,
                                             LocallyCompactTopologicalGroup<X>
{

}
