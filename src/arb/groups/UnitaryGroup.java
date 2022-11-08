package arb.groups;

/**
 * the {@link UnitaryGroup} of degree n, denoted U(n), is the group of n × n
 * unitary matrices, with the group operation of matrix multiplication. The
 * unitary group is a {@link SubGroup} of the general linear group GL(n, C).
 * Hyperorthogonal group is an archaic name for the unitary group, especially
 * over finite fields. For the group of unitary matrices with determinant 1, see
 * Special unitary group.
 * 
 * In the simple case n = 1, the group U(1) corresponds to the circle group,
 * consisting of all complex numbers with absolute value 1, under
 * multiplication. All the unitary groups contain copies of this group.
 * 
 * The unitary group U(n) is a real Lie group of dimension n2. The Lie algebra
 * of U(n) consists of n × n skew-Hermitian matrices, with the Lie bracket given
 * by the commutator.
 * 
 * @author crow
 *
 */
public interface UnitaryGroup extends
                              LieGroup
{

}
