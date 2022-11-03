package arb.functions.complex.elliptic.lemniscatic;

import static java.lang.System.out;

import arb.Complex;
import arb.ComplexConstants;
import junit.framework.TestCase;

public class LemniscateCosineTest extends
                                  TestCase
{
  public void testEval()
  {
    LemniscateCosine cl = new LemniscateCosine();
    Complex w = cl.evaluate(ComplexConstants.one, 1, 256, new Complex() );
    out.println( "cl(1)=" + w );
  }
}
