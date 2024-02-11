package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class Subtraction<D, R, F extends Function<D, R>> extends
                        BinaryOperation<D, R, F>
{

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (left == null)
    {
      left = new LiteralConstant<>(expression,
                                   "0");
    }
    return super.generate(mv, resultType);
  }

  @Override
  public String typeset()
  {
    return format("%s - %s", left.typeset(), right.typeset());
  }

  public Subtraction(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "sub",
          right);
  }
}