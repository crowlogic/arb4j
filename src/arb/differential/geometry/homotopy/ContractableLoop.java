package arb.differential.geometry.homotopy;

import arb.topological.*;

/**
 * A contractable loop is one that can be continuously shrunk to a point without
 * any breaks or discontinuities
 */
public interface ContractableLoop extends
                                  Loop,
                                  ContractableSpace
{

}
