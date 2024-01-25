package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.Typesettable;
import arb.domains.Domain;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

public class FourierTransformedType1ChebyshevPolynomialSequence implements
                                                                OrthogonalPolynomialSequence,
                                                                Typesettable
{

  @Override
  public Iterator<RealFunction> iterator()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public ComplexFunction getOrthogonalMeasure()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Domain<?> getDomain()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public String typeset()
  {
    return "\\frac{i}{y}  (e^{- i y} F^+_n (y) - e^{i (\\pi n + y)} F_n^- (y))";
  }

}
