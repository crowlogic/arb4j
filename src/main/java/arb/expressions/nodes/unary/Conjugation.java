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
public class Conjugation<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                        FunctionCall<D, R, F>
{

  public Conjugation(Expression<D, R, F> parser, String functionName, Node<D, R, F> argument, int depth)
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
