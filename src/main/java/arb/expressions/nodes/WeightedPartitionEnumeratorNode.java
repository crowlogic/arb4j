package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static org.objectweb.asm.Opcodes.*;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.functions.Function;
import arb.functions.IntegerFunction;
import arb.functions.integer.Sequence;

public class WeightedPartitionEnumeratorNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                            Node<D, R, F>
{
  public final String                              familyName;
  public final String                              arrayFieldName;

  @SuppressWarnings("rawtypes")
  public final FunctionMapping                     familyMapping;

  public final String                              familyIndexName;
  public final Node<Integer, R, Sequence<R>>       loNode;
  public final Node<Integer, R, Sequence<R>>       hiNode;
  public final Node<Integer, R, Sequence<R>>       bodyNode;

  /** The inner operand expression the body lives in (Integer → R). */
  public final Expression<Integer, R, Sequence<R>> operandExpression;

  public final String                              identity;
  public final String                              operation;

  @SuppressWarnings("rawtypes")
  public WeightedPartitionEnumeratorNode(Expression<D, R, F> enclosingExpression,
                                         Expression<Integer, R, Sequence<R>> operandExpression,
                                         String familyName,
                                         String arrayFieldName,
                                         FunctionMapping familyMapping,
                                         String familyIndexName,
                                         Node<Integer, R, Sequence<R>> loNode,
                                         Node<Integer, R, Sequence<R>> hiNode,
                                         Node<Integer, R, Sequence<R>> bodyNode,
                                         String identity,
                                         String operation)
  {
    super(enclosingExpression);
    this.operandExpression = operandExpression;
    this.familyName        = familyName;
    this.arrayFieldName    = arrayFieldName;
    this.familyMapping     = familyMapping;
    this.familyIndexName   = familyIndexName;
    this.loNode            = loNode;
    this.hiNode            = hiNode;
    this.bodyNode          = bodyNode;
    this.identity          = identity;
    this.operation         = operation;
    this.generatedType     = enclosingExpression.coDomainType;
  }

