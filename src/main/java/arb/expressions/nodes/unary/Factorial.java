package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 */
public class Factorial<D, R, F extends Function<D, R>> extends
                      FunctionCall<D, R, F>
{

  @Override
  public Class<?> type()
  {
    return arb.Integer.class;
  }

  public Factorial(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super(parser,
          "factorial",
          argument);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}
