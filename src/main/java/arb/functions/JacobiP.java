package arb.functions;

import static arb.RealConstants.negHalf;

import java.util.ArrayList;
import java.util.Collections;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.JacobiPolynomial;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;

/**
 * bad *ASS*
 */
public class JacobiP implements
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

  public static void main(String args[])
  {
    try ( var seq = new JacobiPolynomialSequence<JacobiPolynomial<?>>(negHalf,
                                                                      negHalf,
                                                                      5);
          JacobiP P = new JacobiP();)
    {

      P.P = P;
      P.α = seq.α;
      P.β = seq.β;
      P.A = seq.A;
      P.C = seq.C;
      P.B = seq.B;
      P.E = seq.E;
      var p2 = P.evaluate(new Integer(3), 128, new RealPolynomial());
      System.out.println("P(2)=" + p2);
    }
  }

  ArrayList<RealPolynomial> cache = new ArrayList<>();

  @Override
  public RealPolynomial evaluate(final Integer in, int order, int bits, RealPolynomial result)
  {
    System.out.format("P.eval(in=%s, order=%s, bits=%s, result=%s)\n", in, order, bits, result);

    final int index = in.getSignedValue();
    assert index >= 0 : String.format("index = %d < 0", index);

    if (index >= cache.size())
    {
      cache.addAll(Collections.nCopies(index + 1 - cache.size(), null));
    }

    RealPolynomial cachedResult = cache.get(index);
    if (cachedResult != null)
    {
      result.set(cachedResult);
      return result;
    }

    switch (index)
    {
    case 0:
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
      RealPolynomial lastP = cache.get(index - 1);
      if (lastP != null)
      {
        rp4.set(lastP);
      }
      else
      {
        P.evaluate(in.sub(1, bits, i0), order, bits, rp4);
      }
      RealPolynomial PBeforeLast = cache.get(index - 2);
      if (PBeforeLast != null)
      {
        rp6.set(PBeforeLast);
      }
      else
      {
        int bah = in.getSignedValue() - 2;
        assert bah >= 0 : String.format("index-2=%d < 0", bah);
        Integer fuck = in.sub(2, bits, i1);
        P.evaluate(fuck, order, bits, rp6);
      }
      A.evaluate(in, order, bits, rp3)
       .mul(rp4, bits, rp5)
       .sub(B.evaluate(r2.set(in), order, bits, r3).mul(rp6, bits, rp7), bits, rp8)
       .div(E.evaluate(r4.set(in), order, bits, r5), bits, result);
      break;
    }
    cache.set(index, new RealPolynomial().set(result));
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
