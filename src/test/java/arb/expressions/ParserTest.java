package arb.expressions;

import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ParserTest extends
                        TestCase
{

  public void testIsLatinGreekOrSpecial()
  {
    assertTrue(Parser.isLatinGreekSpecialOrBlackLetter('Γ', false));
    assertTrue(Parser.isGreekOrBlackLetter('Γ'));

  }

}
