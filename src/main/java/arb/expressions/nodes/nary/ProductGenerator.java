package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;

import org.objectweb.asm.*;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary} *
 */
public class ProductGenerator extends
                              BoringPartsOfProductGenerator implements
                              Opcodes
{

  private static final String MUL_METHOD_DESCRIPTOR = Utensils.getMethodDescriptor(Real.class, Real.class, int.class, Real.class);

  public ProductGenerator(String functionClass)
  {
    this.functionClass = functionClass;
  }

  static MethodVisitor beginEvaluationCode(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, evaluate, "(ILarb/Real;)Larb/Real;", null, null);
    methodVisitor.visitCode();
    return methodVisitor;
  }

  MethodVisitor compareIndexToEndIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    loadEndIndex(methodVisitor);
    invokeMethod(methodVisitor,
                 Integer.class,
                 "compareTo",
                 Utensils.getMethodDescriptor(int.class, Integer.class),
                 false);
    return methodVisitor;
  }

  static void endEvaluationCode(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 3);
    methodVisitor.visitEnd();
  }

  void loadIndexVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, getIndexFieldName(), "Larb/Integer;");
  }

  public String getIndexFieldName()
  {
    return "index";
  }

  private void designateLabel(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitLabel(label);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  @Override
  public void generateEvaluateMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = beginEvaluationCode(classWriter);

    generateProduct(methodVisitor);

    returnResult(methodVisitor);
  }

  public void generateProduct(MethodVisitor methodVisitor)
  {
    generateInitializer(methodVisitor);

    generateInnerLoop(methodVisitor);

    generateConditionalBranchJumpBackToTheBeginningOfTheLoop(methodVisitor);
  }

  private void generateConditionalBranchJumpBackToTheBeginningOfTheLoop(MethodVisitor methodVisitor)
  {
    designateLabel(methodVisitor, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);
    jumpToLoopBeginningIfNotLastFactor(methodVisitor);
  }

  private void generateInitializer(MethodVisitor methodVisitor)
  {
    initializeResultToItsIdentity(methodVisitor);
    setIndexToTheStartIndex(methodVisitor);
    jumpTo(methodVisitor, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);
    designateLabel(methodVisitor, beginningOfTheLoop);
  }

  /**
   * TODO; go over this the bug is here most
   * 
   * @param methodVisitor
   */
  public void generateInnerLoop(MethodVisitor methodVisitor)
  {
    assert false : "   * TODO; go over this the bug is here most\n";
                  
    loadIndexVariable(methodVisitor);
    loadResultingProductVariable(methodVisitor);
    loadFactorFunction(methodVisitor);
    loadIndexVariable(methodVisitor);
    loadBits(methodVisitor);
    loadVariableThatHoldsTheEvaluatedFactor(methodVisitor);
    invokeMethod(methodVisitor, Function.class, evaluate, factorEvaluateMethodSignature, true);
    checkClassCast(methodVisitor, Real.class);
    multiplyResultingProductVariableByFactor(methodVisitor);
    incrementIndex(methodVisitor);
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
    loadIndexVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
    pop(methodVisitor);
  }

  void initializeResultToItsIdentity(MethodVisitor methodVisitor)
  {
    loadResultingProductVariable(methodVisitor);
    invokeMethod(methodVisitor, Real.class, "one", Utensils.getMethodDescriptor(Real.class), false);
    pop(methodVisitor);
  }

  MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  void jumpToLoopBeginningIfNotLastFactor(MethodVisitor methodVisitor)
  {
    jumpToIfLessThanOrEquals(compareIndexToEndIndex(methodVisitor), beginningOfTheLoop);
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValue, Real.class);
  }

  void multiplyResultingProductVariableByFactor(MethodVisitor methodVisitor)
  {
    loadBits(methodVisitor);
    loadResultingProductVariable(methodVisitor);
    invokeMethod(methodVisitor,
                 Real.class,
                 "mul",
                 MUL_METHOD_DESCRIPTOR,
                 false);
    pop(methodVisitor);
  }

  void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    loadStartIndex(methodVisitor);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    pop(methodVisitor);
  }
}
