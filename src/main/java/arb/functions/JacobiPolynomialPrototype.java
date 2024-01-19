package arb.functions;

import static arb.RealConstants.negHalf;

import java.util.Collections;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;
import arb.utensils.ShellFunctions;

/**
 * The prototype of what the code-generatr generates for the
 * {@link JacobiPolynomialSequence}
 */
public class JacobiPolynomialPrototype implements
                                       Function<Integer, RealPolynomial>
{
  public Real                              α;
  public Real                              β;

  public Real                              r0  = new Real();
  public Real                              r1  = new Real();
  public RealPolynomial                    rp0 = new RealPolynomial();
  public RealPolynomial                    rp1 = new RealPolynomial();
  public RealPolynomial                    rp2 = new RealPolynomial();
  public RealPolynomial                    rp3 = new RealPolynomial();
  public Integer                           i0  = new Integer();
  public RealPolynomial                    rp4 = new RealPolynomial();
  public RealPolynomial                    rp5 = new RealPolynomial();
  public Real                              r2  = new Real();
  public Real                              r3  = new Real();
  public Integer                           i1  = new Integer();
  public RealPolynomial                    rp6 = new RealPolynomial();
  public RealPolynomial                    rp7 = new RealPolynomial();
  public RealPolynomial                    rp8 = new RealPolynomial();
  public Real                              r4  = new Real();
  public Real                              r5  = new Real();
  public Function<Integer, RealPolynomial> P   = null;
  public Function<Integer, RealPolynomial> A   = null;
  public Function<Real, Real>              B   = null;
  public Function<Real, Real>              C   = null;
  public Function<Real, Real>              E   = null;
  public JacobiPolynomialSequence          seq;

  public JacobiPolynomialPrototype(JacobiPolynomialPrototype p)
  {
    α   = p.α;
    β   = p.β;
    seq = new JacobiPolynomialSequence(α,
                                       β);
    C   = seq.C;
    A   = seq.A;
    B   = seq.B;
    E   = seq.E;
  }

  public JacobiPolynomialPrototype(Real a, Real b)
  {
    α   = a;
    β   = b;
    seq = new JacobiPolynomialSequence(a,
                                       b);
    C   = seq.C;
    A   = seq.A;
    B   = seq.B;
    E   = seq.E;

  }

  private Function<Integer, RealPolynomial> constructNewInstanceOfP()
  {
    return new JacobiPolynomialPrototype(this);
  }

  public static void main(String args[])
  {
    JacobiPolynomialSequence seq = new JacobiPolynomialSequence(negHalf,
                                                                negHalf);

    try ( JacobiPolynomialPrototype Pn = new JacobiPolynomialPrototype(seq.α,
                                                                       seq.β);)
    {
      RealPolynomial polys[] = new RealPolynomial[8];
      for (int n = 0; n < polys.length; n++)
      {
        RealPolynomial p = Pn.evaluate(new Integer(n), 128, new RealPolynomial());
        polys[n] = p;
        System.out.format("P(%d)=%s\n", n, p);
      }
     ShellFunctions.plot(-1, 1, 1000, polys);

    }
  }

  @Override
  public RealPolynomial evaluate(final Integer in, int order, int bits, RealPolynomial result)
  {

    final int index = in.getSignedValue();

    assert index >= 0 : String.format("index = %d < 0", index);

//    if (index >= seq.cache.size())
//    {
//      seq.cache.addAll(Collections.nCopies(index + 1 - seq.cache.size(), null));
//    }
//
//    RealPolynomial cachedResult = seq.cache.get(index);
//    if (cachedResult != null)
//    {
//      result.set(cachedResult);
//      return result;
//    }

    switch (index)
    {
    case 0:
      // no point caching this, faster anyhow
      result.set(1);
      break;
    case 1:
      C.evaluate(r0.set(1), order, bits, r1)
       .mul(result.identity(), bits, rp0)
       .sub(β, bits, rp1)
       .add(α, bits, rp2)
       .div(2, bits, result);
      break;
    default:

      if (P == null)
      {
        P = constructNewInstanceOfP();
      }

      P.evaluate(in.sub(1, bits, i0), order, bits, rp4);
      P.evaluate(in.sub(2, bits, i1), order, bits, rp6);

      A.evaluate(in, order, bits, rp3)
       .mul(rp4, bits, rp5)
       .sub(B.evaluate(r2.set(in), order, bits, r3).mul(rp6, bits, rp7), bits, rp8)
       .div(E.evaluate(r4.set(in), order, bits, r5), bits, result);
      break;
    }

    //seq.cache.set(index, result);
    return result;
  }

  public void close()
  {
    r0.close();
    r1.close();
    rp0.close();
    rp1.close();
    rp2.close();
    rp3.close();
    i0.close();
    rp4.close();
    rp5.close();
    r2.close();
    r3.close();
    i1.close();
    rp6.close();
    rp7.close();
    rp8.close();
    r4.close();
    r5.close();
  }
}
