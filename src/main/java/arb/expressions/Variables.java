package arb.expressions;

import java.util.HashMap;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class Variables<X> extends
                      HashMap<String, X>
{

  private static final long serialVersionUID = 1L;

  public X register(String name, X field)
  {
    return put(name, field);
  }

}
