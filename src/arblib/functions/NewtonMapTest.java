package arblib.functions;

import junit.framework.TestCase;

public class NewtonMapTest extends
                           TestCase
{
  public void testNewtonMap()
  {
    NewtonMap newtonMap = new NewtonMap(new RealSineFunction());
  }
}
