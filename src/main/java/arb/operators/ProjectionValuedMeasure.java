package arb.operators;

import arb.Field;
import arb.annotations.Observable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.measure.Measure;
import arb.measure.σField;
import arb.space.topological.VectorSpace;

/**
 * <p>
 * A Projection Valued Measure (PVM) maps elements of a {@link σField}
 * (σ-algebra) to {@link ProjectionOperator} on a {@link VectorSpace}. This
 * generalization is particularly relevant in the context of quantum mechanics
 * and operator theory, where {@link Observable}s are represented by such
 * measures.
 * </p>
 * 
 * <pre>
 * Theorem (Stone 1932 and von Neumann 1932): Let U(t) and V(t) be continuous
 * unitary representations of ℝ^d on ℋ satisfying the Weyl relations (3). Then
 * there is a Hilbert space 𝕂 and a unitary map T: ℋ → L²(ℝ^d, 𝕂) that
 * transforms U(t) and V(t) to the Schrödinger representation. The
 * representation is irreducible if and only if 𝕂 is one-dimensional.
 * 
 * For systems with infinitely many degrees of freedom, the analog of the
 * Schrödinger representation is called the Fock representation (see, for
 * instance, Streater and Wightman 1964). However, there are infinitely many
 * other inequivalent irreducible representations as well (Gårding and Wightman
 * 1954) and according to a theorem of Haag (see Streater and Wightman 1964)
 * these cannot be avoided in nontrivial field theories. As mentioned earlier,
 * the maps T implementing other representations of the Weyl relations are
 * related to Fourier integral operators.
 * 
 * Mackey (1969) has given an important reformulation of the Stone–von Neumann
 * theorem. One represents the position observables by orthogonal projections
 * P_E in Hilbert space ℋ for any (Borel) set E ⊆ Q, where Q represents position
 * space. One requires E → P_E to be a {@link ProjectionValuedMeasure}. (For Q =ℝ^3,
 * an example of these are the spectral projections associated with the usual
 * position operators, i.e., with ℋ= L²(ℝ^3), P_E ψ = χ_E ψ where χ_E is the
 * characteristic function of E ⊆ ℝ^3.) If a group G acts on Q, the momentum
 * observables will arise as a representation U(g) of G on ℋ. (For example, if G
 * =ℝ^3 = Q, we obtain U(g) as described earlier.) The position and momentum are
 * linked by U(g) P_E U(g)^−1 = P_{g ⋅ E} where g ⋅ E is the translate of E
 * under g in the given action. Equations (5) are an abstract form of the Weyl
 * relations (3) [or the Heisenberg relations (1)]. One calls a
 * projection-valued measure and a representation satisfying (5) a system of
 * imprimitivity. Mackey then proves a general result of which the Stone–von
 * Neumann theorem is a special case.
 * 
 * Besides G =ℝ^d, one wishes to take the Euclidean group for G and still impose
 * (5). This leads to what is referred to as the Mackey–Wightman system. Since
 * one should only work with expectation values, one should only require U(g) to
 * be a projective representation. As Bargmann has shown, we can then adjust
 * things so that we have a true representation of the covering group
 * G̃=ℝ^3 × SU(2). Mackey and Wightman then use the generalized
 * Stone–von Neumann theorem to show that if we have a system of imprimitivity
 * based on ℝ^3 for G̃, then it is unitarily equivalent to the
 * system, P_E f = χ_E f and (U_{(a, A)} f)(x) = D_A f(A^−1(x - a)) on L²(ℝ^3,
 * 𝕂), where a ∈ ℝ^3, A ∈ SU(2) (which by projection to SO(3), acts on ℝ^3),
 * and D_A is a unitary representation of SU(2) on 𝕂.
 * 
 * Thus the unitary representations of SU(2) classify Euclidean invariant
 * systems. In quantum mechanics texts, the irreducible unitary representations
 * of SU(2) are shown to be of dimension n, n = 1, 2, 3, ..., and correspond to
 * particles of spin s = n / 2.
 * 
 * By analogy with the classical case, one can show that a quantum dynamical
 * system with Hamiltonian operator H_op is Euclidean invariant on ℝ^3 when H_op
 * is a function of the Laplacian; the relevant fact from operator theory is
 * that every translation and rotational invariant operator on ℝ^n is a function
 * of the Laplacian.
 * 
 * We can go to the Galilei group and the Lorentz group as in the classical
 * case. For the Galilei case we are again forced into H_op = - (1 / 2m) Δ
 * acting on spin wave functions. For the case of the Lorentz group things are
 * more interesting. Here H_op depends on the spin and one recovers, for
 * example, the
 * 
 * Klein–Gordon and Dirac operators, as Bargmann and Wigner have shown. Any such
 * H_op satisfies H_op^2 = m^2c^4 - c^2Δ the mass-energy relation, independent
 * of spin. (Mass-zero particles, e.g., the photon and neutrino are exceptional
 * in that they are not localizable in the sense that their position operators
 * have the form previously described, so this case is dealt with separately.)
 * We refer the reader to Varadarajan (1968) for details of the aforementioned
 * results and the appropriate references.
 * </pre>
 * 
 * @param <F> The type of {@link Field} elements.
 * @param <V> The type of {@link VectorSpace}.
 * @param <Σ> The type of {@link σField} containing {@link ProjectionOperator}
 *            instances.
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ProjectionValuedMeasure<F extends Field<? extends F>, V extends VectorSpace<? extends F>, Σ extends σField<? extends ProjectionOperator<? extends F, ? extends V>>>
                                        extends
                                        Measure<ProjectionOperator<? extends F, ? extends V>, Σ>
{
}
