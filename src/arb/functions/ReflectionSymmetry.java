package arb.functions;

public class ReflectionSymmetry implements
                                Symmetry
{
  public ReflectionSymmetry(boolean conjugate)
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
