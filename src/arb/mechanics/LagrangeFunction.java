package arb.mechanics;

import arb.functions.Function;

/**
 * A function, related to the method of Lagrange multipliers, that is used to
 * derive necessary conditions for conditional extrema of functions of several
 * variables or, in a wider setting, of functionals.
 * 
 * The primary example is that of locating the local maxima (resp. minima) of a
 * function g of n variables (x1,…,xn)=:x over the set Σ of points x which
 * satisfy the constraints g1(x)=…=gm(x)=0.
 * 
 * The method of Lagrange multipliers is particularly useful because the
 * corresponding conditions can often be solved without resorting to explcit
 * formulae describing the set of points in Σ in terms of n−m independent
 * variables.
 * 
 * In fact the necessary conditions obtained by means of a Lagrange function
 * form often a closed system of relations, i.e. a system of n+m equations in
 * n+m variables.
 * 
 * Lagrange functions are used in both theoretical questions of linear and
 * non-linear programming as in applied problems where they provide often
 * explicit computational methods.
 * 
 * @author crow
 *
 */
public interface LagrangeFunction<P, I> extends
                                 Function<P, I>
{

}
