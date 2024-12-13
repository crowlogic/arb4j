package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.NullaryFunction;
import arb.utensils.ShellFunctions;

public class G implements
               NullaryFunction<Fraction>,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0001 = new Integer("2");
  public Real          vℝ0007 = new Real();
  public Real          vℝ0008 = new Real();
  public Real          α;
  public Real          β;

  public static void main( String args[] )
  {
    G G = new G();
    G.α = RealConstants.negHalf;
    G.β = RealConstants.negHalf;
    ShellFunctions.inspect(G);
    var G3 = G.evaluate(3, 128);
    ShellFunctions.inspect(G);

    System.out.println(G + "(3)=" + G3);
  }

  
  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  @Override
  public Fraction evaluate(Object in, int order, int bits, Fraction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return this.α.pow(this.cℤ0001, bits, this.vℝ0007).sub(this.β.pow(this.cℤ0001, bits, this.vℝ0008), bits, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("G.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("G.β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0001.close();
    this.vℝ0007.close();
    this.vℝ0008.close();
  }

  @Override
  public String toString()
  {
    return "G:(α^2)-(β^2)";
  }

  @Override
  public String typeset()
  {
    return "\\left({α}^{2}-{β}^{2}\\right)";
  }
}
