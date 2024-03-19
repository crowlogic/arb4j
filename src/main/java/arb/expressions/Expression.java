package arb.expressions;

import static arb.expressions.Compiler.*;
import static arb.expressions.Parser.isLatinOrGreek;
import static arb.expressions.Parser.isNumeric;
import static arb.utensils.Utensils.indent;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Stack;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.signature.SignatureWriter;
import org.objectweb.asm.util.TraceClassVisitor;

import arb.ComplexPolynomial;
import arb.Integer;
import arb.OrderedPair;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.nodes.Else;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.expressions.nodes.binary.Addition;
import arb.expressions.nodes.binary.AscendingFactorialization;
import arb.expressions.nodes.binary.BinaryOperation;
import arb.expressions.nodes.binary.Division;
import arb.expressions.nodes.binary.Exponentiation;
import arb.expressions.nodes.binary.Multiplication;
import arb.expressions.nodes.binary.Subtraction;
import arb.expressions.nodes.nary.NAryOperation;
import arb.expressions.nodes.nary.NaryMultiplication;
import arb.expressions.nodes.nary.Summation;
import arb.expressions.nodes.unary.Factorialization;
import arb.expressions.nodes.unary.FunctionReference;
import arb.expressions.nodes.unary.SwingingFactorialization;
import arb.expressions.nodes.unary.UnaryOperation;
import arb.expressions.nodes.unary.When;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * The {@link Expression} class represents a mathematical statement in infix
 * notation, which is a notation that places operators between operands, such as
 * "2 * 3 + 4". It uses characters and strings to represent symbols and
 * operations within these expressions. This class is part of the
 * {@code arb.expressions} package and serves as a dynamic compiler that
 * translates these expressions into high-performance Java bytecode, leveraging
 * the ASM library for bytecode manipulation and generation.
 *
 * <p>
 * Internally, the {@link Expression} class parses the input string to construct
 * an Abstract Syntax Tree (AST), where each {@link Node} represents an
 * {@link BinaryOperation}, {@link UnaryOperation}, {@link NAryOperation}, such
 * as {@link Addition} , {@link Subtraction}, {@link Multiplication}, and
 * {@link Division} or its operands like {@link Variable} and
 * {@link LiteralConstant}. This tree structure allows the class to correctly
 * manage operator precedence and associativity rules inherent in mathematical
 * expressions. The AST is then traversed to generate the corresponding Java
 * bytecode, which can be executed to evaluate the expression.
 *
 * <h2>Key Features:</h2>
 * <ul>
 * <li>Dynamically compiles mathematical expressions into executable Java
 * bytecode, allowing for efficient evaluation.</li>
 * <li>Supports {@link Variable}, {@link LiteralConstant}, and
 * {@link FunctionReference}s within {@link Expression}, providing a rich
 * feature set for constructing complex expressions.</li>
 * <li>Effectively manages intermediate variables and constants, optimizing
 * memory usage and performance.</li>
 * <li>Automatically injects references to variables and functions into the
 * compiled bytecode, facilitating dynamic execution.</li>
 * <li>Provides comprehensive methods for parsing expressions, evaluating them,
 * and generating the necessary bytecode, all while handling mathematical
 * precedence and associativity.</li>
 * </ul>
 *
 * <h2>System Properties:</h2>
 * <ul>
 * <li>{@code expressionCompiler.saveClasses=true|false}: Specifies whether the
 * compiled classes should be saved for inspection. Default is
 * {@code true}.</li>
 * </ul>
 *
 * @param <D> The domain type over which the expression operates, such as
 *            {@link Integer} or {@link Double}.
 * @param <R> The range type that the expression evaluates to, representing the
 *            result of the expression.
 * @param <F> The function type of the expression, extending the
 *            {@link Function} interface, encapsulating the compiled expression
 *            as an evaluatble function in the sense of the Java
 * 
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne for the terms of use of the
 *      {@link TheArb4jLibrary}
 */
