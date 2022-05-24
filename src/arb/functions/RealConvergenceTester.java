package arb.functions;

import arb.Real;

public class RealConvergenceTester implements
                                   ConvergenceTester<Real>,
                                   AutoCloseable
{
  double ε;

  Real Δ = new Real();

  private int prec = 256;

  public RealConvergenceTester(int prec, double ε)
  {
    this.ε = ε;
  }

  @Override
  public boolean converged(int iteration, Real previous, Real current)
  {
   // return iteration >= 10;
    Real delta = current.sub(previous, prec, Δ);
    Real absDelta = delta.abs(Δ);    
    return absDelta.doubleValue() <= ε;
  }

  @Override
  public void close() throws Exception
  {
    Δ.close();
  }

}
