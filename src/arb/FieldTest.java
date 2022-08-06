package arb;

import junit.framework.TestCase;

public class FieldTest extends
                       TestCase
{
  public void testAdd()
  {
    Real real = new Real();
    real.add(RealConstants.one, 128);
    assertEquals( RealConstants.one, real );
  }
}
