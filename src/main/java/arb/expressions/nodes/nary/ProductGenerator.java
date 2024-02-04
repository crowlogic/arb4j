package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.invokeSetMethod;

import org.objectweb.asm.*;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.unary.Function;
import arb.utensils.Utensils;

/**
 * <pre>
 * Generates bytecode for evaluating the product of factors using the ASM
 * library. This class extends {@link BoringPartsOfProductGenerator} and
 * implements specific bytecode generation techniques to dynamically calculate
 * the product of an arbitrary number of {@link arb.Real} factors at runtime.
 * 
 * It utilizes the ASM framework to construct a method within the bytecode of a
 * dynamically generated class. This method iterates over factors, evaluates
 * each one, and accumulates their product. The class defines the structure and
 * logic for this process, including initializing the product value, managing
 * the iteration over factors, and handling the multiplication logic.
 *
 * Key functionalities include: 
 * - Setting up the method structure for product evaluation. 
 * - Dynamically loading factors and calculating their product. 
 * - Managing loop control for iteration over factors. 
 * </pre>
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author Stephen Crowley <stephencrowley214@gmail.com>
 * 
 */
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

  private void designateLabel(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitLabel(label);
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
  public void generateEvaluateMethod(ClassWriter classWriter)
  {
    /**
     * TODO: now to adapt this to inject this inline an already open MethodVisitor
     */
    MethodVisitor methodVisitor = beginEvaluationCode(classWriter);
    initializeProductResultToItsIdentity(methodVisitor);
    setIndexToTheStartIndex(methodVisitor);

    jumpTo(methodVisitor, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);
    designateLabel(methodVisitor, beginningOfTheLoop);
    loadResultingProductVariable(methodVisitor);
    evaluateFactor(methodVisitor);
    multiplyResultingProductVariableByFactor(methodVisitor);
    incrementIndex(methodVisitor);
    designateLabel(methodVisitor, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);
    jumpToLoopBeginningIfThatWasntTheLastFactor(methodVisitor);

    returnResult(methodVisitor);
  }

  private void returnResult(MethodVisitor methodVisitor)
  {
    loadResultingProductVariable(methodVisitor);
    endEvaluationCode(methodVisitor);
  }

  private void jumpTo(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(GOTO, label);
  }

  void incrementIndex(MethodVisitor methodVisitor)
  {
    loadLoopIndexVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
    pop(methodVisitor);
  }

  void initializeProductResultToItsIdentity(MethodVisitor methodVisitor)
  {
    loadResultingProductVariable(methodVisitor);
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
    jumpToIfLessThanOrEquals(methodVisitor, beginningOfTheLoop);
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValue, Real.class);
  }

  void multiplyResultingProductVariableByFactor(MethodVisitor methodVisitor)
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
