package arb.groups;

import arb.theoretical.Theory;

/**
 * Galois theory, originally introduced by Évariste Galois, provides a
 * connection between field theory and group theory. This connection, the
 * fundamental theorem of Galois theory, allows reducing certain problems in
 * field theory to group theory, which makes them simpler and easier to
 * understand.
 * 
 * Galois introduced the subject for studying roots of polynomials. This allowed
 * him to characterize the polynomial equations that are solvable by radicals in
 * terms of properties of the permutation group of their roots—an equation is
 * solvable by radicals if its roots may be expressed by a formula involving
 * only integers, nth roots, and the four basic arithmetic operations. This
 * widely generalizes the Abel–Ruffini theorem, which asserts that a general
 * polynomial of degree at least five cannot be solved by radicals.
 * 
 * Galois theory has been used to solve classic problems including showing that
 * two problems of antiquity cannot be solved as they were stated (doubling the
 * cube and trisecting the angle), and characterizing the regular polygons that
 * are constructible (this characterization was previously given by Gauss, but
 * all known proofs that this characterization is complete require Galois
 * theory).
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Galois_theory">GaloisTheory@Wikipedia</a>
 */
public interface GaloisTheory extends
                              Theory
{

}
