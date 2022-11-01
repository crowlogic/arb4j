package arb.groups;

import arb.topology.transformations.Transformation;

/**
 * 
 * @author crow
 *
 * @param <A>
 * 
 * @see <a href=
 *      "doc-files/HowToEmbedATransformationGroupIntoAnAutomorphismGroup.pdf">Embedding
 *      a transformation group in an automorphism group</a>
 */
public interface TransformationGroup<A extends AutomorphismGroup> extends
                                    Group,
                                    Transformation<A>
{

}
