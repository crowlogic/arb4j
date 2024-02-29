import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements Function<Integer, Real> {
   private boolean isInitialized;
   Integer c1;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public Real valueℝ1;
   public Integer k;
   public Real productℝ1;
   public Integer endIndexℤ1;
   public Real valueℝ2;
   public Real productℝ2;
   public Integer endIndexℤ2;
   public final factorℝ2 factorℝ2 = new factorℝ2();
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public Real evaluate(Integer param1, int param2, int param3, Real param4) {
      // $VF: Couldn't be decompiled
      // Please report this to the Vineflower issue tracker, at https://github.com/Vineflower/vineflower/issues with a copy of the class file (if you have the rights to distribute it!)
      // java.lang.IndexOutOfBoundsException: Index -1 out of bounds for length 0
      //   at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:100)
      //   at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:106)
      //   at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:302)
      //   at java.base/java.util.Objects.checkIndex(Objects.java:385)
      //   at java.base/java.util.ArrayList.remove(ArrayList.java:551)
      //   at org.jetbrains.java.decompiler.util.ListStack.pop(ListStack.java:31)
      //   at org.jetbrains.java.decompiler.modules.decompiler.exps.InvocationExprent.<init>(InvocationExprent.java:129)
      //   at org.jetbrains.java.decompiler.modules.decompiler.ExprProcessor.processBlock(ExprProcessor.java:568)
      //   at org.jetbrains.java.decompiler.modules.decompiler.ExprProcessor.processStatement(ExprProcessor.java:154)
      //   at org.jetbrains.java.decompiler.main.rels.MethodProcessor.codeToJava(MethodProcessor.java:188)
      //
      // Bytecode:
      // 00: aload 0
      // 01: getfield F.isInitialized Z
      // 04: ifne 0b
      // 07: aload 0
      // 08: invokevirtual F.initialize ()V
      // 0b: aload 0
      // 0c: getfield F.factorℝ1 Lfactorℝ1;
      // 0f: aload 1
      // 10: checkcast arb/Integer
      // 13: putfield factorℝ1.n Larb/Integer;
      // 16: aload 0
      // 17: getfield F.productℝ1 Larb/Real;
      // 1a: invokevirtual arb/Real.multiplicativeIdentity ()Larb/Real;
      // 1d: pop
      // 1e: aload 0
      // 1f: getfield F.k Larb/Integer;
      // 22: aload 0
      // 23: getfield F.c1 Larb/Integer;
      // 26: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 29: pop
      // 2a: aload 0
      // 2b: getfield F.endIndexℤ1 Larb/Integer;
      // 2e: aload 0
      // 2f: getfield F.p Larb/Integer;
      // 32: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 35: pop
      // 36: aload 0
      // 37: getfield F.productℝ1 Larb/Real;
      // 3a: aload 0
      // 3b: getfield F.factorℝ1 Lfactorℝ1;
      // 3e: aload 0
      // 3f: getfield F.k Larb/Integer;
      // 42: iload 3
      // 43: aload 0
      // 44: getfield F.valueℝ1 Larb/Real;
      // 47: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // 4c: checkcast arb/Real
      // 4f: iload 3
      // 50: invokevirtual arb/Real.mul (Larb/Real;I)Larb/Real;
      // 53: pop
      // 54: aload 0
      // 55: getfield F.k Larb/Integer;
      // 58: invokevirtual arb/Integer.increment ()Larb/Integer;
      // 5b: aload 0
      // 5c: getfield F.endIndexℤ1 Larb/Integer;
      // 5f: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // 62: ifle 36
      // 65: aload 0
      // 66: getfield F.factorℝ2 Lfactorℝ2;
      // 69: aload 1
      // 6a: checkcast arb/Integer
      // 6d: putfield factorℝ2.n Larb/Integer;
      // 70: aload 0
      // 71: getfield F.productℝ2 Larb/Real;
      // 74: invokevirtual arb/Real.multiplicativeIdentity ()Larb/Real;
      // 77: pop
      // 78: aload 0
      // 79: getfield F.k Larb/Integer;
      // 7c: aload 0
      // 7d: getfield F.c1 Larb/Integer;
      // 80: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 83: pop
      // 84: aload 0
      // 85: getfield F.endIndexℤ2 Larb/Integer;
      // 88: aload 0
      // 89: getfield F.q Larb/Integer;
      // 8c: invokevirtual arb/Integer.set (Larb/Integer;)Larb/Integer;
      // 8f: pop
      // 90: aload 0
      // 91: getfield F.productℝ2 Larb/Real;
      // 94: aload 0
      // 95: getfield F.factorℝ2 Lfactorℝ2;
      // 98: aload 0
      // 99: getfield F.k Larb/Integer;
      // 9c: iload 3
      // 9d: aload 0
      // 9e: getfield F.valueℝ2 Larb/Real;
      // a1: invokeinterface arb/functions/Function.evaluate (Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object; 4
      // a6: checkcast arb/Real
      // a9: iload 3
      // aa: invokevirtual arb/Real.mul (Larb/Real;I)Larb/Real;
      // ad: pop
      // ae: aload 0
      // af: getfield F.k Larb/Integer;
      // b2: invokevirtual arb/Integer.increment ()Larb/Integer;
      // b5: aload 0
      // b6: getfield F.endIndexℤ2 Larb/Integer;
      // b9: invokevirtual arb/Integer.compareTo (Larb/Integer;)I
      // bc: ifle 90
      // bf: iload 3
      // c0: aload 4
      // c2: checkcast arb/Real
      // c5: invokevirtual arb/Real.div (Larb/Real;ILarb/Real;)Larb/Real;
      // c8: areturn
   }

   public F() {
      c1 = new Integer("1");
      valueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
      endIndexℤ1 = new Integer();
      valueℝ2 = new Real();
      productℝ2 = new Real();
      endIndexℤ2 = new Integer();
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
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      valueℝ1.close();
      k.close();
      productℝ1.close();
      endIndexℤ1.close();
      valueℝ2.close();
      productℝ2.close();
      endIndexℤ2.close();
   }
}
