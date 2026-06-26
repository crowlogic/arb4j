package arb.functions.complex;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Complex;
import arb.expressions.Context;

public class GeneralizedPadeSummationTest
{
   @Test
   public void resumsAlternatingHarmonicSeriesWithPadé()
   {
     try ( Context context = new Context();
           Complex v = new Complex();
           Complex res = new Complex();
           GeneralizedPadeSummation summation = GeneralizedPadeSummation.express("term",
                                                                                   "term:k➔v➔((-1)^k)/(k+1)",
                                                                                   context) )
     {
       v.zero();
       summation.evaluate(v, 20, 128, res);
       double value = res.re().doubleValue();
       assertTrue("expected the alternating harmonic sum to converge to ln(2)", Math.abs(value - Math.log(2.0)) < 1e-8);
       assertTrue("imaginary part should remain zero", Math.abs(res.im().doubleValue()) < 1e-12);
     }
   }
}
