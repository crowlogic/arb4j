package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.ComplexPolynomial;
import arb.Real;
import arb.arb;
import arb.domains.Domain;
import arb.functions.complex.HolomorphicFunction;

public class HermitePolynomials implements
                                OrthogonalPolynomials
{

  @Override
  public Iterator<ComplexPolynomial> iterator()
  {
    return new Iterator<ComplexPolynomial>()
    {
      int  i     = 0;
      Real order = new Real();

      @Override
      public boolean hasNext()
      {
        return true;
      }

      @Override
      public ComplexPolynomial next()
      {
        assert false : "TODO: workout the details on this API";
        Real poly = Real.newVector(i);
        order.set(i++);
        arb.arb_hypgeom_hermite_h(poly, order, null, 0);
        // TODO Auto-generated method stub
        return null;
      }
    };
  }

  @Override
  public HolomorphicFunction getDistribution()
  {
    // TODO Auto-generated method stub
    return null;
  }

  /**
   * 
   */
  @Override
  public Domain getDomain()
  {
    // TODO Auto-generated method stub
    return null;
  }

}
