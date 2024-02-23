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
   public RealPolynomial valuer̅1;
   public Integer k;
   public RealPolynomial productr̅1;
   public RealPolynomial r̅3;
   public Integer ℤ2;
   public Integer ℤ3;
   public RealPolynomial valuer̅2;
   public RealPolynomial productr̅2;
   public RealPolynomial r̅4;
   public final factorr̅2 factorr̅2 = new factorr̅2();
   public F F;
   public final factorr̅1 factorr̅1 = new factorr̅1();

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
      // 025: goto 12c
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
      // 05b: getfield F.factorr̅1 Lfactorr̅1;
      // 05e: aload 1
      // 05f: checkcast arb/Integer
      // 062: putfield factorr̅1.n Larb/Integer;
      // 065: aload 0
      // 066: getfield F.productr̅1 Larb/RealPolynomial;
      // 069: invokevirtual arb/RealPolynomial.multiplicativeIdentity ()Larb/RealPolynomial;
      // 06c: pop
      // 06d: aload 0
      // 06e: getfield F.k Larb/Integer;
      // 071: aload 0
      // 072: getfield F.startIndex Larb/Integer;
      // 075: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 078: pop
      // 079: aload 0
      // 07a: getfield F.productr̅1 Larb/RealPolynomial;
      // 07d: aload 0
      // 07e: getfield F.factorr̅1 Lfactorr̅1;
      // 081: aload 0
      // 082: getfield F.k Larb/Integer;
      // 085: iload 3
      // 086: aload 0
      // 087: getfield F.valuer̅1 Larb/RealPolynomial;
      // 08a: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 08f: checkcast arb/RealPolynomial
      // 092: iload 3
      // 093: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;I)Larb/RealPolynomial;
      // 096: pop
      // 097: aload 0
      // 098: getfield F.k Larb/Integer;
      // 09b: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 09e: aload 0
      // 09f: getfield F.p Larb/Integer;
      // 0a2: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 0a5: ifle 079
      // 0a8: iload 3
      // 0a9: aload 0
      // 0aa: getfield F.r̅3 Larb/RealPolynomial;
      // 0ad: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0b0: aload 4
      // 0b2: aload 1
      // 0b3: checkcast arb/Integer
      // 0b6: aload 0
      // 0b7: getfield F.c2 Larb/Integer;
      // 0ba: iload 3
      // 0bb: aload 0
      // 0bc: getfield F.ℤ2 Larb/Integer;
      // 0bf: invokevirtual arb/Integer.sub (Larb/Integer;ILarb/Integer;)Larb/Integer;
      // 0c2: iload 3
      // 0c3: aload 0
      // 0c4: getfield F.ℤ3 Larb/Integer;
      // 0c7: invokevirtual arb/Integer.factorial (ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 0ca: invokevirtual arb/Integer.set (Larb/RealPolynomial;)Larb/Integer;
      // 0cd: aload 0
      // 0ce: getfield F.factorr̅2 Lfactorr̅2;
      // 0d1: aload 1
      // 0d2: checkcast arb/Integer
      // 0d5: putfield factorr̅2.n Larb/Integer;
      // 0d8: aload 0
      // 0d9: getfield F.productr̅2 Larb/RealPolynomial;
      // 0dc: invokevirtual arb/RealPolynomial.multiplicativeIdentity ()Larb/RealPolynomial;
      // 0df: pop
      // 0e0: aload 0
      // 0e1: getfield F.k Larb/Integer;
      // 0e4: aload 0
      // 0e5: getfield F.startIndex Larb/Integer;
      // 0e8: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 0eb: pop
      // 0ec: aload 0
      // 0ed: getfield F.productr̅2 Larb/RealPolynomial;
      // 0f0: aload 0
      // 0f1: getfield F.factorr̅2 Lfactorr̅2;
      // 0f4: aload 0
      // 0f5: getfield F.k Larb/Integer;
      // 0f8: iload 3
      // 0f9: aload 0
      // 0fa: getfield F.valuer̅2 Larb/RealPolynomial;
      // 0fd: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 102: checkcast arb/RealPolynomial
      // 105: iload 3
      // 106: invokevirtual arb/RealPolynomial.mul (Larb/RealPolynomial;I)Larb/RealPolynomial;
      // 109: pop
      // 10a: aload 0
      // 10b: getfield F.k Larb/Integer;
      // 10e: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 111: aload 0
      // 112: getfield F.q Larb/Integer;
      // 115: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 118: ifle 0ec
      // 11b: iload 3
      // 11c: aload 0
      // 11d: getfield F.r̅4 Larb/RealPolynomial;
      // 120: invokevirtual arb/Integer.mul (Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 123: iload 3
      // 124: aload 4
      // 126: checkcast arb/RealPolynomial
      // 129: invokevirtual arb/RealPolynomial.div (Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;
      // 12c: areturn
   }

   public F() {
      c1 = new Integer("0");
      c2 = new Integer("1");
      ℤ1 = new Integer();
      r̅1 = new RealPolynomial();
      r̅2 = new RealPolynomial();
      valuer̅1 = new RealPolynomial();
      k = new Integer();
      productr̅1 = new RealPolynomial();
      r̅3 = new RealPolynomial();
      ℤ2 = new Integer();
      ℤ3 = new Integer();
      valuer̅2 = new RealPolynomial();
      productr̅2 = new RealPolynomial();
      r̅4 = new RealPolynomial();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (p == null) {
         throw new AssertionError("p is null");
      } else if (q == null) {
         throw new AssertionError("q is null");
      } else {
         factorr̅2.p = p;
         factorr̅2.q = q;
         factorr̅2.α = α;
         factorr̅2.β = β;
         factorr̅1.p = p;
         factorr̅1.q = q;
         factorr̅1.α = α;
         factorr̅1.β = β;
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
      valuer̅1.close();
      k.close();
      productr̅1.close();
      r̅3.close();
      ℤ2.close();
      ℤ3.close();
      valuer̅2.close();
      productr̅2.close();
      r̅4.close();
      F.close();
   }
}
