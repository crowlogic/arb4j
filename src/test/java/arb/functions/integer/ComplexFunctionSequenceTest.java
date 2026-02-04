package arb.functions.integer;

import java.io.File;

import arb.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.utensils.Utensils;
import junit.framework.TestCase;

public class ComplexFunctionSequenceTest extends
                                         TestCase
{
  public static void testComplexFunctionSeq1()
  {
    Complex correct = ComplexNullaryFunction.express( "int(t➔t^(5.3), t=-1..1)").evaluate();
    assertTrue( ComplexConstants.zero.isZero() );
    assertEquals("0.0654309123345280747351260389461789256 +/- 3.37e-38 + i*-0.1284153959325313371590941932036220728 +/- 4.42e-38",
                 correct.toString());
    ComplexFunctionSequence seq      =
                                ComplexFunctionSequence.express("χ", "i➔p➔int(t➔t^(i+p), t=-1..1)");
    ComplexFunction         function = seq.apply(3);
    Complex                 y        = function.eval(2.3, new Complex());
    System.out.println( "Wrote " + Utensils.saveToYamlFormat(new File( "chi3.yaml"), function ) );

    assertEquals(correct.toString(),
                 y.toString());
  }
}
