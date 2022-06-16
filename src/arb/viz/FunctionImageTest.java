package arb.viz;

import static java.lang.System.out;

import junit.framework.TestCase;

public class FunctionImageTest extends
                               TestCase
{
  public void testIt()
  {
    FunctionImage image = new FunctionImage(2500, 1250);
    out.println("image=" + image );
  }
}
