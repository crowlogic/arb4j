package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class RealContext extends
                         Context<Real, Real, RealFunction>
{

  public RealContext(Variables vars)
  {
    super(vars);
  }

  public RealContext()
  {
  }

}
