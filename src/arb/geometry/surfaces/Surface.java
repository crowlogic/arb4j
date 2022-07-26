package arb.geometry.surfaces;

import arb.geometry.Manifold;
import arb.spaces.EuclideanSpace;

/**
 * A surface is a two-dimensional {@link Manifold}. Some surfaces arise as the
 * boundaries of three-dimensional solids; for example, the sphere is the
 * boundary of the solid ball. Other surfaces arise as graphs of functions of
 * two variables; see the figure at right. However, surfaces can also be defined
 * abstractly, without reference to any ambient space. For example, the Klein
 * bottle is a surface that cannot be embedded in three-dimensional
 * {@link EuclideanSpace}.
 * 
 * Topological surfaces are sometimes equipped with additional information, such
 * as a Riemannian metric or a complex structure, that connects them to other
 * disciplines within mathematics, such as differential geometry and complex
 * analysis. The various mathematical notions of surface can be used to model
 * surfaces in the physical world.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Surface_(topology)">Wikipedia</a>
 */
public interface Surface extends
                         Manifold
{

}
