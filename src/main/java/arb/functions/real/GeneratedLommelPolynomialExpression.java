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

  public static void main(java.lang.String[]);
    Code:
       0: new           #1                  // class arb/functions/real/GeneratedLommelPolynomialExpression
       3: dup
       4: invokespecial #80                 // Method "<init>":()V
       7: astore_1
       8: aload_1
       9: ldc2_w        #81                 // double 2.3d
      12: invokevirtual #83                 // Method eval:(D)D
      15: dstore_2
      16: getstatic     #87                 // Field java/lang/System.out:Ljava/io/PrintStream;
      19: ldc           #93                 // String R[2.3]=%s\n
      21: iconst_1
      22: anewarray     #3                  // class java/lang/Object
      25: dup
      26: iconst_0
      27: dload_2
      28: invokestatic  #95                 // Method java/lang/Double.valueOf:(D)Ljava/lang/Double;
      31: aastore
      32: invokevirtual #101                // Method java/io/PrintStream.format:(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
      35: pop
      36: ldc2_w        #107                // double -1.3758527163639351d
      39: invokestatic  #95                 // Method java/lang/Double.valueOf:(D)Ljava/lang/Double;
      42: dload_2
      43: invokestatic  #95                 // Method java/lang/Double.valueOf:(D)Ljava/lang/Double;
      46: invokestatic  #109                // Method junit/framework/TestCase.assertEquals:(Ljava/lang/Object;Ljava/lang/Object;)V
      49: return

  public arb.Real evaluate(arb.Real, int, int, arb.Real);
    Code:
       0: aload_0
       1: getfield      #122                // Field isInitialized:Z
       4: ifne          11
       7: aload_0
       8: invokevirtual #124                // Method initialize:()V
      11: aload_0
      12: getfield      #127                // Field element:Larb/RationalFunction;
      15: aload_1
      16: iload_2
      17: iload_3
      18: aload         4
      20: invokevirtual #129                // Method arb/RationalFunction.evaluate:(Larb/Real;IILarb/Real;)Larb/Real;
      23: areturn

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

  public void close();
    Code:
       0: aload_0
       1: getfield      #40                 // Field cℤ2:Larb/Integer;
       4: invokevirtual #148                // Method arb/Integer.close:()V
       7: aload_0
       8: getfield      #44                 // Field cℤ1:Larb/Integer;
      11: invokevirtual #148                // Method arb/Integer.close:()V
      14: aload_0
      15: getfield      #48                 // Field cℤ3:Larb/Integer;
      18: invokevirtual #148                // Method arb/Integer.close:()V
      21: aload_0
      22: getfield      #53                 // Field ℝ1:Larb/Real;
      25: invokevirtual #150                // Method arb/Real.close:()V
      28: aload_0
      29: getfield      #55                 // Field ℝ2:Larb/Real;
      32: invokevirtual #150                // Method arb/Real.close:()V
      35: return

  public java.lang.String toString();
    Code:
       0: ldc           #153                // String z➔R(1/2,3;z)
       2: areturn

  public java.lang.String typeset();
    Code:
       0: ldc           #156                // String $R_{\\frac{1}{2}, 3} (z)$
       2: areturn

  public java.lang.Object evaluate(java.lang.Object, int, int, java.lang.Object);
    Code:
       0: aload_0
       1: aload_1
       2: checkcast     #50                 // class arb/Real
       5: iload_2
       6: iload_3
       7: aload         4
       9: checkcast     #50                 // class arb/Real
      12: invokevirtual #159                // Method evaluate:(Larb/Real;IILarb/Real;)Larb/Real;
      15: areturn

  public java.lang.Object evaluate(java.lang.Object, int, int);
    Code:
       0: aload_0
       1: aload_1
       2: checkcast     #50                 // class arb/Real
       5: iload_2
       6: iload_3
       7: invokeinterface #161,  4          // InterfaceMethod arb/functions/real/RealFunction.evaluate:(Larb/Real;II)Larb/Real;
      12: areturn

  public java.lang.Object evaluate(java.lang.Object, int, java.lang.Object);
    Code:
       0: aload_0
       1: aload_1
       2: checkcast     #50                 // class arb/Real
       5: iload_2
       6: aload_3
       7: checkcast     #50                 // class arb/Real
      10: invokeinterface #165,  4          // InterfaceMethod arb/functions/real/RealFunction.evaluate:(Larb/Real;ILarb/Real;)Larb/Real;
      15: areturn
 * </pre>
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
