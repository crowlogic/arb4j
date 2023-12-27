package arb.expressions.nodes;

import static java.lang.String.format;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Represents the 'RaiseToPower' binary expression node.
 * 
 * TODO: specialize this for integers and use the int-constructor which would be
 * expected to be higher-performance than string parser
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class RaiseToPower<D, R, F extends Function<D,R>> extends
                         BinaryOperation<D, R, F>
{

  @Override
  public String typeset()
  {
    return format("{%s}^{%s}", left.typeset(), right.typeset());
  }

  public RaiseToPower(Expression<D, R, F> expression, Node<D, R, F> base, Node<D, R, F> exponent, int depth)
  {
    super(expression,
          base,
          "pow",
          exponent,
          depth);
  }
}