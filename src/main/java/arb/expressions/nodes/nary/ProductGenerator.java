package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.invokeSetMethod;

import org.objectweb.asm.*;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.unary.Function;
import arb.utensils.Utensils;

public class ProductGenerator extends
                              BoringPartsOfProductGenerator implements
                              Opcodes
{

  static MethodVisitor beginEvaluationCode(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, evaluate, "(ILarb/Real;)Larb/Real;", null, null);
    methodVisitor.visitCode();
    return methodVisitor;
  }

  void compareLoopIndexToEndIndex(MethodVisitor methodVisitor)
  {
    loadLoopIndexVariable(methodVisitor);
    loadEndIndex(methodVisitor);
    invokeMethod(methodVisitor, Integer.class, "compareTo", Utensils.getMethodDescriptor(int.class, Integer.class));
  }

  static void endEvaluationCode(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 3);
    methodVisitor.visitEnd();
  }

  static void loadLoopIndexVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "index", "Larb/Integer;");
  }

  void designateLoopBeginning(MethodVisitor methodVisitor)
  {
    methodVisitor.visitJumpInsn(GOTO, afterLoop);
    methodVisitor.visitLabel(beforeLoop);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  void designateLoopFinished(MethodVisitor methodVisitor)
  {
    methodVisitor.visitLabel(afterLoop);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  void evaluateFactor(MethodVisitor methodVisitor)
  {
    loadFactorFunction(methodVisitor);
    loadLoopIndexVariable(methodVisitor);
    loadBits(methodVisitor);
    loadVariableThatHoldsTheEvaluatedFactor(methodVisitor);
    invokeMethod(methodVisitor, Function.class, evaluate, evaluateMethodSignature);
  }

  @Override
  void generateEvaluateMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = beginEvaluationCode(classWriter);
    initializeProductResultToItsIdentity(methodVisitor);
    setIndexToTheStartIndex(methodVisitor);
    designateLoopBeginning(methodVisitor);
    loadResultVariable(methodVisitor);
    evaluateFactor(methodVisitor);
    multiplyFactor(methodVisitor);
    incrementIndex(methodVisitor);
    designateLoopFinished(methodVisitor);
    jumpToLoopBeginningIfThatWasntTheLastFactor(methodVisitor);
    loadResultVariable(methodVisitor);
    endEvaluationCode(methodVisitor);
  }

  void incrementIndex(MethodVisitor methodVisitor)
  {
    loadLoopIndexVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
    pop(methodVisitor);
  }

  void initializeProductResultToItsIdentity(MethodVisitor methodVisitor)
  {
    loadResultVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Real", "one", "()Larb/Real;");
    pop(methodVisitor);
  }

  void jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
  }

  void jumpToLoopBeginningIfThatWasntTheLastFactor(MethodVisitor methodVisitor)
  {
    compareLoopIndexToEndIndex(methodVisitor);
    jumpToIfLessThanOrEquals(methodVisitor, beforeLoop);
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValue, Real.class);
  }

  void multiplyFactor(MethodVisitor methodVisitor)
  {
    loadBits(methodVisitor);
    invokeMethod(methodVisitor,
                 Real.class,
                 "mul",
                 Utensils.getMethodDescriptor(Field.class, Field.class, int.class, Field.class));
    pop(methodVisitor);
  }

  void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    loadLoopIndexVariable(methodVisitor);
    loadStartIndex(methodVisitor);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    pop(methodVisitor);
  }
}
