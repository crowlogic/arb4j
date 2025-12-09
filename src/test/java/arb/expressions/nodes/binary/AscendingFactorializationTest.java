package arb.expressions.nodes.binary;

import arb.Real;
import arb.functions.integer.RealSequence;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class AscendingFactorializationTest extends
                                           TestCase
{

  public void testAlternativeSyntax()
  {
    var f = RealSequence.express("n⋰3");
    try ( Real list = new Real(f.enumerate(0, 9)))
    {
      assertEquals("[0, 6, 24, 60, 120, 210, 336, 504, 720, 990]", list.toString());
    }
  }

}
