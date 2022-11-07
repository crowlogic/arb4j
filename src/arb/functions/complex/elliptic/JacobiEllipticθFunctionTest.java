package arb.functions.complex.elliptic;

import static arb.ComplexConstants.one;
import static java.lang.System.out;
import static org.junit.Assert.*;

import org.junit.Test;

import arb.Complex;
import arb.ComplexConstants;

public class JacobiEllipticθFunctionTest
{
  public static final int prec = 128;

  @Test
  public void testEvaluate()
  {
    var     θfunc = new JacobiEllipticθFunction();
    Complex w     = θfunc.evaluate(one, 1, prec, new Complex());
    out.println( "JacobiEllipticθFunction(1)=" + w );
  }

}
