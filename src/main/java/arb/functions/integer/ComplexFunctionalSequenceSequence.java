package arb.functions.integer;

import javax.annotation.Nullable;

import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.functions.ComplexFunctional;

/**
 * A {@link Sequence} whose codomain is itself a {@link ComplexFunctionalSequence}
 * — i.e. a doubly-indexed object {@code (n, z) ↦ Complex → Complex}.
 *
 * <p>
 * Mirrors {@link ComplexPolynomialSequenceSequence} with the inner element type
 * swapped for {@link ComplexFunctionalSequence}.
 *
 * <p>
 * Primary client is the Christoffel–Darboux reproducing kernel
 * {@code Kn:n➔z➔w➔K_n(z,w)}.
 */
public interface ComplexFunctionalSequenceSequence extends
                                                   Sequence<ComplexFunctionalSequence>
{

  public static ComplexFunctionalSequenceSequence express(String expression, Context context)
  {
    return Sequence.express(null, ComplexFunctionalSequence.class, expression, ComplexFunctionalSequenceSequence.class, context);
  }

  public static ComplexFunctionalSequenceSequence express(String name, String expression, Context context)
  {
    return Sequence.express(name, ComplexFunctionalSequence.class, expression, ComplexFunctionalSequenceSequence.class, context);
  }

  public static Expression<Integer, ComplexFunctionalSequence, ComplexFunctionalSequenceSequence>
         compile(@Nullable String name, String expression, Context context)
  {
    return Sequence.compile(ComplexFunctionalSequence.class, expression, ComplexFunctionalSequenceSequence.class, context);
  }

  public static Expression<Integer, ComplexFunctionalSequence, ComplexFunctionalSequenceSequence>
         compile(String expression, Context context)
  {
    return compile(null, expression, context);
  }

  public static FunctionMapping<Integer, ComplexFunctionalSequence, ComplexFunctionalSequenceSequence>
         declare(String name, Context context)
  {
    return context.declare(name, Integer.class, ComplexFunctionalSequence.class, ComplexFunctionalSequenceSequence.class);
  }
}
