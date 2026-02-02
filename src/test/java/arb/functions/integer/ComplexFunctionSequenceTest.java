package arb.functions.integer;

import arb.Complex;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

public class ComplexFunctionSequenceTest extends
                                         TestCase
{
  public static void testSeq1()
  {

    ComplexFunctionSequence seq      =
                                ComplexFunctionSequence.express("χ", "i➔p➔int(t➔t^(i+p), t=-1..1)");
    ComplexFunction         function = seq.apply(3);
    Complex                 y        = function.eval(2.3, new Complex());
    assertEquals("0.2995821230740516 +/- 6.69e-17 + i*0.1526447159198013 +/- 5.15e-17",
                 y.toString());
  }
}
