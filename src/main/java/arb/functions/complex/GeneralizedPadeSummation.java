package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.series.ComplexEpsilonTable;

/**
 * Resum a series of {@link ComplexFunction} terms compiled from an expression in a
 * {@link Context} via Wynn's epsilon table (diagonal Padé approximants).
 *
 * <p>
 * The summation is driven by a compiled {@link ComplexFunctionSequence} whose
 * {@code k}-th term is a function of the runtime argument {@code v}. The class
 * evaluates the sequence term-by-term, feeds the partial sums into a
 * {@link ComplexEpsilonTable}, and returns the best diagonal Padé estimate.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class GeneralizedPadeSummation implements
                                           ComplexFunction,
                                           AutoCloseable
{
   private final ComplexFunctionSequence terms;
   private final int                      startIndex;

   public GeneralizedPadeSummation(ComplexFunctionSequence terms)
   {
     this(terms, 0);
   }

   public GeneralizedPadeSummation(ComplexFunctionSequence terms, int startIndex)
   {
     if (terms == null)
       throw new IllegalArgumentException("terms must not be null");
     if (startIndex < 0)
       throw new IllegalArgumentException("startIndex must be non-negative, got " + startIndex);
     this.terms      = terms;
     this.startIndex = startIndex;
   }

   public static GeneralizedPadeSummation express(String expression, Context context)
   {
     return express(null, expression, context);
   }

   public static GeneralizedPadeSummation express(String name, String expression, Context context)
   {
     return new GeneralizedPadeSummation(ComplexFunctionSequence.express(name, expression, context));
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
         ComplexFunction term = terms.evaluate(index, 1, workBits, null);
         term.evaluate(v, 1, workBits, termValue);
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
     // Nothing to own; the compiled term sequence remains owned by the caller.
   }
}
