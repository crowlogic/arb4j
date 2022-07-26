package arb.curves;

import arb.Complex;
import arb.Real;

public class Ellipse implements
                     PlaneCurve,
                     AutoCloseable
{
  final boolean managesParameters;

  public Ellipse()
  {
    super();
    this.a            = new Real();
    this.b            = new Real();
    managesParameters = true;
  }

  public Ellipse(Real a, Real b)

  {
    super();
    this.a                 = a;
    this.b                 = b;
    this.managesParameters = false;
  }

  public Real a;
  public Real b;

  @Override
  public Complex evaluate(Real t, int order, int prec, Complex y)
  {
    assert false : "implement y = a*cos(t)+ i*b*sin(t) after the ExpressionCompiler is implemented";
    return null;
  }

  @Override
  public void close() throws Exception
  {
    if (managesParameters)
    {
      a.close();
      b.close();
      a = b = null;
    }

  }

}
