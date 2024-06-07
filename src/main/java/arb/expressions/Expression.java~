package arb.expressions;

import static arb.expressions.Compiler.addNullCheckForField;
import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.generateFunctionInterface;
import static arb.expressions.Compiler.getVariablePrefix;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadFunctionClass;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static arb.expressions.Compiler.reify;
import static arb.expressions.Parser.isLatinOrGreek;
import static arb.expressions.Parser.isNumeric;
import static java.lang.String.format;
import static java.util.stream.Collectors.toList;
import static org.objectweb.asm.Opcodes.ACC_FINAL;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.INVOKESPECIAL;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.PUTFIELD;
import static org.objectweb.asm.Opcodes.RETURN;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.signature.SignatureWriter;

import arb.ComplexPolynomial;
import arb.Integer;
import arb.OrderedPair;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.expressions.nodes.binary.Addition;
import arb.expressions.nodes.binary.Division;
import arb.expressions.nodes.binary.Exponentiation;
import arb.expressions.nodes.binary.Multiplication;
import arb.expressions.nodes.binary.RisingFactorial;
import arb.expressions.nodes.binary.Subtraction;
import arb.expressions.nodes.nary.Product;
import arb.expressions.nodes.unary.Factorial;
import arb.expressions.nodes.unary.FunctionCall;
import arb.expressions.nodes.unary.When;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * <p>
 * The <code>Expression</code> class in the <code>arb.expressions</code> package
 * is a versatile and dynamic expression {@link Compiler} which produces
 * high-performance {@link Function} implementations instantly using ASM's
 * {@link MethodVisitor} and {@link ClassVisitor} for bytecode generation.
 *
 * <h2>Key features</h2>
 * <ul>
 * <li>Compiles mathematical expressions dynamically into Java bytecodes.</li>
 * <li>Manages variables, constants, and function calls within expressions.</li>
 * <li>Handles intermediate variables and constants effectively.</li>
 * <li>Injects variable and function references into compiled instances.</li>
 * <li>Includes methods for parsing, evaluating, and generating necessary
 * bytecode for expressions.</li>
 * </ul>
 * 
 * TODO: sum ⅀, factorial and Γ function
 * 
 * <h2>System Properties</h2>
 * <ul>
 * <li>expressionCompiler.saveClasses=true|false</li>
 * </ul>
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * 
 * @param <D> domain type
 * @param <R> range type
 * @param <F> the function type of the expression, extending {@link Function}
 * 
 * @author ©2024 Stephen A. Crowley
 */
