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
   public RealPolynomial r̅4 = new RealPolynomial();
   public Integer ℤ2 = new Integer();
   public Integer ℤ3 = new Integer();
   public RealPolynomial r̅5 = new RealPolynomial();
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
      // 025: goto 129
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
      // 06d: aload 0
      // 06e: getfield F.r̅3 Larb/RealPolynomial;
      // 071: invokevirtual arb/Real.one ()Larb/Real;
      // 074: pop
      // 075: aload 0
      // 076: getfield F.index Larb/Integer;
      // 079: aload 0
      // 07a: getfield F.startIndex Larb/Integer;
      // 07d: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 080: pop
      // 081: aload 0
      // 082: getfield F.r̅3 Larb/RealPolynomial;
      // 085: aload 0
      // 086: getfield F.factor Larb/functions/Function;
      // 089: aload 0
      // 08a: getfield F.index Larb/Integer;
      // 08d: iload 3
      // 08e: aload 0
      // 08f: getfield F.factorValue Larb/RealPolynomial;
      // 092: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 097: checkcast arb/RealPolynomial
      // 09a: iload 3
      // 09b: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;I)Larb/RealPolynomial;
      // 09e: pop
      // 09f: aload 0
      // 0a0: getfield F.index Larb/Integer;
      // 0a3: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 0a6: aload 0
      // 0a7: getfield F.endIndex Larb/Integer;
      // 0aa: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 0ad: ifle 081
      // 0b0: iload 3
      // 0b1: aload 0
      // 0b2: getfield F.r̅4 Larb/RealPolynomial;
      // 0b5: invokevirtual arb/RealPolynomial.mul (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0b8: aload 4
      // 0ba: aload 1
      // 0bb: checkcast arb/Integer
      // 0be: aload 0
      // 0bf: getfield F.c2 Larb/Integer;
      // 0c2: iload 3
      // 0c3: aload 0
      // 0c4: getfield F.ℤ2 Larb/Integer;
      // 0c7: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 0ca: iload 3
      // 0cb: aload 0
      // 0cc: getfield F.ℤ3 Larb/Integer;
      // 0cf: invokevirtual arb/Integer.factorial (ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0d2: invokevirtual arb/Integer.set (Larb/RealPolynomial;)Larb/Integer;
      // 0d5: aload 0
      // 0d6: getfield F.r̅5 Larb/RealPolynomial;
      // 0d9: invokevirtual arb/Real.one ()Larb/Real;
      // 0dc: pop
      // 0dd: aload 0
      // 0de: getfield F.index Larb/Integer;
      // 0e1: aload 0
      // 0e2: getfield F.startIndex Larb/Integer;
      // 0e5: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 0e8: pop
      // 0e9: aload 0
      // 0ea: getfield F.r̅5 Larb/RealPolynomial;
      // 0ed: aload 0
      // 0ee: getfield F.factor Larb/functions/Function;
      // 0f1: aload 0
      // 0f2: getfield F.index Larb/Integer;
      // 0f5: iload 3
      // 0f6: aload 0
      // 0f7: getfield F.factorValue Larb/RealPolynomial;
      // 0fa: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 0ff: checkcast arb/RealPolynomial
      // 102: iload 3
      // 103: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;I)Larb/RealPolynomial;
      // 106: pop
      // 107: aload 0
      // 108: getfield F.index Larb/Integer;
      // 10b: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 10e: aload 0
      // 10f: getfield F.endIndex Larb/Integer;
      // 112: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 115: ifle 0e9
      // 118: iload 3
      // 119: aload 0
      // 11a: getfield F.ℝ1 Larb/Real;
      // 11d: invokevirtual arb/Integer.mul (Larb/Real;ILarb/Real;)Larb/Real;
      // 120: iload 3
      // 121: aload 4
      // 123: checkcast arb/RealPolynomial
      // 126: invokevirtual arb/RealPolynomial.div (Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 129: areturn
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
      r̅4.close();
      ℤ2.close();
      ℤ3.close();
      r̅5.close();
      ℝ1.close();
      F.close();
   }
}
