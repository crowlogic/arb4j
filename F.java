import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class F implements Function<Integer, RealPolynomial> {
   Integer c1 = new Integer("0");
   Integer c2 = new Integer("1");
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Integer ℤ1 = new Integer();
   public RealPolynomial r̅1 = new RealPolynomial();
   public RealPolynomial r̅2 = new RealPolynomial();
   public RealPolynomial r̅3 = new RealPolynomial();
   public Integer ℤ2 = new Integer();
   public Integer ℤ3 = new Integer();
   public Real ℝ1 = new Real();
   public F F;

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
      // 025: goto 12f
      // 028: aload 4
      // 02a: checkcast arb/RealPolynomial
      // 02d: invokevirtual arb/RealPolynomial.identity ()Larb/RealPolynomial;
      // 030: aload 0
      // 031: getfield F.F LF;
      // 034: ifnonnull 043
      // 037: aload 0
      // 038: new F
      // 03b: dup
      // 03c: aload 0
      // 03d: invokespecial F.<init> (LF;)V
      // 040: putfield F.F LF;
      // 043: aload 0
      // 044: getfield F.F LF;
      // 047: aload 1
      // 048: checkcast arb/Integer
      // 04b: aload 0
      // 04c: getfield F.c2 Larb/Integer;
      // 04f: iload 3
      // 050: aload 0
      // 051: getfield F.ℤ1 Larb/Integer;
      // 054: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 057: iload 2
      // 058: iload 3
      // 059: aload 0
      // 05a: getfield F.r̅1 Larb/RealPolynomial;
      // 05d: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object; 5
      // 062: checkcast arb/RealPolynomial
      // 065: iload 3
      // 066: aload 0
      // 067: getfield F.r̅2 Larb/RealPolynomial;
      // 06a: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 06d: aload 2
      // 06e: invokevirtual arb/Real.one ()Larb/Real;
      // 071: pop
      // 072: aload 0
      // 073: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 076: aload 0
      // 077: getfield arb/GeneratedProductClass.startIndex Larb/Integer;
      // 07a: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 07d: pop
      // 07e: goto 110
      // 081: aload 2
      // 082: aload 0
      // 083: getfield arb/GeneratedProductClass.factor Larb/functions/Function;
      // 086: aload 0
      // 087: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 08a: iload 1
      // 08b: aload 0
      // 08c: getfield arb/GeneratedProductClass.value Larb/Real;
      // 08f: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 094: checkcast arb/Real
      // 097: iload 1
      // 098: aload 2
      // 099: invokevirtual arb/Real.mul (Larb/Real;ILarb/Real;)Larb/Real;
      // 09c: pop
      // 09d: aload 0
      // 09e: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 0a1: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 0a4: pop
      // 0a5: aload 0
      // 0a6: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 0a9: aload 0
      // 0aa: getfield arb/GeneratedProductClass.endIndex Larb/Integer;
      // 0ad: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 0b0: ifle 081
      // 0b3: iload 3
      // 0b4: aload 0
      // 0b5: getfield F.r̅3 Larb/RealPolynomial;
      // 0b8: invokevirtual arb/RealPolynomial.mul (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0bb: aload 4
      // 0bd: aload 1
      // 0be: checkcast arb/Integer
      // 0c1: aload 0
      // 0c2: getfield F.c2 Larb/Integer;
      // 0c5: iload 3
      // 0c6: aload 0
      // 0c7: getfield F.ℤ2 Larb/Integer;
      // 0ca: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 0cd: iload 3
      // 0ce: aload 0
      // 0cf: getfield F.ℤ3 Larb/Integer;
      // 0d2: invokevirtual arb/Integer.factorial (ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0d5: invokevirtual arb/Integer.set (Larb/RealPolynomial;)Larb/Integer;
      // 0d8: aload 2
      // 0d9: invokevirtual arb/Real.one ()Larb/Real;
      // 0dc: pop
      // 0dd: aload 0
      // 0de: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 0e1: aload 0
      // 0e2: getfield arb/GeneratedProductClass.startIndex Larb/Integer;
      // 0e5: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 0e8: pop
      // 0e9: goto 0a5
      // 0ec: aload 2
      // 0ed: aload 0
      // 0ee: getfield arb/GeneratedProductClass.factor Larb/functions/Function;
      // 0f1: aload 0
      // 0f2: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 0f5: iload 1
      // 0f6: aload 0
      // 0f7: getfield arb/GeneratedProductClass.value Larb/Real;
      // 0fa: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 0ff: checkcast arb/Real
      // 102: iload 1
      // 103: aload 2
      // 104: invokevirtual arb/Real.mul (Larb/Real;ILarb/Real;)Larb/Real;
      // 107: pop
      // 108: aload 0
      // 109: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 10c: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 10f: pop
      // 110: aload 0
      // 111: getfield arb/GeneratedProductClass.index Larb/Integer;
      // 114: aload 0
      // 115: getfield arb/GeneratedProductClass.endIndex Larb/Integer;
      // 118: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 11b: ifle 0ec
      // 11e: iload 3
      // 11f: aload 0
      // 120: getfield F.ℝ1 Larb/Real;
      // 123: invokevirtual arb/Integer.mul (Larb/Real;ILarb/Real;)Larb/Real;
      // 126: iload 3
      // 127: aload 4
      // 129: checkcast arb/RealPolynomial
      // 12c: invokevirtual arb/RealPolynomial.div (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 12f: areturn
   }

   public F() {
   }

   public F(F var1) {
      this();
      if (var1.p == null) {
         throw new AssertionError("p is null");
      } else if (var1.α == null) {
         throw new AssertionError("α is null");
      } else if (var1.q == null) {
         throw new AssertionError("q is null");
      } else if (var1.β == null) {
         throw new AssertionError("β is null");
      } else {
         p = var1.p;
         α = var1.α;
         q = var1.q;
         β = var1.β;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      ℤ1.close();
      r̅1.close();
      r̅2.close();
      r̅3.close();
      ℤ2.close();
      ℤ3.close();
      ℝ1.close();
      F.close();
   }
}
