package arb.expressions.nodes;

import arb.expressions.Expression;
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
public class Conjugate<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                      FunctionCall<D, R, F>
{

  public Conjugate(Expression<D, R, F> parser, String functionName, Node<D, R, F> argument, int depth)
  {
    super(parser,
          "neg",
          argument,
          depth);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}
