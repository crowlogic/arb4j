package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameter;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * @param <D> domain
 * @param <R> range
 * @param <F> {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Product<D, R, F extends Function<D, R>> extends
                    Node<D, R, F>
{

  public Node<D, R, F>     endIndex;

  public Node<D, R, F>     factor;

  public Variable<D, R, F> index;

  public Node<D, R, F>     startIndex;

  private String           productResultVariable;

  public Product(Expression<D, R, F> expression, Node<D, R, F> node)
  {
    super(expression);
    factor        = node;
    functionClass = expression.className;
    assert functionClass != null : "functionClass is null";
  }

  public Product<D, R, F> evaluateRangeSpecification()
  {
    String rem = expression.remaining();
    if (!expression.nextCharacterIs('{'))
    {
      throwException(format(MISSING_OPENING_CURLY_BRACE, expression.character, rem));
    }
    var indexVar = expression.determine();
    if (!(indexVar instanceof Variable<D, R, F>))
    {
      throwException(format(NONVARIABLE_MSG, indexVar, rem));
    }
    index = (Variable<D, R, F>) indexVar;
    if (!expression.nextCharacterIs('='))
    {
      throwException(format(MISSING_EQUALS, expression.character, expression.position, expression));
    }
    startIndex = expression.determine();
    if (!expression.nextCharacterIs('…'))
    {
      throwException(format(MISSING_ELLIPSIS, expression.character, expression.position, expression));

    }
    endIndex = expression.determine();
    if (!expression.nextCharacterIs('}'))
    {
      throwException(format(MISSING_CLOSING_CURLY_BRACE, rem));
    }

    return this;
  }

  private void throwException(String msg)
  {
    throw new ExpressionCompilerException(msg);
  }

  public Product(Expression<D, R, F> expression)
  {

    super(expression);
    {

      expression.context.registerVariable(getIndexFieldName(), new Integer());
    }

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    expression.printWriter.println("-----begin generateProduct------");
    productResultVariable = expression.reserveIntermediateVariable(mv, resultType);
    out.flush();

    out.println("-----begin generateInitializer------");

    /**
     * <pre>
     * ALOAD 2 via this{@link #loadResultingProductVariable(MethodVisitor)}
     * INVOKE "one" via this{@link #invokeMethod(MethodVisitor, String, String, String)}
     * POP
     * </pre>
     */
    out.println("-----begin initializeResultToItsIdentity------");

    invokeMethod(mv, resultType, "identity", Utensils.getMethodDescriptor(resultType), false);
    pop(mv);
    out.println("-----end initializeResultToItsIdentity------");

    setIndexToTheStartIndex(mv);

    designateLabel(mv, beginningOfTheLoop);
    mv.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
    { Type.getInternalName(resultType) });

    out.println("-----end generateInitializer------");

    generateInnerLoop(mv);

    designateLabel(mv, justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot);

    loadEndIndex(mv);
    invokeMethod(mv, Integer.class, "compareTo", Utensils.getMethodDescriptor(int.class, Integer.class), false);

    jumpToIfLessThanOrEquals(mv, beginningOfTheLoop);

    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      Compiler.checkClassCast(mv, type());
      loadResultingProductVariable(mv);
      invokeSetMethod(mv, type(), type());

    }
    out.println("-----end generateProduct------");

    return mv;

  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "not recycleable";
    return mv;
  }

  @Override
  public String toString()
  {
    return typeset();
  }

  @Override
  public Class<Real> type()
  {
    return Real.class;
  }

  private static final String MISSING_CLOSING_CURLY_BRACE = "Expected the closing curly brace } of the range specification {k=a..b} in Πf(k){k=a..b}"
                + " to follow the ending index parameter b, instead got '%s' with remaining";
  private static final String MISSING_ELLIPSIS            = "Expected an … character after the start index a in the "
                + "index specification {k=a..b} in ∏f(k){k=a..b} but instead got '%c' at position %d in %s";
  private static final String MISSING_EQUALS              = "Expected an = character after the index variable specification {k=a..b} "
                + "in ∏f(k){k=a..b} but instead got '%c' at position %d in %s";
  private static final String MISSING_OPENING_CURLY_BRACE = "Expected the opening curly brace { of the product range specification {k=a..b} in Πf(k){k=a..b}"
                + " to follow the operand definition, instead got '%c' with remaining %s";

  private static final String NONVARIABLE_MSG             = "Expected the first element of the product range specification"
                + " {...} in ∏f(k){k=a…b} to be a Variable but got %s with remaining %s";

  @Override
  public String typeset()
  {
    return String.format("\\prod_{%s = %s}^{%s}{%s}",
                         index.typeset(),
                         startIndex.typeset(),
                         endIndex.typeset(),
                         factor.typeset());
  }

  private static final String MUL_METHOD_DESCRIPTOR = Utensils.getMethodDescriptor(Real.class,
                                                                                   Real.class,
                                                                                   int.class,
                                                                                   Real.class);

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
  }

  /**
   * 
   * @param mv
   */
  public void generateInnerLoop(MethodVisitor mv)
  {
    out.println("-----begin generateInnerLoop------");

    loadResultingProductVariable(mv);

    loadFieldFromThis(mv, "factor", Function.class);
    loadFieldFromThis(mv, "index", Integer.class);
    loadBitsParameter(mv);
    loadFieldFromThis(mv, "factorValue", expression.rangeType);
    invokeMethod(mv, Type.getInternalName(Function.class), "evaluate", factorEvaluateMethodSignature, true);
    Compiler.checkClassCast(mv, expression.rangeType);
    loadBitsParameter(mv);
    invokeMethod(mv,
                 expression.rangeType,
                 "mul",
                 Utensils.getMethodDescriptor(expression.rangeType, expression.rangeType, int.class),
                 false);
    mv.visitInsn(Opcodes.POP);

    incrementIndex(mv);

    out.println("-----end generateInnerLoop------");
  }

  void incrementIndex(MethodVisitor methodVisitor)
  {
    out.println("-----begin incrementIndex------");
    loadIndexVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
    out.println("-----end incrementIndex------");
  }

  MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    out.format("IFLE GOTO %s\n", label);
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, "factorValue", Real.class);
  }

  void multiplyResultingProductVariableByFactor(MethodVisitor methodVisitor)
  {
    out.println("-----begin multiplyResultingProductVariableByFactor------");
    loadBitsParameter(methodVisitor);
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

  protected static final String evaluate                      = "evaluate";

  protected static String       factorEvaluateMethodSignature = Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                         Type.getType(Object.class),
                                                                                         Type.getType(int.class),
                                                                                         Type.getType(Object.class));

  String                        functionClass;

  protected void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    out.format("getField(fieldName=%s, fieldTypeSignature=%s\n", fieldName, fieldTypeSignature);
    getField(methodVisitor, functionClass, fieldName, fieldTypeSignature);
  }

  protected static MethodVisitor
            getField(MethodVisitor mv, String thisClassInternalName, String fieldName, Class<?> type)
  {
    return getField(mv, thisClassInternalName, fieldName, type.descriptorString());
  }

  protected static MethodVisitor getField(MethodVisitor methodVisitor,
                                          String thisClassInternalName,
                                          String fieldName,
                                          String fieldTypeSignature)
  {
    assert thisClassInternalName != null : "thisClassInternalName is null";
    loadThis(methodVisitor).visitFieldInsn(GETFIELD, thisClassInternalName, fieldName, fieldTypeSignature);
    System.out.format("GET %s field of type %s\n", fieldName, fieldTypeSignature, thisClassInternalName);
    return methodVisitor;
  }

  protected void loadEndIndex(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "endIndex", "Larb/Integer;");
  }

  protected void loadFactorFunction(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, "factor", Function.class);
  }

  void invokeMethod(MethodVisitor methodVisitor,
                    Class<?> thisClass,
                    String functionName,
                    String methodSignature,
                    boolean isInterface)
  {
    invokeMethod(methodVisitor, Type.getInternalName(thisClass), functionName, methodSignature, isInterface);
  }

  void invokeMethod(MethodVisitor methodVisitor,
                    String classInternalName,
                    String methodName,
                    String methodSignature,
                    boolean isInterface)
  {
    System.out.format("INVOKE%s %s.%s methodSignature=%s\n",
                      isInterface ? "INTERFACE" : "VIRTUAL",
                      classInternalName,
                      methodName,
                      methodSignature);

    methodVisitor.visitMethodInsn(isInterface ? INVOKEINTERFACE : INVOKEVIRTUAL,
                                  classInternalName,
                                  methodName,
                                  methodSignature,
                                  isInterface);
  }

  void invokeMethod(MethodVisitor methodVisitor, String classInternalName, String methodName, String methodSignature)
  {

    invokeMethod(methodVisitor, classInternalName, methodName, methodSignature, false);
  }

  protected MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getField(mv, functionClass, fieldName, type);
  }

  /**
   * Calls this{@link #getField(MethodVisitor, String, String, Class)} so that the
   * variable named by this{@link #productResultVariable} is put on the top of the
   * stack
   * 
   * @param methodVisitor
   */
  void loadResultingProductVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, expression.className, productResultVariable, expression.rangeType);

  }

  protected void loadStartIndex(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "startIndex", "Larb/Integer;");
  }

  protected static MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    System.out.println("loadThis ALOAD 0");

    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  protected Label justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot = new Label();

  protected Label beginningOfTheLoop                                                            = new Label();

  protected void pop(MethodVisitor methodVisitor)
  {
    out.println("POP");
    methodVisitor.visitInsn(POP);
  }

}
