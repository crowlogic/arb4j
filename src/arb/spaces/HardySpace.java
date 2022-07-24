package arb.spaces;

import arb.Field;
import arb.functions.Function;

/**
 * A Hardy space is a {@link HilbertSpace} with inner product given by<br>
 * <code>
 *  (𝑓|𝑔)=sup{0<𝑟<1}(∫(𝑓(𝑟*exp(𝑖*𝜃))*conj(𝑔(𝑟*exp(𝑖*𝜃)))d𝜃=0..2π))
 * </code>
 *
 */
public class HardySpace<D extends Field> implements
                       HilbertSpace<D>
{

  /**
   * @param left
   * @param right
   * @return (𝑓|𝑔)=sup{0<𝑟<1}(∫(𝑓(𝑟*exp(𝑖*𝜃))*conj(𝑔(𝑟*exp(𝑖*𝜃)))d𝜃=0..2π))
   */
  public <P extends Field> P innerProduct(D left, D right)
  {
    throw new UnsupportedOperationException("TODO: return (𝑓|𝑔)=sup{0<𝑟<1}(∫(𝑓(𝑟*exp(𝑖*𝜃))*conj(𝑔(𝑟*exp(𝑖*𝜃)))d𝜃=0..2π))");
  }

}
