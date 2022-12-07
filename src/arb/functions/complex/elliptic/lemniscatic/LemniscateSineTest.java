package arb.functions.complex.elliptic.lemniscatic;

import static java.lang.System.out;

import arb.Complex;
import arb.ComplexConstants;
import junit.framework.TestCase;

public class LemniscateSineTest extends
                                TestCase
{
  public void testEval()
  {
    LemniscateSine sl = new LemniscateSine();
    Complex w = sl.evaluate(ComplexConstants.one, 1, 256, new Complex() );
    out.println( "sl(1)=" + w );
  }
}
