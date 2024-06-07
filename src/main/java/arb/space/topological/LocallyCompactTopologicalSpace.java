package arb.space.topological;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 1. Idea
 * 
 * A topological space is called locally compact if every point has a compact
 * neighbourhood.
 * 
 * Or rather, if one does not at the same time assume that the space is
 * Hausdorff topological space, then one needs to require that these compact
 * neighbourhoods exist in a controlled way, e.g. such that one may find them
 * inside every prescribed open neighbourhood (def. 2.1 below) and possibily
 * such that they are topological closures of smaller open neighbourhoods (def.
 * 2.2 below).
 * 
 * There are various definitions in use, which all coincide if the space is also
 * Hausdorff (prop. 2.3 below).
 * 
 * A locally compact Hausdorff space may also be called a local compactum;
 * compare at compactum.
 * 
 * Local compactness is one of the conditions that are often required by default
 * for working with topological spaces: locally compact spaces are a class of
 * “nice topological spaces”. 2. Definition
 * 
 * Definition 2.1. (local compactness via compact neighbourhood base)
 * 
 * A topological space is locally compact if every point has a neighborhood base
 * consisting of compact subspaces. This means that for every point x∈X every
 * open neighbourhood U x⊃{x} contains a compact neighbourhood K x⊂U x.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LocallyCompactTopologicalSpace<X> extends
                                               TopologicalSpace<X>
{

}
