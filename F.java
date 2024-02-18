import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class F implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1;
   Integer c2;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer ℤ1;
   public RealPolynomial r̅1;
   public RealPolynomial r̅2;
   public Real factorValueℝ1;
   public Integer kℤ1;
   public Real productℝ1;
   public RealPolynomial r̅3;
   public Integer ℤ2;
   public Integer ℤ3;
   public Real factorValueℝ2;
   public Integer kℤ2;
   public Real productℝ2;
   public Real ℝ1;
   public F F;
   public final factorℝ2 factorℝ2 = new factorℝ2();
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public RealPolynomial evaluate(Integer param1, int param2, int param3, RealPolynomial param4) {
      // $VF: Couldn't be decompiled
      // Please report this to the Vineflower issue tracker, at https://github.com/Vineflower/vineflower/issues with a copy of the class file (if you have the rights to distribute it!)
      // java.lang.IndexOutOfBoundsException: Index -1 out of bounds for length 0
      //   at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:100)
      //   at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:106)
      //   at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:302)
      //   at java.base/java.util.Objects.checkIndex(Objects.java:385)
      //   at java.base/java.util.ArrayList.remove(ArrayList.java:551)
      //   at org.jetbrains.java.decompiler.util.ListStack.pop(ListStack.java:31)
      //   at org.jetbrains.java.decompiler.modules.decompiler.exps.InvocationExprent.<init>(InvocationExprent.java:156)
      //   at org.jetbrains.java.decompiler.modules.decompiler.ExprProcessor.processBlock(ExprProcessor.java:568)
      //   at org.jetbrains.java.decompiler.modules.decompiler.ExprProcessor.processStatement(ExprProcessor.java:154)
      //   at org.jetbrains.java.decompiler.main.rels.MethodProcessor.codeToJava(MethodProcessor.java:188)
      //
      // Bytecode:
      // 000: aload 1
      // 001: checkcast arb/Integer
      // 004: invokevirtual arb/Integer.getSignedValue ()I
      // 007: tableswitch 33 0 0 17
      // 018: aload 0
      // 019: getfield F.c2 Larb/Integer;
      // 01c: aload 4
      // 01e: checkcast arb/RealPolynomial
      // 021: swap
      // 022: invokevirtual arb/RealPolynomial.set (Larb/Integer;)Larb/RealPolynomial;
      // 025: goto 116
      // 028: aload 4
      // 02a: checkcast arb/RealPolynomial
      // 02d: invokevirtual arb/RealPolynomial.identity ()Larb/RealPolynomial;
      // 030: aload 0
      // 031: getfield F.F LF;
      // 034: aload 1
      // 035: checkcast arb/Integer
      // 038: aload 0
      // 039: getfield F.c2 Larb/Integer;
      // 03c: iload 3
      // 03d: aload 0
      // 03e: getfield F.ℤ1 Larb/Integer;
      // 041: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 044: iload 2
      // 045: iload 3
      // 046: aload 0
      // 047: getfield F.r̅1 Larb/RealPolynomial;
      // 04a: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object; 5
      // 04f: checkcast arb/RealPolynomial
      // 052: iload 3
      // 053: aload 0
      // 054: getfield F.r̅2 Larb/RealPolynomial;
      // 057: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 05a: aload 0
      // 05b: getfield F.productℝ1 Larb/Real;
      // 05e: invokevirtual arb/Real.multiplicativeIdentity ()Larb/Real;
      // 061: pop
      // 062: aload 0
      // 063: getfield F.kℤ1 Larb/Integer;
      // 066: aload 0
      // 067: getfield F.startIndex Larb/Integer;
      // 06a: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 06d: pop
      // 06e: aload 0
      // 06f: getfield F.productℝ1 Larb/RealPolynomial;
      // 072: aload 0
      // 073: getfield F.factorℝ1 Lfactorℝ1;
      // 076: aload 0
      // 077: getfield F.kℤ1 Larb/Integer;
      // 07a: iload 3
      // 07b: aload 0
      // 07c: getfield F.factorValueℝ1 Larb/RealPolynomial;
      // 07f: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 084: checkcast arb/RealPolynomial
      // 087: iload 3
      // 088: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;I)Larb/RealPolynomial;
      // 08b: pop
      // 08c: aload 0
      // 08d: getfield F.kℤ1 Larb/Integer;
      // 090: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 093: aload 0
      // 094: getfield F.p Larb/Integer;
      // 097: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 09a: ifle 06e
      // 09d: iload 3
      // 09e: aload 0
      // 09f: getfield F.r̅3 Larb/RealPolynomial;
      // 0a2: invokevirtual arb/RealPolynomial.mul (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0a5: aload 4
      // 0a7: aload 1
      // 0a8: checkcast arb/Integer
      // 0ab: aload 0
      // 0ac: getfield F.c2 Larb/Integer;
      // 0af: iload 3
      // 0b0: aload 0
      // 0b1: getfield F.ℤ2 Larb/Integer;
      // 0b4: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 0b7: iload 3
      // 0b8: aload 0
      // 0b9: getfield F.ℤ3 Larb/Integer;
      // 0bc: invokevirtual arb/Integer.factorial (ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0bf: invokevirtual arb/Integer.set (Larb/RealPolynomial;)Larb/Integer;
      // 0c2: aload 0
      // 0c3: getfield F.productℝ2 Larb/Real;
      // 0c6: invokevirtual arb/Real.multiplicativeIdentity ()Larb/Real;
      // 0c9: pop
      // 0ca: aload 0
      // 0cb: getfield F.kℤ2 Larb/Integer;
      // 0ce: aload 0
      // 0cf: getfield F.startIndex Larb/Integer;
      // 0d2: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 0d5: pop
      // 0d6: aload 0
      // 0d7: getfield F.productℝ2 Larb/RealPolynomial;
      // 0da: aload 0
      // 0db: getfield F.factorℝ2 Lfactorℝ2;
      // 0de: aload 0
      // 0df: getfield F.kℤ2 Larb/Integer;
      // 0e2: iload 3
      // 0e3: aload 0
      // 0e4: getfield F.factorValueℝ2 Larb/RealPolynomial;
      // 0e7: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 0ec: checkcast arb/RealPolynomial
      // 0ef: iload 3
      // 0f0: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;I)Larb/RealPolynomial;
      // 0f3: pop
      // 0f4: aload 0
      // 0f5: getfield F.kℤ2 Larb/Integer;
      // 0f8: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 0fb: aload 0
      // 0fc: getfield F.q Larb/Integer;
      // 0ff: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 102: ifle 0d6
      // 105: iload 3
      // 106: aload 0
      // 107: getfield F.ℝ1 Larb/Real;
      // 10a: invokevirtual arb/Integer.mul (Larb/Real;ILarb/Real;)Larb/Real;
      // 10d: iload 3
      // 10e: aload 4
      // 110: checkcast arb/RealPolynomial
      // 113: invokevirtual arb/RealPolynomial.div (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 116: areturn
   }

   public F() {
      c1 = new Integer("0");
      c2 = new Integer("1");
      ℤ1 = new Integer();
      r̅1 = new RealPolynomial();
      r̅2 = new RealPolynomial();
      factorValueℝ1 = new Real();
      kℤ1 = new Integer();
      productℝ1 = new Real();
      r̅3 = new RealPolynomial();
      ℤ2 = new Integer();
      ℤ3 = new Integer();
      factorValueℝ2 = new Real();
      kℤ2 = new Integer();
      productℝ2 = new Real();
      ℝ1 = new Real();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (p == null) {
         throw new AssertionError("p is null");
      } else if (q == null) {
         throw new AssertionError("q is null");
      } else {
         factorℝ2.p = p;
         factorℝ2.q = q;
         factorℝ2.α = α;
         factorℝ2.β = β;
         factorℝ1.p = p;
         factorℝ1.q = q;
         factorℝ1.α = α;
         factorℝ1.β = β;
         F = new F();
         F.p = p;
         F.q = q;
         F.α = α;
         F.β = β;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      ℤ1.close();
      r̅1.close();
      r̅2.close();
      factorValueℝ1.close();
      kℤ1.close();
      productℝ1.close();
      r̅3.close();
      ℤ2.close();
      ℤ3.close();
      factorValueℝ2.close();
      kℤ2.close();
      productℝ2.close();
      ℝ1.close();
      F.close();
   }
}
