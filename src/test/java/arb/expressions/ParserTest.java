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
    assertTrue(Parser.isLatinGreekOrSpecial('Γ', false));
    assertTrue(Parser.isGreek('Γ'));

  }

}
