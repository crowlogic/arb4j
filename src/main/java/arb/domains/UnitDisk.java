package arb.domains;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.Topology;

/**
 * The UnitDisc class represents the mathematical concept of a unit disc in the
 * complex plane, which is a compact subspace.
 *
 * In this class, the unit disc is defined as the set of complex numbers with
 * magnitude (or absolute value) less than or equal to 1.
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UnitDisk implements
                      CompactSubspace<Complex>,
                      Domain<Complex>
{

  // Boolean flag to determine if the disc is closed
  private final boolean isClosed;

  /**
   * Constructs a UnitDisc.
   *
   * @param isClosed true if the disc should be closed (include the boundary),
   *                 false if it should be open (exclude the boundary)
   */
  public UnitDisk(boolean isClosed)
  {
    this.isClosed = isClosed;
  }

  /**
   * Checks whether a given complex number is within the unit disc.
   *
   * @param point the complex number to check
   * @return true if the complex number is within the unit disc, false otherwise
   */
  @Override
  public boolean contains(Complex point)
  {
    try ( Real mod = point.abs(point.bits(), new Real()))
    {
      if (isClosed)
      {
        return mod.compareTo(RealConstants.one) <= 0;
      }
      else
      {
        return mod.compareTo(RealConstants.one) < 0;
      }
    }
  }

  /**
   * Returns the topology structure of the unit disc.
   *
   * Since this class represents a specific mathematical concept, it should
   * provide an appropriate implementation for this method. In this simple
   * example, we'll return null for the sake of brevity, but a real implementation
   * would return an appropriate Topology object.
   *
   * @return the topology structure of the unit disc
   */
  @Override
  public Topology<Complex> topology()
  {
    // This should return an appropriate Topology object in a real implementation.
    // For the sake of this simple example, we'll return null.
    return null;
  }
}
