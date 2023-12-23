package arb.expressions.nodes;

import static java.lang.String.format;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class Add<D, R, F extends Function<? extends D, ? extends R>> extends
                BinaryOperation<D, R, F>
{
  
  @Override
  public String typeset()
  {
    return format("{%s} + {%s}", left.typeset(), right.typeset());
  }
  
  public Add(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right, int depth)
  {
    super(expression,
          left,
          "add",
          right,
          depth);
  }
}