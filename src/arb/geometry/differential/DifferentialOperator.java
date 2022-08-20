package arb.geometry.differential;

import arb.functions.Function;
import arb.functions.FunctionSpace;
import arb.operators.LinearOperator;

/**
 * An order-m linear differential operator is a map A from a function space F1
 * to another function space F2 that can be written as:
 * 
 * A = ∑ | α | ≤ m a α ( x ) D α , where α = ( α 1 , α 2 , ⋯ , α n )
 * 
 * is a multi-index of non-negative integers, | α | = α 1 + α 2 + ⋯ + α n
 * 
 * , and for each α , a_α(x) is a function on some open domain in n-dimensional
 * space. The operator Dα is interpreted as
 * 
 * D α = ∂ | α | ∂ x 1 α 1 ∂ x 2 α 2 ⋯ ∂ x n α n
 * 
 * Thus for a function f ∈ F1
 * 
 * A f = ∑ | α | ≤ m a α ( x ) ∂ | α | f ∂ x 1 α 1 ∂ x 2 α 2 ⋯ ∂ x n α n
 * 
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Differential_operator">DifferentialOperator@Wikipedia</a>
 */
public interface DifferentialOperator<A extends FunctionSpace, B extends FunctionSpace> extends
                                     LinearOperator,
                                     Function<A, B>
{

}
