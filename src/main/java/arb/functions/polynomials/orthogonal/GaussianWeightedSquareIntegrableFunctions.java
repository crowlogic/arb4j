package arb.functions.polynomials.orthogonal;

import arb.Real;
import arb.functions.real.RealFunction;
import arb.operators.LinearFunctional;
import arb.space.topological.InnerProductSpace;
import arb.space.topological.VectorSpace;

public class GaussianWeightedSquareIntegrableFunctions implements
                                                       InnerProductSpace<Real, RealFunction>
{

  @Override
  public Real field()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public VectorSpace<Real, RealFunction> add(RealFunction a, RealFunction b, int precision, RealFunction result)
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public VectorSpace<Real, RealFunction> scale(RealFunction vector, Real scalar, int precision, RealFunction result)
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public VectorSpace<Real, LinearFunctional<Real, RealFunction>> dual()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public RealFunction innerProduct(RealFunction that, int prec, Real result)
  {
    // TODO Auto-generated method stub
    return null;
  }

}
