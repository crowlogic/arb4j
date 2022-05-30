package arb.operators;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

public class TransferOperator<F extends ComplexFunction> implements
                             LinearOperator,
                             ComplexFunction
{
  public TransferOperator(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    int inverseBranchCount = f.getInverseBranchCount();
    try ( Complex a = new Complex();)
    {
      for (int branch = 0; branch < inverseBranchCount; branch++)
      {
        ComplexFunction finverse             = f.inverse(branch);
        ComplexFunction finverseDifferential = finverse.differential();
        throw new UnsupportedOperationException("TODO: finish");
        // finverseDifferential.evaluate(z, order, prec, w)
      }
    }
    // TODO Auto-generated method stub
    return null;
  }

}
