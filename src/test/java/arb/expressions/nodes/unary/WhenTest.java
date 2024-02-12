package arb.expressions.nodes.unary;

import arb.Integer;
import arb.Real;
import arb.functions.Function;
import arb.functions.IntegerSequence;
import junit.framework.TestCase;

public class WhenTest extends
                      TestCase
{
  public static void testWhen()
  {
    Function<Integer, Real> seq = Function.express(Integer.class, Real.class, "when(n=0,5,n=1,7,else,10)");
    System.out.println( seq.evaluate(new Integer(0), 128, new Real()));
    
  }

}
