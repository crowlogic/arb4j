import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class tanhln1PlusyTo2 implements
                             RealFunction
{

  public Real a;
  public Real α;
  public Real b;
  public Real r;
  public Real v;
  public Real x;
  public Real y;
  public Real z;
  public Real λ;
  public Real n;
  public Real ℝ1 = new Real();
  public Real ℝ2 = new Real();
  public Real ℝ3 = new Real();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return in.pow(2, bits, ℝ1).add(1, bits, ℝ2).log(bits, ℝ3).tanh(bits, result);
  }

  public void close()
  {

    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
  }
}
