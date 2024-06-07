package arb.utensils.treetext;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
    var expression = RealFunction.compile("tanh(log(1+x^2))");

    assertEquals("\n-- tanh(log(1+(x^2)))\n"
                 + "   f-- log(1+(x^2))\n"
                 + "      f-- 1+(x^2)\n"
                 + "         |-- 1\n"
                 + "         +-- x^2\n"
                 + "            |-- x\n"
                 + "            ^-- 2\n",
                 expression.syntaxTextTree().toString());
  }

}
