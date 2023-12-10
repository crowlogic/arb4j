package arb;

import java.util.Iterator;

/**
 * <pre>
 * 
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class RealIterator implements
                          Iterator<Real>
{
  int  i = 0;
  Real x = null;

  public RealIterator(Real x)
  {
    this.x = x;
  }

  @Override
  public boolean hasNext()
  {
    return i < x.dim;
  }

  @Override
  public Real next()
  {
    if (!hasNext())
    {
      throw new IndexOutOfBoundsException(String.format("index=%d must be less than length=%d\n", i, x.dim));
    }
    return x.get(i++);
  }

}
