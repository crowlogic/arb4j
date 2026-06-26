package arb.functions.complex;

import arb.Complex;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.series.ComplexEpsilonTable;

/**
 * Resum a series of terms supplied either as a compiled {@link ComplexFunctionSequence}
 * or as the derivative jet returned by a {@link ComplexFunction} through its
 * {@code evaluate(t, order, bits, res)} interface.
 *
 * <p>
 * When given a {@link ComplexFunctionSequence}, the class evaluates the sequence
 * term-by-term, feeds the running partial sums into a {@link ComplexEpsilonTable},
 * and returns the best diagonal Padé estimate. When given a single
 * {@link ComplexFunction}, the class requests a jet of length {@code order + 1}
 * and uses the entries of that jet as the series terms, with the term at index
 * {@code n} feeding the partial sum for the {@code n}-th series term.
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

   public GeneralizedPadeSummation(ComplexFunction function)
   {
     this(function, 0);
   }

   public GeneralizedPadeSummation(ComplexFunction function, int startIndex)
   {
     this(function, null, startIndex);
   }

   public GeneralizedPadeSummation(ComplexFunctionSequence derivatives)
   {
     this(null, derivatives, 0);
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
     if (function == null && derivatives == null)
       throw new IllegalArgumentException("either function or derivatives must be non-null");
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
     return new GeneralizedPadeSummation(ComplexFunction.express(name, expression, context));
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
     int jetOrder = Math.max(1, maxOrder + 1);

     try ( ComplexEpsilonTable table = new ComplexEpsilonTable(capacity, bits);
           Complex running = new Complex();
           Complex termValue = new Complex();
           Complex jet = Complex.newVector(jetOrder);
           Integer index = new Integer())
     {
       if (res == null)
       {
         res = new Complex();
       }

       running.zero();
       if (derivatives != null)
       {
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

       if (function == null)
       {
         throw new IllegalStateException("no function or derivative sequence configured");
       }

       function.evaluate(v, jetOrder, bits, jet);
       return table.limit((n, workBits, partialSum) ->
       {
         running.add(jet.get(n), workBits, running);
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
