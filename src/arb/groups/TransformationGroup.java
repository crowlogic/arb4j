package arb.groups;

import arb.topology.transformations.Transformation;

/**
 * Permutation groups and matrix groups are special cases of transformation
 * groups: groups that act on a certain space X preserving its inherent
 * structure. In the case of permutation groups, X is a set; for matrix groups,
 * X is a vector space. The concept of a transformation group is closely related
 * with the concept of a symmetry group: transformation groups frequently
 * consist of all transformations that preserve a certain structure.
 * 
 * The theory of transformation groups forms a bridge connecting group theory
 * with differential geometry. A long line of research, originating with Lie and
 * Klein, considers group actions on manifolds by homeomorphisms or
 * diffeomorphisms. The groups themselves may be discrete or continuous.
 *
 * @param <A>
 * 
 * @see <a href=
 *      "doc-files/HowToEmbedATransformationGroupIntoAnAutomorphismGroup.pdf">Embedding
 *      a transformation group in an automorphism group</a>
 */
public interface TransformationGroup extends
                                     AutomorphismGroup,
                                     Transformation
{
}
