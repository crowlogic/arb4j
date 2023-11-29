package arb.functions.real;

import arb.Real;
import arb.RealConstants;

public class Cool implements
                  RealFunction
{

  public Real         c0 = new Real("1",
                                    128);
  public Real         c1 = new Real("2",
                                    128);
  public Real         α;
  public Real         β;
  public Real         l0 = new Real();
  public Real         l1 = new Real();
  public Real         l2 = new Real();
  public RealFunction d;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return d.evaluate(c0, 0, bits, result)
            .div(c1, bits, l0)
            .add(in.mul(α.sub(β, bits, l1), bits, l2), bits, result);
  }

  public void close()
  {
    this.c0.close();
    this.c1.close();
    this.l0.close();
    this.l1.close();
    this.l2.close();
  }

  public static void main( String args[] )
  {
    Cool cool = new Cool();
    Real hmm = cool.evaluate(RealConstants.one, 128, new Real() );
    System.out.println( "hmm " + hmm );
  }
}
