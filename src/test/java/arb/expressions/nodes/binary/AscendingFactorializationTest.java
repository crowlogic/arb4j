package arb.expressions.nodes.binary;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealSequence;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AscendingFactorializationTest extends
                                           TestCase
{

  public void testAlternativeSyntax()
  {
    var  f    = RealSequence.express("n⋰3");
    try ( Real list = new Real(f.enumerate(0, 9)))
    {
      assertEquals("[0, 6, 24, 60, 120, 210, 336, 504, 720, 990]", list.toString());
    }
  }

}
