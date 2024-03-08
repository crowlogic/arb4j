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
import static org.objectweb.asm.Opcodes.PUTFIELD;

import java.util.Optional;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.IntermediateVariable;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * abstract base class for {@link Product} and {@link Sum}
 * 
 * @param <D> domain
 * @param <R> range
 * @param <F> {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class NAryOperation<D, R, F extends Function<D, R>> extends
                                   Node<D, R, F>
{

  protected Class<?>      generatedType;
  protected static String factorEvaluateMethodSignature = Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                   Type.getType(Object.class),
                                                                                   Type.getType(int.class),
                                                                                   Type.getType(Object.class));

  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
  }

  private static final String MISSING_CLOSING_CURLY_BRACE = "Expected the closing curly brace } of the range specification {k=a..b} in %sf(k){k=a..b}"
                + " to follow the ending index parameter b, instead got '%s' with remaining";
  private static final String MISSING_ELLIPSIS            = "Expected an … character after the start index a in the "
                + "index specification {k=a..b} in %sf(k){k=a..b} but instead got '%c' at position %d in %s";
  private static final String MISSING_OPENING_CURLY_BRACE = "Expected the opening curly brace { of the product range specification {k=a..b} in %sf(k){k=a..b}"
                + " to follow the operand definition, instead got '%c' with remaining %s";

  protected static MethodVisitor
            getField(MethodVisitor mv, String thisClassInternalName, String fieldName, Class<?> type)
  {
    return getThisField(mv, thisClassInternalName, fieldName, type.descriptorString());
  }

  protected static MethodVisitor getThisField(MethodVisitor methodVisitor,
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
    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class : resultType);

    assignFieldNames(resultType);

    prepareIndexVariable();

    generateFactorClass(resultType);

    propagateInputToFactorClass(mv);

    initializeResultVariable(mv, resultType);

    setIndexToTheStartIndex(mv);

    generateEndingIndex(mv);

    designateLabel(mv, beginningOfTheLoop, expression.isRealNumberOnTopOfTheStack());

    generateInnerLoop(mv);

    compareIndexToEndIndex(mv);

    jumpToIfLessThanOrEquals(mv, beginningOfTheLoop);

    assignResult(mv, resultType);

    return mv;

  }

  protected Label      beginningOfTheLoop = new Label();
  public Node<D, R, F> endIndex;
  public String        factor;
  public String        functionClass;
  public String        index;
  public Node<D, R, F> startIndex;
  private String       factorValueFieldName;
  private String       factorFunctionFieldName;
  private String       endIndexFieldName;

  public void generateInnerLoop(MethodVisitor mv)
  {
    loadResultVariable(mv);
    loadFactor(mv);
    loadIndex(mv);
    loadBitsParameter(mv);
    loadFactorValue(mv);
    evaluateFactor(mv);
    checkClassCast(mv, generatedType);
    loadBitsParameter(mv);
    operate(mv);
    pop(mv);
    incrementIndex(mv);
  }

  public NAryOperation(Expression<D, R, F> expression)
  {
    super(expression);
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    this.factor   = parseFactorExpression();
    functionClass = expression.className;
    assert functionClass != null : "functionClass is null";
    generatedType = (RealPolynomial.class.equals(expression.rangeType) ? Real.class : expression.rangeType);
    if (index != null)
    {
      expression.position += factor.length();
    }
    expression.character = expression.expression.charAt(expression.position);
    evaluateRangeSpecification();
  }

  protected String parseFactorExpression()
  {
    int length     = expression.expression.length();
    int startPos   = expression.position;
    int arrowIndex = expression.expression.indexOf('➔', expression.position);

    if (arrowIndex != -1)
    {
      index               = expression.expression.substring(startPos, arrowIndex);
      expression.position = arrowIndex + 1;
    }

    int rangeSpecificationPosition = index != null ? expression.expression.indexOf(String.format("{%s=", index),
                                                                                   expression.position) : -1;
    if (rangeSpecificationPosition == -1)
    {
      while (expression.character != '{' && expression.position < length)
      {
        expression.nextCharacter();
      }

      String str = expression.expression.substring(startPos, expression.position).trim();
      return str;
    }
    else
    {
      String pos = expression.expression.substring(arrowIndex + 1, rangeSpecificationPosition).trim();
      return pos;
    }
  }

  protected void designateLabel(MethodVisitor mv, Label label, boolean appendRealToFrame)
  {
    mv.visitLabel(label);
    if (!appendRealToFrame)
    {
      mv.visitFrame(Opcodes.F_SAME, 0, null, 0, new Object[]
      {});
    }
    else
    {
      mv.visitFrame(Opcodes.F_SAME1, 0, null, 0, new Object[]
      { Type.getInternalName(expression.typeStack.getLast()) });
    }
  }

  protected void evaluateFactor(MethodVisitor mv)
  {
    invokeMethod(mv,
                 Type.getInternalName(arb.functions.Function.class),
                 "evaluate",
                 factorEvaluateMethodSignature,
                 true);
  }

  public String resultVariable;

  public NAryOperation<D, R, F> evaluateRangeSpecification()
  {
    if (!expression.nextCharacterIs('{'))
    {
      throwException(format(MISSING_OPENING_CURLY_BRACE, "Π", expression.character, expression.remaining()));
    }
    if (index != null)
    {
      String shouldBeIndex = expression.parseName();
      if (!index.equals(shouldBeIndex))
      {
        throw new ExpressionCompilerException(String.format("index variable specified in the range specification '%s' != the index variable specified between the operator symbol and the right arrow '%s'",
                                                            shouldBeIndex,
                                                            index));
      }
    }
    else
    {
      index = expression.parseName();
    }
    if (!expression.nextCharacterIs('='))
    {
      throw new ExpressionCompilerException("Expected = character after index variable name at position "
                    + expression.position + "in " + expression);
    }

    parseStartIndex();
    parseEndIndex();
    return this;
  }

  protected void assignResult(MethodVisitor mv, Class<?> resultType)
  {
    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      Class<?> type = type();
      Compiler.checkClassCast(mv, type);
      loadResultVariable(mv);
      invokeSetMethod(mv, type, type);
    }
    else
    {
      loadResultVariable(mv);
    }
  }

  protected void assignFieldNames(Class<?> resultType)
  {
    factorFunctionFieldName = expression.getNextIntermediateVariableFieldName("factor", resultType);
    factorValueFieldName    = expression.newIntermediateVariable("value", resultType);
    if (expression.traceGenerator)
    {
      System.out.format("%s.assignFieldNames(resultType=%s) factorFunctionFieldName=%s factorValueFieldName=%s\n",
                        getClass(),
                        resultType,
                        factorFunctionFieldName,
                        factorValueFieldName);
    }
  }

  protected void generateFactorClass(Class<?> resultType)
  {
    String expr = format("%s➔%s", getIndexFieldName(), factor);
    if (expression.traceGenerator)
    {
      System.out.format("%s: generateFactorClass( expr=%s,resultType=%s)\n",
                        getClass().getSimpleName(),
                        expr,
                        resultType);

    }
    Expression<Integer, ?, Function<Integer, Object>> factorExpression = Compiler.express(factorFunctionFieldName,
                                                                                          expr,
                                                                                          expression.context,
                                                                                          Integer.class,
                                                                                          resultType,
                                                                                          arb.functions.Function.class,
                                                                                          factorFunctionFieldName,
                                                                                          expression);

    var                                               factorInstance   = factorExpression.instantiate();

    registerFactorSubexpressionInstance(factorExpression, factorInstance);
  }

  protected void compareIndexToEndIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, endIndexFieldName, Integer.class);
    invokeMethod(mv, Integer.class, "compareTo", getMethodDescriptor(int.class, Integer.class), false);
  }

  protected void generateEndingIndex(MethodVisitor mv)
  {
    endIndexFieldName = expression.newIntermediateVariable("endIndex", Integer.class);
    loadFieldFromThis(mv, endIndexFieldName, Integer.class);
    endIndex.generate(mv, Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);
  }

  protected void prepareIndexVariable()
  {
    Optional<IntermediateVariable<D, R, F>> existingIndexVariable = expression.intermediateVariables.stream()
                                                                                                    .filter(predicate -> predicate.name.equals(getIndexFieldName()))
                                                                                                    .findFirst();

    if (existingIndexVariable.isPresent())
    {
      if (!existingIndexVariable.get().type.equals(Integer.class))
      {
        throw new ExpressionCompilerException("index variable " + existingIndexVariable
                      + " already declared  and not of Intger type so it cant be used as the index");
      }
    }
    else
    {
      expression.registerIntermediateVariable(getIndexFieldName(), Integer.class);
    }
  }

  private void
          registerFactorSubexpressionInstance(Expression<Integer, ?, Function<Integer, Object>> factorExpression,
                                              Function<Integer, Object> factorInstance)
  {
    expression.referencedFunctions.put(factorFunctionFieldName,
                                       expression.context.registerFunctionMapping(factorFunctionFieldName,
                                                                                  factorInstance,
                                                                                  Integer.class,
                                                                                  factorExpression.rangeType,
                                                                                  arb.functions.Function.class));
  }

  protected void propagateInputToFactorClass(MethodVisitor mv)
  {
    Variable<D, R, F> independentVariableNode = expression.independentVariableNode;
    if (independentVariableNode != null && !independentVariableNode.type().equals(Void.class))
    {
      expression.loadFieldOntoStack(loadThis(mv), factorFunctionFieldName, "L" + factorFunctionFieldName + ";");
      mv.visitVarInsn(ALOAD, 1);
      checkClassCast(mv, independentVariableNode.type());
      mv.visitFieldInsn(PUTFIELD,
                        factorFunctionFieldName,
                        independentVariableNode.reference.name,
                        independentVariableNode.type().descriptorString());
    }
  }

  protected void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    if (expression.verbose)
    {
      out.format("getField(fieldName=%s, fieldTypeSignature=%s\n", fieldName, fieldTypeSignature);
    }
    getThisField(methodVisitor, functionClass, fieldName, fieldTypeSignature);
  }

  public String getIndexFieldName()
  {
    return index;
  }

  protected void incrementIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    invokeMethod(methodVisitor,
                 Type.getInternalName(Integer.class),
                 "increment",
                 Type.getMethodDescriptor(Type.getType(Integer.class)));
  }

  protected void invokeMethod(MethodVisitor methodVisitor,
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

  protected MethodVisitor jumpToIfLessThanOrEquals(MethodVisitor methodVisitor, Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  protected void loadFactor(MethodVisitor mv)
  {
    getThisField(mv, functionClass, factorFunctionFieldName, "L" + factorFunctionFieldName + ";");
  }

  protected void loadFactorValue(MethodVisitor mv)
  {
    loadFieldFromThis(mv, factorValueFieldName, generatedType);
  }

  protected MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getField(mv, functionClass, fieldName, type);
  }

  protected void loadIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, index, Integer.class);
  }

  void loadIndexVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, getIndexFieldName(), "Larb/Integer;");
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValueFieldName, type() );
  }

  private void parseEndIndex()
  {
    endIndex = expression.evaluate();
    if (!expression.nextCharacterIs('}'))
    {
      throwException(format(MISSING_CLOSING_CURLY_BRACE, "Π", expression.remaining()));
    }
  }

  private void parseStartIndex()
  {
    startIndex = expression.resolve();
    if (!expression.nextCharacterIs('…'))
    {
      throwException(format(MISSING_ELLIPSIS, "∏", expression.character, expression.position, expression));

    }
  }

  protected void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "not recycleable";
    return mv;
  }

  protected void setIndexToTheStartIndex(MethodVisitor methodVisitor)
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
    return String.format("Π%s{%s=%s…%s}", factor, index, startIndex.typeset(), endIndex.typeset());
  }

  @Override
  public Class<?> type()
  {
    return generatedType;
  }

  @Override
  public String typeset()
  {
    return String.format("\\prod_{%s = %s}^{%s}{%s}", index, startIndex.typeset(), endIndex.typeset(), factor);
  }

  public void loadResultVariable(MethodVisitor methodVisitor)
  {
    expression.appendTypeToStack(generatedType);
    getField(methodVisitor, expression.className, resultVariable, generatedType);
  }

  public abstract void initializeResultVariable(MethodVisitor mv, Class<?> resultType);

  public abstract MethodVisitor operate(MethodVisitor mv);

}