package arb.expressions;

import static arb.expressions.Compiler.*;
import static arb.expressions.Parser.*;
import static java.lang.String.format;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.objectweb.asm.*;
import org.objectweb.asm.util.TraceClassVisitor;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.nodes.*;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.nary.NAryOperationNode;
import arb.expressions.nodes.nary.ProductNode;
import arb.expressions.nodes.nary.SumNode;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
import arb.utensils.TopologicalSorter;
import arb.utensils.Utensils;
import arb.utensils.text.trees.TextTree;
import arb.utensils.text.trees.TreeModel;

/**
 * The {@link Expression} class represents mathematical expressions in infix and
 * postfix notation flexibily depending upon the context in which the characters
 * are encountered. It uses {@link Character}s and {@link String}s to represent
 * symbols and operations within these expressions. This class is part of the
 * {@code arb.expressions} package and serves as a dynamic compiler that
 * translates these expressions into high-performance Java bytecode, leveraging
 * the ASM library for bytecode manipulation and generation.
 *
 * <p>
 * Internally, the {@link Expression} class parses the input string to construct
 * an Abstract Syntax Tree (AST), where each {@link Node} represents a
 * {@link BinaryOperationNode}, {@link UnaryOperationNode},
 * {@link NAryOperationNode}, such as {@link AdditionNode} ,
 * {@link SubtractionNode}, {@link MultiplicationNode}, and {@link DivisionNode}
 * or its operands like {@link VariableNode} and {@link LiteralConstantNode},
 * etc. This {@link TreeModel} structure allows the class to correctly manage
 * operator precedence and associativity rules inherent in mathematical
 * expressions and also naturally facilitate their printing via the
 * {@link TextTree} interface. The AST is then traversed by the
 * {@link #generate()} method to produce the corresponding Java bytecodes that
 * which when executed produce the result of the evaluation of the the
 * expression.
 *
 * <h2>Key Features:</h2>
 * <ul>
 * <li>Dynamically compiles mathematical expressions into executable Java
 * bytecode, allowing for efficient evaluation.</li>
 * <li>Supports {@link VariableNode}, {@link LiteralConstantNode}, and
 * {@link FunctionNode}s within {@link Expression}, providing an extensive set
 * of features for constructing elaborate expressions, linked together via a
 * shared {@link Context} in which variables and other functions are registered
 * for mutual accessibility..</li>
 * <li>Effectively manages {@link IntermediateVariable} and
 * {@link LiteralConstantNode}, optimizing memory usage and performance.</li>
 * <li>Automatically injects {@link VariableReference}s to {@link VariableNode}
 * and {@link FunctionNode}s into the compiled bytecode, facilitating dynamic
 * execution.</li>
 * <li>The {@link Parser} provides comprehensive methods for parsing
 * expressions, evaluating them, and generating the necessary bytecode, all
 * while handling mathematical precedence and associativity.</li>
 * </ul>
 *
 * <h2>System Properties:</h2>
 * <ul>
 * <li>{@code arb4j.compiler.traceGeneration=true|false}: Print detail
 * information related to the generation process. Default is {@code false}.</li>
 * 
 * <li>{@code arb4j.compiler.saveClasses=true|false}: Specifies whether the
 * compiled classes should be saved to disk (the current directory). Default is
 * {@code true}.</li>
 * </ul>
 * 
 * <pre>
 * Note: Why we don't manually compute stackmap frames: Using `COMPUTE_FRAMES`
 * is the pragmatic choice in most situations, especially for a tool like the
 * `Expression` compiler, which is typically used during application
 * initialization or setup rather than in performance-critical paths.
 * 
 * The additional time taken by `COMPUTE_FRAMES` to automatically compute stack
 * map frames is usually negligible in the grand scheme of things. It's a small
 * price to pay for the convenience, reliability, and maintainability it
 * provides.
 * 
 * Moreover, the `Expression` compiler is designed to generate bytecode for
 * individual expressions, which are then executed repeatedly. The compilation
 * overhead is incurred only once, while the benefits of the generated bytecode,
 * such as improved performance and type safety, are enjoyed throughout the
 * lifetime of the application.
 * 
 * Attempting to optimize the compilation process by manually computing frames
 * would be a case of premature optimization, adding unnecessary complexity and
 * maintenance burden without providing any tangible benefits in most real-world
 * scenarios.
 * 
 * Therefore, sticking with `COMPUTE_FRAMES` is a sensible choice for the
 * `Expression` compiler, as it strikes a good balance between development
 * effort, correctness, and overall performance.
 * </pre>
 * 
 * See Also:
 * <a href="https://github.com/crowlogic/arb4j/wiki/ExpressionCompiler">arb4j
 * wiki page</a><br>
 * <br>
 * 
 * @param <D> The domain type over which the expression operates, such as
 *            {@link Integer}, {@link Real}, {@link Complex},
 *            {@link RealPolynomial}, etc
 * @param <C> The codomain type that the expression evaluates to, representing
 *            the result of the expression.
 * @param <F> The function type of the expression, extending the
 *            {@link Function} interface, encapsulating the compiled expression
 *            as an evaluatable function in the sense of Java
 * @author Stephen Andrew Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne#gett for the terms of use of the
 *      {@link TheArb4jLibrary}
 */
