package arblib.curves;

import arblib.*;
import junit.framework.TestCase;

public class LemniscateTest extends
                            TestCase
{
  public static void testLemniscate()
  {
    Lemniscate lem = new Lemniscate();
    Complex    w   = lem.evaluate(Constants.COMPLEX_ONE, 2, 555, Complex.newVector(2));
    assertEquals( 0.4473477782427488, w.getReal().doubleValue(), 4.31E-21 );
    assertEquals( 0.3764301755095503, w.getImag().doubleValue(), 3.53E-22 );
    assertEquals( -0.9348496649078705, w.get(1).getReal().doubleValue(), 2.02E-21 );
    assertEquals( -0.54494583206781146610, w.get(1).getImag().doubleValue(), 1.23E-21 );
    /**
     * l(1)=[[+0.44734777824274882640 +/- 4.31e-21] [+0.37643017550955035312 +/- 3.53e-22]i,
       l'(1)=[-0.93484966490787055089 +/- 2.02e-21] [-0.54494583206781146610 +/- 1.23e-21]i]
     */
    System.out.println("l(1)=" + w);
  }
  
  public static void testDerivative()
  {
    Lemniscate l = new Lemniscate();
    ComplexFunction dl = l.differentiate();
    Complex l1 = l.evaluate(Constants.COMPLEX_ONE, 2, 256, Complex.newVector(2));
    Complex dl1 = dl.evaluate(Constants.COMPLEX_ONE, 1, 256, Complex.newVector(2));
    assertTrue( l1.get(1).equals(dl1));
    
    
    
  }
}
