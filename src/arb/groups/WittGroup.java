package arb.groups;

import arb.Field;
import arb.topological.spaces.BilinearForm;

/**
 * a Witt group of a {@link Field}, named after Ernst Witt, is a
 * {@link CommutativeGroup} whose elements are represented by symmetric
 * {@link BilinearForm} over the field.
 * 
 * @author crow
 *
 * @param <F>
 */
public interface WittGroup<F extends Field> extends
                          Group
{

}
