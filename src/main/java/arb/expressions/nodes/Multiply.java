package arb.expressions.nodes;

import static java.lang.String.format;

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
public class Multiply<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                     BinaryOperation<D, R, F>
{
  public Multiply(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right, int depth)
  {
    super(expression,
          left,
          "mul",
          right,
          depth);
  }

  @Override
  public String typeset()
  {
    return format("{%s} {%s}", left.typeset(), right.typeset());
  }
}