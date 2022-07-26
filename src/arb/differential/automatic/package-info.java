/**
 * Automatic differentiation (AD), also called algorithmic differentiation,
 * computational differentiation, auto-differentiation, or simply autodiff, is a
 * set of techniques to evaluate the derivative of a function specified by a
 * computer program. AD exploits the fact that every computer program, no matter
 * how complicated, executes a sequence of elementary arithmetic operations
 * (addition, subtraction, multiplication, division, etc.) and elementary
 * functions (exp, log, sin, cos, etc.). By applying the chain rule repeatedly
 * to these operations, derivatives of arbitrary order can be computed
 * automatically, accurately to working precision, and using at most a small
 * constant factor more arithmetic operations than the original program. Figure
 * 1: How automatic differentiation relates to symbolic differentiation
 * 
 * Automatic differentiation is distinct from symbolic differentiation and
 * numerical differentiation. Symbolic differentiation faces the difficulty of
 * converting a computer program into a single mathematical expression and can
 * lead to inefficient code. Numerical differentiation (the method of finite
 * differences) can introduce round-off errors in the discretization process and
 * cancellation. Both of these classical methods have problems with calculating
 * higher derivatives, where complexity and errors increase. Finally, both of
 * these classical methods are slow at computing partial derivatives of a
 * function with respect to many inputs, as is needed for gradient-based
 * optimization algorithms. Automatic differentiation solves all of these
 * problems.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Automatic_differentiation">Wikipedia</a>
 */
package arb.differential.automatic;