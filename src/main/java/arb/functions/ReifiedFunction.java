package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Marker interface for concrete function objects that carry their own named
 * indeterminate as a string — polynomials, rational functions, and any
 * downstream concrete type whose value <em>is</em> a function and whose input
 * variable has a symbolic name attached to the instance itself.
 *
 * <p>
 * The expression-language parser uses this interface to recognize that
 * {@code p(v)}, when {@code p} is a registered context variable whose runtime
 * class implements {@code ReifiedFunction} and whose
 * {@link #getIndependentVariableName() independent variable name} equals
 * {@code v}, is the symbolic identity in the polynomial sense and should
 * resolve to {@code p} directly rather than to an evaluation call. When the
 * argument's name does <em>not</em> match the indeterminate, the call falls
 * through to ordinary {@link arb.expressions.nodes.unary.FunctionalEvaluationNode}
 * dispatch.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ReifiedFunction
{
  String getIndependentVariableName();

  ReifiedFunction setIndependentVariableName(String name);
}
