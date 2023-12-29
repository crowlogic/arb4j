package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Compiler;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;

/**
 * This is what the generated expression in {@link JacobiPolynomialSequence#A}
 */
public abstract class A implements
                        Function<Integer, RealPolynomial>
{
  public Real                    c0 = new Real("1",
                                               128);
  public Real                    c1 = new Real("2",
                                               128);
  public Real                    G;
  public RealPolynomial          l0;
  public RealPolynomial          l1;
  public Real                    l2;
  public RealPolynomial          l3;
  public RealPolynomial          l4;
  public Function<Integer, Real> C;
  public Function<Integer, Real> F;

  /**
   * Modify
   * {@link Compiler#declareVariables(arb.expressions.Expression, org.objectweb.asm.ClassVisitor, Iterable, boolean) where
   * its hard coded to use the Expression#domainClassDescriptor and make it so that Expression#intermediateVariables consists 
   * and also modify Compiler#declareFunctions(arb.expressions.Expression,
   * org.objectweb.asm.ClassVisitor, arb.expressions.Functions)
   */
  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    return F.evaluate(in, order, bits, l2)
            .mul(result.identity(), bits, l0)
            .add(G, bits, l1)
            .mul(C.evaluate(in, order, bits, l2).sub(c0, bits, l3), bits, l4)
            .div(c1, bits, result);
  }

  public A()
  {
    l0 = new RealPolynomial();
    l1 = new RealPolynomial();
    l2 = new Real();
    l3 = new RealPolynomial();
    l4 = new RealPolynomial();
    C  = null;
    F  = null;
  }

  public void close()
  {
    c0.close();
    c1.close();
    l0.close();
    l1.close();
    l2.close();
    l3.close();
    l4.close();
  }
}