public class Expression<D, C, F extends Function<? extends D, ? extends C>> implements
                       Typesettable
{

  private static final String    JAVA_LANG_ASSERTION_ERROR         = "java/lang/AssertionError";

  private static final String    ASSERTION_ERROR_METHOD_DESCRIPTOR = Compiler.getMethodDescriptor(Void.class,
                                                                                                  Object.class);

  static File                    compiledClassDir                  = new File("compiled");

  public static final String     evaluationMethodDescriptor        =
                                                            "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public static final Class<?>[] implementedInterfaces             = new Class[]
  { Typesettable.class, AutoCloseable.class, Initializable.class };

  public static final String     IS_INITIALIZED                    = "isInitialized";

  public static final String     nameOfInitializerFunction         = "initialize";

  public static boolean          saveClasses                       =
                                             Boolean.valueOf(System.getProperty("arb4j.compiler.saveClasses", "true"));

  public static boolean          trace                             =
                                       Boolean.valueOf(System.getProperty("arb4j.compiler.trace", "false"));

  public static final String     VOID_METHOD_DESCRIPTOR            = Compiler.getMethodDescriptor(Void.class);

  static
  {
    assert arb.functions.integer.Sequence.class.equals(Sequence.class) : "you forgot to import arb.functions.sequences.Sequence or imported a class named sequence in another package";
  }

  static
  {
    if (!compiledClassDir.canWrite())
    {
      compiledClassDir.mkdir();
    }
  }

  public static ClassVisitor constructClassVisitor()
  {
    return new ClassWriter(ClassWriter.COMPUTE_FRAMES);
  }

  public Expression<?, ?, ?>                            ascendentExpression;

  public char                                           character                     = 0;

  public String                                         className;

  public final String                                   coDomainClassDescriptor;

  public final String                                   coDomainClassInternalName;

  public final Class<? extends C>                       coDomainType;

  public Class<F>                                       compiledClass;

  int                                                   constantCount                 = 1;

  public Context                                        context;

  HashSet<String>                                       declaredIntermediateVariables = new HashSet<>();

  public final String                                   domainClassDescriptor;

  public final String                                   domainClassInternalName;

  public final Class<? extends D>                       domainType;

  public final String                                   evaluateMethodSignature;

  public String                                         expression;

  public Class<? extends F>                             functionClass;

  public String                                         functionClassDescriptor;

  public String                                         functionName;

  public final String                                   genericFunctionClassInternalName;

  public boolean                                        inAbsoluteValue               = false;

  public VariableNode<D, C, F>                          independentVariable;

  public VariableNode<D, C, F>                          indeterminateVariable;

  public LinkedList<Consumer<MethodVisitor>>            initializers                  = new LinkedList<>();

  public boolean                                        insideInitializer             = false;

  protected F                                           instance;

  public byte[]                                         instructionByteCodes;

  public HashMap<String, IntermediateVariable<D, C, F>> intermediateVariables         = new HashMap<>();

  public HashMap<String, LiteralConstantNode<D, C, F>>  literalConstants              = new HashMap<>();

  public FunctionMapping<D, C, F>                       mapping;

  public int                                            position                      = -1;

  public char                                           previousCharacter;

  public boolean                                        recursive                     = false;

  public HashMap<String, FunctionMapping<?, ?, ?>>      referencedFunctions           = new HashMap<>();

  public HashMap<String, VariableNode<D, C, F>>         referencedVariables           = new HashMap<>();

  public Node<D, C, F>                                  rootNode;

  public boolean                                        variablesDeclared             = false;

  boolean                                               verboseTrace                  = false;

  public Expression(Class<? extends D> domain, Class<? extends C> codomain, Class<? extends F> function)
  {
    this.ascendentExpression              = null;
    this.coDomainClassDescriptor          = codomain.descriptorString();
    this.domainClassDescriptor            = domain.descriptorString();
    this.domainType                       = domain;
    this.coDomainType                     = codomain;
    this.functionClass                    = function;
    this.coDomainClassInternalName        = Type.getInternalName(codomain);
    this.domainClassInternalName          = Type.getInternalName(domain);
    this.genericFunctionClassInternalName = Type.getInternalName(function);
    this.functionClassDescriptor          = function.descriptorString();
    evaluateMethodSignature               = String.format("(L%s;IIL%s;)L%s;",
                                                          domainClassInternalName,
                                                          coDomainClassInternalName,
                                                          coDomainClassInternalName);
    if (context != null && context.saveClasses)
    {
      saveClasses = true;
    }
  }

  public Expression(String className,
                    Class<? extends D> domainClass,
                    Class<? extends C> coDomainClass,
                    Class<? extends F> functionClass,
                    String expressionString,
                    Context context)
  {
    this(className,
         domainClass,
         coDomainClass,
         functionClass,
         expressionString,
         context,
         null,
         null);
  }

  public Expression(String className,
                    Class<? extends D> domain,
                    Class<? extends C> codomain,
                    Class<? extends F> function,
                    String expression,
                    Context context,
                    String functionName,
                    Expression<?, ?, ?> parentExpression)
  {
    assert className != null : "className needs to be specified";
    this.ascendentExpression              = parentExpression;
    this.coDomainClassDescriptor          = codomain.descriptorString();
    this.domainClassDescriptor            = domain.descriptorString();
    this.className                        = className;
    this.domainType                       = domain;
    this.coDomainType                     = codomain;
    this.functionClass                    = function;
    this.coDomainClassInternalName        = Type.getInternalName(codomain);
    this.domainClassInternalName          = Type.getInternalName(domain);
    this.genericFunctionClassInternalName = Type.getInternalName(function);
    this.functionClassDescriptor          = function.descriptorString();
    this.expression                       = Parser.transformToJavaAcceptableCharacters(expression);
    this.context                          = context;
    this.functionName                     = functionName;
    evaluateMethodSignature               = String.format("(L%s;IIL%s;)L%s;",
                                                          domainClassInternalName,
                                                          coDomainClassInternalName,
                                                          coDomainClassInternalName);
    if (context != null && context.saveClasses)
    {
      saveClasses = true;
    }
  }

  protected <N extends Node<D, C, F>> N addAndSubtract(N node)
  {
    while (true)
    {
      if (nextCharacterIs('+', '₊'))
      {
        node = node.add(exponentiateMultiplyAndDivide());
      }
      else if (nextCharacterIs('-', '₋', '−'))
      {
        N rhs = exponentiateMultiplyAndDivide();
        node = node == null ? rhs.neg() : node.sub(rhs);
      }
      else
      {
        return node;
      }
    }
  }

  protected void addCheckForNullField(MethodVisitor mv, String varName, boolean variable)
  {
    Class<?> fieldClass;
    if (variable)
    {
      Object field = context.getVariable(varName);
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

  protected void addChecksForNullVariableReferences(MethodVisitor mv)
  {
    if (context != null)
    {
      context.variableClassStream()
             .forEach(entry -> addCheckForNullField(loadThisOntoStack(mv), entry.getLeft(), true));
    }
  }

  /**
   * Calls this{@link #newIntermediateVariable(Class)} followed by
   * this{@link #loadThisFieldOntoStack(MethodVisitor, String, Class)} with the
   * newly assigned intermediate variable
   * 
   * @param methodVisitor
   * @param type
   * @return
   */
  public String allocateIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    assert !type.isInterface() : "cannot instantiate interface " + type;

    String intermediateVariableName = newIntermediateVariable(type);
    loadThisFieldOntoStack(methodVisitor, intermediateVariableName, type);
    return intermediateVariableName;
  }

  public String allocateIntermediateVariable(MethodVisitor methodVisitor, String prefix, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(prefix, type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  public boolean anyAscendentIndependentVariableIsEqualTo(String name)
  {
    if (independentVariable != null && independentVariable.getName().equals(name))
    {
      return true;
    }
    if (ascendentExpression != null)
    {
      if (ascendentExpression.anyAscendentIndependentVariableIsEqualTo(name))
      {
        return true;
      }
    }
    return false;
  }

  protected boolean characterAfterNextIs(char ch)
  {
    return position + 1 < expression.length() && expression.charAt(position + 1) == ch;
  }

  public Expression<D, C, F> recompile()
  {
    updateStringRepresentation();
    instructionByteCodes = null;
    compiledClass        = null;
    return compile();
  }

  public Expression<D, C, F> compile()
  {
    defineClass();
    return this;
  }

  protected ClassVisitor declareConstants(ClassVisitor classVisitor)
  {
    for (var constant : literalConstants.values())
    {
      constant.declareField(classVisitor);
    }
    return classVisitor;
  }

  protected MethodVisitor
            declareEvaluateMethodsLocalVariableArguments(MethodVisitor methodVisitor, Label startLabel, Label endLabel)
  {
    methodVisitor.visitLocalVariable("this", "L" + className + ";", null, startLabel, endLabel, 0);
    methodVisitor.visitLocalVariable(independentVariable != null ? independentVariable.getName() : "in",
                                     domainType.descriptorString(),
                                     null,
                                     startLabel,
                                     endLabel,
                                     1);
    methodVisitor.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("result", coDomainType.descriptorString(), null, startLabel, endLabel, 4);
    return methodVisitor;
  }

  protected void declareFields(ClassVisitor cw)
  {
    cw.visitField(Opcodes.ACC_PUBLIC, IS_INITIALIZED, "Z", null, null);
    if (!coDomainType.isInterface())
    {
      declareConstants(cw);
      declareIntermediateVariables(cw);
    }
    declareFunctionReferences(cw);
    declareVariables(cw);
  }

  protected ClassVisitor declareFunctionReferences(ClassVisitor classVisitor)
  {
    if (context == null)
    {
      return classVisitor;
    }
    context.populateFunctionReferenceGraph();
    List<String> sortedFunctions = TopologicalSorter.sort(context.functionReferenceGraph);

    if (trace)
    {
      var graphFile = context.saveDependencyGraph(sortedFunctions);
      if (graphFile != null)
      {
        System.err.println("Function Graph written to " + graphFile);
      }
    }
    // Declare functions in dependency order
    for (String functionName : sortedFunctions)
    {
      FunctionMapping<?, ?, ?> function = referencedFunctions.get(functionName);
      if (function != null)
      {
        function.declare(classVisitor, functionName);
      }
    }

    return classVisitor;
  }

  protected void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    for (var variable : intermediateVariables.values())
    {
      if (!declaredIntermediateVariables.contains(variable.name))
      {
        if (trace)
        {
          System.out.format("Declaring IntermediateVariable : %s %s\n", variable.type, variable.name);
        }
        variable.declareField(classVisitor);
        declaredIntermediateVariables.add(variable.name);
      }
    }
  }

  protected void declareVariableEntry(ClassVisitor classVisitor, Entry<String, Named> variable)
  {
    if (trace)
    {
      System.out.println("Declaring variable of " + className + ": " + variable);
    }
    if (variable.getValue() != null)
    {
      classVisitor.visitField(ACC_PUBLIC,
                              variable.getKey(),
                              variable.getValue().getClass().descriptorString(),
                              null,
                              null);
    }
    else
    {
      if (trace)
      {
        System.out.println("Skipping null variable of " + className + ": " + variable);
      }
    }
  }

  protected void declareVariables(ClassVisitor classVisitor)
  {
    // assert !variablesDeclared : "variables have already been declared";
    if (ascendentExpression != null)
    {
      var ascendentIndependentVariableNode = ascendentExpression.independentVariable;
      if (ascendentIndependentVariableNode != null && !ascendentIndependentVariableNode.type().equals(Object.class))
      {
        classVisitor.visitField(ACC_PUBLIC,
                                ascendentIndependentVariableNode.reference.name,
                                ascendentIndependentVariableNode.type().descriptorString(),
                                null,
                                null);
      }
    }

    if (context != null)
    {
      if (trace)
      {
        String vars = context.variables.map.entrySet().stream().map(x -> x.toString()).collect(Collectors.joining(","));
        System.out.println("declareVariables: " + vars);
      }
      for (var variable : context.variables.map.entrySet()
                                               .stream()
                                               .sorted((a, b) -> a.getKey().compareTo(b.getKey()))
                                               .toList())
      {
        declareVariableEntry(classVisitor, variable);
      }
    }

    variablesDeclared = true;
  }

  protected Class<F> defineClass()
  {
    if (compiledClass != null)
    {
      return compiledClass;
    }
    if (trace)
    {
      System.err.format("\nExpression(#%s).defineClass(expression=%s\n,className=%s\n, context=%s)\n\n",
                        System.identityHashCode(this),
                        expression,
                        className,
                        context);
    }
    if (instructionByteCodes == null)
    {
      generate();
    }
    return compiledClass = loadFunctionClass(className, instructionByteCodes, context);
  }

  /**
   * Process the next character
   * 
   * @return a parenthetical {@link Node}, a {@link ProductNode}, a
   *         {@link LiteralConstantNode},a {@link Function}, a
   *         {@link VariableNode} or null if for instance "-t" is encountered, as
   *         a 0 is implied by the absence of a node before the
   *         {@link SubtractionNode} operator is encountered, also handles
   *         {@link ProductNode} also known as the product operator and
   *         {@link SumNode}
   * 
   * @throws CompilerException
   */
  @SuppressWarnings("unchecked")
  public <N extends Node<D, C, F>> N evaluate() throws CompilerException
  {
    N node = null;

    if (nextCharacterIs('['))
    {
      node = (N) new VectorNode<D, C, F>(this);
    }
    else if (nextCharacterIs('('))
    {
      node = resolve();
      require(')');
    }
    else if (nextCharacterIs('∂'))
    {
      node = (N) new DerivativeNode<D, C, F>(this);
    }
    else if (nextCharacterIs('∫'))
    {
      node = (N) new IntegralNode<D, C, F>(this);
    }
    else if (nextCharacterIs('Π', '∏'))
    {
      node = (N) new ProductNode<D, C, F>(this);
    }
    else if (nextCharacterIs('∑', 'Σ'))
    {
      node = (N) new SumNode<D, C, F>(this);
    }
    else if (isNumeric(character))
    {
      node = (N) evaluateNumber();
    }
    else if (isIdentifierCharacter())
    {
      node = (N) resolveIdentifier();
    }

    return resolvePostfixOperators(node);
  }

  /**
   * 
   * @return the results of this{@link #evaluateSquareBracketedIndex()} and
   *         this{@link #evaluateSubscriptedIndex()} being applied in succession
   */
  protected Node<D, C, F> evaluateIndex()
  {
    var index = evaluateSquareBracketedIndex();
    return index == null ? index = evaluateSubscriptedIndex() : index;
  }

  /**
   * 
   * @param startPos
   * @return a new {@link VariableReference} constructed from the results of
   *         calling this{@link #parseName()} and this{@link #evaluateIndex()}
   */
  protected VariableReference<D, C, F> evaluateName(int startPos)
  {
    String identifier = parseName(startPos);
    var    index      = evaluateIndex();
    return new VariableReference<D, C, F>(identifier,
                                          index);
  }

  /**
   * 
   * @return a new {@link LiteralConstantNode} constucted by iterating
   *         this{@link #nextCharacter()} while {@link Parser#isNumeric(char)}
   *         applied to this{@link #character} is true
   */
  protected Node<D, C, F> evaluateNumber()
  {
    int startingPosition = position;
    while (isNumeric(character))
    {
      nextCharacter();
    }
    assert position > startingPosition : "didn't read any digits";

    return newLiteralConstant(expression.substring(startingPosition, position));
  }

  protected Expression<D, C, F> evaluateOptionalIndependentVariableSpecification()
  {
    int rightArrowIndex = (expression = transformToJavaAcceptableCharacters(expression)).indexOf('➔');
    if (rightArrowIndex != -1)
    {
      String  inputVariableName        = expression.substring(0, rightArrowIndex);
      boolean isInputVariableSpecified = true;
      for (int i = 0; i < inputVariableName.length(); i++)
      {
        if (!isAlphabetical(inputVariableName.charAt(i)))
        {
          isInputVariableSpecified = false;
        }
      }
      if (isInputVariableSpecified)
      {
        if (context != null)
        {
          if (context.getVariable(inputVariableName) != null)
          {
            throw new CompilerException(inputVariableName
                                        + " cannot be declared as the input since it is already registered as a context variable in "
                                        + context);
          }
        }
        var variable = new VariableNode<>(this,
                                          new VariableReference<>(inputVariableName,
                                                                  null,
                                                                  coDomainType),
                                          position,
                                          false);

        if (hasIndeterminateVariable())
        {
          indeterminateVariable                 = variable;
          indeterminateVariable.isIndeterminate = true;
        }
        else
        {
          independentVariable               = variable;
          independentVariable.isIndependent = true;
        }

        position = rightArrowIndex;
      }
    }
    return this;
  }

  protected Node<D, C, F> evaluateSquareBracketedIndex()
  {
    Node<D, C, F> index = null;
    if (nextCharacterIs('['))
    {
      index = resolve();
      require(']');
    }
    return index;
  }

  protected Node<D, C, F> evaluateSubscriptedIndex()
  {
    int startPos = position;

    if (nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
    {
      while (nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY));
      return newLiteralConstant(expression.substring(startPos, position));
    }
    else if (isIdentifierCharacter())
    {
      return resolveIdentifier();
    }
    return null;
  }

  protected <N extends Node<D, C, F>> N exponentiate() throws CompilerException
  {
    return exponentiate(evaluate());
  }

  protected <N extends Node<D, C, F>> N exponentiate(N node) throws CompilerException
  {
    if (nextCharacterIs('^'))
    {
      final boolean parenthetical = nextCharacterIs('(');
      node = node.pow(parenthetical ? resolve() : evaluate());
      if (parenthetical)
      {
        require(')');
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
  protected <N extends Node<D, C, F>> N exponentiateMultiplyAndDivide()
  {
    return multiplyAndDivide(exponentiate());
  }

  /**
   * Generate the implementation of the function after this{@link #parseRoot()}
   * has been invoked
   * 
   * @return this
   * @throws CompilerException
   */
  protected Expression<D, C, F> generate() throws CompilerException
  {
    if (trace)
    {
      System.err.format("Expression(#%s).generate() className=%s expression='%s'\n\n",
                        System.identityHashCode(this),
                        className,
                        expression);
    }
    ClassVisitor classVisitor = constructClassVisitor();

    try
    {
      generateFunctionInterface(this, className, classVisitor);
      generateCoDomainTypeMethod(classVisitor);
      generateEvaluationMethod(classVisitor);
      declareFields(classVisitor);
      generateInitializationMethod(classVisitor);
      generateConstructor(classVisitor);
      declareIntermediateVariables(classVisitor);
      if (needsCloseMethod())
      {
        generateCloseMethod(classVisitor);
      }
      generateToStringMethod(classVisitor);
      generateTypesetMethod(classVisitor);
      generateIntermediateStatesMethod(classVisitor);
    }
    finally
    {
      classVisitor.visitEnd();
    }

    return storeInstructions(classVisitor);
  }

  protected MethodVisitor generateCloseFieldCall(MethodVisitor methodVisitor, String fieldName, Class<?> fieldType)
  {
    getFieldFromThis(methodVisitor, className, fieldName, fieldType);
    return invokeCloseMethod(methodVisitor, fieldType);
  }

  protected ClassVisitor generateCloseMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = defineMethod(classVisitor, "close", VOID_METHOD_DESCRIPTOR);

    methodVisitor.visitCode();

    if (!coDomainType.isInterface())
    {
      literalConstants.values()
                      .forEach(constant -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                  constant.fieldName,
                                                                  constant.type()));

      intermediateVariables.values()
                           .forEach(intermediateVariable -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                                   intermediateVariable.name,
                                                                                   intermediateVariable.type));

      referencedFunctions.forEach((name, mapping) -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                            name,
                                                                            mapping.type()));
    }

    methodVisitor.visitInsn(Opcodes.RETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();

    return classVisitor;
  }

  protected void generateCodeToSetIsInitializedToTrue(MethodVisitor methodVisitor)
  {
    loadThisOntoStack(methodVisitor).visitInsn(Opcodes.ICONST_1);
    methodVisitor.visitFieldInsn(PUTFIELD, className, IS_INITIALIZED, "Z");
  }

  protected void generateCodeToThrowErrorIfAlreadyInitialized(MethodVisitor mv)
  {
    loadThisOntoStack(mv);
    mv.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    var alreadyInitializedLabel = new Label();
    mv.visitJumpInsn(IFEQ, alreadyInitializedLabel);
    mv.visitTypeInsn(NEW, JAVA_LANG_ASSERTION_ERROR);
    duplicateTopOfTheStack(mv).visitLdcInsn("Already initialized");
    mv.visitMethodInsn(INVOKESPECIAL, JAVA_LANG_ASSERTION_ERROR, "<init>", ASSERTION_ERROR_METHOD_DESCRIPTOR, false);
    mv.visitInsn(ATHROW);
    mv.visitLabel(alreadyInitializedLabel);
  }

  protected ClassVisitor generateCoDomainTypeMethod(ClassVisitor classVisitor) throws CompilerException
  {

    MethodVisitor mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                "coDomainType",
                                                Compiler.getMethodDescriptor(Class.class),
                                                getCoDomainTypeMethodSignature(),
                                                null);

    Compiler.annotateWithOverride(mv);

    mv.visitCode();
    mv.visitLdcInsn(Type.getType(coDomainType));
    Compiler.generateReturnInstructionAndEndTheVisit(mv);

    return classVisitor;
  }

  protected void generateConditionalInitializater(MethodVisitor mv)
  {
    var alreadyInitialized = new Label();
    loadThisOntoStack(mv).visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    mv.visitJumpInsn(Opcodes.IFNE, alreadyInitialized);
    loadThisOntoStack(mv).visitMethodInsn(INVOKEVIRTUAL, className, nameOfInitializerFunction, "()V", false);
    mv.visitLabel(alreadyInitialized);
  }

  protected ClassVisitor generateConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor mv = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    generateInvocationOfDefaultNoArgConstructor(mv, true);

    if (!coDomainType.isInterface())
    {
      generateLiteralConstantInitializers(mv);
    }

    generateIntermediateVariableInitializers(mv);

    mv.visitInsn(RETURN);
    mv.visitMaxs(10, 10);
    mv.visitEnd();
    return classVisitor;
  }

  protected ClassVisitor generateEvaluationMethod(ClassVisitor classVisitor) throws CompilerException
  {
    if (rootNode == null)
    {
      parseRoot();
    }

    Label         startLabel = new Label();
    Label         endLabel   = new Label();

    String        methodName = "evaluate";
    MethodVisitor mv         = visitMethod(classVisitor, methodName);
    mv.visitCode();
    mv.visitLabel(startLabel);
    Compiler.annotateWithOverride(mv);
    generateConditionalInitializater(mv);

    rootNode.isResult = true;
    if (coDomainType.isInterface())
    {
      generateFunctionalElement(mv);
    }
    else
    {
      rootNode.generate(mv, coDomainType);
    }

    mv.visitInsn(Opcodes.ARETURN);
    mv.visitLabel(endLabel);
    declareEvaluateMethodsLocalVariableArguments(mv, startLabel, endLabel);
    mv.visitMaxs(10, 10);
    mv.visitEnd();
    return classVisitor;
  }

  protected MethodVisitor visitMethod(ClassVisitor classVisitor, String methodName)
  {
    MethodVisitor mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                methodName,
                                                evaluationMethodDescriptor,
                                                evaluateMethodSignature,
                                                null);
    return mv;
  }

  /**
   * Generate the code when the {@link #coDomainType} {@link Class#isInterface()}
   * so that the return value is itself a {@link Function}, in this case the
   * result argument is ignored since there is no possible way to use the
   * {@link Function} reference as a changeable object, since it is not in general
   * {@link Becomable}
   * 
   * @param mv
   * @return
   */
  protected Expression<Object, Object, Function<?, ?>> generateFunctionalElement(MethodVisitor mv)
  {
    var                                          function                               = newFunctionalExpression();

    boolean                                      functionalDependsOnIndependentVariable = false;
    VariableNode<Object, Object, Function<?, ?>> independentVariableMappedToFunctional  = null;
    if (independentVariable != null)
    {
      independentVariableMappedToFunctional  = independentVariable.spliceInto(function).asVariable();
      functionalDependsOnIndependentVariable = function.rootNode.dependsOn(independentVariableMappedToFunctional);
    }

    function.generate();

    constructNewObject(mv, function.className);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, function.className);

    if (functionalDependsOnIndependentVariable)
    {
      generateCodeToPropagateIndependentVariableToFunctionalElement(mv,
                                                                    function,
                                                                    independentVariableMappedToFunctional);
    }

    if (context != null && context.variables != null)
    {
      generateCodeToPropagateContextVariablesToFunctionalElement(mv, function);
    }

    generateCodeToInvokeTheInitializationMethod(mv, function);

    function.defineClass();

    return function;
  }

  protected void generateCodeToInvokeTheInitializationMethod(MethodVisitor mv,
                                                             Expression<Object, Object, Function<?, ?>> function)
  {
    duplicateTopOfTheStack(mv);
    Compiler.invokeMethod(mv, function.className, "initialize", "()V", false);
  }

  protected void generateCodeToPropagateContextVariablesToFunctionalElement(MethodVisitor mv,
                                                                            Expression<Object, Object,
                                                                                          Function<?, ?>> function)
  {
    for (var entry : context.variables.map.entrySet())
    {
      var fieldName = entry.getKey();
      var fieldType = entry.getValue().getClass();
      duplicateTopOfTheStack(mv);
      loadThisFieldOntoStack(mv, fieldName, fieldType);
      Compiler.putField(mv, function.className, fieldName, fieldType);
    }
  }

  protected void
            generateCodeToPropagateIndependentVariableToFunctionalElement(MethodVisitor mv,
                                                                          Expression<Object, Object,
                                                                                        Function<?, ?>> function,
                                                                          VariableNode<Object, Object, Function<?,
                                                                                        ?>> independentVariableMappedToFunctional)
  {
    var fieldName = independentVariableMappedToFunctional.getName();
    duplicateTopOfTheStack(mv);
    independentVariable.generate(mv, domainType);
    Compiler.putField(mv, function.className, fieldName, domainType);
  }

  protected Expression<Object, Object, Function<?, ?>> newFunctionalExpression()
  {
    Class<?>                        funcDomain   = null;
    Class<?>                        funcCoDomain = null;
    Class<? extends Function<?, ?>> funcClass    = null;

    if (RealFunction.class.equals(coDomainType))
    {
      funcDomain   = Real.class;
      funcCoDomain = Real.class;
      funcClass    = RealFunction.class;
    }
    else
    {
      assert false : "TODO: handle " + coDomainType;

    }

    var functionalExpression = new Expression<Object, Object, Function<?, ?>>(funcDomain,
                                                                              funcCoDomain,
                                                                              funcClass);
    functionalExpression.ascendentExpression = this;
    functionalExpression.context             = context;
    if (indeterminateVariable != null)
    {
      functionalExpression.independentVariable = indeterminateVariable.spliceInto(functionalExpression).asVariable();
    }

    rootNode.isResult             = true;
    functionalExpression.rootNode = (Node<Object, Object, Function<?, ?>>) rootNode.spliceInto(functionalExpression);
    assert functionalExpression.rootNode
                  != null : functionalExpression.rootNode + ".spliceInto(" + functionalExpression + ") returned null";
    functionalExpression.rootNode.isResult = true;
    functionalExpression.className         = className + "func";
    return functionalExpression;
  }

  protected MethodVisitor generateFunctionInitializer(MethodVisitor mv, FunctionMapping<?, ?, ?> nestedFunction)
  {
    if (trace)
    {
      err.format("Expression.generateFunctionInitializer( nestedFunction=%s )\n\n", nestedFunction);
    }

    if (nestedFunction.instance != null)
    {
      initializeReferencedFunctionVariableReferences(loadThisOntoStack(mv),
                                                     className,
                                                     Type.getInternalName(nestedFunction.type()),
                                                     nestedFunction.functionName,
                                                     context.variableClassStream());
    }
    else
    {
      referencedFunctions.put(nestedFunction.functionName, nestedFunction);
    }

    return mv;
  }

  protected void constructReferencedFunctionInstanceIfItIsNull(MethodVisitor mv, FunctionMapping<?, ?, ?> mapping)
  {
    if ((mapping.functionName == null || functionName == null || !functionName.equals(mapping.functionName))
                  && mapping.expression != null)
    {
      Class<?> type = mapping.type();
      if (type == null)
      {
        mapping.instantiate();
        type = mapping.type();
      }
      assert type != null : "type is  null for mapping=" + mapping;
      var alreadyInitialized = new Label();
      loadThisOntoStack(mv).visitFieldInsn(GETFIELD,
                                           className,
                                           mapping.functionName,
                                           mapping.functionFieldDescriptor());
      mv.visitJumpInsn(Opcodes.IFNONNULL, alreadyInitialized);
      loadThisOntoStack(mv);
      constructNewObject(mv, type);
      duplicateTopOfTheStack(mv);
      invokeDefaultConstructor(mv, type);
      Compiler.putField(mv, className, mapping.functionName, type);

//      loadThisOntoStack(mv);
//      generateFunctionInitializer(mv, mapping);

      mv.visitLabel(alreadyInitialized);
    }
  }

  protected MethodVisitor generateInitializationCode(MethodVisitor mv)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(mv);

    if (trace)
    {
      System.err.println("referencedFunctions=" + referencedFunctions);
    }

    addChecksForNullVariableReferences(mv);

    generateReferencedFunctionInstances(mv);

    referencedFunctions.values().forEach(mapping -> generateFunctionInitializer(mv, mapping));

    initializers.forEach(initializer -> initializer.accept(mv));
    if (recursive)
    {
      generateSelfReference(mv);
    }
    generateCodeToSetIsInitializedToTrue(mv);
    return mv;
  }

  public void generateReferencedFunctionInstances(MethodVisitor mv)
  {
    referencedFunctions.values()
                       .stream()
                       .forEach(mapping -> constructReferencedFunctionInstanceIfItIsNull(mv, mapping));
  }

  protected ClassVisitor generateInitializationMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC, nameOfInitializerFunction, "()V", null, null);
    Compiler.annotateWithOverride(methodVisitor);

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

  protected MethodVisitor generateIntermediateVariableInitializers(MethodVisitor methodVisitor)
  {
    for (var intermediateVariable : intermediateVariables.values())
    {
      intermediateVariable.generateInitializer(methodVisitor);
    }
    return methodVisitor;
  }

  protected void generateInvocationOfDefaultNoArgConstructor(MethodVisitor methodVisitor, boolean object)
  {
    loadThisOntoStack(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  object ? Type.getInternalName(Object.class) : className.replace(".", "/"),
                                  "<init>",
                                  "()V",
                                  false);
  }

  protected MethodVisitor generateLiteralConstantInitializers(MethodVisitor methodVisitor)
  {
    for (var literal : literalConstants.values())
    {
      literal.generateLiteralConstantInitializerWithString(methodVisitor);
    }
    return methodVisitor;
  }

  protected MethodVisitor generateSelfReference(MethodVisitor mv)
  {
    loadThisOntoStack(mv);
    constructNewObject(mv, functionName);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, functionName);
    Compiler.putField(mv, className, functionName, "L" + functionName + ";");
    initializeReferencedFunctionVariableReferences(loadThisOntoStack(mv),
                                                   className,
                                                   functionName,
                                                   functionName,
                                                   context.variableClassStream());
    return mv;
  }

  public MethodVisitor generateSetResultInvocation(MethodVisitor mv, Class<?> inputType)
  {
    loadResultParameter(mv);
    checkClassCast(mv, coDomainType);
    swap(mv);
    return invokeSetMethod(mv, inputType, coDomainType);
  }

  protected ClassVisitor generateToStringMethod(ClassVisitor classVisitor)
  {
    if (Expression.trace)
    {
      System.err.format("generateToStringMethod(expression=%s)\n", expression);
    }

    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "toString",
                                                 Compiler.getMethodDescriptor(String.class),
                                                 null,
                                                 null);

    methodVisitor.visitCode();

    String name = functionName != null ? (functionName + ":") : "";
    updateStringRepresentation();
    String arrow = expression.contains("➔") || independentVariable == null ? "" : (independentVariable.getName() + "➔");
    methodVisitor.visitLdcInsn(String.format("%s%s%s", name, arrow, expression.replace("sqrt", "√")));
    Compiler.generateReturnInstructionAndEndTheVisit(methodVisitor);
    return classVisitor;
  }

  protected ClassVisitor generateIntermediateStatesMethod(ClassVisitor classVisitor)
  {
    if (Expression.trace)
    {
      System.err.format("generateTypesetMethod(expression=%s)\n", expression);
    }
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "intermediateStates",
                                                 getMethodDescriptor(String.class),
                                                 null,
                                                 null);

    methodVisitor.visitCode();
    methodVisitor.visitLdcInsn("TODO: insert intermediate states here");
    generateReturnInstructionAndEndTheVisit(methodVisitor);
    return classVisitor;
  }

  protected ClassVisitor generateTypesetMethod(ClassVisitor classVisitor)
  {
    if (Expression.trace)
    {
      System.err.format("generateTypesetMethod(expression=%s)\n", expression);
    }
    return Compiler.generateTypesetMethod(classVisitor, typeset());
  }

  protected String getCoDomainTypeMethodSignature()
  {
    return Compiler.getCoDomainTypeMethodSignature(coDomainType);
  }

  protected String getFunctionClassTypeSignature(Class<?> functionClass)
  {
    return Compiler.getFunctionClassTypeSignature(functionClass, domainType, coDomainType, implementedInterfaces);
  }

  public VariableNode<D, C, F> getIndependentVariable()
  {
    return independentVariable;
  }

  protected String getInputName()
  {
    if (indeterminateVariable != null)
    {
      return indeterminateVariable.getName();
    }
    else if (independentVariable != null)
    {
      return independentVariable.getName();
    }
    return null;
  }

  VariableNode<D, C, F> getInputVariable()
  {
    return indeterminateVariable != null ? indeterminateVariable : independentVariable;
  }

  public F getInstance()
  {
    Class<F> definition = compiledClass != null ? compiledClass : defineClass();

    try
    {
      return instance = definition.getDeclaredConstructor().newInstance();
    }
    catch (Exception e)
    {
      Utensils.throwOrWrap(e);
      return null;
    }

  }

  public String getNextConstantFieldName(Class<?> type)
  {
    return "c" + getVariablePrefix(type) + String.format("%04d", constantCount++);
  }

  public String getNextIntermediateVariableFieldName(String name, Class<?> type)
  {
    if (context == null)
    {
      context = new Context();
    }
    var prefix  = name + getVariablePrefix(type);
    var counter = context.intermediateVariableCounters.get(prefix);
    if (counter == null)
    {
      context.intermediateVariableCounters.put(prefix, counter = new AtomicInteger(1));
    }
    return prefix + String.format("%04d", counter.getAndIncrement());
  }

  public VariableNode<D, C, F> getReference(String reference)
  {
    return referencedVariables.get(reference);
  }

  public Class<?> getThisOrAnyAscendentExpressionsPolynomialCoDomain()
  {
    if (coDomainType.equals(RealPolynomial.class) || coDomainType.equals(ComplexPolynomial.class)
                  || coDomainType.equals(RealFunction.class))
    {
      return coDomainType;
    }
    if (ascendentExpression != null)
    {
      var ascendentPolynomialCoDomainType = ascendentExpression.getThisOrAnyAscendentExpressionsPolynomialCoDomain();

      if (ascendentPolynomialCoDomainType != null)
      {
        return ascendentPolynomialCoDomainType;
      }
    }

    return null;
  }

  public <Q> Q getVariable(VariableReference<D, C, F> reference)
  {
    return context == null ? null : context.variables.get(reference.name);
  }

  public boolean hasIndeterminateVariable()
  {
    return (domainType.equals(Object.class) && thisOrAnyAscendentExpressionHasIndeterminateVariable());
  }

  public boolean hasScalarCodomain()
  {
    return coDomainType.equals(Real.class) || coDomainType.equals(Complex.class) || coDomainType.equals(Fraction.class)
                  || coDomainType.equals(Integer.class) || coDomainType.equals(ComplexFraction.class)
                  || coDomainType.equals(GaussianInteger.class);
  }

  protected boolean hasScalarCodomain(Expression<D, C, F> expression)
  {
    return coDomainType.equals(Real.class) || coDomainType.equals(Complex.class) || coDomainType.equals(Fraction.class)
                  || coDomainType.equals(Integer.class) || coDomainType.equals(ComplexFraction.class)
                  || coDomainType.equals(GaussianInteger.class);
  }

  protected String[] implementedInterfaces()
  {
    return Stream.concat(Stream.of(genericFunctionClassInternalName),
                         Stream.of(implementedInterfaces).map(Type::getInternalName))
                 .toArray(n -> new String[n]);
  }

  /**
   * 
   * 
   * @param mv
   * @param generatedFunctionClassInternalName
   * @param fieldType
   * @param functionFieldName
   * @param variables
   * @implNote The parameters are {@link String}s here because since this function
   *           is actually generating the {@link Class} file it is referrring to
   *           it is not yet available to be referred to by the JVM as realizable
   *           {@link Object} ( because {@link #generate()} hasn't yet completed
   *           generating the this{@link #instructionByteCodes} and the
   *           {@link CompiledExpressionClassLoader} hasn't assembled the .class
   *           file and made it available to be instantiated yet and hence there
   *           is no .class to refer to
   */
  protected void initializeReferencedFunctionVariableReferences(MethodVisitor mv,
                                                                String generatedFunctionClassInternalName,
                                                                String fieldType,
                                                                String functionFieldName,
                                                                Stream<OrderedPair<String, Class<?>>> variables)
  {
    String typeDesc = "L" + fieldType + ";";

    variables.forEach(variable ->
    {
      String variableFieldName           = variable.getLeft();
      String variableFieldTypeDescriptor = variable.getRight().descriptorString();
      getField(loadThisOntoStack(mv), generatedFunctionClassInternalName, functionFieldName, typeDesc);
      getField(loadThisOntoStack(mv),
               generatedFunctionClassInternalName,
               variableFieldName,
               variableFieldTypeDescriptor);
      Compiler.putField(mv, fieldType, variableFieldName, variableFieldTypeDescriptor);
    });

  }

  protected void injectReferences(F f)
  {
    if (context != null)
    {
      context.injectVariableReferences(f);
      context.injectFunctionReferences(f);
    }
  }

  public F instantiate()
  {

    if (trace)
    {
      System.err.format("\nInstantiating %s\n", this);
    }
    instance = getInstance();
    if (trace)
    {
      System.err.format("\nInjecting references %s\n", this);
    }

    injectReferences(instance);

    return instance;
  }

  /**
   * @return true if this{@link #character} any of
   *         {@link Parser#isLatinGreekSpecialOrBlackLetter(char, boolean)},
   *         {@link Parser#isAlphabeticalSuperscript(char)} or
   *         {@link Parser#isAlphabeticalOrNumericSubscript(char)} are true
   */
  protected boolean isIdentifierCharacter()
  {
    return isLatinGreekSpecialOrBlackLetter(character, false) || isAlphabeticalOrNumericSubscript(character)
                  || isAlphabeticalSuperscript(character);
  }

  public boolean isNullaryFunction()
  {
    return domainType.equals(Object.class);
  }

  protected MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, Class<?> fieldType)
  {
    if (verboseTrace)
    {
      System.out.format("Expression(#%s).loadFieldOntoStack(fieldName=%s, fieldDescriptor=%s)\n",
                        System.identityHashCode(this),
                        fieldName,
                        fieldType.descriptorString());
    }
    methodVisitor.visitFieldInsn(GETFIELD, className, fieldName, fieldType.descriptorString());
    return methodVisitor;
  }

  public MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, String fieldDescriptor)
  {
    if (verboseTrace)
    {
      System.out.format("Expression(#%s).loadFieldOntoStack(fieldName=%s, fieldDescriptor=%s)\n",
                        System.identityHashCode(this),
                        fieldName,
                        fieldDescriptor);
    }
    methodVisitor.visitFieldInsn(GETFIELD, className, fieldName, fieldDescriptor);
    return methodVisitor;
  }

  protected MethodVisitor loadIndexField(MethodVisitor methodVisitor, String indexFieldName)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, indexFieldName, Integer.class.descriptorString());
    return methodVisitor;
  }

  public MethodVisitor loadThisFieldOntoStack(MethodVisitor mv, String name, Class<?> referenceType)
  {
    return loadFieldOntoStack(loadThisOntoStack(mv), name, referenceType);
  }

  public MethodVisitor loadThisFieldOntoStack(MethodVisitor mv, String name, String referenceTypeDescriptor)
  {
    return loadFieldOntoStack(loadThisOntoStack(mv), name, referenceTypeDescriptor);
  }

  protected <N extends Node<D, C, F>> N multiplyAndDivide(N node)
  {
    while (true)
    {
      if (nextCharacterIs('*', '×', 'ₓ', '⋅'))
      {
        node = node.mul(exponentiate());
      }
      else if (!characterAfterNextIs('∂') && nextCharacterIs('⁄', '/', '÷'))
      {
        node = node.div(exponentiate());
      }
      else
      {
        return node;
      }
    }
  }

  protected boolean needsCloseMethod()
  {
    return !literalConstants.isEmpty() | !intermediateVariables.isEmpty();
  }

  @SuppressWarnings("unchecked")
  public <N extends Named> N newCoDomainInstance()
  {
    try
    {
      return (N) coDomainType.getConstructor().newInstance();
    }
    catch (Throwable e)
    {
      Utensils.throwOrWrap(e);
      return null;
    }
  }

  @SuppressWarnings("unchecked")
  public <N extends Named> N newDomainInstance()
  {
    try
    {
      return (N) domainType.getConstructor().newInstance();
    }
    catch (Throwable e)
    {
      Utensils.throwOrWrap(e);
      return null;
    }
  }

  protected String newIntermediateVariable(Class<?> type)
  {
    return newIntermediateVariable("v", type);
  }

  public String newIntermediateVariable(String prefix, Class<?> type)
  {
    return newIntermediateVariable(prefix, type, true);
  }

  /**
   * Assigns the next field name in the sequence for the given variable name
   * prefix by calling
   * this{@link #getNextIntermediateVariableFieldName(String, Class)} then passing
   * the result to this{@link #registerIntermediateVariable(String, Class)}
   * 
   * @param prefix
   * @param type
   * @param initialize if true then "this.field=new FieldType()" is generated
   *                   otherwise its not
   * 
   * @return the variable name assigned
   */
  public String newIntermediateVariable(String prefix, Class<?> type, boolean initialize)
  {
    assert prefix != null : "name shan't be null";
    var intermediateVarName = getNextIntermediateVariableFieldName(prefix, type);
    return registerIntermediateVariable(intermediateVarName, type, initialize);
  }

  protected VariableNode<D, C, F> newVariable(int startPos, VariableReference<D, C, F> reference)
  {
    return new VariableNode<D, C, F>(this,
                                     reference,
                                     startPos,
                                     true);
  }

  protected char nextCharacter()
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

  /**
   * expression.charAt(position)
   * 
   * @return
   */
  public String parseName()
  {
    return parseName(position);
  }

  protected String parseName(int startPos)
  {
    boolean entirelySubscripted   = true;
    boolean entirelySuperscripted = true;
    boolean isLatinOrGreek;
    while ((isLatinOrGreek = isLatinGreekSpecialOrBlackLetter(character, true))
                  || (entirelySubscripted && !isLatinOrGreek && Parser.isAlphabeticalOrNumericSubscript(character))
                  || (entirelySuperscripted && !isLatinOrGreek && Parser.isAlphabeticalSuperscript(character)))
    {
      nextCharacter();
      if (isLatinOrGreek)
      {
        entirelySubscripted = false;
      }
    }
    var substring = expression.substring(startPos, position);
    return Parser.subscriptToRegular(substring.trim());
  }

  /**
   * Calls this{@link #evaluateOptionalIndependentVariableSpecification()} before
   * calling this{@link #resolve()} and assigning the result to
   * this{@link #rootNode}
   * 
   * @return this
   * @throws CompilerException
   */
  @SuppressWarnings("unchecked")
  public <E extends Expression<D, C, F>> E parseRoot()
  {
    assert rootNode == null : "parse must only be called before anything else has been parsed but rootNode=" + rootNode;
    evaluateOptionalIndependentVariableSpecification();
    nextCharacter();
    if (trace)
    {
      System.out.format("parseRoot %s of Expression(#%s)\n", expression, System.identityHashCode(this));
    }
    rootNode = resolve();
    assert rootNode != null : "evaluateRootNode: determine() returned null, expression='" + expression + "'";
    rootNode.isResult = true;

    if (position < expression.length())
    {
      if (character != '=')
      {
        throwUnexpectedCharacterException();
      }
    }
    return (E) this;
  }

  protected <N extends Node<D, C, F>> N parseSuperscript(N node, char superscript, String digit)
  {
    if (nextCharacterIs(superscript))
    {
      node = node.pow(newLiteralConstant(digit));
    }
    return node;
  }

  /**
   * TODO: test/suppport multi-digit literal constants as superscripts
   * 
   * @param node
   * @return
   */
  protected <N extends Node<D, C, F>> N parseSuperscripts(N node)
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

  public Expression<D, C, F> putField(MethodVisitor mv, String fieldName, Class<?> fieldType)
  {
    Compiler.putField(mv, className, fieldName, fieldType);
    return this;
  }

  /**
   * 
   * @param reference
   * @return true if reference is in this{@link #referencedVariables}
   */
  public boolean references(VariableReference<D, C, F> reference)
  {
    return referencedVariables.containsKey(reference.name);
  }

  /**
   * {@link Node}s can call this to register a {@link Consumer} of
   * {@link MethodVisitor} to have its {@link Consumer#accept(Object)} method
   * called during the declaration of the body of the {@link Initializable}
   * interface method implementation {@link Initializable#initialize()} of the
   * {@link Function} being generated by this {@link Expression}
   * 
   * @param consumer
   * @return
   */
  public Expression<D, C, F> registerInitializer(Consumer<MethodVisitor> consumer)
  {
    initializers.add(consumer);
    return this;
  }

  public String registerIntermediateVariable(String intermediateVarName, Class<?> type, boolean initialize)
  {
    assert !type.isInterface() : "cannot instantiate interface " + type;

    if (!coDomainType.isInterface())
    {
      var newIntermediateVariable = new IntermediateVariable<>(this,
                                                               intermediateVarName,
                                                               type,
                                                               initialize);
      if (intermediateVariables.containsKey(intermediateVarName))
      {
        throw new CompilerException(String.format("an intermediate variable named %s already exists",
                                                  intermediateVarName));
      }

      intermediateVariables.put(intermediateVarName, newIntermediateVariable);
    }
    else
    {
      // if the coDomain is a functon, then it will be an interface and thus
      // no intermediate variables will be declare in this class, but only declared in
      // the class that will be returned
      return null;
    }

    return intermediateVarName;
  }

  public String remaining()
  {
    return expression == null ? null : expression.substring(Math.max(0, position), expression.length());
  }

  protected void rename(String from, String to)
  {
    if (trace)
    {
      err.format("Expression(#%s).rename(from=%s, to=%s)\n", System.identityHashCode(this), from, to);
    }
    renameIfNamed(independentVariable, from, to);
    renameIfNamed(indeterminateVariable, from, to);

  }

  protected boolean renameIfNamed(VariableNode<D, C, F> thevar, String from, String to)
  {
    if (thevar != null && thevar.isVariableNamed(from))
    {
      thevar.renameTo(to);
      return true;
    }
    else
    {
      return false;
    }

  }

  public Expression<D, C, F> require(char... which)
  {
    return require(null, which);
  }

  public Expression<D, C, F> require(String msg, char... which)
  {
    if (!nextCharacterIs(which))
    {
      throwUnexpectedCharacterException(msg, which);
    }
    return this;
  }

  /**
   * Apply the order of operations except for parenthesis by first calling
   * this{@link #exponentiateMultiplyAndDivide()} then passing the result to
   * {@link #addAndSubtract(Node)}
   * 
   * @return the result of passing this{@link #exponentiateMultiplyAndDivide()} to
   *         this{@link #addAndSubtract(Node)}
   */
  @SuppressWarnings("unchecked")
  public <N extends Node<D, C, F>> N resolve()
  {
    var node = exponentiateMultiplyAndDivide();
    return (N) addAndSubtract(node);
  }

  protected <N extends Node<D, C, F>> N resolveAbsoluteValue(N node)
  {
    if (!inAbsoluteValue && nextCharacterIs('|'))
    {
      inAbsoluteValue = true;
      node            = resolve().abs();
      require('|');
      inAbsoluteValue = false;
    }
    return node;
  }

  @SuppressWarnings("unchecked")
  protected <N extends Node<D, C, F>> N resolveFactorials(N node)
  {
    if (nextCharacterIs('!'))
    {
      return (N) new FactorialNode<D, C, F>(this,
                                            node);
    }
    else if (nextCharacterIs('₍'))
    {
      return (N) new AscendingFactorializationNode<D, C, F>(node,
                                                            resolve(),
                                                            require('₎'));
    }
    else if (nextCharacterIs('⋰'))
    {
      return (N) new AscendingFactorializationNode<D, C, F>(node,
                                                            resolve(),
                                                            this);
    }
    else
    {
      return node;
    }
  }

  @SuppressWarnings("unchecked")
  protected <N extends Node<D, C, F>> N resolveFloor(Node<D, C, F> node)
  {
    if (nextCharacterIs('⌊'))
    {
      node = new FloorNode<D, C, F>(this,
                                    resolve());
      require('⌋');
    }
    return (N) node;
  }

  protected Node<D, C, F> resolveFunction(int startPos, VariableReference<D, C, F> reference)
  {
    switch (reference.name)
    {
    case "when":
      return new WhenNode<>(this);
    case "J":
      return new BesselFunctionNodeOfTheFirstKind<>(this);
    case "j":
      return new SphericalBesselFunctionNodeOfTheFirstKind<>(this);
    case "R":
      return new LommelPolynomialNode<>(this);
    case "ℭ":
    case "binom":
    case "binomial":
      return new BinomialCoefficientNode<>(this);
    case "pFq":
      return new HypergeometricFunctionNode<>(this);
    case "Beta":
    case "beta":
      return new BetaFunctionNode<D, C, F>(this);
    default:
      return new FunctionNode<>(reference.name,
                                resolve(),
                                require(')'));
    }

  }

  protected Node<D, C, F> resolveIdentifier() throws CompilerException
  {
    final int startPos  = position;
    final var reference = evaluateName(startPos);

    if (nextCharacterIs('('))
    {
      return resolveFunction(startPos, reference);
    }
    else
    {
      return resolveSymbolicLiteralConstantKeywordOrVariable(startPos, reference);
    }
  }

  protected <N extends Node<D, C, F>> N resolvePostfixOperators(N node)
  {
    node = resolveFactorials(node);
    node = resolveFloor(node);
    node = resolveAbsoluteValue(node);
    return node;
  }

  protected Node<D, C, F> resolveSymbolicLiteralConstantKeywordOrVariable(int startPos,
                                                                          VariableReference<D, C, F> reference)
  {
    if (LiteralConstantNode.constantSymbols.contains(reference.name))
    {
      return newLiteralConstant(reference.name);
    }
    else
    {
      if (reference.isElse())
      {
        return otherwise();
      }
      else
      {
        return newVariable(startPos, reference);
      }
    }
  }

  public ElseNode<D, C, F> otherwise()
  {
    return new ElseNode<D, C, F>(this);
  }

  protected void skip(int n)
  {
    character = expression.charAt(position += n);
  }

  protected void skipSpaces()
  {
    while (character == ' ')
    {
      nextCharacter();
    }
  }

  protected Expression<D, C, F> storeInstructions(ClassVisitor classVisitor)
  {
    if (classVisitor instanceof TraceClassVisitor)
    {
      classVisitor = ((TraceClassVisitor) classVisitor).getDelegate();
    }

    instructionByteCodes = ((ClassWriter) classVisitor).toByteArray();

    if (saveClasses)
    {

      File file = new File(compiledClassDir,
                           className + ".class");
      writeBytecodes(file);
    }
    return this;
  }

  public <E, S, G extends Function<? extends E, ? extends S>>
         Expression<D, C, F>
         substitute(String variableToChange, Expression<E, S, G> substitution)
  {
    if (variableToChange.equals(substitution.toString()))
    {
      return this;
    }

    if (context == null)
    {
      context = new Context();
    }

    if (Expression.trace)
    {
      System.err.format("Expression(#%s).substitute %s for %s into %s\n \n\n",
                        System.identityHashCode(this),
                        substitution,
                        variableToChange,
                        this);
    }

    var substituteInputVariable     = substitution.getInputVariable();
    var substituteInputVariableName = substituteInputVariable.getName();
    if (!variableToChange.equals(substituteInputVariableName))
    {
      substitution.rename(substituteInputVariableName, variableToChange);
    }

    rootNode = rootNode.substitute(variableToChange, substitution.rootNode);

    updateStringRepresentation();

    return this;
  }

  public <E, S, G extends Function<? extends E, ? extends S>> Expression<D, C, F> substitute(String variableToChange,
                                                                                             Node<E, S, G> substitution)
  {
    if (variableToChange.equals(substitution.toString()))
    {
      return this;
    }

    if (context == null)
    {
      context = new Context();
    }

    if (Expression.trace)
    {
      System.err.format("Expression(#%s).substitute %s for %s into %s\n \n\n",
                        System.identityHashCode(this),
                        substitution,
                        variableToChange,
                        this);
    }

    rootNode = rootNode.substitute(variableToChange, substitution);

    updateStringRepresentation();

    return this;
  }

  public TextTree<Node<D, C, F>> inspect(F f)
  {
    SyntaxTree<D, C, F> syntaxTree = syntaxTree();
    return new TextTree<Node<D, C, F>>(syntaxTree,
                                       f);
  }

  public SyntaxTree<D, C, F> syntaxTree()
  {
    return new SyntaxTree<D, C, F>(rootNode);
  }

  public boolean thisOrAnyAscendentExpressionHasIndeterminateVariable()
  {
    boolean hasIndeterminateVariable = ascendentExpression != null
                  && ascendentExpression.thisOrAnyAscendentExpressionHasIndeterminateVariable();
    return coDomainType.equals(RealFunction.class) || coDomainType.equals(RationalFunction.class)
                  || coDomainType.equals(RealPolynomial.class) || coDomainType.equals(ComplexPolynomial.class)
                  || coDomainType.equals(IntegerPolynomial.class) || coDomainType.equals(ComplexRationalFunction.class)
                  || hasIndeterminateVariable;
  }

  protected void throwUnexpectedCharacterException()
  {
    throw new CompilerException(String.format("unexpected '%s'(0x%x) character at position=%s in expression '%s' of length %d, remaining='%s'\n",
                                              character,
                                              (int) character,
                                              position,
                                              expression,
                                              expression.length(),
                                              remaining()));

  }

  protected void throwUnexpectedCharacterException(char... which)
  {
    throwUnexpectedCharacterException(null, which);
  }

  public void throwUnexpectedCharacterException(String msg, char... which)
  {
    String result = Stream.of(which)
                          .map(ch -> String.format("'%s'", String.valueOf(ch)))
                          .collect(Collectors.joining(","));

    throw new CompilerException(format("Expecting %s %s at position %d but got char '%c' instead, remaining=%s%s\n",
                                       which.length > 1 ? "one of" : "",
                                       result,
                                       position,
                                       character == 0 ? '0' : character,
                                       remaining(),
                                       msg != null ? " syntax=\"" + msg : "",
                                       implementedInterfaces));
  }

  @Override
  public String toString()
  {
    String str = null;
    if (Object.class.equals(domainType))
    {
      str = rootNode != null ? rootNode.toString() : expression;
    }
    if (rootNode != null)
    {
      if (independentVariable == null)
      {
        str = rootNode.toString();
      }
      else
      {
        str = String.format("%s➔%s", independentVariable.getName(), rootNode.toString());
      }
    }
    else
    {
      str = expression;
    }
    if (functionName != null && !functionName.startsWith("_") && !functionName.startsWith("factor"))
    {
      str = String.format("%s:%s", functionName, expression);
    }
    return str;
  }

  @Override
  public String typeset()
  {
    return rootNode == null ? null : rootNode.typeset();
  }

  public void updateStringRepresentation()
  {
    if (rootNode == null)
    {
      return;
    }
    if (independentVariable != null)
    {
      expression = String.format("%s➔%s", independentVariable.getName(), rootNode.toString());
    }
    else
    {
      expression = rootNode.toString();
    }
  }

  protected Expression<D, C, F> writeBytecodes(File file)
  {
    try
    {
      Files.write(file.toPath(), instructionByteCodes);
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return this;
  }

  /**
   * Sets this{@link #rootNode} to this{@link #rootNode}.{@link Node#simplify()}
   * 
   * @return this
   */
  public Expression<D, C, F> simplify()
  {
    rootNode   = rootNode.simplify();
    expression = rootNode.toString();
    return this;
  }

  /**
   * 
   * @return true if this{@link #coDomainType} is an interface (that extends
   *         {@link Function})
   */
  public boolean isFunctional()
  {
    return coDomainType.isInterface();
  }

  public LiteralConstantNode<D, C, F> newLiteralConstant(String i)
  {
    return new LiteralConstantNode<D, C, F>(this,
                                            i);
  }

  public LiteralConstantNode<D, C, F> newLiteralConstant(int i)
  {
    return new LiteralConstantNode<D, C, F>(this,
                                            java.lang.Integer.toString(i));
  }

}
