package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.series.ComplexEpsilonTable;

/**
 * Resum the sequence of derivative functions belonging to an analytic
 * {@link ComplexFunction} via Wynn's epsilon table (diagonal Padé approximants).
 *
 * <p>
 * The summation is driven by a compiled {@link ComplexFunctionSequence} whose
 * {@code k}-th entry is the {@code k}-th derivative function of the underlying
 * function with respect to the expansion variable. The class evaluates the
 * derivative sequence term-by-term, feeds the running partial sums into a
 * {@link ComplexEpsilonTable}, and returns the best diagonal Padé estimate.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class GeneralizedPadeSummation implements
                                           ComplexFunction,
                                           AutoCloseable
{
   private final ComplexFunction          function;
   private final ComplexFunctionSequence  derivatives;
   private final int                      startIndex;

   public GeneralizedPadeSummation(ComplexFunctionSequence derivatives)
   {
     this(derivatives, 0);
   }

   public GeneralizedPadeSummation(ComplexFunctionSequence derivatives, int startIndex)
   {
     this(null, derivatives, startIndex);
   }

   public GeneralizedPadeSummation(ComplexFunction function, ComplexFunctionSequence derivatives)
   {
     this(function, derivatives, 0);
   }

   public GeneralizedPadeSummation(ComplexFunction function, ComplexFunctionSequence derivatives, int startIndex)
   {
     if (derivatives == null)
       throw new IllegalArgumentException("derivatives must not be null");
     if (startIndex < 0)
       throw new IllegalArgumentException("startIndex must be non-negative, got " + startIndex);
     this.function    = function;
     this.derivatives = derivatives;
     this.startIndex  = startIndex;
   }

   public static GeneralizedPadeSummation express(String expression, Context context)
   {
     return express(null, expression, context);
   }

   public static GeneralizedPadeSummation express(String name, String expression, Context context)
   {
     return new GeneralizedPadeSummation(null, ComplexFunctionSequence.express(name, expression, context));
   }

   @Override
   public Complex evaluate(Complex v, int order, int bits, Complex res)
   {
     if (v == null)
       throw new IllegalArgumentException("v must not be null");
     if (bits <= 0)
       throw new IllegalArgumentException("bits must be positive, got " + bits);
     if (order < startIndex)
       throw new IllegalArgumentException("order must be >= startIndex, got " + order + " < " + startIndex);

     int maxOrder = order;
     int capacity = Math.max(1, maxOrder - startIndex + 1);

     try ( ComplexEpsilonTable table = new ComplexEpsilonTable(capacity, bits);
           Complex running = new Complex();
           Complex termValue = new Complex();
           Integer index = new Integer())
     {
       if (res == null)
       {
         res = new Complex();
       }

       running.zero();
       return table.limit((n, workBits, partialSum) ->
       {
         index.set(n);
         ComplexFunction derivative = derivatives.evaluate(index, 1, workBits, null);
         derivative.evaluate(v, 1, workBits, termValue);
         running.add(termValue, workBits, running);
         partialSum.set(running);
         return partialSum;
       },
                          startIndex,
                          maxOrder,
                          bits,
                          res);
     }
   }

   @Override
   public void close()
   {
     // Nothing to own; the underlying function and derivative sequence remain owned by the caller.
   }
}
