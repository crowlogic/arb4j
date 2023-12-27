package arb.functions;

import arb.Integer;
import arb.RealPolynomial;

public abstract class A implements
                        Function<Integer, RealPolynomial>
{
//  public Integer      c0 = new Integer("1",
//                                       128);
//  public Integer      c1 = new Integer("2",
//                                       128);
//  public Integer      G;
//  public Integer      x;
//  public Integer      l0;
//  public Integer      l1;
//  public Integer      l2;
//  public Integer      l3;
//  public Integer      l4;
//  public RealFunction C;
//  public RealFunction F;
//
//  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
//  {
//    return F.evaluate(in, order, bits, result)
//            .mul(result, bits, l0)
//            .add(G, bits, l1)
//            .mul(C.evaluate(in, order, bits, l2).sub(c0, bits, l3), bits, l4)
//            .div(c1, bits, result);
//  }
//
//  public A() {
//    l0 = new RealPolynomial();
//    l1 = new RealPolynomial();
//    l2 = new RealPolynomial();
//    l3 = new RealPolynomial();
//    l4 = new RealPolynomial();
//    C = null;
//    F = null;
//  }
//
//  public void close()
//  {
//    c0.close();
//    c1.close();
//    l0.close();
//    l1.close();
//    l2.close();
//    l3.close();
//    l4.close();
//  }
}