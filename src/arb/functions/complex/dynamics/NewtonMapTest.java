package arb.functions.complex.dynamics;

import arb.Complex;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.SFunction;
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

  @SuppressWarnings("resource")
  public void testNewtonMapDerivative() throws NotDifferentiableException
  {
    ComplexFunction f = new NewtonMap(new SFunction()).differential();
    Complex         t = new Complex().set(0.1, 0.2);
    Complex         w = f.evaluate(t, 1, prec, new Complex());

    assertEquals(0.47827850346020756, w.getReal().doubleValue(), Math.pow(10, -20));
    assertEquals(0.03295813148788927, w.getImag().doubleValue(), Math.pow(10, -20));
  }

  public void testSMultiplier()
  {
    SFunction       sFunction   = new SFunction();
    NewtonMap       sNewtonMap  = new NewtonMap(sFunction);
    ComplexFunction sNewtonDiff = sNewtonMap.differential();
    ComplexFunction f           = sNewtonDiff;
    try ( Complex t = new Complex(); Complex w = new Complex();)
    {
      f.evaluate(t.set(0, 0), 1, prec, w);

      // TODO: this will be busted until the NewtonMap is enhanced and modified for
      // multiple roots
      assertEquals(0.5, w.getReal().doubleValue(), Math.pow(10, -20));
      assertEquals(0, w.getImag().doubleValue(), Math.pow(10, -20));
    }
  }
}
