package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameter;
import static arb.utensils.Utensils.getMethodDescriptor;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.IFLE;
import static org.objectweb.asm.Opcodes.INVOKEINTERFACE;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.POP;

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
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * 
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

  protected static String     factorEvaluateMethodSignature = Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                       Type.getType(Object.class),
                                                                                       Type.getType(int.class),
                                                                                       Type.getType(Object.class));

  private static final String MISSING_CLOSING_CURLY_BRACE   = "Expected the closing curly brace } of the range specification {k=a..b} in Πf(k){k=a..b}"
                + " to follow the ending index parameter b, instead got '%s' with remaining";

  private static final String MISSING_ELLIPSIS              = "Expected an … character after the start index a in the "
                + "index specification {k=a..b} in ∏f(k){k=a..b} but instead got '%c' at position %d in %s";

  private static final String MISSING_EQUALS                = "Expected an = character after the index variable specification {k=a..b} "
                + "in ∏f(k){k=a..b} but instead got '%c' at position %d in %s";

  private static final String MISSING_OPENING_CURLY_BRACE   = "Expected the opening curly brace { of the product range specification {k=a..b} in Πf(k){k=a..b}"
                + " to follow the operand definition, instead got '%c' with remaining %s";

  private static final String MUL_METHOD_DESCRIPTOR         = Utensils.getMethodDescriptor(Real.class,
                                                                                           Real.class,
                                                                                           int.class,
                                                                                           Real.class);

  private static final String NONVARIABLE_MSG               = "Expected the first element of the product range specification"
                + " {...} in ∏f(k){k=a…b} to be a Variable but got %s with remaining %s";

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
    return methodVisitor;
  }

  protected static MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    System.out.println("loadThis ALOAD 0");

    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  protected Label          beginningOfTheLoop = new Label();

  public Node<D, R, F>     endIndex;

  public Node<D, R, F>     factor;

  String                   functionClass;

  public Variable<D, R, F> index;

  private String           productResultVariable;
  public Node<D, R, F>     startIndex;

  public Product(Expression<D, R, F> expression, Node<D, R, F> node)
  {
    super(expression);
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    factor        = node;
    functionClass = expression.className;
    assert functionClass != null : "functionClass is null";
  }

  private void designateLabel(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitLabel(label);
  }

  private void evaluateFactor(MethodVisitor mv)
  {
    invokeMethod(mv, Type.getInternalName(Function.class), "evaluate", factorEvaluateMethodSignature, true);
  }

  public Product<D, R, F> evaluateRangeSpecification()
  {
    if (!expression.nextCharacterIs('{'))
    {
      throwException(format(MISSING_OPENING_CURLY_BRACE, expression.character, expression.remaining()));
    }
    var indexVar = expression.determine();
    if (!(indexVar instanceof Variable<D, R, F>))
    {
      throwException(format(NONVARIABLE_MSG, indexVar, expression.remaining()));
    }
    parseIndex(indexVar);
    parseStartIndex();
    parseEndIndex();

    if (startIndex instanceof LiteralConstant)
    {
      ((LiteralConstant<D, R, F>) startIndex).fieldName = "startIndex";
    }
    if (endIndex instanceof LiteralConstant)
    {
      ((LiteralConstant<D, R, F>) endIndex).fieldName = "endIndex";
    }

    return this;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    String factorExpression = getIndexFieldName() + "->" + getIndexFieldName();

    expression.context.registerVariable(getIndexFieldName(), new Integer());

    // FIXME: read the entire factor string , dont parse it, pass it to
    // Function.express here, for now we hard code it so that the factor is just the
    // value of the index of the factor for now

    Expression<Integer, Object, Function<Integer, Object>> factor = Compiler.express(factorExpression,
                                                                                     expression.context,
                                                                                     Integer.class,
                                                                                     resultType,
                                                                                     Function.class,
                                                                                     getFactorFieldName());

    expression.referencedFunctions.put(getFactorFieldName(),
                                       expression.context.registerFunctionMapping(getFactorFieldName(),
                                                                                  factor.instantiate(),
                                                                                  Integer.class,
                                                                                  Object.class,
                                                                                  Function.class));

    productResultVariable = expression.reserveIntermediateVariable(mv, resultType);
    invokeMethod(mv, resultType, "multiplicativeIdentity", getMethodDescriptor(resultType), false);
    pop(mv);
    setIndexToTheStartIndex(mv);
    designateLabel(mv, beginningOfTheLoop);
    mv.visitFrame(Opcodes.F_SAME, 0, null, 0, new Object[]
    {});

    generateInnerLoop(mv);

    endIndex.generate(mv, Integer.class);
    invokeMethod(mv, Integer.class, "compareTo", getMethodDescriptor(int.class, Integer.class), false);

    jumpToIfLessThanOrEquals(mv, beginningOfTheLoop);

    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      Class<Real> type = type();
      Compiler.checkClassCast(mv, type);
      loadResultingProductVariable(mv);
      invokeSetMethod(mv, type, type);

    }

    return mv;

  }

  public String getFactorFieldName()
  {
    return "factor";
  }

  public void generateInnerLoop(MethodVisitor mv)
  {
    loadResultingProductVariable(mv);
    loadFactor(mv);
    loadIndex(mv);
    loadBitsParameter(mv);
    loadFactorValue(mv);
    evaluateFactor(mv);
    checkClassCast(mv, expression.rangeType);
    loadBitsParameter(mv);
    multiplyFactor(mv);
    pop(mv);
    incrementIndex(mv);
  }

  protected void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    out.format("getField(fieldName=%s, fieldTypeSignature=%s\n", fieldName, fieldTypeSignature);
    getField(methodVisitor, functionClass, fieldName, fieldTypeSignature);
  }

  public String getIndexFieldName()
  {
    return index.reference.name;
  }

  void incrementIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
  }

  void invokeMethod(MethodVisitor methodVisitor,
                    Class<?> thisClass,
                    String functionName,
                    String methodSignature,
                    boolean isInterface)
  {
    invokeMethod(methodVisitor, Type.getInternalName(thisClass), functionName, methodSignature, isInterface);
  }

  void invokeMethod(MethodVisitor methodVisitor, String classInternalName, String methodName, String methodSignature)
  {

    invokeMethod(methodVisitor, classInternalName, methodName, methodSignature, false);
  }

  void invokeMethod(MethodVisitor methodVisitor,
                    String classInternalName,
                    String methodName,
                    String methodSignature,
                    boolean isInterface)
  {
    methodVisitor.visitMethodInsn(isInterface ? INVOKEINTERFACE : INVOKEVIRTUAL,
                                  classInternalName,
                                  methodName,
                                  methodSignature,
                                  isInterface);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

  MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  private void loadFactor(MethodVisitor mv)
  {
    loadFieldFromThis(mv, getFactorFieldName(), Function.class);
  }

  private void loadFactorValue(MethodVisitor mv)
  {
    loadFieldFromThis(mv, "factorValue", expression.rangeType);
  }

  protected MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getField(mv, functionClass, fieldName, type);
  }

  private void loadIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, index.reference.name, Integer.class);
  }

  void loadIndexVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, getIndexFieldName(), "Larb/Integer;");
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

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, "factorValue", Real.class);
  }

  private void multiplyFactor(MethodVisitor mv)
  {
    invokeMethod(mv,
                 expression.rangeType,
                 "mul",
                 getMethodDescriptor(expression.rangeType, expression.rangeType, int.class),
                 false);
  }

  void multiplyResultingProductVariableByFactor(MethodVisitor methodVisitor)
  {
    loadBitsParameter(methodVisitor);
    loadResultingProductVariable(methodVisitor);
    invokeMethod(methodVisitor, Real.class, "mul", MUL_METHOD_DESCRIPTOR, false);
    pop(methodVisitor);
  }

  private void parseEndIndex()
  {
    endIndex = expression.determine();
    if (!expression.nextCharacterIs('}'))
    {
      throwException(format(MISSING_CLOSING_CURLY_BRACE, expression.remaining()));
    }
  }

  private void parseIndex(Node<D, R, F> indexVar)
  {
    index = (Variable<D, R, F>) indexVar;
    if (!expression.nextCharacterIs('='))
    {
      throwException(format(MISSING_EQUALS, expression.character, expression.position, expression));
    }
  }

  private void parseStartIndex()
  {
    startIndex = expression.determine();
    if (!expression.nextCharacterIs('…'))
    {
      throwException(format(MISSING_ELLIPSIS, expression.character, expression.position, expression));

    }
  }

  protected void pop(MethodVisitor methodVisitor)
  {
    out.println("POP");
    methodVisitor.visitInsn(POP);
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "not recycleable";
    return mv;
  }

  void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    startIndex.generate(methodVisitor, Integer.class);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    pop(methodVisitor);
  }

  private void throwException(String msg)
  {
    throw new ExpressionCompilerException(msg);
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

  @Override
  public String typeset()
  {
    return String.format("\\prod_{%s = %s}^{%s}{%s}",
                         index.typeset(),
                         startIndex.typeset(),
                         endIndex.typeset(),
                         factor.typeset());
  }

}
