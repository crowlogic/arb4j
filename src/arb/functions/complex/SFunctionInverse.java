package arb.functions.complex;

import arb.*;

public class SFunctionInverse implements
                              ComplexFunction
{

  public static final int BRANCH_COUNT = 4;

  public final boolean    horizontalSign, verticalSign;

  /**
   * Quadrartic scaling parameter
   */
  private Real            qs;

  public SFunctionInverse(Real quadraticScale, int branch)
  {
    assert branch >= 0 && branch < BRANCH_COUNT : "branch must be in [0,1,2,3]";
    horizontalSign = branch % 2 == 0;
    verticalSign   = branch % 2 == 1;
    this.qs        = quadraticScale;
  }

  @Override
  public Complex evaluate(Complex point, int order, int prec, Complex res)
  {
    try ( Complex r = new Complex();)
    {
      Complex aNumerator = point.add(1, prec, res).mul(point.pow(2, prec, r), 256, res); // aNumerator = res =
                                                                                         // (quadraticScale+1)*
      Complex aDivisor   = ComplexConstants.complexOne.sub(r, prec, r).sqrt(prec, r);    // aDivisor = sqrt(1-a^2)
      aNumerator.div(aDivisor, prec, res);
      if (horizontalSign)
      {
        res.neg();
      }
      res.add(ComplexConstants.complexOne, prec, res);
      res.sqrt(prec, res);
      if (verticalSign)
      {
        res.neg();
      }
      return res;
    }
  }

}
