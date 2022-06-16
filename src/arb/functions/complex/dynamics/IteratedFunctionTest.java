package arb.functions.complex.dynamics;

import arb.Complex;
import junit.framework.TestCase;

public class IteratedFunctionTest extends
                                  TestCase
{
  public void testNewtonSTwiceComposed()
  {
    IteratedFunction<SNewtonMap> sNewtonIter = new IteratedFunction<SNewtonMap>(new SNewtonMap(), 2);
    Complex coordinate = new Complex();
    coordinate.set(0.2, 0.6);
    Complex value = sNewtonIter.evaluate(coordinate, 1, 256, new Complex() );
    assertEquals( 0.011519733024779039, value.getReal().doubleValue() );
    assertEquals( 0.12687504645347963, value.getImag().doubleValue() );
  }
}
