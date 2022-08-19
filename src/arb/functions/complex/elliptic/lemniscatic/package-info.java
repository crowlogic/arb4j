/**
 * a lemniscatic {@link arb.functions.complex.elliptic.EllipticFunction} is an
 * elliptic function related to the arc length of a lemniscate of Bernoulli
 * studied by Giulio Carlo de' Toschi di Fagnano in 1718. It has a square period
 * lattice and is closely related to the Weierstrass elliptic function when the
 * Weierstrass invariants satisfy g2 = 1 and g3 = 0. In the lemniscatic case,
 * the minimal half period ω1 is real and equal to
 * 
 * where Γ is the gamma function. The second smallest half period is pure
 * imaginary and equal to iω1. In more algebraic terms, the period lattice is a
 * real multiple of the Gaussian integers.
 * 
 * The constants e1, e2, and e3 are given by
 * 
 * The case g2 = a, g3 = 0 may be handled by a scaling transformation. However,
 * this may involve complex numbers. If it is desired to remain within real
 * numbers, there are two cases to consider: a > 0 and a < 0. The period
 * parallelogram formed by the
 * {@link arb.functions.complex.elliptic.FundamentalPeriodPair} is either a
 * square or a rhombus.
 */
package arb.functions.complex.elliptic.lemniscatic;
