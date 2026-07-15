package arb.expressions;

import arb.*;
import arb.functions.integer.*;
import arb.functions.complex.*;
import arb.functions.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import junit.framework.TestCase;

public class VariableOrderingTest extends TestCase
{
  private static final Logger log = LoggerFactory.getLogger(VariableOrderingTest.class);
  public void testThreeVarsNoSum()
  {
    Context ctx = new Context();
    
    ComplexFunctionalSequence.express("testSeq:n➔z➔w➔z^(n+w)", ctx);
    
    var mapping = ctx.getFunctionMapping("testSeq");
    assertNotNull("testSeq should be registered in context", mapping);
    
    ComplexFunctionalSequence seq = mapping.instantiate();
    assertNotNull("sequence should instantiate", seq);
    
    int n = 2;
    
    ComplexFunctional func1 = seq.evaluate(n, 128);
    
    Complex z = new Complex();
    try
    {
      z.set(3.0, 0.0);
      
      ComplexFunction func2 = func1.evaluate(z, 1, 128, null);
      
      Complex w = new Complex();
      try
      {
        w.set(4.0, 0.0);
        
Complex result = new Complex();
        func2.evaluate(w, 1, 128, result);

        log.debug("testSeq(n=2, z=3, w=4) = z^(n+w) = 3^(2+4) = 729 = " + result);
      }
      finally
      {
        w.close();
      }
    }
    finally
    {
      z.close();
    }
  }

  public void testVariableOrderingWithSum()
  {
    Context ctx = new Context();
    
    // n is Integer (outermost), then z,w are Complex
    // The sum body uses z and w, the sum bound is n
    
    

    ComplexFunctionalSequence seq = ComplexFunctionalSequence.express("testSum:n➔z➔w➔sum(k➔z+w{k=0..n})", ctx);
    assertNotNull("sequence should instantiate", seq);
    
    int n = 2;
    
    ComplexFunctional func1 = seq.evaluate(n, 128);
    
    Complex z = new Complex();
    try
    {
      z.set(2.0, 0.0);
      
      ComplexFunction func2 = func1.evaluate(z, 1, 128, null);
      
      Complex w = new Complex();
      try
      {
        w.set(3.0, 0.0);
        
Complex result = new Complex();
        func2.evaluate(w, 1, 128, result);

        log.debug("testSum(n=2, z=2, w=3) = sum k=0..2 of (z+w) = 3*(2+3) = 15 = " + result);
      }
      finally
      {
        w.close();
      }
    }
    finally
    {
      z.close();
    }
  }
}