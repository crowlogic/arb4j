package arb.expressions;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexPolynomialSequence;

public class ExpressionSequenceExperiment
{
  private static final Logger log = LoggerFactory.getLogger(ExpressionSequenceExperiment.class);

  @Test
  public void testApproachRegisterTAsT0()
  {
    int bits = 128;
    try ( ComplexFunction f = ComplexFunction.express("t➔exp(t)");
          Complex         t0 = new Complex(new Real("1.0", bits)) )
    {
      Context ctx = new Context();
      ctx.registerFunctionMapping("f", f, Complex.class, Complex.class);
      Complex t = new Complex(t0);
      t.setName("t");
      ctx.registerVariable(t);
      ComplexPolynomialSequence a = ComplexPolynomialSequence.express("a:k➔diff(f(t), t^k)/Γ(k+1)", ctx);
      assertNotNull(a);
      for (int k = 1; k <= 5; k++)
      {
        try ( ComplexPolynomial result = a.evaluate(new Integer(k), bits) )
        {
          log.debug("a({}) = {}", k, result);
          assertNotNull(result);
        }
      }
    }
  }
}
