package arblib;

import static arblib.arblib.*;

public class ComplexConstants
{
  public static final Complex π = new Complex();


  static
  {
    π.getReal().pi(256);
  }
}