public class Expression<D, R, F extends Function<D, R>> implements
                       Typesettable
{

  public static final String evaluationMethodDescriptor = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public static final String IS_INITIALIZED             = "isInitialized";

  public static final String nameOfInitializerFunction  = "initialize";

  public static boolean      saveClasses                = Boolean.valueOf(System.getProperty("arb4j.compiler.saveClasses",
                                                                                             "true"));

  public static <D, R, F extends Function<D, R>> F instantiate(String expression,
                                                               Context context,
                                                               Class<? extends D> domainClass,
                                                               Class<? extends R> rangeClass,
                                                               Class<? extends F> functionClass,
                                                               String functionName)
  {
    int colonCharacterIndex = expression.indexOf(":");
    if (colonCharacterIndex != -1)
    {
      String inlineFunctionName = expression.substring(0, colonCharacterIndex);
      if (functionName != null && !functionName.equals(inlineFunctionName))
      {
        throw new ExpressionCompilerException(String.format("functionName='%s' specified via function argument != inlineFunctionName='%s'",
                                                            functionName,
                                                            inlineFunctionName));
      }
      functionName = inlineFunctionName;
      expression   = expression.substring(colonCharacterIndex + 1, expression.length());
    }

    FunctionMapping<?, ?> mapping = null;
    if (functionName != null && context != null)
    {
      mapping = context.registerFunctionMapping(functionName, null, domainClass, rangeClass, functionClass);

    }

    Expression<D, R, F> compiledExpression = express(expression,
                                                     context,
                                                     domainClass,
                                                     rangeClass,
                                                     functionClass,
                                                     functionName);
    F                   func               = compiledExpression.instantiate();
    if (mapping != null)
    {
      mapping.instance = func;
    }

    return func;
  }

  public static <D, R, F extends Function<D, R>> F instantiate(String className,
                                                               String expression,
                                                               Context context,
                                                               Class<D> domainClass,
                                                               Class<R> rangeClass,
                                                               Class<F> functionClass,
                                                               boolean verbose)
  {
    return express(className, expression, context, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  public char                     character                     = 0;

  public boolean                  checkForNullsBeforeEvaluating = false;

  public String                   className;

  Class<F>                        compiledClass;

  int                             constantCount                 = 1;

  public Context                  context;

  final public String             domainClassDescriptor;

  public final String             domainClassInternalName;

  final public Class<? extends D> domainType;

  public final String             evaluateMethodSignature;

  public String                   expression;

  public Class<? extends F>       functionClass;

  public String                   functionClassDescriptor;

  public String                   functionName;

  final public String             genericFunctionClassInternalName;

  public Variable<D, R, F>        inputNode;

  @SuppressWarnings("unchecked")
  public <E, S, G extends Function<E, S>> Variable<E, S, G> getParentsExpressionsIndependentVariableNode()
  {
    return ascendentExpression == null ? null : (Variable<E, S, G>) ascendentExpression.inputNode;
  }

  public Variable<D, R, F>                        indeterminate;

  F                                               instance;

  protected byte[]                                instructions;

  public ArrayList<IntermediateVariable<D, R, F>> intermediateVariables = new ArrayList<>();

  public ArrayList<LiteralConstant<D, R, F>>      literalConstants      = new ArrayList<>();

  public int                                      position              = -1;

  public char                                     previousCharacter;

  final public String                             rangeClassDescriptor;

  public final String                             rangeClassInternalName;

  final public Class<? extends R>                 rangeType;

  public boolean                                  recursive             = false;

  public HashMap<String, FunctionMapping<D, R>>   referencedFunctions   = new HashMap<>();

  public HashMap<String, Variable<D, R, F>>       referencedVariables   = new HashMap<>();

  public Node<D, R, F>                            rootNode;

  public Variables                                variables;

  public boolean                                  variablesDeclared     = false;

  public Expression(String className,
                    Class<? extends D> domainClass,
                    Class<? extends R> rangeClass,
                    Class<? extends F> functionClass,
                    String expressionString,
                    Context context)
  {
    this(className,domainClass,rangeClass,functionClass,expressionString,context,null,null);
  }

  public Expression(String className,
                    Class<? extends D> domainClass,
                    Class<? extends R> rangeClass,
                    Class<? extends F> functionClass,
                    String expression,
                    Context context,
                    String functionName,
                    Expression<?, ?, ?> parentExpression)
  {
    this.ascendentExpression              = parentExpression;
    this.rangeClassDescriptor             = rangeClass.descriptorString();
    this.domainClassDescriptor            = domainClass.descriptorString();
    this.className                        = className;
    this.domainType                       = domainClass;
    this.rangeType                        = rangeClass;
    this.functionClass                    = functionClass;
    this.rangeClassInternalName           = Type.getInternalName(rangeClass);
    this.domainClassInternalName          = Type.getInternalName(domainClass);
    this.genericFunctionClassInternalName = Type.getInternalName(functionClass);
    this.functionClassDescriptor          = functionClass.descriptorString();
    this.expression                       = Parser.replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(expression);
    this.context                          = context;
    this.variables                        = context != null ? context.variables : null;
    this.functionName                     = functionName;
    evaluateMethodSignature               = String.format("(L%s;IIL%s;)L%s;",
                                                          domainClassInternalName,
                                                          rangeClassInternalName,
                                                          rangeClassInternalName);
    if (context != null && context.saveClasses)
    {
      saveClasses = true;
    }
  }

  public Node<D, R, F> addAndSubtract(Node<D, R, F> node)
  {
    while (true)
    {
      if (nextCharacterIs('+', '₊'))
      {
        node = new Addition<>(this, node, exponentiateMultiplyAndDivide());
      }
      else if (nextCharacterIs('-', '₋'))
      {
        node = new Subtraction<>(this, node, exponentiateMultiplyAndDivide());
      }
      else
      {
        return node;
      }
    }
  }

  public static boolean ignoreTODO = true;

  /**
   * TODO: add code to retrieve the input variable from this expresson, or its
   * parent, or its parents parent, etc and validate it just like non-input
   * variables (fields)
   * 
   * @param mv
   * @param varName
   * @param variable
   */
  public void addCheckForNullField(MethodVisitor mv, String varName, boolean variable)
  {
    Class<?> fieldClass;
    if (variable)
    {
      Object field = context.variables.map.get(varName);
      if (field == null)
      {
        if (varName != null && !varName.equals(inputNode.reference.name))
        {
          if (ascendentExpression != null && varName.equals(ascendentExpression.inputNode.reference.name))
          {
            assert ignoreTODO : "TODO: add check for null superexpression input here: " + ascendentExpression;
          }
          else
          {
            throw new UnsupportedOperationException("no contextual variable for varName='" + varName
                          + "' and independent variable reference is " + inputNode + " where parentExpression="
                          + ascendentExpression + " and this expression=" + this);
          }
        }
        else
        {
          assert ignoreTODO : "TODO: add check for null input here field=" + field;
        }
      }
      fieldClass = field != null ? field.getClass() : null;
    }
    else
    {
      fieldClass = context.functions.get(varName).type();
    }

    if (fieldClass != null)
    {
      String fieldDesc = fieldClass.descriptorString();

      addNullCheckForField(mv, className, varName, fieldDesc);
    }

  }

  public void addChecksForNullVariableReferences(MethodVisitor mv, boolean all, boolean that)
  {
    if (context != null)
    {
      for (var variable : all ? context.variables.map.keySet() : referencedVariables.keySet())
      {
        mv.visitVarInsn(Opcodes.ALOAD, that ? 1 : 0);
        addCheckForNullField(mv, variable, true);
      }
    }
  }

  public MethodVisitor callContextualUnaryFunction(MethodVisitor mv, FunctionMapping<D, R> mapping, Class<?> type)
  {
    boolean isInterface = mapping.functionInterface != null;
    mv.visitMethodInsn(mapping.functionInterface != null ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(isInterface ? mapping.functionInterface : mapping.instance.getClass()),
                       "evaluate",
                       evaluationMethodDescriptor,
                       isInterface);
    return Compiler.checkClassCast(mv, type);
  }

  public ClassVisitor constructClassVisitor()
  {
    ClassVisitor cw = new ClassWriter(computeFrames ? ClassWriter.COMPUTE_FRAMES : 0);
    return cw;
  }

  public ClassVisitor declareConstants(ClassVisitor classVisitor)
  {
    for (var constant : literalConstants)
    {
      constant.declareField(classVisitor);
    }
    return classVisitor;
  }

  public void declareFields(ClassVisitor cw)
  {
    if (needsInitializer())
    {
      cw.visitField(Opcodes.ACC_PRIVATE, IS_INITIALIZED, "Z", null, null);
    }

    declareConstants(cw);

    declareVariables(cw);

    declareIntermediateVariables(cw);

    declareFunctionReferences(cw);

  }

  public void declareFunctionReference(ClassVisitor classVisitor, String name, FunctionMapping<D, R> function)
  {
    String descriptor = "L" + function.name + ";";
    classVisitor.visitField(ACC_PUBLIC
                  | (function.name.equals(functionName) ? 0 : ACC_FINAL), name, descriptor, null, null);
  }

  public ClassVisitor declareFunctionReferences(ClassVisitor classVisitor)
  {
    if (context != null)
    {
      referencedFunctions.forEach((name, function) -> declareFunctionReference(classVisitor, name, function));
    }
    return classVisitor;
  }

  public void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    for (var variable : intermediateVariables)
    {
      variable.declareField(classVisitor);
    }
  }

  public MethodVisitor declareLocalVariables(MethodVisitor methodVisitor, Label startLabel, Label endLabel)
  {
    methodVisitor.visitLocalVariable("this", "L" + className + ";", null, startLabel, endLabel, 0);
    methodVisitor.visitLocalVariable("in", domainType.descriptorString(), null, startLabel, endLabel, 1);
    methodVisitor.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("result", rangeType.descriptorString(), null, startLabel, endLabel, 4);
    return methodVisitor;
  }

  public void declareVariables(ClassVisitor classVisitor)
  {
    if (ascendentExpression != null)
    {
      Variable<?, ?, ?> parentIndependentVariableNode = ascendentExpression.inputNode;
      if (parentIndependentVariableNode != null && !parentIndependentVariableNode.type().equals(Void.class))
      {
        classVisitor.visitField(ACC_PUBLIC,
                                parentIndependentVariableNode.reference.name,
                                parentIndependentVariableNode.type().descriptorString(),
                                null,
                                null);
      }
    }

    if (context != null)
    {
      for (var variable : context.variables.map.entrySet())
      {
        declareVariableEntry(classVisitor, variable);
      }
    }

    variablesDeclared = true;
  }

  public void declareVariableEntry(ClassVisitor classVisitor, Entry<String, Object> variable)
  {
    if (verbose)
    {
      System.out.println("Declaring variable of " + className + ": " + variable);
    }
    classVisitor.visitField(ACC_PUBLIC,
                            variable.getKey(),
                            variable.getValue().getClass().descriptorString(),
                            null,
                            null);
  }

  public static boolean      computeFrames  = Boolean.valueOf(System.getProperty("arb4j.compiler.computeFrames",
                                                                                 "false"));

  public PrintWriter         printWriter;

  public boolean             verbose        = false;

  public boolean             traceGenerator = true;

  public Expression<?, ?, ?> ascendentExpression;

  public Class<F> load()
  {
    assert instructions != null : "the instructions field is null indicating that the expression has not been compiled";

    return compiledClass = loadFunctionClass(className, instructions, context);
  }

  /**
   * Apply the order of operations except for parenthesis by first calling
   * this{@link #exponentiateMultiplyAndDivide()} then passing the result to
   * {@link #addAndSubtract(Node)}
   * 
   * @return the result of passing this{@link #exponentiateMultiplyAndDivide()} to
   *         this{@link #addAndSubtract(Node)}
   */
  public Node<D, R, F> resolve()
  {
    Node<D, R, F> node = exponentiateMultiplyAndDivide();
    return addAndSubtract(node);
  }

  /**
   * @return a parenthetical {@link Node}, a {@link NaryMultiplication}, a
   *         {@link LiteralConstant},a {@link Function}, a {@link Variable} or
   *         null if for instance "-t" is encountered, as a 0 is implied by the
   *         absence of a node before the {@link Subtraction} operator is
   *         encountered
   * 
   * @throws ExpressionCompilerException
   */
  public Node<D, R, F> evaluate() throws ExpressionCompilerException
  {
    Node<D, R, F> node     = null;

    int           startPos = position;

    if (nextCharacterIs('('))
    {
      node = resolve();

      if (!nextCharacterIs(')'))
      {
        throwMissingClosingParenthesisException(node);
      }

    }
    else if (nextCharacterIs('Π', '∏'))
    {
      return new NaryMultiplication<>(this);
    }
    else if (nextCharacterIs('∑', 'Σ'))
    {
      return new Summation<>(this);
    }
    else if (Parser.isNumeric(character))
    {
      node = evaluateNumber(startPos);
      assert node != null : "parseNumber returned null";
    }
    else if (Parser.isLatinOrGreek(character, false) || Parser.isAlphaNumericSubscript(character))
    {
      node = resolveFunctionOrVariableReference(startPos);
      assert node != null : "parseFunctionInvocationOrVariableReference returned null";
    }

    return resolvePostfixOperators(node);
  }

  public void throwMissingClosingParenthesisException(Object node)
  {
    throw new ExpressionCompilerException(format("expected closing parenthesis, instead "
                  + "got %c at position %s in expression '%s' %s=%s which is followed by %s ",
                                                 character,
                                                 position,
                                                 expression,
                                                 node instanceof Node ? "node" : "variableReference",
                                                 node,
                                                 expression.substring(position, expression.length())));
  }

  public VariableReference<D, R, F> evaluateName(int startPos)
  {
    String        identifier = parseName(startPos);
    Node<D, R, F> index      = evaluateIndex();
    return new VariableReference<D, R, F>(identifier, index);
  }

  public Node<D, R, F> evaluateIndex()
  {
    Node<D, R, F> index = evaluateSquareBracketedIndex();
    if (index == null)
    {
      index = evaluateSubscriptedIndex();
    }
    return index;
  }

  public Node<D, R, F> evaluateNumber(int startPos)
  {
    while (isNumeric(character))
    {
      nextCharacter();
    }

    return new LiteralConstant<>(this, expression.substring(startPos, position));
  }

  public void evaluateOptionalIndependentVariableSpecification()
  {
    int rightArrowIndex = (expression = expression.replace("->", "➔")).indexOf('➔');
    if (rightArrowIndex != -1)
    {
      String independentVariableName = expression.substring(0, rightArrowIndex);
      inputNode = new Variable<>(this, new VariableReference<>(independentVariableName, null, domainType));

      position  = rightArrowIndex;
    }
  }

  public Node<D, R, F> evaluateSquareBracketedIndex()
  {
    Node<D, R, F> index = null;
    if (nextCharacterIs('['))
    {
      index = resolve();
      if (!nextCharacterIs(']'))
      {
        throw new ExpressionCompilerException(format("Expected closing ] at position %d in %s but got %c and the rest is %s",
                                                     position,
                                                     expression,
                                                     character,
                                                     remaining()));
      }
    }
    return index;
  }

  public Node<D, R, F> evaluateSubscriptedIndex()
  {
    if (nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
    {
      if (!nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
      {
        return new LiteralConstant<>(this, String.valueOf(previousCharacter));
      }
      else
      {
        throw new ExpressionCompilerException(String.format("TODO: handle subscripted index starting with"
                      + " lastCharacter=%c this could be either a numeric literal constant or a "
                      + "alphanumeric variable reference"));
      }
    }
    else
    {
      return null;
    }
  }

  /**
   * Calls this{@link #evaluateOptionalIndependentVariableSpecification()} before
   * calling this{@link #resolve()} and assigning the result to
   * this{@link #rootNode}
   * 
   * @return this
   * @throws ExpressionCompilerException
   */
  public Expression<D, R, F> parseRoot()
  {
    assert rootNode == null : "parse must only be called before anything else has been parsed but rootNode="
                  + rootNode;
    evaluateOptionalIndependentVariableSpecification();
    nextCharacter();
    if (verbose)
    {
      System.out.println("parseRoot " + expression);
    }
    rootNode = resolve();
    assert rootNode != null : "evaluateRootNode: determine() returned null, expression='" + expression + "'";
    rootNode.isResult = true;
    return this;
  }

  public Node<D, R, F> exponentiate() throws ExpressionCompilerException
  {
    return exponentiate(evaluate());
  }

  public Node<D, R, F> exponentiate(Node<D, R, F> node) throws ExpressionCompilerException
  {
    if (nextCharacterIs('^'))
    {
      boolean parenthetical = false;
      if (nextCharacterIs('('))
      {
        parenthetical = true;
      }
      node = new Exponentiation<>(this, node, parenthetical ? resolve() : evaluate());
      if (parenthetical)
      {
        if (!nextCharacterIs(')'))
        {
          throw new ExpressionCompilerException(String.format("parseExponent expected closing parenthesis at: position=%d, ch='%c'\n",
                                                              position,
                                                              character == -1 ? '?' : character));
        }
      }

      return node;
    }
    else
    {
      return parseSuperscripts(node);
    }
  }

  /**
   * @return the result of passing this{@link #exponentiate()} to
   *         this{@link #multiplyAndDivide(Node)}
   */
  public Node<D, R, F> exponentiateMultiplyAndDivide()
  {
    var node = exponentiate();
    return multiplyAndDivide(node);
  }

  /**
   * Generate the implementation of the function after this{@link #parseRoot()}
   * has been invoked
   * 
   * @return
   * @throws ExpressionCompilerException
   */
  public Expression<D, R, F> compile() throws ExpressionCompilerException
  {

    ClassVisitor classVisitor = constructClassVisitor();

    printWriter = new PrintWriter(System.out, false);

    try
    {
      generateFunctionInterface(this, className, classVisitor);

      generateEvaluationMethod(classVisitor);

      declareFields(classVisitor);

      generateDefaultConstructor(classVisitor);

      if (needsInitializer())
      {
        generateInitializationMethod(classVisitor);
      }

      if (needsCloseMethod())
      {
        generateCloseMethod(classVisitor);
      }

    }
    finally
    {
      classVisitor.visitEnd();
    }

    if (classVisitor instanceof TraceClassVisitor)
    {
      classVisitor = ((TraceClassVisitor) classVisitor).getDelegate();
    }

    instructions = ((ClassWriter) classVisitor).toByteArray();

    if (saveClasses)
    {
      File file = new File(className + ".class");
      writeBytecodes(file);
    }

    return this;
  }

  public MethodVisitor generateCloseFieldCall(MethodVisitor methodVisitor, String name, Class<?> type)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, name, type.descriptorString());
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, Type.getInternalName(type), "close", "()V", false);
    return methodVisitor;
  }

  public ClassVisitor generateCloseMethod(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC, "close", "()V", null, null);

    methodVisitor.visitCode();

    literalConstants.forEach(constant -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                constant.fieldName,
                                                                constant.type()));

    intermediateVariables.forEach(intermediateVariable -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                                 intermediateVariable.name,
                                                                                 intermediateVariable.type));
    if (recursive)
    {
      generateCloseFieldCall(loadThisOntoStack(methodVisitor), functionName, functionClass);
    }

    methodVisitor.visitInsn(Opcodes.RETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();

    return classVisitor;
  }

  public void generateCodeToSetIsInitializedToTrue(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitInsn(Opcodes.ICONST_1);
    methodVisitor.visitFieldInsn(PUTFIELD, className, IS_INITIALIZED, "Z");
  }

  public void generateCodeToThrowErrorIfAlreadyInitialized(MethodVisitor mv)
  {

    mv.visitVarInsn(ALOAD, 0);
    mv.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    Label alreadyInitializedLabel = new Label();

    mv.visitJumpInsn(Opcodes.IFEQ, alreadyInitializedLabel);

    mv.visitTypeInsn(Opcodes.NEW, "java/lang/AssertionError");
    mv.visitInsn(Opcodes.DUP);
    mv.visitLdcInsn("Already initialized");
    mv.visitMethodInsn(INVOKESPECIAL, "java/lang/AssertionError", "<init>", "(Ljava/lang/Object;)V", false);
    mv.visitInsn(Opcodes.ATHROW);
    mv.visitLabel(alreadyInitializedLabel);
    mv.visitFrame(Opcodes.F_SAME, 0, null, 0, null);

  }

  public void generateConditionalInitializater(MethodVisitor mv)
  {
    mv.visitVarInsn(ALOAD, 0);
    mv.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    Label alreadyInitialized = new Label();
    mv.visitJumpInsn(Opcodes.IFNE, alreadyInitialized);

    mv.visitVarInsn(ALOAD, 0);
    mv.visitMethodInsn(INVOKEVIRTUAL, className, nameOfInitializerFunction, "()V", false);

    mv.visitLabel(alreadyInitialized);
    mv.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  public MethodVisitor generateInitializationCode(MethodVisitor mv)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(mv);

    addChecksForNullVariableReferences(mv, false, false);

    if (needsInitializer())
    {
      referencedFunctions.values().forEach(mapping -> generateFunctionInitializer(mv, mapping));

      if (recursive)
      {
        generateSelfReference(mv);
      }

      generateCodeToSetIsInitializedToTrue(mv);
    }

    return mv;
  }

  public MethodVisitor generateSelfReference(MethodVisitor mv)
  {
    String functionFieldType = functionName;
    mv.visitVarInsn(Opcodes.ALOAD, 0);
    mv.visitTypeInsn(Opcodes.NEW, functionFieldType);
    mv.visitInsn(Opcodes.DUP);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, functionFieldType, "<init>", "()V", false);
    mv.visitFieldInsn(Opcodes.PUTFIELD, className, functionName, "L" + functionFieldType + ";");

    initializeNestedFunctionVariableReferences(loadThisOntoStack(mv),
                                               className,
                                               functionFieldType,
                                               functionFieldType,
                                               context.variableTypeStream());

    return mv;
  }

  public MethodVisitor generateFunctionInitializer(MethodVisitor mv, FunctionMapping<?, ?> nestedFunction)
  {
    if (nestedFunction.instance != null)
    {
      initializeNestedFunctionVariableReferences(loadThisOntoStack(mv),
                                                 className,
                                                 Type.getInternalName(nestedFunction.type()),
                                                 nestedFunction.name,
                                                 context.variableTypeStream());
    }
    else
    {
      assert !NAryOperation.instantiateFactors
                    || nestedFunction.name.equals(functionName) : "nestedFunction.func should not be null if its"
                                  + " not the recursive function referring to itself, "
                                  + String.format("nestedFunction.name=%s, name=%s\n",
                                                  nestedFunction.name,
                                                  functionName);

    }

    return mv;
  }

  public ClassVisitor generateDefaultConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor mv = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    generateInvocationOfDefaultNoArgConstructor(mv, true);

    referencedFunctions.values()
                       .stream()
                       .filter(func -> func.instance != null)
                       .forEach(mapping -> generateFunctionReference(mv, mapping));

    generateLiteralConstantInitializers(mv);

    generateIntermediateVariableInitializers(mv);

    mv.visitInsn(RETURN);
    mv.visitMaxs(10, 10);
    mv.visitEnd();
    return classVisitor;
  }

  public void generateFunctionReference(MethodVisitor mv, FunctionMapping<D, R> mapping)
  {
    String fieldType = Type.getInternalName(mapping.type());
    mv.visitVarInsn(Opcodes.ALOAD, 0);
    mv.visitTypeInsn(Opcodes.NEW, fieldType);
    mv.visitInsn(Opcodes.DUP);
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, fieldType, "<init>", "()V", false);
    mv.visitFieldInsn(Opcodes.PUTFIELD, className, mapping.name, "L" + fieldType + ";");
  }

  public ClassVisitor generateEvaluationMethod(ClassVisitor classVisitor) throws ExpressionCompilerException
  {
    if (rootNode == null)
    {
      parseRoot();
    }

    Label         startLabel = new Label();
    Label         endLabel   = new Label();

    MethodVisitor mv         = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                        "evaluate",
                                                        evaluationMethodDescriptor,
                                                        evaluateMethodSignature,
                                                        null);

    mv.visitCode();
    mv.visitLabel(startLabel);

    if (position < expression.length())
    {
      throwNewUnexpectedCharacterException();
    }

    if (needsInitializer())
    {
      generateConditionalInitializater(mv);
    }

    if (checkForNullsBeforeEvaluating)
    {
      addChecksForNullVariableReferences(mv, false, false);
    }

    if (traceGenerator)
    {
      System.out.format("Generating %s\n\n", expression);
    }
    rootNode.generate(mv, rangeType);

    mv.visitInsn(Opcodes.ARETURN);

    mv.visitLabel(endLabel);

    declareLocalVariables(mv, startLabel, endLabel);

    mv.visitMaxs(10, 10);

    mv.visitEnd();

    return classVisitor;
  }

  public void throwNewUnexpectedCharacterException()
  {
    throw new ExpressionCompilerException(String.format("unexpected '%c' character at position=%s in expression '%s' of length %d, remaining=%s\n",
                                                        character,
                                                        position,
                                                        expression,
                                                        expression.length(),
                                                        remaining()));

  }

  public ClassVisitor generateInitializationMethod(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           nameOfInitializerFunction,
                                                           "()V",
                                                           null,
                                                           null);
    try
    {
      methodVisitor.visitCode();

      generateInitializationCode(methodVisitor);

      methodVisitor.visitInsn(Opcodes.RETURN);
      methodVisitor.visitMaxs(10, 10);
    }
    finally
    {
      methodVisitor.visitEnd();
    }

    return classVisitor;
  }

  public MethodVisitor generateIntermediateVariableInitializers(MethodVisitor methodVisitor)
  {
    for (var intermediateVariable : intermediateVariables)
    {
      intermediateVariable.generateInitializer(methodVisitor);
    }
    return methodVisitor;
  }

  public void generateInvocationOfDefaultNoArgConstructor(MethodVisitor methodVisitor, boolean object)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  object ? Type.getInternalName(Object.class) : className,
                                  "<init>",
                                  "()V",
                                  false);
  }

  public MethodVisitor generateLiteralConstantInitializers(MethodVisitor methodVisitor)
  {
    for (var literal : literalConstants)
    {
      literal.generateLiteralConstantInitializerWithString(methodVisitor);
    }
    return methodVisitor;
  }

  public String getFunctionClassTypeSignature()
  {

    String          classSignature;
    SignatureWriter sw = new SignatureWriter();

    sw.visitSuperclass().visitClassType(Type.getInternalName(Object.class));
    sw.visitEnd();

    sw.visitInterface();
    sw.visitClassType(Type.getInternalName(Function.class));
    sw.visitTypeArgument('=').visitClassType(Type.getInternalName(domainType));
    sw.visitEnd();
    sw.visitTypeArgument('=').visitClassType(Type.getInternalName(rangeType));
    sw.visitEnd();
    sw.visitEnd();

    classSignature = sw.toString();
    return classSignature;
  }

  public String getNextConstantFieldName()
  {
    return "c" + constantCount++;
  }

  public String getNextIntermediateVariableFieldName(String name, Class<?> type)
  {
    if (context == null)
    {
      context = new Context();
    }
    String        prefix  = name + getVariableSuffix(type);
    AtomicInteger counter = context.intermediateVariableCounters.get(prefix);
    if (counter == null)
    {
      context.intermediateVariableCounters.put(prefix, counter = new AtomicInteger(1));
    }
    return prefix + counter.getAndIncrement();
  }

  public boolean hasPolynomialRange()
  {
    return rangeType.equals(RealPolynomial.class) || rangeType.equals(ComplexPolynomial.class);
  }

  public void initializeNestedFunctionVariableReferences(MethodVisitor mv,
                                                         String classType,
                                                         String fieldType,
                                                         String functionFieldName,
                                                         Stream<OrderedPair<String, Class<?>>> variables)
  {
    String typeDesc = "L" + fieldType + ";";

    variables.forEach(variable ->
    {
      String variableFieldName = variable.getKey();
      String variableFieldType = variable.getValue().descriptorString();
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitFieldInsn(Opcodes.GETFIELD, classType, functionFieldName, typeDesc);
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitFieldInsn(Opcodes.GETFIELD, classType, variableFieldName, variableFieldType);
      mv.visitFieldInsn(Opcodes.PUTFIELD, fieldType, variableFieldName, variableFieldType);
    });

  }

  public void injectVariableReferences(F f) throws NoSuchFieldException, IllegalAccessException
  {
    if (context != null)
    {
      context.injectVariableReferences(f);
    }
  }

  public F instantiate()
  {
    try
    {
      injectVariableReferences(constructNewInstance());
    }
    catch (Exception e)
    {
      Utensils.wrapOrThrow(e);
    }

    return instance;
  }

  public F constructNewInstance() throws ReflectiveOperationException
  {
    return instance = (compiledClass != null ? compiledClass : load()).getDeclaredConstructor().newInstance();
  }

  public MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, String fieldDescriptor)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, fieldName, fieldDescriptor);
    return methodVisitor;
  }

  public MethodVisitor loadIndexField(MethodVisitor methodVisitor, String indexFieldName)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, indexFieldName, Integer.class.descriptorString());
    return methodVisitor;
  }

  public Node<D, R, F> multiplyAndDivide(Node<D, R, F> node)
  {
    while (true)
    {
      if (nextCharacterIs('*', '×', 'ₓ'))
      {
        node = new Multiplication<>(this, node, exponentiate());

      }
      else if (nextCharacterIs('/', '÷'))
      {
        node = new Division<>(this, node, exponentiate());
      }
      else
      {
        return node;
      }
    }
  }

  public boolean needsCloseMethod()
  {
    return !literalConstants.isEmpty() | !intermediateVariables.isEmpty();
  }

  /**
   * @return true if the call to the generated initialize() method is needed to
   *         propagate contextual variables referenced functions
   * 
   */
  public boolean needsInitializer()
  {
    return (!referencedFunctions.isEmpty()) || recursive || !referencedVariables.isEmpty();
  }

  public String newIntermediateVariable(Class<?> type)
  {
    assert type != Void.class : "dont generate a variable for the Void type";
    String intermediateVarName = getNextIntermediateVariableFieldName("", type);
    return registerIntermediateVariable(intermediateVarName, type);
  }

  /**
   * Assigns the next field name in the sequence for the given variable name
   * prefix by calling
   * this{@link #getNextIntermediateVariableFieldName(String, Class)} then passing
   * the result to this{@link #registerIntermediateVariable(String, Class)}
   * 
   * @param prefix
   * @param type
   * @return the variable name assigned
   */
  public String newIntermediateVariable(String prefix, Class<?> type)
  {
    assert prefix != null : "name shan't be null";
    assert type != Void.class : "dont generate a variable for the Void type";
    String intermediateVarName = getNextIntermediateVariableFieldName(prefix, type);
    return registerIntermediateVariable(intermediateVarName, type);
  }

  public String registerIntermediateVariable(String intermediateVarName, Class<?> type)
  {
    intermediateVariables.add(new IntermediateVariable<>(this, intermediateVarName, type));

    return intermediateVarName;
  }

  public Variable<D, R, F> newVariable(VariableReference<D, R, F> reference)
  {
    var contextVar = getVariable(reference);
    reference.type = (context == null || contextVar == null) ? domainType : contextVar.getClass();
    return new Variable<D, R, F>(this, reference);
  }

  public <Q> Q getVariable(VariableReference<D, R, F> reference)
  {
    return context == null ? null : context.variables.get(reference.name);
  }

  public char nextCharacter()
  {
    return character = (++position < expression.length()) ? expression.charAt(position) : Character.MIN_VALUE;
  }

  public boolean nextCharacterIs(char... expectedCharacters)
  {
    skipSpaces();
    for (char expectedCharacter : expectedCharacters)
    {
      if (character == expectedCharacter)
      {
        previousCharacter = character;
        nextCharacter();
        return true;
      }
    }

    return false;
  }

  public String parseName()
  {
    return parseName(position);
  }

  public String parseName(int startPos)
  {
    boolean entirelySubscripted = true;
    boolean isLatinOrGreek;
    while ((isLatinOrGreek = isLatinOrGreek(character, true))
                  || (entirelySubscripted && !isLatinOrGreek && Parser.isAlphaNumericSubscript(character)))
    {
      nextCharacter();
      if (isLatinOrGreek)
      {
        entirelySubscripted = false;
      }
    }
    String substring        = expression.substring(startPos, position);
    String trimmedSubstring = substring.trim();
    String identifier       = Utensils.subscriptToRegular(trimmedSubstring);
    return identifier;
  }

  public Node<D, R, F> parseSuperscript(Node<D, R, F> node, char superscript, String digit)
  {
    if (nextCharacterIs(superscript))
    {
      node = new Exponentiation<>(this, node, new LiteralConstant<>(this, digit));
    }
    return node;
  }

  public Node<D, R, F> parseSuperscripts(Node<D, R, F> node)
  {
    node = parseSuperscript(node, '⁰', "0");
    node = parseSuperscript(node, '¹', "1");
    node = parseSuperscript(node, '²', "2");
    node = parseSuperscript(node, '³', "3");
    node = parseSuperscript(node, '⁴', "4");
    node = parseSuperscript(node, '⁵', "5");
    node = parseSuperscript(node, '⁶', "6");
    node = parseSuperscript(node, '⁷', "7");
    node = parseSuperscript(node, '⁸', "8");
    node = parseSuperscript(node, '⁹', "9");
    return node;
  }

  public boolean prevCharacterWas(char... expectedCharacters)
  {
    for (char expectedCharacter : expectedCharacters)
    {
      if (expectedCharacter == previousCharacter)
      {
        return true;
      }
    }

    return false;
  }

  public String remaining()
  {
    return expression.substring(position, expression.length());
  }

  public String reserveIntermediateVariable(MethodVisitor methodVisitor, String prefix, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(prefix, type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  public String reserveIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  public Node<D, R, F> resolveFactorials(Node<D, R, F> node)
  {
    if (nextCharacterIs('!'))
    {
      return new Factorialization<D, R, F>(this, node);
    }
    else if (nextCharacterIs('≀'))
    {
      return new SwingingFactorialization<D, R, F>(this, node);
    }
    else
    {
      return node = resolveAscendingFactorial(node);
    }
  }

  public Node<D, R, F> resolveFunction(int startPos, VariableReference<D, R, F> reference)
  {
    if ("when".equals(reference.name))
    {
      return new When<>(this);
    }
    else
    {
      Node<D, R, F> arg = resolve();
      if (nextCharacterIs(')'))
      {
        return new FunctionReference<>(this, reference.name, arg);
      }
      else
      {
        throwMissingClosingParenthesisException(reference);
        return null;
      }
    }
  }

  public Node<D, R, F> resolveFunctionOrVariableReference(int startPos) throws ExpressionCompilerException
  {
    var     reference  = evaluateName(startPos);

    boolean isFunction = nextCharacterIs('(');

    if (isFunction)
    {
      return resolveFunction(startPos, reference);
    }
    else if (LiteralConstant.constantSymbols.contains(reference.name))
    {
      return new LiteralConstant<>(this, reference.name);
    }
    else
    {
      if (reference.name.equals("else") && reference.index == null)
      {
        return new Else<D, R, F>(this);
      }
      else
      {
        return newVariable(reference);
      }
    }
  }

  public Node<D, R, F> resolvePostfixOperators(Node<D, R, F> node)
  {
    return node = resolveFactorials(node);
  }

  public Node<D, R, F> resolveAscendingFactorial(Node<D, R, F> node)
  {
    if (nextCharacterIs('₍'))
    {
      Node<D, R, F> power = resolve();
      if (nextCharacterIs('₎'))
      {
        node = new AscendingFactorialization<D, R, F>(this, node, power);
      }
      else
      {
        throw new ExpressionCompilerException(String.format("Expected ₎ not found at position %d in %s instead got %c with remaining %s\n",
                                                            position,
                                                            expression,
                                                            character,
                                                            remaining()));
      }
    }

    return node;
  }

  public MethodVisitor setResult(MethodVisitor methodVisitor, Class<?> inputType)
  {
    checkClassCast(loadResultParameter(methodVisitor), rangeType).visitInsn(Opcodes.SWAP);
    return invokeSetMethod(methodVisitor, inputType, rangeType);
  }

  void skipSpaces()
  {
    while (character == ' ')
    {
      nextCharacter();
    }
  }

  @Override
  public String toString()
  {
    return String.format("Expression[expression=%s,\n%sclassName=%s,\n%sfunctionName=%s, recursive=%s, functionClass=%s]",
                         expression,
                         indent(22),
                         className,
                         indent(22),
                         functionName,
                         recursive,
                         functionClass);
  }

  @Override
  public String typeset()
  {
    return rootNode == null ? null : "$" + rootNode.typeset() + "$";
  }

  public Expression<D, R, F> writeBytecodes(File file)
  {
    try
    {
      Files.write(Paths.get(file.toURI()), instructions);
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(), e);
    }
    return this;
  }

  public boolean isRealNumberOnTopOfTheStack()
  {
    return !typeStack.isEmpty() && typeStack.getLast().equals(Real.class);
  }

  public Stack<Class<?>> typeStack = new Stack<>();

  public void addToTypeStack(Class<?> type)
  {
    typeStack.add(type);
  }

}