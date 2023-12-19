package arb.expressions;

import java.util.HashMap;

import arb.Field;

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

  @SafeVarargs
  public Variables(X... fields)
  {
    for (X field : fields)
    {
      if (field instanceof Field)
      {
        String name = ((Field<?>) field).getName();
        assert name != null : "variable names must not be null";
        put(name, field);
      }
      else
      {
        throw new UnsupportedOperationException("TODO: this is not a Field..support mixing of types");
      }
    }
  }

  public X register(String name, X field)
  {
    return put(name, field);
  }

}
