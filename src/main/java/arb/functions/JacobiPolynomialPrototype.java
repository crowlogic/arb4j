package arb.functions;

import static arb.RealConstants.negHalf;

import java.util.Collections;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;

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

  public JacobiPolynomialPrototype(JacobiPolynomialSequence seq)
  {
    this.seq = seq;
  }

  private Function<Integer, RealPolynomial> constructNewElement(JacobiPolynomialSequence seq)
  {
    var element = new JacobiPolynomialPrototype(seq);
    element.α = seq.α;
    element.β = seq.β;
    element.A = seq.A;
    element.C = seq.C;
    element.B = seq.B;
    element.E = seq.E;
    return element;
  }

  public static void main(String args[])
  {
    try ( var seq = new JacobiPolynomialSequence(negHalf,
                                                 negHalf);
          JacobiPolynomialPrototype Pn = new JacobiPolynomialPrototype(seq);
          JacobiPolynomialPrototype PnMinus1 = new JacobiPolynomialPrototype(seq);
          JacobiPolynomialPrototype PnMinus2 = new JacobiPolynomialPrototype(seq);)
    {
      Pn.P       = PnMinus1;
      PnMinus1.P = PnMinus2;
      PnMinus2.α = PnMinus1.α = Pn.α = seq.α;
      PnMinus2.β = PnMinus1.β = Pn.β = seq.β;
      PnMinus2.A = PnMinus1.A = Pn.A = seq.A;
      PnMinus2.C = PnMinus1.C = Pn.C = seq.C;
      PnMinus2.B = PnMinus1.B = Pn.B = seq.B;
      PnMinus2.E = PnMinus1.E = Pn.E = seq.E;
      
      //Pn.evaluate(new Integer(2), 128, new RealPolynomial())
      
      for (int i = 0; i < 5; i++)
      {
        var p = Pn.evaluate(new Integer(i), 128, new RealPolynomial());
        System.out.format("P(%d)=%s\n", i, p);
      }
    }
  }

  @Override
  public RealPolynomial evaluate(final Integer in, int order, int bits, RealPolynomial result)
  {
    System.out.format("evaluate(in=%s,order=%d,bits=%d,result=%s)\n", in, order, bits, result);

    final int index = in.getSignedValue();

    assert index >= 0 : String.format("index = %d < 0", index);

    if (index >= seq.cache.size())
    {
      seq.cache.addAll(Collections.nCopies(index + 1 - seq.cache.size(), null));
    }

    RealPolynomial cachedResult = seq.cache.get(index);
    if (cachedResult != null)
    {
      System.out.println("Using cached result for index: " + index);
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
      RealPolynomial lastP = seq.cache.get(index - 1);
      if (lastP != null)
      {
        System.out.println( "Using cache lastP " + lastP + " at " + (index-1) );
        rp4.set(lastP);
      }
      else
      {
        if (P == null)
        {
          System.out.println( "Constructing new element at " + (index-1) );

          P = constructNewElement(seq);
        }
        P.evaluate(in.sub(1, bits, i0), order, bits, rp4);
        seq.cache.set(index - 1, rp4);
      }
      RealPolynomial PBeforeLast = seq.cache.get(index - 2);
      if (PBeforeLast != null)
      {
        System.out.println( "Using cache PBeforeLast " + PBeforeLast + " at " + (index-2) );

        rp6.set(PBeforeLast);
      }
      else
      {
        if (P == null)
        {
          P = constructNewElement(seq);
        }
        P.evaluate(in.sub(2, bits, i1), order, bits, rp6);
        seq.cache.set(index - 2, rp6);
      }
      A.evaluate(in, order, bits, rp3)
       .mul(rp4, bits, rp5)
       .sub(B.evaluate(r2.set(in), order, bits, r3).mul(rp6, bits, rp7), bits, rp8)
       .div(E.evaluate(r4.set(in), order, bits, r5), bits, result);
      break;
    }
    seq.cache.set(index, result);
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
