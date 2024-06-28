package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.stochastic.HarmonizableRandomProcess;
import arb.stochastic.processes.integrators.State;

/**
 * A band-limited process is a {@link StationaryProcess} whose spectral support
 * is contained in an interval and is zero outside interval. The generalization
 * of {@link BandLimitedProcess}es are the {@link HarmonizableRandomProcess}es
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface BandLimitedProcess<S extends State> extends StationaryProcess<S>
{

}
