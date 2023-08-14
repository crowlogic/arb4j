package arb.functions.real;

import arb.*;

public class EmpiricalVarianceStructure implements
                                        RealFunction
{
  @Override
  public void close()
  {
    γ.close();
    sampler.close();
  }

  public EmpiricalVarianceStructure(RealFunction f,
                                    FloatInterval domain,
                                    arb.Float δh)
  {
    this.f  = f;
    sampler = new FunctionSampler(domain,
                                  δh);
    dataset = sampler.dataSets.get(0);
    data    = dataset.data;
    n       = data.getNumRows() / 3;
    γ       = data.getRow(1).varianceStructure(n, 128, Real.newVector(n));
    assert false : "see FunctionPlotter";
  }

  RealFunction            f;
  private FunctionSampler sampler;
  private Real            γ;
  private int             n;
  private RealDataSet     dataset;
  private RealMatrix      data;

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert false : "implements this as a step funciton based on the discretization computed in the constructor";
    return null;
  }

}
