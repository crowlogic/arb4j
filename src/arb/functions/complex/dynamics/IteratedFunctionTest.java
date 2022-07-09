package arb.functions.complex.dynamics;

import static java.lang.Math.pow;

import arb.*;
import junit.framework.TestCase;

public class IteratedFunctionTest extends
                                  TestCase
{
  public void testNewtonSTwiceComposed()
  {
    IteratedFunction<SNewtonMap> sNewtonIter = new IteratedFunction<SNewtonMap>(new SNewtonMap(),
                                                                                2,
                                                                                false);
    Complex                      coordinate  = new Complex();
    coordinate.set(0.2, 0.6);
    Complex value = sNewtonIter.evaluate(coordinate, 1, 256, new Complex());
    assertEquals(0.011519733024779039, value.getReal().doubleValue());
    assertEquals(0.12687504645347963, value.getImag().doubleValue());
  }

  public void testNewtonSTwiceComposedNormalized()
  {
    IteratedFunction<SNewtonMap> sNewtonIter = new IteratedFunction<SNewtonMap>(new SNewtonMap(),
                                                                                2,
                                                                                true);
    Complex                      coordinate  = new Complex();
    coordinate.set(0.2, 0.6);
    Complex value = sNewtonIter.evaluate(coordinate, 2, 256, Complex.newVector(2));
    assertEquals(0.022075576897468703052584970691896160133183, value.getReal().doubleValue(), pow(10, -17));
    assertEquals(0.43913084891123982389515845170535612851381, value.getImag().getMid().doubleValue());

  }

  public void testNormalizedMultiplier()
  {
    IteratedFunction<SNewtonMap> sNewtonIter = new IteratedFunction<SNewtonMap>(new SNewtonMap(),
                                                                                2,
                                                                                true);
    Complex                      coordinate  = new Complex();
    coordinate.zero();
    Complex value = sNewtonIter.evaluate(coordinate, 2, 256, Complex.newVector(2));
    assertTrue( value.isZero() );
    Complex multiplier = value.get(1);
    Real    modulus    = multiplier.abs(256, new Real());
    assertTrue(modulus.equals(Constants.one));
  }

  @SuppressWarnings("resource")
  public void testMultiplierNormalized()
  {
    IteratedFunction<SNewtonMap> sNewtonIter = new IteratedFunction<SNewtonMap>(new SNewtonMap(),
                                                                                2,
                                                                                false);
    Complex                      coordinate  = new Complex();
    coordinate.zero();
    Complex value = sNewtonIter.evaluate(coordinate, 2, 256, Complex.newVector(2));
    assertTrue( value.isZero() );
    Complex multiplier = value.get(1);
    multiplier.printPrecision = true;
    Real    modulus    = multiplier.abs(-1, new Real());    
    assertEquals(new Real().set("0.25",256), modulus);
  }

  
}
