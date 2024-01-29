package arb.expressions.nodes.binary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 */
public class RisingFactorial<D, R, F extends Function<D, R>> extends
                            BinaryOperation<D, R, F>
{

  public RisingFactorial(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "risingFactorial",
          right);
  }

  @Override
  public String typeset()
  {
    return String.format("(%s)_{%s}", left, right);
  }

}
