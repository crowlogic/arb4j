package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;
import arb.functions.real.RealNullaryFunction;

public class Ptest implements
                   RealNullaryFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean                  isInitialized;
  public final Real               cℝ0000 = new Real("0.75",
                                                    128);
  public final Integer            cℤ0000 = new Integer("3");
  public ShiftedJacobiPolynomials P;

  @Override
  public Class<Real> domainType()
  {
    return Object.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Object param1, int param2, int param3, Real param4)
  {
    // $VF: Couldn't be decompiled
    // Please report this to the Vineflower issue tracker, at
    // https://github.com/Vineflower/vineflower/issues with a copy of the class file
    // (if you have the rights to distribute it!)
    // java.lang.IndexOutOfBoundsException: Index -1 out of bounds for length 0
    // at
    // java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:100)
    // at
    // java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:106)
    // at
    // java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:302)
    // at java.base/java.util.Objects.checkIndex(Objects.java:365)
    // at java.base/java.util.ArrayList.remove(ArrayList.java:552)
    // at org.jetbrains.java.decompiler.util.ListStack.pop(ListStack.java:31)
    // at
    // org.jetbrains.java.decompiler.modules.decompiler.exps.InvocationExprent.<init>(InvocationExprent.java:156)
    // at
    // org.jetbrains.java.decompiler.modules.decompiler.ExprProcessor.processBlock(ExprProcessor.java:568)
    // at
    // org.jetbrains.java.decompiler.modules.decompiler.ExprProcessor.processStatement(ExprProcessor.java:154)
    // at
    // org.jetbrains.java.decompiler.main.rels.MethodProcessor.codeToJava(MethodProcessor.java:188)
    //
    // Bytecode:
    // 00: aload 0
    // 01: getfield P(3)(0_75).isInitialized Z
    // 04: ifne 0b
    // 07: aload 0
    // 08: invokevirtual P(3)(0_75).initialize ()V
    // 0b: aload 0
    // 0c: getfield P(3)(0_75).cℝ0000 Larb/Real;
    // 0f: iload 2
    // 10: iload 3
    // 11: aload 4
    // 13: checkcast arb/Real
    // 16: invokeinterface arb/Real.evaluate
    // (Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object; 5
    // 1b: checkcast arb/Real
    // 1e: areturn
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℝ0000.close();
    this.cℤ0000.close();
    this.P.close();
  }

  @Override
  public String toString()
  {
    return "InlineFunctionNode[functionNode=P(3), arg=0.75]";
  }

  @Override
  public String typeset()
  {
    return "\\left(0.75\\right)";
  }
}
