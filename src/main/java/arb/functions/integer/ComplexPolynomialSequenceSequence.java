package arb.functions.integer;

import javax.annotation.Nullable;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;

/**
 * A {@link Sequence} whose codomain is itself a {@link ComplexPolynomialSequence}
 * — i.e. a doubly-indexed polynomial table {@code (j, k) ↦ ℂ[u]}.
 *
 * <p>
 * Mirrors {@link ComplexSequenceSequence} (1D-scalar inner sequence) with the
 * inner element type swapped for {@link ComplexPolynomialSequence}.
 *
 * <p>
 * Primary client is the polynomial Chebyshev/Wheeler σ-table consumed by
 * {@link arb.functions.polynomials.orthogonal.complex.OrthogonalPolynomialMomentFunctionalSequence}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexPolynomialSequenceSequence extends
                                                   Sequence<ComplexPolynomialSequence>
{

  public static ComplexPolynomialSequenceSequence express(String expression)
  {
    return Sequence.express(ComplexPolynomialSequence.class, expression, ComplexPolynomialSequenceSequence.class);
  }

  public static ComplexPolynomialSequenceSequence express(String name, String expression)
  {
    return Sequence.express(name, ComplexPolynomialSequence.class, expression, ComplexPolynomialSequenceSequence.class);
  }

  public static ComplexPolynomialSequenceSequence express(String name, String expression, Context context)
  {
    return Sequence.express(name, ComplexPolynomialSequence.class, expression, ComplexPolynomialSequenceSequence.class, context);
  }

  static ComplexPolynomialSequenceSequence express(String expression, Context context)
  {
    return Sequence.express(null, ComplexPolynomialSequence.class, expression, ComplexPolynomialSequenceSequence.class, context);
  }

  public static Expression<Integer, ComplexPolynomialSequence, ComplexPolynomialSequenceSequence>
         compile(@Nullable String name, String expression, Context context)
  {
    return Sequence.compile(ComplexPolynomialSequence.class, expression, ComplexPolynomialSequenceSequence.class, context);
  }

  public static Expression<Integer, ComplexPolynomialSequence, ComplexPolynomialSequenceSequence>
         compile(String expression, Context context)
  {
    return compile(null, expression, context);
  }

  public static FunctionMapping<Integer, ComplexPolynomialSequence, ComplexPolynomialSequenceSequence>
         declare(String name, Context context)
  {
    return context.declare(name, Integer.class, ComplexPolynomialSequence.class, ComplexPolynomialSequenceSequence.class);
  }
}
