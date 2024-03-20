package arb.utensils.treetext;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTreeTest extends
                          TestCase
{
  public void testPrintAbstractSyntaxTree()
  {
    var expression = Expression.compile("S",
                                        "tanh(log(1+x^2))",
                                        Real.class,
                                        Real.class,
                                        RealFunction.class);

    assertEquals("-- tanh(log(1+(x^2)))\n"
                 + "   `-- log(1+(x^2))\n"
                 + "      `-- 1+(x^2)\n"
                 + "         |-- 1\n"
                 + "         `-- x^2\n"
                 + "            |-- x\n"
                 + "            `-- 2\n",
                 expression.syntaxTreeToString());
  }

}
