package arb.functions.integer;

import arb.*;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

public class ComplexFunctionSequenceTest2 extends
                                          TestCase
{
  
  public void testComplexFunctionSequence()
  {
    var context = new Context();
    var a = ComplexFunctionSequence.express("a:n➔t➔sin(tⁿ)",context);
    ComplexFunction a3 = a.apply(3);
    ComplexFunction a4 = a.apply(4);
    var y = a3.eval(2.3, new Complex());
    assertTrue( y.im().isZero() );
    assertEquals( -0.3888385626535563 , y.re().doubleValue() );
    var z = a4.eval(1.4, new Complex());
    assertTrue( z.im().isZero() );
    assertEquals( -0.6442233060647573 , z.re().doubleValue() );
    
  }
  
  public void testComplexFunctionSequenceDividedByRealNumber()
  {
    var context = new Context(Real.named("r").set("2.3",128));    
    var seq = ComplexFunctionSequence.express("seq:n->t->sin(t^n)",context);
    var divseq = ComplexFunctionSequence.express("divseq:n->t->seq(n)(t)/r",context);
    assertTrue( "gr8", false);
  }
}
