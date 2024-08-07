package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.sequences.LommelPolynomialSequence;
import junit.framework.TestCase;

/**
 * TODO: examine the .class assembler of this class
 * 
 * <pre>
 * Compiled from "GeneratedLommelPolynomialExpression.java"
public class arb.functions.real.GeneratedLommelPolynomialExpression implements arb.functions.real.RealFunction,arb.Typesettable,java.lang.AutoCloseable,arb.Initializable {
  public boolean isInitialized;

  arb.Integer cℤ2;

  arb.Integer cℤ1;

  arb.Integer cℤ3;

  public arb.Real ℝ1;

  public arb.Real ℝ2;

  public int bits;

  arb.functions.sequences.LommelPolynomialSequence seq;

  public arb.functions.real.GeneratedLommelPolynomialExpression();
    Code:
       0: aload_0
       1: invokespecial #31                 // Method java/lang/Object."<init>":()V
       4: aload_0
       5: new           #33                 // class arb/Integer
       8: dup
       9: ldc           #35                 // String 2
      11: invokespecial #37                 // Method arb/Integer."<init>":(Ljava/lang/String;)V
      14: putfield      #40                 // Field cℤ2:Larb/Integer;
      17: aload_0
      18: new           #33                 // class arb/Integer
      21: dup
      22: ldc           #42                 // String 1
      24: invokespecial #37                 // Method arb/Integer."<init>":(Ljava/lang/String;)V
      27: putfield      #44                 // Field cℤ1:Larb/Integer;
      30: aload_0
      31: new           #33                 // class arb/Integer
      34: dup
      35: ldc           #46                 // String 3
      37: invokespecial #37                 // Method arb/Integer."<init>":(Ljava/lang/String;)V
      40: putfield      #48                 // Field cℤ3:Larb/Integer;
      43: aload_0
      44: new           #50                 // class arb/Real
      47: dup
      48: invokespecial #52                 // Method arb/Real."<init>":()V
      51: putfield      #53                 // Field ℝ1:Larb/Real;
      54: aload_0
      55: new           #50                 // class arb/Real
      58: dup
      59: invokespecial #52                 // Method arb/Real."<init>":()V
      62: putfield      #55                 // Field ℝ2:Larb/Real;
      65: aload_0
      66: sipush        128
      69: putfield      #57                 // Field bits:I
      72: aload_0
      73: new           #59                 // class arb/functions/sequences/LommelPolynomialSequence
      76: dup
      77: aload_0
      78: getfield      #44                 // Field cℤ1:Larb/Integer;
      81: aload_0
      82: getfield      #40                 // Field cℤ2:Larb/Integer;
      85: aload_0
      86: getfield      #57                 // Field bits:I
      89: aload_0
      90: getfield      #53                 // Field ℝ1:Larb/Real;
      93: invokevirtual #61                 // Method arb/Integer.div:(Larb/Integer;ILarb/Real;)Larb/Real;
      96: invokespecial #65                 // Method arb/functions/sequences/LommelPolynomialSequence."<init>":(Larb/Real;)V
      99: putfield      #68                 // Field seq:Larb/functions/sequences/LommelPolynomialSequence;
     102: return

  public java.lang.Class<arb.Real> coDomainType();
    Code:
       0: ldc           #50                 // class arb/Real
       2: areturn

  public void initialize();
    Code:
       0: aload_0
       1: getfield      #122                // Field isInitialized:Z
       4: ifeq          17
       7: new           #137                // class java/lang/AssertionError
      10: dup
      11: ldc           #139                // String Already initialized
      13: invokespecial #141                // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
      16: athrow
      17: aload_0
      18: iconst_1
      19: putfield      #122                // Field isInitialized:Z
      22: aload_0
      23: aload_0
      24: getfield      #68                 // Field seq:Larb/functions/sequences/LommelPolynomialSequence;
      27: aload_0
      28: getfield      #48                 // Field cℤ3:Larb/Integer;
      31: sipush        128
      34: invokevirtual #144                // Method arb/functions/sequences/LommelPolynomialSequence.evaluate:(Ljava/lang/Object;I)Ljava/lang/Object;
      37: checkcast     #130                // class arb/RationalFunction
      40: putfield      #127                // Field element:Larb/RationalFunction;
      43: return

 * 
 * }
 */
public class GeneratedLommelPolynomialExpression implements RealFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  Integer        cℤ2 = new Integer("2");
  Integer        cℤ1 = new Integer("1");
  Integer        cℤ3 = new Integer("3");
  public Real    ℝ1  = new Real();
  public Real    ℝ2  = new Real();

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  public int               bits = 128;

  LommelPolynomialSequence seq  = new LommelPolynomialSequence(cℤ1.div(cℤ2, bits, ℝ1));
  private RationalFunction element;

  public static void main(String args[])
  {
    GeneratedLommelPolynomialExpression r   = new GeneratedLommelPolynomialExpression();
    double                              val = r.eval(2.3);
    System.out.format("R[2.3]=%s\n", val);
    TestCase.assertEquals(-1.3758527163639351505, val);

  }

  @Override
  public Real evaluate(Real z, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return element.evaluate(z, order, bits, result);

  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      isInitialized = true;
    }
    element = seq.evaluate(cℤ3, 128);

  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    ℝ1.close();
    ℝ2.close();
  }

  @Override
  public String toString()
  {
    return "z➔R(1/2,3;z)";
  }

  @Override
  public String typeset()
  {
    return "$R_{\\frac{1}{2}, 3} (z)$";
  }
}
