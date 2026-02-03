package arb.functions.integer;

import arb.Complex;
import arb.Real;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import junit.framework.TestCase;

public class ComplexFunctionSequenceTest extends
                                         TestCase
{
  public static void testComplexFunctionSeq1()
  {
    Complex correct = ComplexNullaryFunction.express( "int(t➔t^(5.3), t=-1..1)").evaluate();
    ComplexFunctionSequence seq      =
                                ComplexFunctionSequence.express("χ", "i➔p➔int(t➔t^(i+p), t=-1..1)");
    ComplexFunction         function = seq.apply(3);
    Complex                 y        = function.eval(2.3, new Complex());
    assertEquals("blah +/- 5.15e-17",
                 correct.toString());
  }
}