public class Expression<D, R, F extends Function<D, R>> implements
                       Typesettable
{

  public static final String  evaluationMethodDescriptor = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  private static final String IS_INITIALIZED             = "isInitialized";

  private static final String nameOfInitializerFunction  = "initialize";

  public static boolean       saveClasses                = Boolean.valueOf(System.getProperty("expressionCompiler.saveClasses",
                                                                                              "false"));

  public static <D, R, F extends Function<D, R>> F instantiate(String expression,
                                                               Context context,
                                                               Class<? extends D> domainClass,
                                                               Class<? extends R> rangeClass,
                                                               Class<? extends F> functionClass,
                                                               String functionName)
  {
    FunctionMapping<?, ?> mapping = null;
    if (functionName != null)
    {
      mapping = context.registerFunctionMapping(functionName, null, domainClass, rangeClass, functionClass);
    }

    Expression<D, R, F> compiledExpression = reify(expression,
                                                   context,
                                                   domainClass,
                                                   rangeClass,
                                                   functionClass,
                                                   functionName);
    F                   func               = compiledExpression.instantiate();
    if (mapping != null)
    {
      mapping.func = func;
    }

    return func;
  }

  /**
   * {@link Compiler#reify(String, String, Context, Class, Class, Class, boolean)}s
   * then {@link Expression#instantiate()}s a mathematical expressions
   * 
   * @param <D>
   * @param <R>
   * @param <F>
   * @param className
   * @param expression
   * @param context
   * @param domainClass
   * @param rangeClass
   * @param functionClass
   * @param verbose
   * @return
   */
  public static <D, R, F extends Function<D, R>> F instantiate(String className,
                                                               String expression,
                                                               Context context,
                                                               Class<D> domainClass,
                                                               Class<R> rangeClass,
                                                               Class<F> functionClass,
                                                               boolean verbose)
  {
    return reify(className, expression, context, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  public char                                     character                     = 0;

  public boolean                                  checkForNullsBeforeEvaluating = false;

  public String                                   className;

  Class<F>                                        compiledClass;

  int                                             constantCount                 = 1;

  public Context                                  context;

  final public String                             domainClassDescriptor;

  public final String                             domainClassInternalName;

  final public Class<? extends D>                 domainType;

  protected Method                                evaluateMethod;

  public final String                             evaluateMethodSignature;

  public String                                   expression;

  public Class<? extends F>                       functionClass;

  public String                                   functionClassDescriptor;

  public String                                   functionName;

  final public String                             genericFunctionClassInternalName;

  public Variable<D, R, F>                        independentVariableNode;

  public Variable<D, R, F>                        indeterminate;

  F                                               instance;

  protected byte[]                                instructions;

  public HashMap<String, AtomicInteger>           intermediateVariableCounters  = new HashMap<>();

  public ArrayList<IntermediateVariable<D, R, F>> intermediateVariables         = new ArrayList<>();

  public ArrayList<LiteralConstant<D, R, F>>      literalConstants              = new ArrayList<>();

  public int                                      position                      = -1;

  public char                                     previousCharacter;

  final public String                             rangeClassDescriptor;

  public final String                             rangeClassInternalName;

  final public Class<? extends R>                 rangeType;

  public boolean                                  recursive                     = false;

  public HashMap<String, FunctionMapping<D, R>>   referencedFunctions           = new HashMap<>();

  public HashMap<String, Variable<D, R, F>>       referencedVariables           = new HashMap<>();

  public Node<D, R, F>                            rootNode;

  public Variables                                variables;

  public boolean                                  variablesDeclared             = false;

  public Expression(String className,
                    Class<? extends D> domainClass,
                    Class<? extends R> rangeClass,
                    Class<? extends F> functionClass,
                    String expressionString,
                    Context context)
  {
    this(className,
         domainClass,
         rangeClass,
         functionClass,
         expressionString,
         context,
         null);
  }

  public Expression(String className,
                    Class<? extends D> domainClass,
                    Class<? extends R> rangeClass,
                    Class<? extends F> functionClass,
                    String expression,
                    Context context,
                    String functionName)
  {
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
    this.expression                       = Parser.replaceArrowsAndEllipses(expression);
    this.context                          = context;
    this.variables                        = context != null ? context.variables : null;
    evaluateMethodSignature               = String.format("(L%s;IIL%s;)L%s;",
                                                          domainClassInternalName,
                                                          rangeClassInternalName,
                                                          rangeClassInternalName);
    this.functionName                     = functionName;
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
        node = new Addition<>(this,
                              node,
                              exponentiateMultiplyAndDivide());
      }
      else if (nextCharacterIs('-', '₋'))
      {
        node = new Subtraction<>(this,
                                 node,
                                 exponentiateMultiplyAndDivide());
      }

      else
      {
        return node;
      }
    }
  }

  public void addCheckForNullField(MethodVisitor methodVisitor, String varName, boolean variable)
  {
    Class<?> fieldClass = variable ? context.variables.map.get(varName).getClass() : context.functions.get(varName)
                                                                                                      .type();
    String   fieldDesc  = fieldClass.descriptorString();
    addNullCheckForField(methodVisitor, className, varName, fieldDesc);
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

  public MethodVisitor
         callContextualUnaryFunction(MethodVisitor methodVisitor, FunctionMapping<D, R> mapping, Class<?> type)
  {
    boolean isInterface = mapping.functionInterface != null;
    methodVisitor.visitMethodInsn(mapping.functionInterface != null ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(isInterface ? mapping.functionInterface : mapping.func.getClass()),
                                  "evaluate",
                                  evaluationMethodDescriptor,
                                  isInterface);
    return Compiler.checkClassCast(methodVisitor, type);
  }

  public ClassVisitor constructClassVisitor()
  {
    ClassVisitor cw = new ClassWriter(false ? ClassWriter.COMPUTE_FRAMES : 0 );
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
    methodVisitor.visitLocalVariable("in", domainType.descriptorString(), null, startLabel, endLabel, 1);
    methodVisitor.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("result", rangeType.descriptorString(), null, startLabel, endLabel, 4);
    return methodVisitor;
  }

  public void declareVariables(ClassVisitor classVisitor)
  {
    if (context != null)
    {
      for (var variable : context.variables.map.entrySet())
      {
        classVisitor.visitField(ACC_PUBLIC,
                                variable.getKey(),
                                variable.getValue().getClass().descriptorString(),
                                null,
                                null);
      }
    }

    variablesDeclared = true;
  }

  public Class<F> load()
  {
    assert instructions != null : "the instructions field is null indicating that the expression has not been compiled";
    return compiledClass = loadFunctionClass(className, instructions, context);
  }

  /**
   * Apply the order of operations except for parenthesis
   * 
   * @return the result of passing this{@link #exponentiateMultiplyAndDivide()} to
   *         this{@link #addAndSubtract(Node)}
   */
  public Node<D, R, F> determine()
  {
    Node<D, R, F> node = exponentiateMultiplyAndDivide();
    return addAndSubtract(node);
  }

  /**
   * @return a parenthetical {@link Node}, a {@link Product}, a
   *         {@link LiteralConstant},a {@link Function}, a {@link Variable} or
   *         null if for instance "-t" is encountered, a 0 is implied by the
   *         abscence of a node before the {@link Subtraction} operator is
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
      node = determine();

      if (!nextCharacterIs(')'))
      {
        throw new ExpressionCompilerException(format("expected closing parenthesis, instead "
                      + "got %c at position %s in " + "expression '%s' node=%s which is fllowed by %s ",
                                                     character,
                                                     position,
                                                     expression,
                                                     node,
                                                     expression.substring(position, expression.length())));
      }

    }
    else if (nextCharacterIs('Π', '∏'))
    {
      return new Product<D, R, F>(this,
                                  determine()).evaluateRangeSpecification();
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

    node = resolvePostfixOperators(node);
    return node;
  }

  private VariableReference<D, R, F> evaluateName(int startPos)
  {
    String        identifier = parseName(startPos);
    Node<D, R, F> index      = evaluateIndex();
    return new VariableReference<D, R, F>(identifier,
                                          index);
  }

  private Node<D, R, F> evaluateIndex()
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

    return new LiteralConstant<>(this,
                                 expression.substring(startPos, position));
  }

  public void evaluateOptionalIndependentVariableSpecification()
  {
    expression = expression.replace("->", "➔");
    int rightArrowIndex = expression.indexOf('➔');
    if (rightArrowIndex != -1)
    {
      String                     name      = expression.substring(0, rightArrowIndex);
      VariableReference<D, R, F> reference = new VariableReference<D, R, F>(name,
                                                                            null,
                                                                            domainType);
      independentVariableNode = new Variable<D, R, F>(this,
                                                      reference);

      position                = rightArrowIndex;
    }
  }

  private Node<D, R, F> evaluateSquareBracketedIndex()
  {
    Node<D, R, F> index = null;
    if (nextCharacterIs('['))
    {
      index = determine();
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

  private Node<D, R, F> evaluateSubscriptedIndex()
  {
    if (nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
    {
      if (!nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
      {
        return new LiteralConstant<D, R, F>(this,
                                            String.valueOf(previousCharacter));
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
   * Calls this{@link #evaluateOptionalIndependentVariableSpecification()} befor
   * calling this{@link #determine()} and assigning the result to
   * this{@link #rootNode}
   * 
   * @return this
   * @throws ExpressionCompilerException
   */
  public Expression<D, R, F> parse()
  {
    assert position == -1 : "parse must only be called before anything else has been parsed but position="
                  + position;
    evaluateOptionalIndependentVariableSpecification();
    nextCharacter();
    rootNode = determine();
    assert rootNode != null : "evaluateRootNode: determine() returned null, expression='" + expression + "'";
    rootNode.isResult = true;
    return this;
  }

  public Node<D, R, F> exponentiate() throws ExpressionCompilerException
  {
    return exponentiate(evaluate());
  }

  /**
   * TODO: this could probably be handled in
   * this{@link #resolvePostfixOperators(Node)}
   * 
   * @param node
   * @return
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> exponentiate(Node<D, R, F> node) throws ExpressionCompilerException
  {
    if (nextCharacterIs('^'))
    {
      boolean parenthetical = false;
      if (nextCharacterIs('('))
      {
        parenthetical = true;
      }
      node = new Exponentiation<>(this,
                                  node,
                                  parenthetical ? determine() : evaluate());
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
    Node<D, R, F> node = exponentiate();
    return multiplyAndDivide(node);
  }

  /**
   * Generate the implementation of the function after this{@link #parse()} has
   * been invoked
   * 
   * @return
   * @throws ExpressionCompilerException
   */
  public Expression<D, R, F> compile() throws ExpressionCompilerException
  {

    ClassVisitor classVisitor = constructClassVisitor();

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

      if (recursive)
      {
        generateCopyConstructor(classVisitor);
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
    methodVisitor.visitMaxs(0, 0);
    methodVisitor.visitEnd();

    return classVisitor;
  }

  private void generateCodeToSetIsInitializedToTrue(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitInsn(Opcodes.ICONST_1);
    methodVisitor.visitFieldInsn(PUTFIELD, className, IS_INITIALIZED, "Z");
  }

  private void generateCodeToThrowErrorIfAlreadyInitialized(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    Label alreadyInitializedLabel = new Label();
    methodVisitor.visitJumpInsn(Opcodes.IFEQ, alreadyInitializedLabel);

    methodVisitor.visitTypeInsn(Opcodes.NEW, "java/lang/AssertionError");
    methodVisitor.visitInsn(Opcodes.DUP);
    methodVisitor.visitLdcInsn("Already initialized");
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  "java/lang/AssertionError",
                                  "<init>",
                                  "(Ljava/lang/Object;)V",
                                  false);
    methodVisitor.visitInsn(Opcodes.ATHROW);
    methodVisitor.visitLabel(alreadyInitializedLabel);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  private void generateConditionalInitializater(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    Label alreadyInitialized = new Label();
    methodVisitor.visitJumpInsn(Opcodes.IFNE, alreadyInitialized);

    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, className, nameOfInitializerFunction, "()V", false);

    methodVisitor.visitLabel(alreadyInitialized);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  public MethodVisitor generateContextInitializationCode(MethodVisitor methodVisitor)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(methodVisitor);

    addChecksForNullVariableReferences(methodVisitor, false, false);

    if (needsInitializer())
    {
      referencedFunctions.values().forEach(mapping -> generateContextInitializer(methodVisitor, mapping));

      generateCodeToSetIsInitializedToTrue(methodVisitor);
    }

    return methodVisitor;
  }

  public MethodVisitor generateContextInitializer(MethodVisitor mv, FunctionMapping<?, ?> nestedFunction)
  {

    if (nestedFunction.func != null)
    {
      var nestedFunctionsVariables = context.variableEntryStream()
                                            .map(entry -> new OrderedPair<String, Class<?>>(entry.getKey(),
                                                                                            entry.getValue()
                                                                                                 .getClass()))
                                            .collect(toList());

      initializeNestedFunctionVariableReferences(loadThisOntoStack(mv),
                                                 className,
                                                 Type.getInternalName(nestedFunction.type()),
                                                 nestedFunction.name,
                                                 nestedFunctionsVariables);

    }
    else
    {
      assert nestedFunction.name.equals(functionName) : "nestedFunction.func should not be null if its"
                    + " not the recursive function referring to itself";

    }

    return mv;
  }

  public ClassVisitor generateCopyConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(ACC_PUBLIC,
                                                           "<init>",
                                                           "(L" + className + ";)V",
                                                           null,
                                                           null);
    methodVisitor.visitCode();

    generateInvocationOfDefaultNoArgConstructor(methodVisitor, false);

    addChecksForNullVariableReferences(methodVisitor, false, true);

    for (Variable<D, R, F> variable : referencedVariables.values())
    {
      String variableName = variable.reference.name;
      loadThisOntoStack(methodVisitor);
      methodVisitor.visitVarInsn(ALOAD, 1);
      loadFieldOntoStack(methodVisitor, variableName, variable.type().descriptorString());
      methodVisitor.visitFieldInsn(PUTFIELD, className, variableName, variable.type().descriptorString());
    }

    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(0, 0);
    methodVisitor.visitEnd();
    return classVisitor;
  }

  public ClassVisitor generateDefaultConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor mv = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    generateInvocationOfDefaultNoArgConstructor(mv, true);

    referencedFunctions.values().stream().filter(func -> func.func != null).forEach(mapping ->
    {
      String fieldType = Type.getInternalName(mapping.type());
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitTypeInsn(Opcodes.NEW, fieldType);
      mv.visitInsn(Opcodes.DUP);
      mv.visitMethodInsn(Opcodes.INVOKESPECIAL, fieldType, "<init>", "()V", false);
      mv.visitFieldInsn(Opcodes.PUTFIELD, className, mapping.name, "L" + fieldType + ";");
    });

    generateLiteralConstantInitializers(mv);

    generateIntermediateVariableInitializers(mv);

    mv.visitInsn(RETURN);
    mv.visitMaxs(0, 0);
    mv.visitEnd();
    return classVisitor;
  }

  public ClassVisitor generateEvaluationMethod(ClassVisitor classVisitor) throws ExpressionCompilerException
  {
    if (rootNode == null)
    {
      parse();
    }

    Label         startLabel    = new Label();
    Label         endLabel      = new Label();

    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           "evaluate",
                                                           evaluationMethodDescriptor,
                                                           evaluateMethodSignature,
                                                           null);

    methodVisitor.visitCode();
    methodVisitor.visitLabel(startLabel);

    if (position < expression.length())
    {
      throw new ExpressionCompilerException(String.format("unexpected '%c' character at position=%s in expression '%s' of length %d\n",
                                                          character,
                                                          position,
                                                          expression,
                                                          expression.length()));
    }

    if (needsInitializer())
    {
      generateConditionalInitializater(methodVisitor);
    }

    if (checkForNullsBeforeEvaluating)
    {
      addChecksForNullVariableReferences(methodVisitor, false, false);
    }

    rootNode.generate(classVisitor, methodVisitor, rangeType);

    methodVisitor.visitInsn(Opcodes.ARETURN);

    methodVisitor.visitLabel(endLabel);

    declareLocalVariables(methodVisitor, startLabel, endLabel);

    methodVisitor.visitMaxs(0, 0);

    methodVisitor.visitEnd();

    return classVisitor;
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

      generateContextInitializationCode(methodVisitor);

      methodVisitor.visitInsn(Opcodes.RETURN);
      methodVisitor.visitMaxs(0, 0);
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

  public String getNextIntermediatevariableFieldName(Class<?> type)
  {
    String        prefix  = getVariablePrefix(type);
    AtomicInteger counter = intermediateVariableCounters.get(prefix);
    if (counter == null)
    {
      intermediateVariableCounters.put(prefix, counter = new AtomicInteger(1));
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
                                                         List<OrderedPair<String, Class<?>>> variables)
  {
    String typeDesc = "L" + fieldType + ";";

    for (OrderedPair<String, Class<?>> variable : variables)
    {
      String variableFieldName = variable.getKey();
      String variableFieldType = variable.getValue().descriptorString();
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitFieldInsn(Opcodes.GETFIELD, classType, functionFieldName, typeDesc);
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitFieldInsn(Opcodes.GETFIELD, classType, variableFieldName, variableFieldType);
      mv.visitFieldInsn(Opcodes.PUTFIELD, fieldType, variableFieldName, variableFieldType);
    }

  }

  public void injectVariableReferences(F f) throws NoSuchFieldException, IllegalAccessException
  {
    if (context != null)
    {
      context.variables.map.entrySet().forEach(entry ->
      {
        try
        {
          String variableName = entry.getKey();
          R      value        = variables.get(variableName);
          setFieldValue(f, variableName, value, false);
        }
        catch (Exception e)
        {
          throw new RuntimeException(e.getMessage(),
                                     e);
        }
      });
    }
  }

  public F instantiate()
  {
    try
    {
      F f;

      f = instance = (compiledClass != null ? compiledClass : load()).getDeclaredConstructor().newInstance();

      injectVariableReferences(f);
    }
    catch (Exception e)
    {
      wrapOrThrow(e);
    }

    return instance;
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
        node = new Multiplication<>(this,
                                    node,
                                    exponentiate());

      }
      else if (nextCharacterIs('/', '÷'))
      {
        node = new Division<>(this,
                              node,
                              exponentiate());
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

  private boolean needsInitializer()
  {
    String onlyReferencedFunctionName = null;

    if (referencedFunctions.size() == 1)
    {
      onlyReferencedFunctionName = referencedFunctions.entrySet().iterator().next().getKey();
    }

    return !referencedFunctions.isEmpty()
                  && (functionName != null && !functionName.equals(onlyReferencedFunctionName));
  }

  public String newIntermediateVariable(Class<?> type)
  {
    assert type != Void.class : "dont generate a variable for the Void type";
    String intermediateVarName = getNextIntermediatevariableFieldName(type);
    intermediateVariables.add(new IntermediateVariable<>(this,
                                                         intermediateVarName,
                                                         type));

    return intermediateVarName;
  }

  private Variable<D, R, F> newVariable(VariableReference<D, R, F> reference)
  {
    var contextVar = context == null ? null : context.variables.get(reference.name);
    reference.type = (context == null || contextVar == null) ? domainType : contextVar.getClass();
    Variable<D, R, F> variable = new Variable<D, R, F>(this,
                                                       reference);
    return variable;
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

  private String parseName(int startPos)
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
      node = new Exponentiation<>(this,
                                  node,
                                  new LiteralConstant<>(this,
                                                        digit));
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

  public String reserveIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  private Node<D, R, F> resolveFactorial(Node<D, R, F> node)
  {
    if (nextCharacterIs('!'))
    {
      return new Factorial<D, R, F>(this,
                                    node);
    }
    return node;
  }

  private Node<D, R, F> resolveFunction(int startPos, VariableReference<D, R, F> reference)
  {
    if ("when".equals(reference.name))
    {
      return new When<>(this);
    }
    else
    {
      Node<D, R, F> arg = determine();
      if (nextCharacterIs(')'))
      {
        return new FunctionCall<>(this,
                                  reference.name,
                                  arg);
      }
      else
      {
        throw new RuntimeException(String.format("expected closing parenthesis at: startPos=%s, position=%s,"
                      + " identifier='%s', expression=%s\n", startPos, position, reference, expression));
      }
    }
  }

  public Node<D, R, F> resolveFunctionOrVariableReference(int startPos) throws ExpressionCompilerException
  {
    VariableReference<D, R, F> reference  = evaluateName(startPos);

    boolean                    isFunction = nextCharacterIs('(');

    if (isFunction)
    {
      return resolveFunction(startPos, reference);
    }
    else if (LiteralConstant.constantSymbols.contains(reference.name))
    {
      return new LiteralConstant<>(this,
                                   reference.name);
    }
    else
    {
      Variable<D, R, F> variable = newVariable(reference);

      return variable;
    }
  }

  private Node<D, R, F> resolvePostfixOperators(Node<D, R, F> node)
  {
    node = resolveRisingFactorial(node);
    node = resolveFactorial(node);
    return node;
  }

  private Node<D, R, F> resolveRisingFactorial(Node<D, R, F> node)
  {
    if (nextCharacterIs('₍'))
    {
      Node<D, R, F> power = determine();
      if (nextCharacterIs('₎'))
      {
        node = new RisingFactorial<D, R, F>(this,
                                            node,
                                            power);
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

  public void setFieldValue(F f, String variableName, Object value, boolean overwrite)
  {
    java.lang.reflect.Field field;
    try
    {
      field = compiledClass.getField(variableName);
      field.set(f, value);
    }
    catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e)
    {
      wrapOrThrow(e);
    }
  }

  public static void wrapOrThrow(Throwable e)
  {
    if (e instanceof RuntimeException)
    {
      throw (RuntimeException) e;
    }
    else
    {
      throw new RuntimeException(e);
    }
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
    return String.format("Expression[expression=%s, className=%s, functionName=%s, recursive=%s, className=%s, functionClass=%s]",
                         expression,
                         className,
                         functionName,
                         recursive,
                         className,
                         functionClass);
  }

  @Override
  public String typeset()
  {
    return rootNode == null ? null : rootNode.typeset();
  }

  public Expression<D, R, F> writeBytecodes(File file)
  {
    try
    {
      Files.write(Paths.get(file.toURI()), instructions);
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return this;
  }

}