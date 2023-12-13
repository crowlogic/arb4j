package arb.expressions;

import java.util.HashMap;

import arb.Field;
import arb.functions.Function;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class Functions<D, R, F extends Function<D, R>> extends
                      HashMap<String, F>
{

  private static final long serialVersionUID = 1L;

}
