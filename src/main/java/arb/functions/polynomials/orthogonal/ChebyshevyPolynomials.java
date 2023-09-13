package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.OrthogonalBasis;
import arb.Real;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

public class ChebyshevyPolynomials extends
                                   JacobiPolynomials<ChebyshevPolynomial>

{

  @Override
  public Iterator<ChebyshevPolynomial> iterator()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    assert false : "TODO: return 1/sqrt(1-t^2)";
    return null;
  }

  @Override
  public Domain<Real> getDomain()
  {
    assert false : "TODO: return [-1,1]";
    return null;
  }

}
