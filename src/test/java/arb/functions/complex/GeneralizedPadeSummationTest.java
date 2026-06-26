package arb.functions.complex;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Complex;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;

public class GeneralizedPadeSummationTest
{
   @Test
   public void resumsAlternatingHarmonicSeriesWithPadé()
   {
     try ( Context context = new Context();
           Complex v = new Complex();
           Complex res = new Complex();
           ComplexFunction function = new ComplexFunction()
           {
             @Override
             public Complex evaluate(Complex t, int order, int bits, Complex result)
             {
               return result.zero();
             }
           };
           GeneralizedPadeSummation summation = new GeneralizedPadeSummation(function,
                                                                               ComplexFunctionSequence.express("term",
                                                                                                               "term:k➔v➔((-1)^k)/(k+1)",
                                                                                                               context)) )
     {
       v.zero();
       summation.evaluate(v, 20, 128, res);
       double value = res.re().doubleValue();
       assertTrue("expected the alternating harmonic sum to converge to ln(2)", Math.abs(value - Math.log(2.0)) < 1e-8);
       assertTrue("imaginary part should remain zero", Math.abs(res.im().doubleValue()) < 1e-12);
     }
   }

   @Test
   public void resumsJetTermsProvidedByFunctionEvaluate()
   {
     try ( Complex v = new Complex();
           Complex res = new Complex();
           ComplexFunction function = new ComplexFunction()
           {
             @Override
             public Complex evaluate(Complex t, int order, int bits, Complex result)
             {
               if (result == null)
               {
                 result = Complex.newVector(order);
               }
               else if (result.size() != order)
               {
                 result.become(Complex.newVector(order));
               }
               for (int k = 0; k < order; k++)
               {
                 Complex term = result.get(k);
                 term.set((k % 2 == 0 ? 1.0 : -1.0) / (k + 1));
               }
               return result;
             }
           };
           GeneralizedPadeSummation summation = new GeneralizedPadeSummation(function) )
     {
       v.zero();
       summation.evaluate(v, 20, 128, res);
       double value = res.re().doubleValue();
       assertTrue("expected the function-jet summation to converge to ln(2)", Math.abs(value - Math.log(2.0)) < 1e-8);
       assertTrue("imaginary part should remain zero", Math.abs(res.im().doubleValue()) < 1e-12);
     }
   }
}
