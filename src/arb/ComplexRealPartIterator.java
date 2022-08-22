package arb;

public class ComplexRealPartIterator extends
                                     ComplexPartIterator
{

  public ComplexRealPartIterator(Complex x)
  {
    this.x = x;
  }

  @Override
  public Real next()
  {
    return x.get(i++).getReal();
  }

}
