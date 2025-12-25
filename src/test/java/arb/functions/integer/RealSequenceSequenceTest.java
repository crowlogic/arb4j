package arb.functions.integer;

import arb.Real;
import arb.expressions.Context;
import junit.framework.TestCase;

public class RealSequenceSequenceTest extends
                                      TestCase
{

  public void testExpressString()
  {
    RealSequenceSequence express = RealSequenceSequence.express("i+j");
    System.out.println("express=" + express);
    RealSequence row = express.apply(3);
    Real         val = row.apply(5);
    assertEquals("8", val.toString());
  }

  public void testExpressString2()
  {
    RealSequenceSequence express = RealSequenceSequence.express("i->i+j");
    RealSequence row = express.apply(3);
    Real         val = row.apply(5);
    assertEquals("8", val.toString());

  }

  public void testExpressString3()
  {
    RealSequenceSequence express = RealSequenceSequence.express("i->j->i+j");
    System.out.println("express=" + express);
    RealSequence row = express.apply(3);
    Real         val = row.apply(5);
    assertEquals("8", val.toString());

  }

  public void testExpressStringIntegral()
  {
    Context              context = new Context(Real.named("x"));
    RealSequenceSequence express = RealSequenceSequence.express("i->j->int(x^(i+j),x=-1..1)",
                                                                context);
    RealSequence         row     = express.apply(3);
    Real                 val     = row.apply(5);
    assertEquals(2.0 / 9.0, val.doubleValue());
  }

  public void testExpressStringSum()
  {
    Context              context = new Context(Real.named("x"));
    RealSequenceSequence express = RealSequenceSequence.express("i->j->sum(k{k=i..j})",
                                                                context);
    RealSequence         row     = express.apply(3);
    Real                 val     = row.apply(5);
    assertEquals(12.0, val.doubleValue());
  }
  
  public void testExpressStringSumFuncSyntax()
  {
    Context              context = new Context(Real.named("x"));
    RealSequenceSequence express = RealSequenceSequence.express("i->j->sum(k,k=i..j)",
                                                                context);
    RealSequence         row     = express.apply(3);
    Real                 val     = row.apply(5);
    assertEquals(12.0, val.doubleValue());
  }

  
}
