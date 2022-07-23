package arb.functions.complex.numbertheoretic;

import static arb.arb.*;
import static java.lang.Math.max;

import arb.Complex;
import arb.Real;
import arb.functions.complex.HolomorphicFunction;
import arb.utensils.AutoArrayList;

public class ZFunction implements
                       HolomorphicFunction
{
  @Override
  public String toString()
  {
    return "Z";
  }

  static int                           prec         = 128;

  public static AutoArrayList<Real>    roots        = new AutoArrayList<>(i ->
                                                    {
                                                      Real root = new Real();
                                                      nthHardyZero(root, i, prec);
                                                      return root;
                                                    });

  public static AutoArrayList<Complex> complexRoots = new AutoArrayList<>(i ->
                                                    {
                                                      Complex root = new Complex();
                                                      nthHardyZero(root.getReal(), i, prec);
                                                      return root;
                                                    });

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = max(order, 1);

    assert w.dim >= order : String.format("wdim=%d >= order = %d", w.dim, order);
    assert prec > 0;
    assert w.size() >= order;
    try ( Complex q = Complex.newVector(order))
    {
      // we have to do this, because the C code expects the vectors
      // to be contiguous in memory, but this is not done because the memory
      // mapped files are seperate files for each order
      acb_dirichlet_hardy_z(q, z, null, null, order, prec);
      return w.set(q);
    }

  }

}
