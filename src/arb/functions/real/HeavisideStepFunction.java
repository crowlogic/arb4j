package arb.functions.real;

import static java.lang.Math.*;

import arb.*;

/**
 * Let x be the independent variable:<br>
 * 
 * 0 if x <= 0 <br>
 * 1 if x > 0 otherwise <br>
 */
public class HeavisideStepFunction implements
                                   RealFunction
{

  @Override
  public Real evaluate(Real t, int order, int prec, Real res)
  {
    order = max(1, order);
    assert order < 2;
    if (t.compareTo(ComplexConstants.ZERO.getReal()) <= 0)
    {
      res.zero();
    }
    else
    {
      res.one();
    }
    return res;
  }

}
