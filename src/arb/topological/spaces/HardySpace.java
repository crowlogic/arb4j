package arb.topological.spaces;

import arb.Field;

/**
 * A Hardy space is a {@link HilbertSpace} with inner product given by<br>
 * <code>
 *  (𝑓|𝑔)=sup{0<𝑟<1}(∫(𝑓(𝑟*e^(𝑖*𝜃))*conj(𝑔(𝑟*e^(𝑖*𝜃)))d𝜃=0..2π))
 * </code>
 *
 */
public class HardySpace<D extends Field> implements
                       HilbertSpace<D>
{

  @Override
  public D innerProduct(D that, int prec, D result)
  {
    throw new UnsupportedOperationException("TODO: return (𝑓|𝑔)=sup{0<𝑟<1}(∫(𝑓(𝑟*exp(𝑖*𝜃))*conj(𝑔(𝑟*exp(𝑖*𝜃)))d𝜃=0..2π))");

  }

}
