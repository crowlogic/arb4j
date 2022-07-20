package arb.functions.complex;

import arb.*;
import arb.functions.*;
import arb.operators.*;

/**
 * The conjugate of this function is {@link YFunction}
 * 
 * @author crow
 */
public class XFunction extends
                       Composition<SFunction, ZFunction> implements SymmetricFunction
{

  @Override
  public String toString()
  {
    return "X=" + super.toString();
  }

  public XFunction()
  {
    super(new SFunction(),
          new ZFunction());
  }

  public XFunction(Real scale)
  {
    super(new SFunction(scale),
          new ZFunction());
  }

  @Override
  public ComplexFunction adjoint()
  {
    return new YFunction(f.a);
  }

  @Override
  public int getNumberOfSymmetries()
  {    
    return 2;
  }

  @Override
  public Symmetry getSymmetry(int symmetry)
  {
    switch(symmetry)
    {
    case 0:
      return new RealAxisSymmetry(false);
    case 1:
      return new ImaginaryAxisSymmetry(true);
    default:
      throw new IllegalArgumentException( "only 2 symmetries");
    }
  }
}