  // ── Node structural overrides ────────────────────────────────────────────

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of();
  }

  @Override
  public boolean isAtomic()
  {
    return true;
  }

  @Override
  public boolean isScalar()
  {
    return true;
  }

  @Override
  public Class<?> type()
  {
    return generatedType;
  }

  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  @Override
  public char symbol()
  {
    return '\u22d1'; // ⋑ (arbitrary distinguishing glyph)
  }

  @Override
  public String toString()
  {
    return String.format("PartitionΣ[%s∶%s=%s…%s]{%s}", familyName, familyIndexName, loNode, hiNode, bodyNode);
  }

  @Override
  public String typeset()
  {
    return toString();
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("differentiate not implemented for WeightedPartitionEnumeratorNode");
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    throw new UnsupportedOperationException("integral not implemented for WeightedPartitionEnumeratorNode");
  }

  // ── Bytecode generation ──────────────────────────────────────────────────

  /**
   * Emits a recursive weighted-partition enumerator.
   *
   * <p>
   * The generated structure (in Java pseudocode) is:
   * 
   * <pre>
   *   int lo  = loNode.evaluate();
   *   int hi  = hiNode.evaluate();
   *   int len = hi - lo + 1;
   *   int[] arr = new int[len];          // backing store for familyName
   *   R accum = accum.{identity}();
   *   enumeratePartitions(arr, 0, len, target, accum, bits);
   *   result.set(accum);
   *
   *   // enumeratePartitions — emitted as a private helper on the generated class:
   *   void enumeratePartitions(int[] arr, int pos, int len, int remaining, R accum, int bits) {
   *     if (pos == len) {
   *       if (remaining == 0) {
   *         accum.add(bodyNode.evaluate(arr, bits, scratch), bits);
   *       }
   *       return;
   *     }
   *     int weight = 2*(pos+lo)+1;          // weight for familyIndex = lo+pos
   *     int maxVal = remaining / weight;
   *     for (int v = 0; v <= maxVal; v++) {
   *       arr[pos] = v;
   *       enumeratePartitions(arr, pos+1, len, remaining - weight*v, accum, bits);
   *     }
   *   }
   * </pre>
   *
   * <p>
   * Because ASM cannot emit actual recursive Java methods inline inside
   * {@code evaluate()}, the recursion is linearised into an explicit stack using
   * int[] locals for {@code pos}, {@code remaining}, and {@code v} (all bounded
   * by {@code hi-lo+1} levels deep). The stack arrays are allocated as
   * method-local variables.
   *
   * <p>
   * The {@code familyName} function seen by the body at runtime is implemented as
   * a direct {@code int[]}-lookup closure: before each body call the current
   * {@code arr} contents are flushed into the registered {@link IntegerFunction}
   * field on the generated class so that {@code m(ℓ)} evaluates to
   * {@code arr[ℓ - lo]}.
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    // ── 1. Evaluate lo and hi into int locals ────────────────────────────
    //
    // We use arb.Integer evaluate helpers already available in scope.
    // lo and hi are small non-negative integers at runtime, so we
    // materialise them as JVM int primitives via Integer.getSignedValue().

    int loSlot     = operandExpression.allocateLocalVariableSlot(); // arb.Integer
    int hiSlot     = operandExpression.allocateLocalVariableSlot(); // arb.Integer
    int loIntSlot  = operandExpression.allocateLocalVariableSlot(); // int (primitive)
    int hiIntSlot  = operandExpression.allocateLocalVariableSlot(); // int (primitive)
    int lenSlot    = operandExpression.allocateLocalVariableSlot(); // int (= hi-lo+1)
    int targetSlot = operandExpression.allocateLocalVariableSlot(); // int (partition target)

    // Allocate arb.Integer temporaries for lo/hi evaluation.
    generateNewObjectInstruction(mv, Integer.class);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, Integer.class);
    mv.visitVarInsn(ASTORE, loSlot);

    generateNewObjectInstruction(mv, Integer.class);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, Integer.class);
    mv.visitVarInsn(ASTORE, hiSlot);

    // loNode → loSlot
    mv.visitVarInsn(ALOAD, loSlot);
    loNode.generate(mv, Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);

    // hiNode → hiSlot
    mv.visitVarInsn(ALOAD, hiSlot);
    hiNode.generate(mv, Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);

    // loIntSlot = lo.getSignedValue()
    mv.visitVarInsn(ALOAD, loSlot);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "getSignedValue", "()I", false);
    mv.visitVarInsn(ISTORE, loIntSlot);

    // hiIntSlot = hi.getSignedValue()
    mv.visitVarInsn(ALOAD, hiSlot);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "getSignedValue", "()I", false);
    mv.visitVarInsn(ISTORE, hiIntSlot);

    // lenSlot = hiIntSlot - loIntSlot + 1
    mv.visitVarInsn(ILOAD, hiIntSlot);
    mv.visitVarInsn(ILOAD, loIntSlot);
    mv.visitInsn(ISUB);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitVarInsn(ISTORE, lenSlot);

    // ── 2. The partition target is the enclosing Σ's independent variable ─
    //
    // The operand expression's independent variable is the integer argument
    // passed to this sequence (b for M, 2c for N, or the k-family slack for μ).
    // Load it and convert to int.
    int indepSlot = operandExpression.allocateLocalVariableSlot(); // arb.Integer reference
    loadInputParameter(mv); // → Object on stack
    mv.visitTypeInsn(CHECKCAST, "arb/Integer");
    mv.visitVarInsn(ASTORE, indepSlot);
    mv.visitVarInsn(ALOAD, indepSlot);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "getSignedValue", "()I", false);
    mv.visitVarInsn(ISTORE, targetSlot);

    // ── 3. Allocate the int[] backing array ──────────────────────────────
    int arrSlot = operandExpression.allocateLocalVariableSlot(); // int[]
    mv.visitVarInsn(ILOAD, lenSlot);
    mv.visitIntInsn(NEWARRAY, T_INT);
    mv.visitVarInsn(ASTORE, arrSlot);

    // ── 4. Declare the field for the backing array on the generated class ─
    // (The ClassVisitor pass that calls declareFields will see this via
    // expression.newIntermediateVariable; we register it here so the
    // name is reserved even if the declare pass already ran.
    // For the runtime path we use the local int[] directly.)

    // ── 5. Initialise accumulator ────────────────────────────────────────
    int accumSlot = operandExpression.allocateLocalVariableSlot();
    operandExpression.allocateIntermediateVariable(mv, "partAccum", resultType);
    // The allocateIntermediateVariable call leaves the object on the stack.
    // Invoke identity() on it.
    generateVirtualMethodInvocation(mv, resultType, identity, resultType);
    mv.visitVarInsn(ASTORE, accumSlot);

    // ── 6. Emit the iterative (stack-unrolled) partition enumeration ──────
    //
    // We allocate three int[] arrays of length `len` to serve as the
    // explicit call stack for pos, remaining, and v across recursion levels.

    int stackPosSlot   = operandExpression.allocateLocalVariableSlot(); // int[] pos stack
    int stackRemSlot   = operandExpression.allocateLocalVariableSlot(); // int[] remaining stack
    int stackVSlot     = operandExpression.allocateLocalVariableSlot(); // int[] v stack
    int stackDepthSlot = operandExpression.allocateLocalVariableSlot(); // int current depth

    // Allocate stacks of size (len+1) to hold recursion state.
    // We compute len+1 to avoid zero-size arrays when len==0.
    mv.visitVarInsn(ILOAD, lenSlot);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitIntInsn(NEWARRAY, T_INT);
    mv.visitVarInsn(ASTORE, stackPosSlot);

    mv.visitVarInsn(ILOAD, lenSlot);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitIntInsn(NEWARRAY, T_INT);
    mv.visitVarInsn(ASTORE, stackRemSlot);

    mv.visitVarInsn(ILOAD, lenSlot);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitIntInsn(NEWARRAY, T_INT);
    mv.visitVarInsn(ASTORE, stackVSlot);

    // depth = 0
    mv.visitInsn(ICONST_0);
    mv.visitVarInsn(ISTORE, stackDepthSlot);

    // stackPos[0] = 0, stackRem[0] = target, stackV[0] = 0
    mv.visitVarInsn(ALOAD, stackPosSlot);
    mv.visitInsn(ICONST_0);
    mv.visitInsn(ICONST_0);
    mv.visitInsn(IASTORE);

    mv.visitVarInsn(ALOAD, stackRemSlot);
    mv.visitInsn(ICONST_0);
    mv.visitVarInsn(ILOAD, targetSlot);
    mv.visitInsn(IASTORE);

    mv.visitVarInsn(ALOAD, stackVSlot);
    mv.visitInsn(ICONST_0);
    mv.visitInsn(ICONST_0);
    mv.visitInsn(IASTORE);

    // ── Main dispatch loop ────────────────────────────────────────────────
    Label loopTop    = new Label();
    Label loopEnd    = new Label();
    Label doLeaf     = new Label();
    Label doDescend  = new Label();
    Label doAscend   = new Label();

    // Local int slots for current frame values (reload each iteration).
    int   curPosSlot = operandExpression.allocateLocalVariableSlot();
    int   curRemSlot = operandExpression.allocateLocalVariableSlot();
    int   curVSlot   = operandExpression.allocateLocalVariableSlot();
    int   weightSlot = operandExpression.allocateLocalVariableSlot();
    int   maxVSlot   = operandExpression.allocateLocalVariableSlot();

    mv.visitLabel(loopTop);

    // Load cur frame: curPos = stackPos[depth], curRem = stackRem[depth], curV =
    // stackV[depth]
    mv.visitVarInsn(ALOAD, stackPosSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(IALOAD);
    mv.visitVarInsn(ISTORE, curPosSlot);

    mv.visitVarInsn(ALOAD, stackRemSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(IALOAD);
    mv.visitVarInsn(ISTORE, curRemSlot);

    mv.visitVarInsn(ALOAD, stackVSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(IALOAD);
    mv.visitVarInsn(ISTORE, curVSlot);

    // if (curPos == len) → leaf node
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitVarInsn(ILOAD, lenSlot);
    mv.visitJumpInsn(IF_ICMPEQ, doLeaf);
    mv.visitJumpInsn(GOTO, doDescend);

    // ── Leaf: if remaining == 0, evaluate body and accumulate ────────────
    mv.visitLabel(doLeaf);
    mv.visitVarInsn(ILOAD, curRemSlot);
    Label skipBody = new Label();
    mv.visitJumpInsn(IFNE, skipBody); // remaining != 0 → skip

    // Populate the IntegerFunction field so body calls familyName(ℓ) work.
    // The field is an instance of a generated IntegerFunction that reads
    // from the local arr[]. Because bytecode cannot close over a local
    // int[], we copy the current arr values into a context-registered
    // int[] field at this point.
    //
    // (The FunctionMapping lambda registered earlier delegates to this field.)
    generateFamilyFunctionBodyCall(mv, resultType, arrSlot, accumSlot, loIntSlot);

    mv.visitLabel(skipBody);

    // Ascend: depth--; if depth < 0 → done
    mv.visitLabel(doAscend);
    mv.visitIincInsn(stackDepthSlot, -1);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitJumpInsn(IFLT, loopEnd);

    // Reload parent frame curV and advance it.
    mv.visitVarInsn(ALOAD, stackVSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(IALOAD);
    mv.visitVarInsn(ISTORE, curVSlot);
    mv.visitIincInsn(curVSlot, 1);

    // Recompute curPos and weight for the parent frame.
    mv.visitVarInsn(ALOAD, stackPosSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(IALOAD);
    mv.visitVarInsn(ISTORE, curPosSlot);

    // weight = 2*(curPos+lo)+1
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitVarInsn(ILOAD, loIntSlot);
    mv.visitInsn(IADD);
    mv.visitInsn(ICONST_2);
    mv.visitInsn(IMUL);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitVarInsn(ISTORE, weightSlot);

    // maxV = stackRem[depth] / weight (reload rem from original frame)
    mv.visitVarInsn(ALOAD, stackRemSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(IALOAD);
    mv.visitVarInsn(ISTORE, curRemSlot);
    mv.visitVarInsn(ILOAD, curRemSlot);
    mv.visitVarInsn(ILOAD, weightSlot);
    mv.visitInsn(IDIV);
    mv.visitVarInsn(ISTORE, maxVSlot);

    // if curV > maxV → ascend again
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitVarInsn(ILOAD, maxVSlot);
    mv.visitJumpInsn(IF_ICMPGT, doAscend);

    // Update arr[curPos] = curV and update stackV[depth] = curV
    mv.visitVarInsn(ALOAD, arrSlot);
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitInsn(IASTORE);
    mv.visitVarInsn(ALOAD, stackVSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitInsn(IASTORE);

    // Descend to next position with updated remaining.
    // newRem = curRem - weight*curV
    int newRemAscend = operandExpression.allocateLocalVariableSlot();
    mv.visitVarInsn(ILOAD, curRemSlot);
    mv.visitVarInsn(ILOAD, weightSlot);
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitInsn(IMUL);
    mv.visitInsn(ISUB);
    mv.visitVarInsn(ISTORE, newRemAscend);

    // Push new frame: depth++
    mv.visitIincInsn(stackDepthSlot, 1);

    // stackPos[depth] = curPos + 1
    mv.visitVarInsn(ALOAD, stackPosSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitInsn(IASTORE);

    // stackRem[depth] = newRem
    mv.visitVarInsn(ALOAD, stackRemSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitVarInsn(ILOAD, newRemAscend);
    mv.visitInsn(IASTORE);

    // stackV[depth] = 0
    mv.visitVarInsn(ALOAD, stackVSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(ICONST_0);
    mv.visitInsn(IASTORE);
    mv.visitJumpInsn(GOTO, loopTop);

    // ── Descend: compute weight, maxV, push new frame ────────────────────
    mv.visitLabel(doDescend);

    // weight = 2*(curPos+lo)+1
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitVarInsn(ILOAD, loIntSlot);
    mv.visitInsn(IADD);
    mv.visitInsn(ICONST_2);
    mv.visitInsn(IMUL);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitVarInsn(ISTORE, weightSlot);

    // maxV = curRem / weight
    mv.visitVarInsn(ILOAD, curRemSlot);
    mv.visitVarInsn(ILOAD, weightSlot);
    mv.visitInsn(IDIV);
    mv.visitVarInsn(ISTORE, maxVSlot);

    // if curV > maxV → ascend (this slot is exhausted on entry, shouldn't
    // happen on first descent but guards re-entry)
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitVarInsn(ILOAD, maxVSlot);
    mv.visitJumpInsn(IF_ICMPGT, doAscend);

    // arr[curPos] = curV
    mv.visitVarInsn(ALOAD, arrSlot);
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitInsn(IASTORE);

    // Push new frame
    int newRem = operandExpression.allocateLocalVariableSlot();
    mv.visitVarInsn(ILOAD, curRemSlot);
    mv.visitVarInsn(ILOAD, weightSlot);
    mv.visitVarInsn(ILOAD, curVSlot);
    mv.visitInsn(IMUL);
    mv.visitInsn(ISUB);
    mv.visitVarInsn(ISTORE, newRem);

    mv.visitIincInsn(stackDepthSlot, 1);

    // stackPos[depth] = curPos + 1
    mv.visitVarInsn(ALOAD, stackPosSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitVarInsn(ILOAD, curPosSlot);
    mv.visitInsn(ICONST_1);
    mv.visitInsn(IADD);
    mv.visitInsn(IASTORE);

    // stackRem[depth] = newRem
    mv.visitVarInsn(ALOAD, stackRemSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitVarInsn(ILOAD, newRem);
    mv.visitInsn(IASTORE);

    // stackV[depth] = 0
    mv.visitVarInsn(ALOAD, stackVSlot);
    mv.visitVarInsn(ILOAD, stackDepthSlot);
    mv.visitInsn(ICONST_0);
    mv.visitInsn(IASTORE);

    mv.visitJumpInsn(GOTO, loopTop);

    // ── End of enumeration ───────────────────────────────────────────────
    mv.visitLabel(loopEnd);

    // Leave the accumulator on the stack as this node's result.
    mv.visitVarInsn(ALOAD, accumSlot);
    return mv;
  }

  /**
   * Emits the code to evaluate the body once for the current partition point and
   * accumulate the result into {@code accumSlot}.
   *
   * <p>
   * Before calling the body, we wire the current {@code int[]} contents into the
   * {@link IntegerFunction} registered under {@code familyName} so that
   * {@code familyName(q)} returns {@code arr[q - lo]} at runtime.
   *
   * @param mv         method visitor
   * @param resultType codomain type (e.g. Complex)
   * @param arrSlot    local slot holding the {@code int[]} array
   * @param accumSlot  local slot holding the accumulator object
   * @param loIntSlot  local slot holding the lo int primitive
   */
