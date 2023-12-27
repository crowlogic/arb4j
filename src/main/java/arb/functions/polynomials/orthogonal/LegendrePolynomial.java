package arb.functions.polynomials.orthogonal;

import arb.Real;
import arb.RealPolynomial;
import arb.arblib;

/**
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
 */
public class LegendrePolynomial extends
                                RealPolynomial implements
                                AutoCloseable
{

  static
  {
    System.loadLibrary("arblib");
  }

  public LegendrePolynomial(int order)
  {
    this.n = order;

  }

  final int n;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (order < 0 || order > 2)
    {
      throw new UnsupportedOperationException("only 0 <= order <= 2 supported");
    }
    assert res.size() >= order : "result size < order";
    Real resPrime = res.size() > 1 ? res.get(1) : null;
    arblib.arb_hypgeom_legendre_p_ui(res, resPrime, n, t, bits);
    return res;
  }
}
