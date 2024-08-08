package arb;

import java.lang.foreign.Arena;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFraction implements Field<ComplexFraction>,AutoCloseable
{
  @Override
  public void close()
  {
   if ( arena != null )
   {
     arena.close();
   }
   arena = null;
   realPart = imaginaryPart = parts = null;
  }

  Arena arena ;
  
  Fraction parts;

  Fraction realPart;

  Fraction imaginaryPart;
  
  public ComplexFraction()
  {
    arena = Arena.ofShared();
    parts = Fraction.newVector(arena, 2);
    realPart = parts.get(0);
    imaginaryPart = parts.get(1);
  }

  @Override
  public ComplexFraction additiveIdentity()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction multiplicativeIdentity()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction add(ComplexFraction element, int prec, ComplexFraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public int bits()
  {
    assert false : "TODO";
    return 128;
  }

  @Override
  public int dim()
  {
    assert false : "TODO";
    return 1;
  }

  @Override
  public ComplexFraction div(int j, int prec, ComplexFraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction div(ComplexFraction j, int prec, ComplexFraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction get(int index)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public String getName()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction mul(int x, int prec, ComplexFraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction mul(ComplexFraction x, int prec, ComplexFraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction newFieldElement()
  {
    assert false : "TODO";
    return null;
  }

  public ComplexFraction set(String string)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction sub(ComplexFraction element, int prec, ComplexFraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public ComplexFraction zero()
  {
    assert false : "TODO";
    return null;

  }

  @Override
  public ComplexFraction set(ComplexFraction value)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public GaussianInteger getNumerator()
  {
    assert false : "todo";
    return null;
  }
  
  public GaussianInteger getDenominator()
  {
    assert false : "todo";
    return null;
  }

}
