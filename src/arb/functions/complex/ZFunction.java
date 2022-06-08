package arb.functions.complex;

import static arb.arb.*;

import arb.Complex;
import arb.Real;
import arb.util.AutoArrayList;

public class ZFunction implements
                       ComplexFunction
{
  static int prec = 256;

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

  public static Complex Z(Complex z, int order, Complex res, int prec)
  {
    assert res.dim >= order;
    assert prec > 0;
    acb_dirichlet_hardy_z(res, z, null, null, order, prec);
    return res;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert w.dim >= order : String.format("wdim=%d >= order = %d", w.dim, order );
    assert prec > 0;
    acb_dirichlet_hardy_z(w, z, null, null, order, prec);
    return w;
  }

}
