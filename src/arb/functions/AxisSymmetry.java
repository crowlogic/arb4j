package arb.functions;

public class AxisSymmetry implements Symmetry
{
  public AxisSymmetry(boolean conjugate)
  {
    this.conjugate = conjugate;
  }

  boolean conjugate;

  @Override
  public boolean isConjugate()
  {
    return conjugate;
  }
  

}