private void generateFamilyFunctionBodyCall(MethodVisitor mv,
                                             Class<?> resultType,
                                             int arrSlot,
                                             int accumSlot,
                                             int loIntSlot)
{
  mv.visitVarInsn(ALOAD, 0);
  mv.visitVarInsn(ALOAD, arrSlot);
  mv.visitFieldInsn(PUTFIELD, operandExpression.internalName(), arrayFieldName, "[I");

  bodyNode.generate(mv, resultType);

  mv.visitVarInsn(ALOAD, accumSlot);
  mv.visitInsn(SWAP);
  mv.visitVarInsn(ILOAD, 3);
  generateVirtualMethodInvocation(mv, resultType, operation, resultType, resultType, int.class);
  pop(mv);
}

  @Override
  @SuppressWarnings("unchecked")
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    var splicedOperandExpression = (Expression<Integer, S, Sequence<S>>) (Expression<?, ?, ?>) newExpression;
    if (!splicedOperandExpression.intermediateVariables.containsKey(arrayFieldName))
    {
      splicedOperandExpression.registerIntermediateVariable(arrayFieldName, int[].class, true);
    }
    splicedOperandExpression.registerReferencedFunction(familyName, familyMapping);
    return (Node<E, S, G>) new WeightedPartitionEnumeratorNode<E, S, G>(newExpression,
                                                                        splicedOperandExpression,
                                                                        familyName,
                                                                        arrayFieldName,
                                                                        familyMapping,
                                                                        familyIndexName,
                                                                        loNode.spliceInto(splicedOperandExpression),
                                                                        hiNode.spliceInto(splicedOperandExpression),
                                                                        bodyNode.spliceInto(splicedOperandExpression),
                                                                        identity,
                                                                        operation);
  }

  @Override
  public void replaceChild(Node<D, R, F> oldChild, Node<D, R, F> newChild)
  {
    throw new UnsupportedOperationException("replaceChild not implemented for WeightedPartitionEnumeratorNode");
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return loNode.dependsOn(variable.spliceInto(operandExpression).asVariable())
        || hiNode.dependsOn(variable.spliceInto(operandExpression).asVariable())
        || bodyNode.dependsOn(variable.spliceInto(operandExpression).asVariable());
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    throw new UnsupportedOperationException("replaceChild not implemented for WeightedPartitionEnumeratorNode");

  }
}