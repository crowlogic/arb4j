package arb;

import java.util.Iterator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FloatIterator implements
                           Iterator<Float>
{
  int   i = 0;
  Float x = null;

  public FloatIterator(Float x)
  {
    this.x = x;
  }

  @Override
  public boolean hasNext()
  {
    return i < x.dim;
  }

  @Override
  public Float next()
  {
    return x.get(i++);
  }

}
