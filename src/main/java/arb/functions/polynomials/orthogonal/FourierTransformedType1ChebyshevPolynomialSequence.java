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
    return "\\begin{equation}\n" + "  \\int_{- 1}^1 \\frac{ i e^{i y x} }{y} \\left(\n"
                  + "  \\mathrm{e}^{\\textrm{- i} \\cdot y} { _3 F_1 } \\hspace{-0.17em} \\left( [1, m, -\n"
                  + "  m], \\left[ \\frac{1}{2} \\right], \\frac{\\mathrm{i}}{2y} \\right) -  \\mathrm{e}^{\\textrm{i} \\cdot y} (-1)^m { _3 F_1 }  \\textrm{} \\hspace{-0.17em} \\left( [1, m, - m], \\left[\n"
                  + "  \\frac{1}{2} \\right], - \\frac{\\mathrm{i}}{2y} \\right) \\right)  dy = T_m (x)\n"
                  + "\\end{equation}";
  }

}
