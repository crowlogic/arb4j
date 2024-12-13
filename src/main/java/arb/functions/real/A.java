package arb.functions.real;

import static org.objectweb.asm.Opcodes.AALOAD;

import arb.*;
import arb.Integer;
import arb.functions.rational.RationalFunctionSequence;
import arb.utensils.ShellFunctions;

public class A implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean          isInitialized;
  public final Integer    cℤ0002 = new Integer("1");
  public final Integer    cℤ0001 = new Integer("2");
  public RationalFunction vℚ0004 = new RationalFunction();
  public RationalFunction vℚ0005 = new RationalFunction();
  public Real             vℝ0003 = new Real();
  public Fraction         vf0005 = new Fraction();
  public Real             vℝ0002 = new Real();
  public Fraction         vf0004 = new Fraction();
  public Fraction         vf0003 = new Fraction();
  public RationalFunction vℚ0001 = new RationalFunction();
  public RationalFunction vℚ0002 = new RationalFunction();
  public RationalFunction vℚ0003 = new RationalFunction();
  public C                C;
  public F                F;
  public Real             α;
  public Real             β;

  public static void main(String args[])
  {
    C C = new C();
    A A = new A();
    F F = new F();
    F.C = C;   
    A.C = C;
    A.F = F;
    A.α = RealConstants.negHalf;
    A.β = RealConstants.negHalf;
    ShellFunctions.inspect(A);
    var A3 = A.evaluate(3, 128);
    ShellFunctions.inspect(A);

    System.out.println(A + "(3)=" + A3);
  }

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return ((Fraction) this.F.evaluate(n,
                                       order,
                                       bits,
                                       this.vf0003)).mul(this.vℚ0001.identity(), bits, this.vℚ0002)
                                                    .add(this.α.pow(this.cℤ0001, bits, this.vℝ0002), bits, this.vℚ0003)
                                                    .sub(this.β.pow(this.cℤ0001, bits, this.vℝ0003), bits, this.vℚ0004)
                                                    .mul(((Fraction) this.C.evaluate(n,
                                                                                     order,
                                                                                     bits,
                                                                                     this.vf0004)).sub(this.cℤ0002,
                                                                                                       bits,
                                                                                                       this.vf0005),
                                                         bits,
                                                         this.vℚ0005)
                                                    .div(this.cℤ0001, bits, result);
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
      throw new AssertionError("A.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("A.β is null");
    }
    else
    {
      if (this.C == null)
      {
        this.C = new C();
      }

      if (this.F == null)
      {
        this.F = new F();
      }

      this.C.α           = this.α;
      this.C.β           = this.β;
      this.F.α           = this.α;
      this.F.β           = this.β;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0002.close();
    this.cℤ0001.close();
    this.vℚ0004.close();
    this.vℚ0005.close();
    this.vℝ0003.close();
    this.vf0005.close();
    this.vℝ0002.close();
    this.vf0004.close();
    this.vf0003.close();
    this.vℚ0001.close();
    this.vℚ0002.close();
    this.vℚ0003.close();
    this.C.close();
    this.F.close();
  }

  @Override
  public String toString()
  {
    return "A:n➔((F(n)*x+α^2)-(β^2)*C(n)-1)/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\F(n) \\cdot x + {α}^{2}-{β}^{2}\\right) \\cdot \\left(\\C(n)-1\\right)}{2}";
  }
}
