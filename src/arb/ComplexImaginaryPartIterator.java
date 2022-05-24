package arb;

public class ComplexImaginaryPartIterator extends
                                          ComplexPartIterator
{

  public ComplexImaginaryPartIterator(Complex x)
  {
    this.x = x;
  }

  @Override
  public Real next()
  {
    return x.get(i++).getImag();
  }

}
