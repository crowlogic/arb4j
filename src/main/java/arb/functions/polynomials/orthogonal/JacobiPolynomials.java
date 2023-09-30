package arb.functions.polynomials.orthogonal;

import static arb.expressions.Compiler.express;

import java.util.Iterator;

import arb.*;
import arb.domains.Domain;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

public class JacobiPolynomials implements
                               OrthogonalBasis<Real, RealPolynomial>,
                               AutoCloseable
{

  final Real α = new Real();
  final Real β = new Real();

  public JacobiPolynomials(Real α, Real β)
  {
    this.α.set(α);
    this.β.set(β);
  }

  Variables<Real> vars         = new Variables<>();

  RealFunction    orthoMeasure = express("(1-x)^α*(1+x)^β", vars);

  @Override
  public Iterator<RealPolynomial> iterator()
  {
    return new Iterator<RealPolynomial>()
    {
      private int currentIndex = 0;

      @Override
      public boolean hasNext()
      {
        return true;
      }

      @SuppressWarnings("unchecked")
      @Override
      public RealPolynomial next()
      {
        return (RealPolynomial) new JacobiPolynomial(JacobiPolynomials.this,
                                                     currentIndex++);
      }
    };
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    return orthoMeasure;
  }

  public static final Real domain = new Real();

  static
  {
    domain.setRad(MagnitudeConstants.one);
  }

  @Override
  public Domain<Real> getDomain()
  {
    return domain;
  }

  public static void main(String[] args)
  {
    try ( JacobiPolynomials jacobiPolynomials = new JacobiPolynomials(RealConstants.one,
                                                                      RealConstants.two))
    {
      Iterator<RealPolynomial> iterator         = jacobiPolynomials.iterator();
      RealPolynomial           jacobiPolynomial = iterator.next();

      double                   result           = jacobiPolynomial.eval(0.5);

      System.out.println("The value of Jacobi Polynomial is: " + result);
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  @Override
  public void close() throws Exception
  {
    α.close();
    β.close();
  }
}
