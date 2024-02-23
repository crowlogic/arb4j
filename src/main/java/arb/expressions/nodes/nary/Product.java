package arb.expressions.nodes.nary;

import static arb.expressions.Compiler.*;
import static arb.utensils.Utensils.getMethodDescriptor;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.*;

import java.util.Optional;

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
import arb.expressions.IntermediateVariable;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * Parse represent and generate bytecodes for the product operator where the
 * syntax is ∏f(k){k=a…b} and the characters between the Π and { characters are
 * compiled as a sub-expression as a function from the {@link Integer} index
 * variable to whatever type is output by default or requested by whatever is
 * requesting its generation
 * 
 * // FIXME: need to make this sub-expression aware of the input field of the
 * containing expression
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

  protected Label      beginningOfTheLoop = new Label();

  public Node<D, R, F> endIndex;

  public String        factor;

  public String        functionClass;

  public String        index;

  public String        productResultVariable;

  public Node<D, R, F> startIndex;

  private String       factorValueFieldName;

  private String       factorFunctionFieldName;

  public Product(Expression<D, R, F> expression)
  {
    super(expression);
    if (expression.context == null)
    {
      expression.context = new Context();
    }
    this.factor   = parseFactorExpression();

    functionClass = expression.className;
    assert functionClass != null : "functionClass is null";
  }

  private String parseFactorExpression()
  {
    int length   = expression.expression.length();
    int startPos = expression.position;
    while (expression.character != '{' && expression.position < length)
    {
      expression.nextCharacter();
    }

    return expression.expression.substring(startPos, expression.position).trim();
  }

  private void designateLabel(MethodVisitor mv, Label label)
  {
    mv.visitLabel(label);
    mv.visitFrame(Opcodes.F_SAME, 0, null, 0, new Object[]
    {});
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
    index = expression.parseName();
    if (!expression.nextCharacterIs('='))
    {
      throw new ExpressionCompilerException("Expected = character after index variable name at position "
                    + expression.position + "in " + expression);
    }

    parseStartIndex();
    parseEndIndex();

    if (startIndex instanceof LiteralConstant)
    {
      ((LiteralConstant<D, R, F>) startIndex).fieldName = "startIndex";
    }
    else
    {
      assert false : "handle " + startIndex;
    }
    if (endIndex instanceof LiteralConstant)
    {
      ((LiteralConstant<D, R, F>) endIndex).fieldName = "endIndex";
    }
    else
    {
      assert false : "handle " + endIndex;
    }

    return this;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    factorFunctionFieldName = expression.getNextIntermediateVariableFieldName("factor", resultType);
    factorValueFieldName    = expression.newIntermediateVariable("value", resultType);

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

    /**
     * FIXME: TODO: when an Expression is passed to Compiler#express the input
     * variable needs become a field of the compiled sub-expression and the input
     * value needs to be injected into the newly constructed functions field.. if
     * this sub-expression makes any sub-expressions then it needs to propagate all
     * of the input fields by making fields for the inputs (this is cause an invoked
     * method cannot access a callers local variables in java
     */
    Expression<Integer, ?, Function<Integer, Object>> factorExpression = Compiler.express(factorFunctionFieldName,
                                                                                          format("%s➔%s",
                                                                                                 getIndexFieldName(),
                                                                                                 factor),
                                                                                          expression.context,
                                                                                          Integer.class,
                                                                                          resultType,
                                                                                          Function.class,
                                                                                          factorFunctionFieldName,
                                                                                          expression);

    var                                               factorInstance   = factorExpression.instantiate();

    expression.referencedFunctions.put(factorFunctionFieldName,
                                       expression.context.registerFunctionMapping(factorFunctionFieldName,
                                                                                  factorInstance,
                                                                                  Integer.class,
                                                                                  factorExpression.rangeType,
                                                                                  Function.class));

    propagateInputToFactorFunctionSubexpression(mv);

    productResultVariable = expression.reserveIntermediateVariable(mv, "product", resultType);
    invokeMethod(mv, resultType, "multiplicativeIdentity", getMethodDescriptor(resultType), false);
    pop(mv);
    setIndexToTheStartIndex(mv);
    designateLabel(mv, beginningOfTheLoop);

    generateInnerLoop(mv);

    endIndex.generate(mv, Integer.class);
    invokeMethod(mv, Integer.class, "compareTo", getMethodDescriptor(int.class, Integer.class), false);

    jumpToIfLessThanOrEquals(mv, beginningOfTheLoop);

    if (isResult)
    {
      Compiler.loadResultParameter(mv);
      Class<?> type = type();
      Compiler.checkClassCast(mv, type);
      loadResultingProductVariable(mv);
      invokeSetMethod(mv, type, type);

    }

    return mv;

  }

  private void propagateInputToFactorFunctionSubexpression(MethodVisitor mv)
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
    getThisField(mv, functionClass, factorFunctionFieldName, "L" + factorFunctionFieldName + ";");
  }

  private void loadFactorValue(MethodVisitor mv)
  {
    loadFieldFromThis(mv, factorValueFieldName, expression.rangeType);
  }

  protected MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getField(mv, functionClass, fieldName, type);
  }

  private void loadIndex(MethodVisitor mv)
  {
    loadFieldFromThis(mv, index, Integer.class);
  }

  void loadIndexVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, getIndexFieldName(), "Larb/Integer;");
  }

  void loadResultingProductVariable(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, expression.className, productResultVariable, expression.rangeType);

  }

  void loadVariableThatHoldsTheEvaluatedFactor(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorValueFieldName, Real.class);
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
  public Class<?> type()
  {
    return expression.rangeType;
  }

  @Override
  public String typeset()
  {
    return String.format("\\prod_{%s = %s}^{%s}{%s}", index, startIndex.typeset(), endIndex.typeset(), factor);
  }

}
