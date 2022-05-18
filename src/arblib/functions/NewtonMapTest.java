package arblib.functions;

import static java.lang.System.out;

import arblib.Complex;
import junit.framework.TestCase;

public class NewtonMapTest extends
                           TestCase
{
  int prec = 256;

  @SuppressWarnings("resource")
  public void testNewtonMap()
  {
    NewtonMap newtonMap = new NewtonMap(new SFunction());
    Complex   t         = new Complex().set(0.1, 0.2);
    Complex   w         = newtonMap.evaluate(t, 1, prec, new Complex());
    assertEquals(0.047147279411764706, w.getReal().doubleValue(), Math.pow(10, -20));
    assertEquals(0.09959161764705882, w.getImag().doubleValue(), Math.pow(10, -20));
  }
}
