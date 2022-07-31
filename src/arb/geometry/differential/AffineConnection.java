package arb.geometry.differential;

import arb.geometry.Manifold;

/**
 * An {@link AffineConnection} is a geometric object on a smooth {@link Manifold} which
 * connects nearby tangent spaces, so it permits tangent vector fields to be
 * differentiated as if they were functions on the manifold with values in a
 * fixed vector space. Connections are among the simplest methods of defining
 * differentiation of the sections of vector bundles
 * 
 * @author crow
 *
 */
public interface AffineConnection extends
                                  Connection
{

}
