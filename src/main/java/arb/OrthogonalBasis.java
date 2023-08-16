package arb;

import arb.domains.Domain;
import arb.functions.real.RealFunction;

public interface OrthogonalBasis<X extends Field<X>, VE> extends
                                Basis<X, VE>,
                                Iterable<VE>
{

  RealFunction getOrthogonalMeasure();

  Domain<X> getDomain();

}
