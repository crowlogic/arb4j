package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;
import static java.lang.System.out;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ProductGenerator<D, R, F extends Function<D, R>> extends
                              BoringPartsOfProductGenerator implements
                              Opcodes
{

  private static final String MUL_METHOD_DESCRIPTOR = Utensils.getMethodDescriptor(Real.class,
                                                                                   Real.class,
                                                                                   int.class,
                                                                                   Real.class);
  private Node<D, R, F> product;
  private Expression<D, R, F> expression;

  public  ProductGenerator(Node<D, R, F> product, String internalName)
  {
    this.product =product;
    this.functionClass = internalName;
    this.expression = product.expression;
  }

  static MethodVisitor beginEvaluationCode(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, evaluate, "(ILarb/Real;)Larb/Real;", null, null);
    methodVisitor = new ExecutionFlowDocumenter(ASM9, methodVisitor);
    methodVisitor.visitCode();;
    return methodVisitor;
  }

  MethodVisitor compareIndexToEndIndex(MethodVisitor methodVisitor)
  {
    out.println("-----begin compareIndexToEndIndex------");

    loadIndexVariable(methodVisitor);
    loadEndIndex(methodVisitor);
    invokeMethod(methodVisitor,
                 Integer.class,
                 "compareTo",
                 Utensils.getMethodDescriptor(int.class, Integer.class),
                 false);
    out.println("-----end compareIndexToEndIndex------");
    return methodVisitor;

  }

  static void endEvaluationCode(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(6, 4);
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
    expression.printWriter.println("-----begin generateProduct------");
    out.flush();

    generateInitializer(methodVisitor);

    generateInnerLoop(methodVisitor);

    generateConditionalBranchJumpBackToTheBeginningOfTheLoop(methodVisitor);

    out.println("-----end generateProduct------");
  }

  private void generateConditionalBranchJumpBackToTheBeginningOfTheLoop(MethodVisitor methodVisitor)
  {
    designateLabel(methodVisitor, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);
    jumpToLoopBeginningIfNotLastFactor(methodVisitor);
  }

  private void generateInitializer(MethodVisitor methodVisitor)
  {
    out.println("-----begin generateInitializer------");

    /**
     * <pre>
     * ALOAD 2 via this{@link #loadResultingProductVariable(MethodVisitor)}
     * INVOKE "one" via this{@link #invokeMethod(MethodVisitor, String, String, String)}
     * POP
     * </pre>
     */
    initializeResultToItsIdentity(methodVisitor);

    setIndexToTheStartIndex(methodVisitor);

    jumpTo(methodVisitor, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);

    designateLabel(methodVisitor, beginningOfTheLoop);
    out.println("-----end generateInitializer------");

  }

  /**
   * TODO; go over this the bug is here most
   * 
   * @param methodVisitor
   */
  public void generateInnerLoop(MethodVisitor methodVisitor)
  {
    out.println("-----begin generateInnerLoop------");

    // assert false : " * TODO; go over this the bug is here most\n";

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
    out.println("-----end generateInnerLoop------");
  }

  private void returnResult(MethodVisitor methodVisitor)
  {
    loadResultingProductVariable(methodVisitor);
    endEvaluationCode(methodVisitor);
  }

  private void jumpTo(MethodVisitor methodVisitor, Label label)
  {
    out.format("GOTO %s\n", label);
    methodVisitor.visitJumpInsn(GOTO, label);
  }

  void incrementIndex(MethodVisitor methodVisitor)
  {
    out.println("-----begin incrementIndex------");
    loadIndexVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
    pop(methodVisitor);
    out.println("-----end incrementIndex------");
  }

  /**
   * Emits
   * 
   * <pre>
   * ALOAD 2 via this{@link #loadResultingProductVariable(MethodVisitor)}
   * INVOKE "one" via this{@link #invokeMethod(MethodVisitor, String, String, String)}
   * POP
   * </pre>
   * 
   * @param methodVisitor
   */
  void initializeResultToItsIdentity(MethodVisitor methodVisitor)
  {
    out.println("-----begin initializeResultToItsIdentity------");

    loadResultingProductVariable(methodVisitor);
    invokeMethod(methodVisitor, Real.class, "one", Utensils.getMethodDescriptor(Real.class), false);
    pop(methodVisitor);
    out.println("-----end initializeResultToItsIdentity------");

  }

  MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    out.format("IFLE GOTO %s\n", label);
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
    out.println("-----begin multiplyResultingProductVariableByFactor------");
    loadBits(methodVisitor);
    loadResultingProductVariable(methodVisitor);
    invokeMethod(methodVisitor, Real.class, "mul", MUL_METHOD_DESCRIPTOR, false);
    pop(methodVisitor);
    out.println("-----end multiplyResultingProductVariableByFactor------");
  }

  void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    out.println("-----begin setIndexToTheStartIndex------");

    loadIndexVariable(methodVisitor);
    loadStartIndex(methodVisitor);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    pop(methodVisitor);
    out.println("-----endsetIndexToTheStartIndex------");

  }
}
