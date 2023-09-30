package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.Real;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

public class ChebyshevyPolynomials extends
                                   JacobiPolynomials<ChebyshevPolynomialOfTheFirstKind>

{

  public ChebyshevyPolynomials(int n)
  {
    super(n,
          0.5,
          0.5);
  }

  @Override
  public Iterator<ChebyshevPolynomialOfTheFirstKind> iterator()
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
