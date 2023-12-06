package arb.functions.complex.elliptic;

import arb.Complex;
import arb.functions.complex.MeromorphicFunction;

/**
 * Represents an elliptic function, a type of complex function notable for its
 * appearance in various areas of mathematics and physics. These functions are
 * doubly periodic, meaning they repeat their values in two directions in the
 * complex plane.
 * 
 * <p>
 * An elliptic function is a {@link MeromorphicFunction} on the {@link Complex}
 * plane, satisfying two key properties:
 * </p>
 * 
 * <ul>
 * <li><b>Doubly Periodic:</b> There exist two non-zero complex numbers
 * {@code ω1} and {@code ω2}, with a non-real ratio, such that for all {@code z}
 * in the complex plane, {@code f(z + ω1) = f(z)} and {@code f(z + ω2) = f(z)}.
 * These numbers are the periods of the function.</li>
 * <li><b>Meromorphic:</b> The function may have poles but is otherwise analytic
 * throughout its domain.</li>
 * </ul>
 * 
 * <p>
 * Elliptic functions, such as the Weierstrass {@code ℘}-function and the Jacobi
 * elliptic functions, originally arose in the context of inverting elliptic
 * integrals. While certain elliptic functions can be seen as the inverse of
 * elliptic integrals, not every elliptic function is directly an inverse of an
 * elliptic integral. Elliptic functions originated that way but are not limited
 * to that form. The relationship stems more from the historical between the
 * development of these concepts.
 * </p>
 *
 * <p>
 * Properties of elliptic functions include:
 * </p>
 * <ul>
 * <li>The set of all periods of an elliptic function forms a lattice in the
 * complex plane.</li>
 * <li>Some elliptic functions are even or odd functions.</li>
 * <li>Elliptic functions often satisfy complex addition theorems.</li>
 * </ul>
 * 
 * <p>
 * Applications of elliptic functions:
 * </p>
 * <ul>
 * <li>In complex analysis, they serve as examples of functions with complex
 * multiplication.</li>
 * <li>In number theory, they are used in the study of elliptic curves, with
 * applications in cryptography.</li>
 * <li>In theoretical physics, they appear in the context of integrable systems
 * and solitons.</li>
 * <li>In algebraic geometry, they provide a rich source of examples and
 * problems.</li>
 * <li>In gravitation and celestial mechanics, they are used to describe the
 * motion of celestial bodies and in the formulation of general relativity.</li>
 * </ul>
 * 
 * 
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @see arb.functions.complex.MeromorphicFunction
 */
public interface EllipticFunction extends
                                  MeromorphicFunction
{

  /**
   * One of the main results of the theory of elliptic functions is the following:
   * Every elliptic function with respect to a given period lattice Λ can be
   * expressed as a rational function in terms of ℘ and ℘′.
   * 
   * @return FundamentalPeriodPair representing the pair of periods (ω1, ω2)
   */
  public FundamentalPeriodPair periodPair();
}
