package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameter;
import static arb.utensils.Utensils.getMethodDescriptor;
import static arb.utensils.Utensils.indent;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.IFLE;
import static org.objectweb.asm.Opcodes.INVOKEINTERFACE;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.POP;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import java.util.List;
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
import arb.expressions.VariableReference;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.expressions.nodes.unary.FunctionCall;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * Represents a generic n-ary operation on {@link Node}s within
 * {@link Expression}s. This abstract base class provides the common structure
 * and behavior for operations that involve multiple operands, such as
 * {@link Summation}, {@link NaryMultiplication}, or other customized functions
 * that combine elements of a class over a range of values.
 * <p>
 * It handles the initialization and execution of these operations, including
 * setting up the operation's parameters, executing the operation over the
 * specified range, and managing intermediate results. The class leverages ASM
 * for bytecode manipulation, enabling dynamic generation and compilation of
 * expressions.
 * </p>
 * <p>
 * Generics <code>D</code>, <code>R</code>, and <code>F</code> represent the
 * domain, range, and the function type of the operation, respectively. This
 * allows for operations over different types of expressions and results,
 * facilitating flexibility and reuse in various mathematical and computational
 * contexts.
 * </p>
 * <p>
 * The class integrates closely with the {@link arb.expressions.Compiler} and
 * {@link arb.utensils.Utensils} for expression parsing, bytecode generation,
 * and utility methods, ensuring a seamless operation within the arb framework.
 * </p>
 * 
 * @param <D> the domain type of the operands and the operation
 * @param <R> the range type of the operation's result
 * @param <F> the function interface this operation implements, extending the
 *            Function interface with specific domain and range types
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NAryOperation<D, R, F extends Function<D, R>> extends
                          Node<D, R, F>
{

  public final String         symbol;

  protected static String     factorEvaluateMethodSignature =
                                                            Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                     Type.getType(Object.class),
                                                                                     Type.getType(int.class),
                                                                                     Type.getType(Object.class));

  private static final String MISSING_CLOSING_CURLY_BRACE   =
                                                          "Expected the closing curly brace } of the range specification {k=a..b} in %sf(k){k=a..b}"
                                                              + " to follow the ending index parameter b, instead got '%s' with remaining";

  private static final String MISSING_ELLIPSIS              =
                                               "Expected an … character after the start index a in the "
                                                              + "index specification {k=a..b} in %sf(k){k=a..b} but instead got '%c' at position %d in %s";

  private static final String MISSING_OPENING_CURLY_BRACE   =
                                                          "Expected the opening curly brace { of the product range specification {k=a..b} in %sf(k){k=a..b}"
                                                              + " to follow the operand definition, instead got '%c' with remaining %s";

  protected static MethodVisitor getField(MethodVisitor mv,
                                          String thisClassInternalName,
                                          String fieldName,
                                          Class<?> type)
  {
    return getThisField(mv, thisClassInternalName, fieldName, type.descriptorString());
  }

  protected static MethodVisitor getThisField(MethodVisitor methodVisitor,
                                              String thisClassInternalName,
                                              String fieldName,
                                              String fieldTypeSignature)
  {
    assert thisClassInternalName != null : "thisClassInternalName is null";
    loadThis(methodVisitor).visitFieldInsn(GETFIELD,
                                           thisClassInternalName,
                                           fieldName,
                                           fieldTypeSignature);
    return methodVisitor;
  }

  protected static MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  protected Class<?>   generatedType;

  protected Label      beginningOfTheLoop = new Label();

  public Node<D, R, F> endIndex;

  public String        factorExpression;

  public String        functionClass;

  public String        index;

  public Node<D, R, F> startIndex;

  private String       factorValueFieldName;

  private String       factorFunctionFieldName;

  private String       endIndexFieldName;

  public final String  operation;

  public final String  prefix;

  public final String  identity;

  public String        resultVariable;

  public NAryOperation(Expression<D, R, F> expression,
                       String identity,
                       String prefix,
                       String operation,
                       String symbol)
  {
    super(expression);
    this.identity  = identity;
    this.prefix    = prefix;
    this.operation = operation;
    this.symbol    = symbol;
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    this.factorExpression = parseFactorExpression();
    functionClass         = expression.className;
    assert functionClass != null : "functionClass=expression.className shan't be null";
    generatedType = (RealPolynomial.class.equals(expression.rangeType) ? Real.class
                                                                       : expression.rangeType);
    if (index != null)
    {
      expression.character =
                           expression.expression.charAt(expression.position +=
                                                                            factorExpression.length());
    }
    evaluateRangeSpecification();
  }

  protected void assignFieldNames(Class<?> resultType)
  {
    factorFunctionFieldName = expression.getNextIntermediateVariableFieldName("factor", resultType);
    factorValueFieldName    = expression.newIntermediateVariable("value", resultType);
    if (expression.traceGenerator)
    {
      int indentation = 18 + getClass().getSimpleName().length();
      System.out.format("%s.assignFieldNames(resultType=%s,\n%sfactorFunctionFieldName=%s,\n%sfactorValueFieldName=%s)\n\n",
                        getClass().getSimpleName(),
                        resultType,
                        indent(indentation),
                        factorFunctionFieldName,
                        indent(indentation),
                        factorValueFieldName);
    }
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

  protected void compareIndexToEndIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, endIndexFieldName, Integer.class);
    invokeMethod(mv,
                 Integer.class,
                 "compareTo",
                 getMethodDescriptor(int.class, Integer.class),
                 false);
  }

  protected void designateLabel(MethodVisitor mv, Label label, boolean addTypeToStackMap)
  {
    if (expression.traceGenerator)
    {
      System.out.format("%s.designateLabel( label=%s,\n%saddTypeToStackMap=%s)\n\n",
                        getClass().getSimpleName(),
                        label,
                        Utensils.indent(35),
                        addTypeToStackMap);
    }
    mv.visitLabel(label);
    if (!addTypeToStackMap)
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
                 Type.getInternalName(Function.class),
                 "evaluate",
                 factorEvaluateMethodSignature,
                 true);
  }

  public NAryOperation<D, R, F> evaluateRangeSpecification()
  {
    if (!expression.nextCharacterIs('{'))
    {
      throwException(format(MISSING_OPENING_CURLY_BRACE,
                            symbol,
                            expression.character,
                            expression.remaining()));
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
                                            + expression.position
                                            + "in "
                                            + expression);
    }

    parseStartIndex();
    parseEndIndex();
    return this;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    resultType = scalarDowncast(resultType);

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

  public Class<?> scalarDowncast(Class<?> resultType)
  {
    return resultType = generatedType = (RealPolynomial.class.equals(resultType) ? Real.class
                                                                                 : resultType);
  }

  protected void generateEndingIndex(MethodVisitor mv)
  {
    endIndexFieldName = expression.newIntermediateVariable("endIndex", Integer.class);
    loadFieldFromThis(mv, endIndexFieldName, Integer.class);
    endIndex.generate(mv, Integer.class);
    invokeSetMethod(mv, Integer.class, Integer.class);
    pop(mv);
  }

  protected <Q> void generateFactorClass(Class<Q> resultType)
  {
    String expr = format("%s➔%s", getIndexFieldName(), factorExpression);
    if (expression.traceGenerator)
    {
      System.out.format("%s.generateFactorClass( expr=%s,resultType=%s)\n\n",
                        getClass().getSimpleName(),
                        expr,
                        resultType);

    }
    Expression<Integer,
                  Q,
                  Function<Integer, Q>> factorExpression = Compiler.express(factorFunctionFieldName,
                                                                            expr,
                                                                            expression.context,
                                                                            Integer.class,
                                                                            resultType,
                                                                            Function.class,
                                                                            factorFunctionFieldName,
                                                                            expression);


    registerFactorSubexpressionInstance(factorExpression);
  }

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
    combine(mv);
    pop(mv);
    incrementIndex(mv);
  }

  /**
   * TODO: use a hash instead of doing a linear search thru intermediate variables
   * which could become an appreciable factor for sufficiently elaborate
   * expressions
   * 
   * @return
   */
  private Optional<IntermediateVariable<D, R, F>> getExistingIndexVariable()
  {
    String indexFieldName        = getIndexFieldName();

    var    existingIndexVariable =
                                 expression.intermediateVariables.stream()
                                                                 .filter(variable -> variable.name.equals(indexFieldName))
                                                                 .findFirst();
    return existingIndexVariable;
  }

  protected void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    if (expression.verbose || expression.traceGenerator)
    {
      out.format("getField(functionClass=%s,\n%sfieldName=%s,\n%sfieldTypeSignature=%s\n\n",
                 functionClass,
                 indent(9),
                 fieldName,
                 indent(9),
                 fieldTypeSignature);
    }
    getThisField(methodVisitor, functionClass, fieldName, fieldTypeSignature);
  }

  @Override
  public Class<?> getGeneratedType()
  {
    return generatedType;
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
                 Utensils.getMethodDescriptor(Integer.class));
  }

  public void initializeResult(MethodVisitor mv,
                               Class<?> resultType,
                               String identityFunction,
                               String prefix)
  {
    resultVariable = expression.reserveIntermediateVariable(mv, prefix, resultType);
    pop(invokeMethod(mv, resultType, identityFunction, getMethodDescriptor(resultType), false));
  }

  public void initializeResultVariable(MethodVisitor mv, Class<?> resultType)
  {
    initializeResult(mv, resultType, identity, prefix);
  }

  protected MethodVisitor invokeMethod(MethodVisitor methodVisitor,
                                       Class<?> thisClass,
                                       String functionName,
                                       String methodSignature,
                                       boolean isInterface)
  {
    return invokeMethod(methodVisitor,
                        Type.getInternalName(thisClass),
                        functionName,
                        methodSignature,
                        isInterface);
  }

  MethodVisitor invokeMethod(MethodVisitor methodVisitor,
                             String classInternalName,
                             String methodName,
                             String methodSignature)
  {
    return invokeMethod(methodVisitor, classInternalName, methodName, methodSignature, false);
  }

  MethodVisitor invokeMethod(MethodVisitor methodVisitor,
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
    return methodVisitor;
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
    getField(methodVisitor, getIndexFieldName(), Integer.class.descriptorString());
  }

  public void loadResultVariable(MethodVisitor methodVisitor)
  {
    //expression.addToTypeStack(generatedType, "result");
    getField(methodVisitor, expression.className, resultVariable, generatedType);
  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValueFieldName, type());
  }

  public MethodVisitor combine(MethodVisitor mv)
  {
    return invokeMethod(mv,
                        generatedType,
                        operation,
                        getMethodDescriptor(generatedType, generatedType, int.class),
                        false);
  }

  private void parseEndIndex()
  {
    endIndex = expression.evaluate();
    if (!expression.nextCharacterIs('}'))
    {
      throwException(format(MISSING_CLOSING_CURLY_BRACE, symbol, expression.remaining()));
    }
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

    int rangeSpecificationPosition =
                                   index != null ? expression.expression.indexOf(String.format("{%s=",
                                                                                               index),
                                                                                 expression.position)
                                                 : -1;
    if (rangeSpecificationPosition == -1)
    {
      while (expression.character != '{' && expression.position < length)
      {
        expression.nextCharacter();
      }

      return expression.expression.substring(startPos, expression.position).trim();
    }
    else
    {
      return expression.expression.substring(arrowIndex + 1, rangeSpecificationPosition).trim();
    }
  }

  private void parseStartIndex()
  {
    startIndex = expression.resolveArithmetic();
    if (!expression.nextCharacterIs('…'))
    {
      throwException(format(MISSING_ELLIPSIS,
                            symbol,
                            expression.character,
                            expression.position,
                            expression));
    }
  }

  protected void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }

  protected void prepareIndexVariable()
  {
    Optional<IntermediateVariable<D, R, F>> existingIndexVariable = getExistingIndexVariable();

    if (existingIndexVariable.isPresent())
    {
      if (!existingIndexVariable.get().type.equals(Integer.class))
      {
        throw new ExpressionCompilerException(String.format("index variable %s already declared  and not of Intger type so it cant be used as the index",
                                                            existingIndexVariable));
      }
    }
    else
    {
      expression.registerIntermediateVariable(getIndexFieldName(), Integer.class);
    }
  }

  @Override
  public MethodVisitor prepareStackForReuse(MethodVisitor mv)
  {
    assert false : "not recycleable";
    return mv;
  }

  protected void propagateInputToFactorClass(MethodVisitor mv)
  {
    Variable<D, R, F> independentVariableNode = expression.inputNode;
    if (independentVariableNode != null && !independentVariableNode.type().equals(Void.class))
    {
      loadThis(mv);
      expression.loadFieldOntoStack(mv,
                                    factorFunctionFieldName,
                                    "L" + factorFunctionFieldName + ";");
      Compiler.loadInputParameter(mv);
      checkClassCast(mv, independentVariableNode.type());
      if (expression.traceGenerator)
      {
        System.out.format("%s.propagateInputToFactorClass( factorFunctionFieldName=%s,\n"
                          + "%sindependentVariableNode=%s,\n"
                          + "%sindependentVariableNode.type=%s)\n\n",
                          getClass().getSimpleName(),
                          factorFunctionFieldName,
                          indent(48),
                          independentVariableNode,
                          indent(48),
                          independentVariableNode.type());
      }

      mv.visitFieldInsn(PUTFIELD,
                        factorFunctionFieldName,
                        independentVariableNode.reference.name,
                        independentVariableNode.type().descriptorString());
    }
  }

  /**
   * Setting this to false can be useful during development when and if the
   * instantiation of function throws an exception before the outer function has a
   * chance to be compiled and written to disk thus preventing the analysis of the
   * generated bytecodes by disassembling and/or decompiling the resulting
   * instruction sequence generated by the {@link Expression} {@link Compiler}
   */
  public static boolean instantiateFactors =
                                           Boolean.valueOf(System.getProperty("arb4.compiler.instantiateFactors",
                                                                              "true"));

  private <Q>
          void
          registerFactorSubexpressionInstance(Expression<Integer,
                        Q,
                        Function<Integer, Q>> factorExpression)
  {
    expression.referencedFunctions.put(factorFunctionFieldName,
                                       expression.context.registerFunctionMapping(factorFunctionFieldName,
                                                                                  instantiateFactors ? factorExpression.instantiate()
                                                                                                     : null,
                                                                                  Integer.class,
                                                                                  factorExpression.rangeType,
                                                                                  Function.class));
  }

  protected void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    loadIndexVariable(methodVisitor);
    startIndex.generate(methodVisitor, Integer.class);
    invokeSetMethod(methodVisitor, Integer.class, Integer.class);
    pop(methodVisitor);
  }

  private static void throwException(String msg)
  {
    throw new ExpressionCompilerException(msg);
  }

  @Override
  public String toString()
  {
    return String.format("%s%s{%s=%s…%s}", symbol, factorExpression, index, startIndex, endIndex);
  }

  @Override
  public Class<?> type()
  {
    return generatedType;
  }

  @Override
  public String typeset()
  {
    return String.format("\\%s_{%s = %s}^{%s}{%s}",
                         operation.replace("mul", "prod"),
                         index,
                         startIndex.typeset(),
                         endIndex.typeset(),
                         factorExpression);
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return false;
  }

  @Override
  public List<Node<?, ?, ?>> getBranches()
  {
//    Node<D, R, F> indexVar = new Variable<>(expression, new VariableReference<>(index));
//    assert indexVar != null : expression.variables.toString();
//    FunctionCall<D, R, F> pattern = new FunctionCall<>(expression,
//                                                       factorFunctionFieldName,
//                                                       indexVar);
    return List.of(startIndex, endIndex);
  }

}