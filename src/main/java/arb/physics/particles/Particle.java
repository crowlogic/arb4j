package arb.physics.particles;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.functions.sequences.Sequence;

/**
 * A particle is a small, localized object to which can be ascribed several
 * physical or chemical properties, such as volume, mass, or charge. In the
 * context of physics, particles are the basic units of matter and the
 * fundamental constituents of the universe. Particles can be classified into
 * two main types: elementary particles, which are not composed of smaller parts
 * and are defined as the basic building blocks of matter (such as quarks and
 * leptons, including electrons), and composite particles, which are made up of
 * two or more elementary particles bound together (such as protons, neutrons,
 * and atoms). The behavior and interactions of particles are described by
 * fields and fundamental forces in the framework of quantum mechanics and
 * quantum field theory.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Particle<X> extends
                         Concept
{
  /**
   * The occupation number sequences associated with fermions are the sets of
   * square-integrable sequences of elements from {0,1}, and for bosons, they are
   * the sets of square-integrable sequences of elements from the set of
   * nonnegative integers. This distinction arises from the Pauli exclusion
   * principle, which applies to {@link Fermion}s but not to {@link Boson}s.
   * Fermions can only occupy a quantum state with at most one particle (thus the
   * elements {0,1}), whereas bosons can occupy a quantum state with any
   * nonnegative integer number of particles.
   * 
   * @return
   */
  public Sequence<X> occuptationNumberSequence();
}
