package arb.functions.integer;

import arb.Real;
import junit.framework.TestCase;

public class RealSequenceSequenceTest extends
                                      TestCase
{

  public void testExpressString()
  {
    RealSequenceSequence express = RealSequenceSequence.express("i+j");
    System.out.println( "express=" + express );
    RealSequence row = express.apply(3);
    Real val = row.apply(5);
    assertEquals( "8", val.toString() );    
  }
  
  public void testExpressString2()
  {
    RealSequenceSequence express = RealSequenceSequence.express("i->i+j");
    System.out.println( "express=" + express );
    RealSequence row = express.apply(3);
    Real val = row.apply(5);
    assertEquals( "8", val.toString() );
    
  }

  
}
