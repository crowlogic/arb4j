package arb.expressions;

import junit.framework.TestCase;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ParserTest extends
                        TestCase
{

  public void testIsLatinGreekOrSpecial()
  {
    assertTrue(Parser.isIdentifyingCharacter('Γ', false));
    assertTrue(Parser.isGreekOrBlackLetter('Γ'));

  }

}
