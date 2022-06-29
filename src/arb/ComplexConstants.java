package arb;

public class ComplexConstants
{
  public static final Complex π = new Complex();


  static
  {
    π.getReal().pi(256);
  }
}
