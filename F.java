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
   public Real valueℝ1;
   public Integer k;
   public Real productℝ1;
   public Integer endIndexℤ1;
   public RealPolynomial r̅3;
   public Integer ℤ2;
   public Integer ℤ3;
   public Real valueℝ2;
   public Real productℝ2;
   public Integer endIndexℤ2;
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
      // 025: goto 144
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
      // 05b: getfield F.factorℝ1 Lfactorℝ1;
      // 05e: aload 1
      // 05f: checkcast arb/Integer
      // 062: putfield factorℝ1.n Larb/Integer;
      // 065: aload 0
      // 066: getfield F.productℝ1 Larb/Real;
      // 069: invokevirtual arb/Real.multiplicativeIdentity ()Larb/Real;
      // 06c: pop
      // 06d: aload 0
      // 06e: getfield F.k Larb/Integer;
      // 071: aload 0
      // 072: getfield F.c2 Larb/Integer;
      // 075: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 078: pop
      // 079: aload 0
      // 07a: getfield F.endIndexℤ1 Larb/Integer;
      // 07d: aload 0
      // 07e: getfield F.p Larb/Integer;
      // 081: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 084: pop
      // 085: aload 0
      // 086: getfield F.productℝ1 Larb/Real;
      // 089: aload 0
      // 08a: getfield F.factorℝ1 Lfactorℝ1;
      // 08d: aload 0
      // 08e: getfield F.k Larb/Integer;
      // 091: iload 3
      // 092: aload 0
      // 093: getfield F.valueℝ1 Larb/Real;
      // 096: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 09b: checkcast arb/Real
      // 09e: iload 3
      // 09f: invokevirtual arb/Real.mul (Larb/Real;I)Larb/Real;
      // 0a2: pop
      // 0a3: aload 0
      // 0a4: getfield F.k Larb/Integer;
      // 0a7: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 0aa: aload 0
      // 0ab: getfield F.endIndexℤ1 Larb/Integer;
      // 0ae: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 0b1: ifle 085
      // 0b4: iload 3
      // 0b5: aload 0
      // 0b6: getfield F.r̅3 Larb/RealPolynomial;
      // 0b9: invokevirtual arb/RealPolynomial.mul (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0bc: aload 4
      // 0be: aload 1
      // 0bf: checkcast arb/Integer
      // 0c2: aload 0
      // 0c3: getfield F.c2 Larb/Integer;
      // 0c6: iload 3
      // 0c7: aload 0
      // 0c8: getfield F.ℤ2 Larb/Integer;
      // 0cb: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 0ce: iload 3
      // 0cf: aload 0
      // 0d0: getfield F.ℤ3 Larb/Integer;
      // 0d3: invokevirtual arb/Integer.factorial (ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0d6: invokevirtual arb/Integer.set (Larb/RealPolynomial;)Larb/Integer;
      // 0d9: aload 0
      // 0da: getfield F.factorℝ2 Lfactorℝ2;
      // 0dd: aload 1
      // 0de: checkcast arb/Integer
      // 0e1: putfield factorℝ2.n Larb/Integer;
      // 0e4: aload 0
      // 0e5: getfield F.productℝ2 Larb/Real;
      // 0e8: invokevirtual arb/Real.multiplicativeIdentity ()Larb/Real;
      // 0eb: pop
      // 0ec: aload 0
      // 0ed: getfield F.k Larb/Integer;
      // 0f0: aload 0
      // 0f1: getfield F.c2 Larb/Integer;
      // 0f4: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 0f7: pop
      // 0f8: aload 0
      // 0f9: getfield F.endIndexℤ2 Larb/Integer;
      // 0fc: aload 0
      // 0fd: getfield F.q Larb/Integer;
      // 100: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 103: pop
      // 104: aload 0
      // 105: getfield F.productℝ2 Larb/Real;
      // 108: aload 0
      // 109: getfield F.factorℝ2 Lfactorℝ2;
      // 10c: aload 0
      // 10d: getfield F.k Larb/Integer;
      // 110: iload 3
      // 111: aload 0
      // 112: getfield F.valueℝ2 Larb/Real;
      // 115: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 11a: checkcast arb/Real
      // 11d: iload 3
      // 11e: invokevirtual arb/Real.mul (Larb/Real;I)Larb/Real;
      // 121: pop
      // 122: aload 0
      // 123: getfield F.k Larb/Integer;
      // 126: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 129: aload 0
      // 12a: getfield F.endIndexℤ2 Larb/Integer;
      // 12d: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 130: ifle 104
      // 133: iload 3
      // 134: aload 0
      // 135: getfield F.ℝ1 Larb/Real;
      // 138: invokevirtual arb/Integer.mul (Larb/Real;ILarb/Real;)Larb/Real;
      // 13b: iload 3
      // 13c: aload 4
      // 13e: checkcast arb/RealPolynomial
      // 141: invokevirtual arb/RealPolynomial.div (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 144: areturn
   }

   public F() {
      c1 = new Integer("0");
      c2 = new Integer("1");
      ℤ1 = new Integer();
      r̅1 = new RealPolynomial();
      r̅2 = new RealPolynomial();
      valueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
      endIndexℤ1 = new Integer();
      r̅3 = new RealPolynomial();
      ℤ2 = new Integer();
      ℤ3 = new Integer();
      valueℝ2 = new Real();
      productℝ2 = new Real();
      endIndexℤ2 = new Integer();
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
      valueℝ1.close();
      k.close();
      productℝ1.close();
      endIndexℤ1.close();
      r̅3.close();
      ℤ2.close();
      ℤ3.close();
      valueℝ2.close();
      productℝ2.close();
      endIndexℤ2.close();
      ℝ1.close();
      F.close();
   }
}
