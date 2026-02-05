package arb.expressions;

import static arb.expressions.Compiler.*;
import static arb.expressions.Parser.*;
import static java.lang.String.format;
import static org.objectweb.asm.Opcodes.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.jetbrains.java.decompiler.api.Decompiler;
import org.jetbrains.java.decompiler.main.decompiler.DirectoryResultSaver;
import org.jetbrains.java.decompiler.main.extern.IFernflowerPreferences;
import org.objectweb.asm.*;
import org.objectweb.asm.util.TraceClassVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.context.Dependency;
import arb.expressions.nodes.*;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.nary.*;
import arb.expressions.nodes.unary.*;
import arb.expressions.viz.ExpressionTree;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.RealSequence;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
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
 * <li>{@code arb4j.compiler.saveclasses=true|false}: Specifies whether the
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
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Expression<D, C, F extends Function<? extends D, ? extends C>> implements
                       Typesettable,
                       Cloneable,
                       Supplier<F>,
                       Consumer<Consumer<Expression<?, ?, ?>>>
{

  private static String     ASSERTION_ERROR_METHOD_DESCRIPTOR =
                                                              Compiler.getMethodDescriptor(Void.class,
                                                                                           Object.class);

  private static final char COMBINING_DOT_ABOVE               = '\u0307';

  private static final char COMBINING_TWO_DOTS_ABOVE          = '\u0308';

  static File               compiledClassDir                  = new File("compiled");

  public static String      evaluationMethodDescriptor        =
                                                       Compiler.getMethodDescriptor(Object.class,
                                                                                    Object.class,
                                                                                    int.class,
                                                                                    int.class,
                                                                                    Object.class);

  public static Class<?>[]  implementedInterfaces             = new Class[]
  { Typesettable.class, AutoCloseable.class, Initializable.class, Named.class };

  static HashSet<Class<?>>  indeterminantTypes                = new HashSet<>();

  public static String      IS_INITIALIZED                    = "isInitialized";

  private static String     JAVA_LANG_ASSERTION_ERROR         = "java/lang/AssertionError";

  public static String      nameOfInitializerFunction         = "initialize";

  private static boolean    saveClasses                       =
                                        Boolean.valueOf(System.getProperty("arb4j.saveClasses",
                                                                           "false"));

  private static boolean    decompileClasses                  =
                                             Boolean.valueOf(System.getProperty("arb4j.decompileClasses",
                                                                                "false"));

  public static boolean     saveGraphs                        =
                                       Boolean.valueOf(System.getProperty("arb4j.saveGraphs",
                                                                          "false"));

  public static boolean     trace                             =
                                  Boolean.valueOf(System.getProperty("arb4j.trace", "false"));

  public static boolean     traceNodes                        =
                                       Boolean.valueOf(System.getProperty("arb4j.traceNodes",
                                                                          "false"));

  public static String      VOID_METHOD_DESCRIPTOR            =
                                                   Compiler.getMethodDescriptor(Void.class);

  static
  {
    assert arb.functions.integer.Sequence.class.equals(Sequence.class) : "you forgot to import arb.functions.sequences.Sequence or imported a class named sequence in another package";
  }

  static
  {
    if (saveClasses && !compiledClassDir.canWrite())
    {
      compiledClassDir.mkdir();
    }
  }

  static
  {
    indeterminantTypes.addAll(Arrays.asList(RealFunction.class,
                                            RealToComplexFunction.class,
                                            Function.class,
                                            ComplexFunction.class,
                                            RationalFunction.class,
                                            ComplexRationalFunction.class,
                                            RealPolynomial.class,
                                            ComplexPolynomial.class,
                                            IntegerPolynomial.class));
  }

  public Expression<?, ?, ?>                            ascendentExpression;

  public char                                           character                     = 0;

  public String                                         className;

  public Class<? extends C>                             coDomainType;

  public Class<F>                                       compiledClass;

  HashMap<Class<?>, AtomicInteger>                      constantCounts                =
                                                                       new HashMap<>();

  public Context                                        context;

  HashSet<String>                                       declaredIntermediateVariables =
                                                                                      new HashSet<>();

  public List<Dependency>                               dependencies;

  public Class<? extends D>                             domainType;

  public String                                         expression;

  public boolean                                        functionalDependsOnIndependentVariable;

  public boolean                                        functionalDependsOnIndeterminateVariable;

  private VariableNode<Object, Object, Function<?, ?>>  functionalIndependentVariable;

  public VariableNode<Object, Object, Function<?, ?>>   functionalIndeterminateVariable;

  public Class<? extends F>                             functionClass;

  public String                                         functionClassDescriptor;

  public String                                         functionName;

  public boolean                                        functionNameSpecified         = false;

  public HashMap<Node<D, C, F>, String>                 generatedNodes                =
                                                                       new HashMap<>();

  public String                                         genericFunctionClassInternalName;

  public boolean                                        inAbsoluteValue               = false;

  public VariableNode<D, C, F>                          independentVariable;

  public Stack<VariableNode<D, C, F>>                   indeterminateVariables        =
                                                                               new Stack<>();

  int                                                   currentLevel                  = 0;

  public LinkedList<Consumer<MethodVisitor>>            initializers                  =
                                                                     new LinkedList<>();

  public boolean                                        insideInitializer             = false;

  protected F                                           instance;

  public byte[]                                         instructions;

  public HashMap<String, IntermediateVariable<D, C, F>> intermediateVariables         =
                                                                              new HashMap<>();

  private ArrayList<LiteralConstantNode<D, C, F>>       literalConstantNodes;

  public HashMap<String, LiteralConstantNode<D, C, F>>  literalConstants              =
                                                                         new HashMap<>();

  private final Logger                                  log                           =
                                                            LoggerFactory.getLogger(Expression.class);

  public FunctionMapping<D, C, F>                       mapping;

  public int                                            position                      = -1;

  public char                                           previousCharacter;

  public boolean                                        recursive                     = false;

  public HashMap<String, FunctionMapping<?, ?, ?>>      referencedFunctions           =
                                                                            new HashMap<>();

  public HashMap<String, VariableNode<D, C, F>>         referencedVariables           =
                                                                            new HashMap<>();

  public Node<D, C, F>                                  rootNode;

  public boolean                                        variablesDeclared             = false;

  public boolean                                        verboseTrace                  = false;

  public boolean acceptUntil(java.util.function.Predicate<Expression<?, ?, ?>> visitor)
  {
    Expression<?, ?, ?> e = this;
    while (e != null)
    {
      if (visitor.test(e))
      {
        return true;
      }
      e = e.ascendentExpression;
    }
    return false;
  }

  public Expression(Class<? extends D> domain,
                    Class<? extends C> coDomain,
                    Class<? extends F> function)
  {
    this.ascendentExpression              = null;
    this.domainType                       = domain;
    this.coDomainType                     = coDomain;
    this.functionClass                    = function;
    this.genericFunctionClassInternalName = Type.getInternalName(function);
    this.functionClassDescriptor          = function.descriptorString();

    if (context != null && context.saveClasses)
    {
      saveClasses = true;
    }
    if (Expression.trace)
    {
      log.debug("#{}: new Expression(domain={}, coDomain={}, function={})",
                System.identityHashCode(this),
                domain,
                coDomain,
                function);
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
                    Expression<?, ?, ?> ascenentExpression)
  {
    assert className != null : "className needs to be specified";
    this.ascendentExpression              = ascenentExpression;
    this.className                        = className;
    this.domainType                       = domain;
    this.coDomainType                     = codomain;
    this.functionClass                    = function;

    this.genericFunctionClassInternalName = Type.getInternalName(function);
    this.functionClassDescriptor          = function.descriptorString();
    this.expression                       = Parser.transformToJavaAcceptableCharacters(expression);
    this.context                          = context;
    functionNameSpecified                 = (this.functionName = functionName) != null;

    if (context != null && context.saveClasses)
    {
      saveClasses = true;
    }
    if (Expression.trace)
    {
      log.debug("#{}: new Expression(className={}, domain={}, coDomain={}, function={}, expression={}, context={}, functionName={}, ascendentExpression=#{})",
                System.identityHashCode(this),
                className,
                domain,
                codomain,
                function,
                expression,
                context,
                functionName,
                System.identityHashCode(ascenentExpression));
    }

  }

  protected Node<D, C, F> addAndSubtract(Node<D, C, F> node)
  {
    while (true)
    {
      if (nextCharacterIs('+', '₊'))
      {
        node = node.add(exponentiateMultiplyAndDivide());
      }
      else if (nextCharacterIs('-', '₋', '−'))
      {
        var rhs = exponentiateMultiplyAndDivide();
        node = node == null ? rhs.neg() : node.sub(rhs);
      }
      else
      {
        return node;
      }
    }
  }

  private void addCheckForNullField(MethodVisitor mv,
                                    FunctionMapping<?, ?, ?> functionMapping,
                                    boolean variable)
  {
    String fieldClassDescriptor;
    var    varName = functionMapping.functionName;

    if (variable)
    {
      Object field = context.getVariable(varName);
      fieldClassDescriptor = field != null ? field.getClass().descriptorString() : null;
    }
    else
    {
      fieldClassDescriptor = functionMapping.functionFieldDescriptor();
    }

    addNullCheckForField(mv, className, varName, fieldClassDescriptor);

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
      addNullCheckForField(mv, className, varName, fieldClass.descriptorString());
    }
  }

  protected void addChecksForNullFunctionReferences(MethodVisitor mv)
  {
    if (context != null)
    {
      context.functionEntryStream()
             .filter(event -> referencedFunctions.containsKey(event.getKey())
                           && !event.getKey().equals(functionName))
             .forEach(entry -> addCheckForNullField(loadThisOntoStack(mv),
                                                    entry.getValue(),
                                                    false));
    }
  }

  protected void addChecksForNullVariableReferences(MethodVisitor mv)
  {
    if (context != null)
    {
      context.variableClassStream()
             .filter(event -> referencedVariables.containsKey(event.getLeft()))
             .forEach(entry -> addCheckForNullField(loadThisOntoStack(mv), entry.getLeft(), true));
    }
  }

  public String allocateIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    Class<?> actualType               = type.isInterface() ? scalarType(type) : type;
    String   intermediateVariableName = newIntermediateVariable(actualType);
    loadThisFieldOntoStack(methodVisitor, intermediateVariableName, actualType);
    return intermediateVariableName;
  }

  public String
         allocateIntermediateVariable(MethodVisitor methodVisitor, String prefix, Class<?> type)
  {
    Class<?> actualType               = type.isInterface() ? scalarType(type) : type;
    String   intermediateVariableName = newIntermediateVariable(prefix, actualType);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor),
                       intermediateVariableName,
                       actualType.descriptorString());
    return intermediateVariableName;
  }

  public boolean anyAscendentIndependentVariableIsNamed(String name)
  {
    if (independentVariable != null && independentVariable.getName().equals(name))
    {
      return true;
    }
    if (ascendentExpression != null)
    {
      if (ascendentExpression.anyAscendentIndependentVariableIsNamed(name))
      {
        return true;
      }
    }
    return false;
  }

  protected Expression<D, C, F> assignIndependentVariable(VariableNode<D, C, F> variable)
  {
    if (independentVariable != null)
    {
      if (!independentVariable.equals(variable))
      {

        throw new CompilerException(String.format("undefined variable reference '%s' at position=%s in expression '%s' "
                                                  + "since the inderminate variable has already been declared to be '%s' in expr#%s",
                                                  variable,
                                                  position,
                                                  this,
                                                  independentVariable,
                                                  System.identityHashCode(expression)));

      }
      else
      {
        return this;
      }

    }
    independentVariable               = variable;
    independentVariable.isIndependent = true;
    return this;
  }

  protected VariableNode<D, C, F> assignIndeterminateVariable(VariableNode<D, C, F> variable)
  {
    assert !variable.equals(independentVariable) : "cannot add "
                                                   + variable
                                                   + " to indeterminate stack since it is the inependent variable";
    return variable.pushThisOntoTheIndeterminantVariableStack();
  }

  /**
   * Assigns a variable to either this{@link #indeterminantVariable} or
   * this{@link #independentVariable}
   * 
   * @param variable
   * @param indeterminant if true then this variable represents a placeholder
   *                      variable for a polynomial or a rational function or a
   *                      functional. if false then it is an independent variable
   *                      defined on the domain of the expression
   */
  private void assignVariable(VariableNode<D, C, F> variable, boolean indeterminant)
  {
    if (Expression.trace)
    {
      log.debug("#{}: assignVariable( variable={}, indeterminant={})",
                System.identityHashCode(this),
                variable,
                indeterminant);
    }

    if (indeterminant)
    {
      assignIndeterminateVariable(variable);
    }
    else
    {
      assignIndependentVariable(variable);
    }
  }

  protected void
            assureInputNameHasNotAlreadyBeenAssociatedWithAContextVariable(String inputVariableName)
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
  }

  protected boolean assureNoNumbersInTheInputVariable(String inputVariableName,
                                                      boolean isInputVariableSpecified)
  {
    for (int i = 0; i < inputVariableName.length(); i++)
    {
      if (!Parser.isIdentifyingCharacter(inputVariableName.charAt(i), false))
      {
        isInputVariableSpecified = false;
      }
    }
    return isInputVariableSpecified;
  }

  protected boolean characterAfterNextIs(char ch)
  {
    return position + 1 < expression.length() && expression.charAt(position + 1) == ch;
  }

  @Override
  protected Object clone()
  {
    var expr = new Expression<D, C, F>(className,
                                       domainType,
                                       coDomainType,
                                       functionClass,
                                       expression,
                                       context,
                                       functionName,
                                       ascendentExpression);
    expr.context                = context;
    expr.independentVariable    = independentVariable;

    // Deep copy the stack: clone each VariableNode WITHOUT resolving
    expr.indeterminateVariables = new Stack<>();
    for (VariableNode<D, C, F> var : indeterminateVariables)
    {
      // Create new VariableNode directly without calling resolveReference again
      VariableNode<D, C, F> cloned = new VariableNode<>(expr,
                                                        var.reference.spliceInto(expr),
                                                        var.position,
                                                        false); // ← resolve=false!
      cloned.isIndeterminate = var.isIndeterminate;
      cloned.isIndependent   = var.isIndependent;
      expr.indeterminateVariables.push(cloned);
    }

    expr.functionNameSpecified = functionNameSpecified;
    expr.position              = position;
    expr.character             = character;
    expr.previousCharacter     = previousCharacter;
    return expr;
  }

  @SuppressWarnings("unchecked")
  public <G extends Function<?, ?>, E extends Expression<?, ?, ? extends G>> E cloneExpression()
  {
    return (E) clone();
  }

  public Expression<D, C, F> compile()
  {
    if (compiledClass != null)
    {
      return this;
    }
    if (context == null)
    {
      context = new Context();
    }

    if (trace)
    {
      log.debug(String.format("#%s: compile(expression=%s, className=%s, context=%s)\n",
                              System.identityHashCode(this),
                              expression,
                              className,
                              context));
    }
    if (instructions == null)
    {
      generate();
    }
    assert context != null : "context is null for "
                             + this
                             + " and ascendentExpression="
                             + ascendentExpression
                             + " ascendentExpression.context="
                             + ascendentExpression.context;
    compiledClass = loadFunctionClass(className, instructions, context);
    return this;
  }

  /**
   * Constructs a referenced function instance if it is null and injects context
   * references.
   * 
   * CRITICAL FIX for Issue #825: After constructing the nested function instance,
   * immediately call context.injectReferences() to:
   * 1. Set the nested function's context field to the shared context
   * 2. Inject all context variables (α, β, etc.) into the nested function
   * 
   * This enables the cascade: when the nested function initializes, it can inject
   * references into ITS nested functions, allowing deeply nested functions to
   * access shared context variables.
   */
  protected void constructReferencedFunctionInstanceIfItIsNull(MethodVisitor mv,
                                                               FunctionMapping<?, ?, ?> mapping)
  {
    if ((mapping.functionName == null || functionName == null
                  || !functionName.equals(mapping.functionName)) && mapping.expression != null)
    {
      Class<?> type = mapping.type();
      if (type == null)
      {
        mapping.instantiate();
        type = mapping.type();
      }
      assert type != null : "type is null for mapping=" + mapping;

      var alreadyInitialized = new Label();

      loadThisOntoStack(mv).visitFieldInsn(GETFIELD,
                                           className,
                                           mapping.functionName,
                                           mapping.functionFieldDescriptor());
      mv.visitJumpInsn(Opcodes.IFNONNULL, alreadyInitialized);

      loadThisOntoStack(mv);
      generateNewObjectInstruction(mv, type);
      duplicateTopOfTheStack(mv);
      invokeDefaultConstructor(mv, type);
      putField(mv, className, mapping.functionName, type);

      mv.visitLabel(alreadyInitialized);

      // CRITICAL FIX (Issue #825): Inject shared context into nested function
      // This ensures the nested function's context field points to the shared context,
      // so when IT creates its own nested functions, they can access α, β, etc.
      // Generate: this.context.injectReferences(this.<functionName>);
      loadThisFieldOntoStack(mv, "context", Context.class);
      loadThisOntoStack(mv).visitFieldInsn(GETFIELD,
                                           className,
                                           mapping.functionName,
                                           mapping.functionFieldDescriptor());
      invokeVirtualMethod(mv, Context.class, "injectReferences", void.class, Function.class);
    }
  }


  protected void
            copyNestedFunctionFieldByValueIfNestedFunctionFieldIsNotNull(MethodVisitor mv,
                                                                         String generatedFunctionClassInternalName,
                                                                         String functionFieldName,
                                                                         String functionTypeDesc,
                                                                         String variableFieldName,
                                                                         String variableFieldTypeDescriptor,
                                                                         Class<?> variableType,
                                                                         String nestedFunctionClassInternalName,
                                                                         Label labelEnd)
  {
    // Create new instance and PUTFIELD
    loadThisOntoStack(mv); // Stack: [this]
    mv.visitFieldInsn(GETFIELD,
                      generatedFunctionClassInternalName,
                      functionFieldName,
                      functionTypeDesc);
    // Stack: [this.nestFunctionField]
    generateNewObjectInstruction(mv, variableType);
    // Stack: [this.nestFunctionField, newInstance]
    duplicateTopOfTheStack(mv);
    // Stack: [this.nestFunctionField, newInstance, newInstance]
    invokeDefaultConstructor(mv, variableType);
    // Stack: [this.nestFunctionField, newInstance]
    mv.visitFieldInsn(PUTFIELD,
                      nestedFunctionClassInternalName,
                      variableFieldName,
                      variableFieldTypeDescriptor);
    // Stack: [] (PUTFIELD pops owner and value)

    // Copy by value: Load both and call set
    loadThisOntoStack(mv);
    // Stack: [this]
    mv.visitFieldInsn(GETFIELD,
                      generatedFunctionClassInternalName,
                      functionFieldName,
                      functionTypeDesc);
    // Stack: [this.nestFunctionField]
    mv.visitFieldInsn(GETFIELD,
                      nestedFunctionClassInternalName,
                      variableFieldName,
                      variableFieldTypeDescriptor);
    // Stack: [nestFunctionField.variableField]
    loadThisOntoStack(mv);
    // Stack: [nestFunctionField.variableField, this]
    mv.visitFieldInsn(GETFIELD,
                      generatedFunctionClassInternalName,
                      variableFieldName,
                      variableFieldTypeDescriptor);
    // Stack: [nestFunctionField.variableField, this.variableField]
    invokeVirtualMethod(mv, variableType, "set", variableType, variableType);
    // Stack: [nestFunctionField.variableField]
    // (set() returns the object)

    mv.visitInsn(Opcodes.POP);
    // Stack: [] (pop the return value from set())

    mv.visitJumpInsn(GOTO, labelEnd);
    // Stack: [] (GOTO doesn't affect stack)

  }

  protected VariableNode<D, C, F> createNewVariableNode(String inputVariableName)
  {
    return new VariableNode<>(this,
                              new VariableReference<>(inputVariableName,
                                                      null,
                                                      coDomainType),
                              position,
                              true);
  }

  private ClassVisitor declareContext(ClassVisitor cw)
  {
    Class<?> type           = Context.class;
    String   typeDescriptor = type.descriptorString();
    cw.visitField(ACC_PUBLIC, "context", typeDescriptor, null, null);
    return cw;
  }

  protected MethodVisitor declareEvaluateMethodsLocalVariableArguments(MethodVisitor methodVisitor,
                                                                       Label startLabel,
                                                                       Label endLabel)
  {
    methodVisitor.visitLocalVariable("this",
                                     String.format("L%s;", className),
                                     null,
                                     startLabel,
                                     endLabel,
                                     0);
    methodVisitor.visitLocalVariable(independentVariable != null ? independentVariable.getName()
                                                                 : "in",
                                     domainType.descriptorString(),
                                     null,
                                     startLabel,
                                     endLabel,
                                     1);
    methodVisitor.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("result",
                                     coDomainType.descriptorString(),
                                     null,
                                     startLabel,
                                     endLabel,
                                     4);
    return methodVisitor;
  }

  protected void declareFields(ClassVisitor cw)
  {
    cw.visitField(Opcodes.ACC_PUBLIC, IS_INITIALIZED, "Z", null, null);

    declareContext(cw);

    if (!coDomainType.isInterface())
    {
      declareLiteralConstants(cw);
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
    dependencies = Utensils.sortDependencies(context.functionReferenceGraph, referencedFunctions);

    if (saveGraphs)
    {
      context.saveDependencyGraph(dependencies);
    }
    // Declare functions in dependency order
    for (Dependency dependency : dependencies)
    {
      String dependencyVariableName = dependency.variableName;
      var    functionMapping        = referencedFunctions.get(dependencyVariableName);

      if (functionMapping != null)
      {
        functionMapping.declare(classVisitor, dependencyVariableName);
      }
    }

    return classVisitor;
  }

  protected void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    sortedIntermediateVariableStream().filter(variable -> !declaredIntermediateVariables.contains(variable.name))
                                      .forEach(variable ->
                                      {
                                        variable.declareField(classVisitor);
                                        declaredIntermediateVariables.add(variable.name);
                                      });
  }

  protected ClassVisitor declareLiteralConstants(ClassVisitor classVisitor)
  {
    for (var constant : getSortedLiteralConstantNodes())
    {
      constant.declareField(classVisitor);
    }
    return classVisitor;
  }

  protected void declareVariableEntry(ClassVisitor classVisitor, Entry<String, Named> variable)
  {
    if (trace)
    {
      log.trace("Declaring variable of " + className + ": " + variable);
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
        log.trace("Skipping null variable of " + className + ": " + variable);
      }
    }
  }

  /**
   * Declares variables as fields in the generated class. This includes: 1. The
   * ascendent expression's independent variable (if any) 2. Variables referenced
   * from ancestor expressions (ascendentInput variables) 3. Context variables
   * ONLY if they are actually referenced by this expression
   *
   * CRITICAL FIX for Issue #826: Only declares context variables that appear in
   * referencedVariables to prevent "cannot be resolved or is not a field" errors
   * AND to prevent NoSuchFieldError at runtime when propagating to nested
   * functions.
   */
  protected void declareVariables(ClassVisitor classVisitor)
  {
    // Declare the immediate ascendent expression's independent variable
    if (ascendentExpression != null)
    {
      var ascendentIndependentVariableNode = ascendentExpression.independentVariable;
      if (ascendentIndependentVariableNode != null
                    && !ascendentIndependentVariableNode.type().equals(Object.class))
      {
        classVisitor.visitField(ACC_PUBLIC,
                                ascendentIndependentVariableNode.reference.name,
                                ascendentIndependentVariableNode.type().descriptorString(),
                                null,
                                null);
      }
    }

    // Declare fields for all referenced variables from ancestor expressions
    for (var entry : referencedVariables.entrySet())
    {
      String                varName = entry.getKey();
      VariableNode<D, C, F> varNode = entry.getValue();

      // Skip independent or indeterminate variables
      if (varNode.isIndependent || varNode.isIndeterminate)
      {
        continue;
      }

      // Skip if already declared as ascendent independent variable
      if (ascendentExpression != null && ascendentExpression.independentVariable != null
                    && varName.equals(ascendentExpression.independentVariable.getName()))
      {
        continue;
      }

      // Skip context variables (they will be declared below if referenced)
      if (context != null && context.getVariable(varName) != null)
      {
        continue;
      }

      // This is an ascendentInput variable - declare it as a field
      Class<?> varType = varNode.type();
      if (varType != null && !varType.equals(Object.class))
      {
        if (trace)
        {
          log.debug("declareVariables for {}: declaring ascendentInput variable {} of type {}",
                    className,
                    varName,
                    varType);
        }
        classVisitor.visitField(ACC_PUBLIC, varName, varType.descriptorString(), null, null);
      }
    }

    // Declare context variables ONLY if they are actually referenced
    if (context != null)
    {
      var varList = context.variableEntryStream()
                           .sorted((a, b) -> a.getKey().compareTo(b.getKey()))
                           .toList();
      if (trace)
      {
        String vars           =
                    varList.stream().map(f -> f.getKey()).collect(Collectors.joining(","));
        String referencedVars = referencedVariables.keySet()
                                                   .stream()
                                                   .collect(Collectors.joining(","));
        log.debug("declareVariables for {}: context variables={}, referencedVariables={}",
                  className,
                  vars,
                  referencedVars);
      }
      for (var variable : varList)
      {
        // CRITICAL FIX (Issue #826): Only declare variables this expression actually
        // references
        if (referencedVariables.containsKey(variable.getKey()))
        {
          declareVariableEntry(classVisitor, variable);
        }
      }
    }

    variablesDeclared = true;
  }

  public boolean defaultToIntegerConstantsWhenPossible()
  {
    return coDomainType.equals(Integer.class);
  }

  public boolean anyAscendentIndeterminateVariableIsNamed(String name)
  {
    for (var indeterminateVariable : indeterminateVariables)
    {
      if (indeterminateVariable != null && indeterminateVariable.getName().equals(name))
      {
        return true;
      }
    }
    if (ascendentExpression != null)
    {
      if (ascendentExpression.anyAscendentIndeterminateVariableIsNamed(name))
      {
        return true;
      }
    }
    return false;
  }

  @Override
  public boolean equals(Object obj)
  {
    return obj instanceof Expression exp ? Objects.equals(rootNode, exp.rootNode) : false;
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

  protected Node<D, C, F> evaluateNumericLiteralConstant()
  {
    int startingPosition = position;
    while (isNumeric(character))
    {
      nextCharacter();
    }
    assert position > startingPosition : "didn't read any digits";

    return newLiteralConstant(expression.substring(startingPosition, position));
  }

  private Node<D, C, F> evaluateOperand() throws CompilerException
  {
    Node<D, C, F> node = null;

    if (nextCharacterIs('['))
    {
      node = new VectorNode<>(this);
    }
    else if (nextCharacterIs('(', '⁽'))
    {
      node = resolve();
      require(')', '⁾');
    }
    else if (nextCharacterIs('∂'))
    {
      node = new DerivativeNode<>(this);
    }
    else if (nextCharacterIs('Đ'))
    {
      node = new CaputoFractionalDerivativeNode<>(this);
    }
    else if (nextCharacterIs('∫'))
    {
      node = new IntegralNode<>(this);
    }
    else if (nextCharacterIs('Π', '∏'))
    {
      node = new ProductNode<>(this);
    }
    else if (nextCharacterIs('∑', 'Σ'))
    {
      node = new SumNode<>(this);
    }
    else if (isNumeric(character))
    {
      node = evaluateNumericLiteralConstant();
    }
    else if (isIdentifierCharacter())
    {
      // PEEK AHEAD: check if identifier is followed by arrow (nested lambda)
      int    savedPos                      = position;
      char   savedChar                     = character;

      String possibleVariableSpecification = parseName();
      skipSpaces();

      if ((character == '➔') && coDomainType.isInterface())
      {
        node = parseLambda(possibleVariableSpecification);
      }
      else
      {
        // Not a lambda, reset and parse normally
        position  = savedPos;
        character = savedChar;
        node      = resolveIdentifier();
      }
    }

    return resolvePostfixOperators(node);
  }

  public Node<D, C, F> parseLambda(String paramName)
  {
    if (trace)
    {
      log.debug("#{}: parseLambda( expr={},  paramName = {} at position {} where remaining={} )",
                System.identityHashCode(this),
                expression,
                paramName,
                position,
                remaining());
    }

    assureInputNameHasNotAlreadyBeenAssociatedWithAContextVariable(paramName);
    checkLambdaParameterConflicts(paramName);

    // Create parameter variable and save it BEFORE parsing body
    var paramVar   = createNewVariableNode(paramName);
    var savedParam = paramVar;                        // Save reference before other variables get
                                                      // pushed

    require('➔');

    // Parse the body (may push more indeterminates like integration variables)
    var node = resolve();

    // Restore the parameter as the top of stack for newFunctionalExpression to
    // retrieve
    if (!indeterminateVariables.isEmpty() && indeterminateVariables.peek() != savedParam)
    {
      indeterminateVariables.remove(savedParam); // Remove from wherever it is
      indeterminateVariables.push(savedParam); // Put it on top
    }

    return node;
  }

  private void checkLambdaParameterConflicts(String paramName)
  {
    if (independentVariable != null && Objects.equals(independentVariable.getName(), paramName))
    {
      throw new CompilerException("lambda parameter '"
                                  + paramName
                                  + "' conflicts with the independent variable of the containing expression");
    }

    for (var v : indeterminateVariables)
    {
      if (v != null && Objects.equals(v.getName(), paramName))
      {
        throw new CompilerException("lambda parameter '"
                                    + paramName
                                    + "' conflicts with an existing indeterminate variable");
      }
    }
  }

  public File saveToFile()
  {
    var file = new File(className + ".yaml");
    if (trace)
    {
      log.debug("#{}: saveToFile(): file={}", System.identityHashCode(this), file);
    }
    Utensils.saveToYamlFormat(file, this);
    return file;
  }

  /**
   * Similiar to this{@link #parseLambda(String")} but only for the root of the
   * expression
   * 
   * @return
   */
  protected Expression<D, C, F> evaluateOptionalIndependentVariableSpecification()
  {
    if (trace)
    {
      log.debug("#{}: evaluateOptionalIndependentVariableSpecification: remaining {} ",
                System.identityHashCode(this),
                remaining());

    }
    expression = transformToJavaAcceptableCharacters(expression);

    int searchPos = 0;
    int rightArrowIndex;

    if ((rightArrowIndex = expression.indexOf('➔', searchPos)) != -1)
    {
      String  inputVariableName        = expression.substring(searchPos, rightArrowIndex).trim();
      boolean isInputVariableSpecified = true;

      isInputVariableSpecified = assureNoNumbersInTheInputVariable(inputVariableName,
                                                                   isInputVariableSpecified);

      if (isInputVariableSpecified)
      {
        assureInputNameHasNotAlreadyBeenAssociatedWithAContextVariable(inputVariableName);
        VariableNode<D, C, F> newRef = createNewVariableNode(inputVariableName);
        assignVariable(newRef, independentVariable != null && !independentVariable.equals(newRef));
        searchPos = rightArrowIndex + 1; // Move past this arrow, search for next
      }

    }

    position = searchPos - 1; // Position should be just before the expression starts
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

  protected VariableReference<D, C, F> evaluateVariableReference(int startPos)
  {
    String identifier = parseName(startPos);
    var    index      = evaluateIndex();
    return new VariableReference<D, C, F>(identifier,
                                          index);
  }

  protected Node<D, C, F> exponentiate() throws CompilerException
  {
    return exponentiate(evaluateOperand());
  }

  protected <N extends Node<D, C, F>> N exponentiate(N node) throws CompilerException
  {
    if (nextCharacterIs('^'))
    {
      boolean parenthetical = nextCharacterIs('(', '⁽');
      node = node.pow(parenthetical ? resolve() : evaluateOperand());
      if (parenthetical)
      {
        require(')', '⁾');
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
  protected Node<D, C, F> exponentiateMultiplyAndDivide()
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
  public Expression<D, C, F> generate() throws CompilerException
  {
    assert instructions == null;
    if (trace)
    {
      log.debug("#{}: generate(className={}, functionName={}, expression='{}')\n",
                System.identityHashCode(this),
                className,
                functionName,
                expression);
    }

    ClassVisitor classVisitor = Compiler.constructClassVisitor();

    try
    {
      generateFunctionInterface(this, className, classVisitor);
      generateDomainTypeMethod(classVisitor);
      generateCoDomainTypeMethod(classVisitor);
      generateEvaluationMethod(classVisitor);
      if (!isNullaryFunction())
      {
        generateDerivativeMethod(classVisitor);
        generateIntegralMethod(classVisitor);
      }
      else if (Polynomial.class.isAssignableFrom(coDomainType))
      {
        generatePolynomialMethod(classVisitor, "integral");
        generatePolynomialMethod(classVisitor, "derivative");
      }
      declareFields(classVisitor);
      generateInitializationMethod(classVisitor);
      generateConstructor(classVisitor);
      declareIntermediateVariables(classVisitor);
      if (needsCloseMethod())
      {
        generateCloseMethod(classVisitor);
      }
      generateGetNameMethod(classVisitor);
      generateGetContextMethod(classVisitor);

      generateToStringMethod(classVisitor);
      generateTypesetMethod(classVisitor);
    }
    finally
    {
      classVisitor.visitEnd();
    }

    return

    storeInstructions(classVisitor);
  }

  protected void generateAssertionThatOrderIsLessThanOrEqualTo1(MethodVisitor mv)
  {

    Label label1 = new Label();
    mv.visitVarInsn(ILOAD, 2);
    mv.visitInsn(ICONST_1);
    mv.visitJumpInsn(IF_ICMPLE, label1);
    mv.visitTypeInsn(NEW, "java/lang/AssertionError");
    mv.visitInsn(DUP);
    mv.visitVarInsn(ILOAD, 2);
    mv.visitInvokeDynamicInsn("makeConcatWithConstants",
                              "(I)Ljava/lang/String;",
                              new Handle(Opcodes.H_INVOKESTATIC,
                                         "java/lang/invoke/StringConcatFactory",
                                         "makeConcatWithConstants",
                                         "(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;",
                                         false),
                              new Object[]
                              { "TODO: implement order=\u0001>1" });
    mv.visitMethodInsn(INVOKESPECIAL,
                       "java/lang/AssertionError",
                       "<init>",
                       "(Ljava/lang/Object;)V",
                       false);
    mv.visitInsn(ATHROW);
    mv.visitLabel(label1);
  }

  protected MethodVisitor generateCloseFieldCall(MethodVisitor methodVisitor,
                                                 String fieldName,
                                                 Class<?> fieldType)
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
      getSortedLiteralConstantNodes().forEach(constant -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                                 constant.fieldName,
                                                                                 constant.type()));

      sortedIntermediateVariables().forEach(intermediateVariable -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                                           intermediateVariable.name,
                                                                                           intermediateVariable.type));

      referencedFunctions.forEach((name,
                                   mapping) -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                      name,
                                                                      mapping.type()));
    }

    Compiler.generateReturnFromVoidMethod(methodVisitor);

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
    mv.visitMethodInsn(INVOKESPECIAL,
                       JAVA_LANG_ASSERTION_ERROR,
                       "<init>",
                       ASSERTION_ERROR_METHOD_DESCRIPTOR,
                       false);
    mv.visitInsn(ATHROW);
    mv.visitLabel(alreadyInitializedLabel);
  }

  protected ClassVisitor
            generateCoDomainTypeMethod(ClassVisitor classVisitor) throws CompilerException
  {
    return generateTypeMethod(classVisitor,
                              "coDomainType",
                              Type.getType(coDomainType),
                              getCoDomainTypeMethodSignature());
  }

  protected MethodVisitor generateConditionalInitializater(MethodVisitor mv)
  {
    var alreadyInitialized = new Label();
    getFieldFromThis(mv, className, IS_INITIALIZED, boolean.class);
    jumpToIfNotEqual(mv, alreadyInitialized);
    loadThisOntoStack(mv).visitMethodInsn(INVOKEVIRTUAL,
                                          className,
                                          nameOfInitializerFunction,
                                          "()V",
                                          false);
    Compiler.designateLabel(mv, alreadyInitialized);
    return mv;
  }

  protected ClassVisitor generateConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor mv = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    generateInvocationOfDefaultNoArgConstructor(mv, true);

    if (context != null)
    {
      generateContextInitializer(mv);
    }

    if (!coDomainType.isInterface())
    {
      generateLiteralConstantInitializers(mv);
    }

    generateIntermediateVariableInitializers(mv);

    Compiler.generateReturnFromVoidMethod(mv);
    return classVisitor;
  }

  public MethodVisitor generateContextInitializer(MethodVisitor methodVisitor)
  {

    loadThisOntoStack(methodVisitor);
    String contextTypeInternalName = Type.getInternalName(Context.class);
    methodVisitor.visitTypeInsn(NEW, contextTypeInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, contextTypeInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, className, "context", Context.class.descriptorString());
    return methodVisitor;
  }

  protected void generateDependencyAssignment(MethodVisitor mv,
                                              String functionName,
                                              String functionDescriptor,
                                              String assignment)
  {
    var otherMapping = referencedFunctions.get(assignment);

    if (Expression.trace)
    {
      log.debug("generateDependencyAssignment: functionName={} functionDescriptor={} assignment={}",
                functionName,
                functionDescriptor,
                assignment);
    }
    loadThisOntoStack(mv).visitFieldInsn(GETFIELD,
                                         className,
                                         assignment,
                                         otherMapping.functionFieldDescriptor());
    loadThisOntoStack(mv).visitFieldInsn(GETFIELD, className, functionName, functionDescriptor);
    mv.visitFieldInsn(PUTFIELD, assignment, functionName, functionDescriptor);
  }

  protected void generateDependencyAssignments(MethodVisitor mv, Dependency dependency)
  {
    var assignments        = dependency.getAssignments(className, referencedFunctions);

    var functionName       = dependency.variableName;
    var mapping            = referencedFunctions.get(functionName);
    var functionDescriptor = functionClass.descriptorString();                         // .format("L%s;",
                                                                                       // functionName);

    if (mapping != null)
    {

      functionDescriptor = mapping.functionFieldDescriptor();

      constructReferencedFunctionInstanceIfItIsNull(mv, mapping);
      generateFunctionInitializer(mv, mapping, assignments);

      for (String assignment : assignments)
      {
        generateDependencyAssignment(mv, functionName, functionDescriptor, assignment);
      }

    }
  }

  private ClassVisitor generateDerivativeMethod(ClassVisitor classVisitor)
  {
    assert functionClass.isInterface() : functionClass + " is not an interface";

    assert rootNode != null : "rootNode is null";

    var mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                      "derivative",
                                      Compiler.getMethodDescriptor(functionClass),
                                      null,
                                      null);
    mv.visitCode();
    Compiler.annotateWithOverride(mv);

    mv.visitLdcInsn(Type.getType(domainType));
    mv.visitLdcInsn(Type.getType(coDomainType));
    mv.visitLdcInsn(Type.getType(functionClass));
    mv.visitLdcInsn("_diff" + className);
    try
    {
      mv.visitLdcInsn(String.format("diff(%s,%s)", rootNode.toString(), independentVariable));

      // mv.visitLdcInsn(rootNode.differentiate().toString());
    }
    catch (Throwable e)
    {
      mv.visitLdcInsn("TODO: implement differentiation of " + expression);

    }

    loadThisFieldOntoStack(mv, "context", Context.class);

    Compiler.invokeStaticMethod(mv,
                                Function.class,
                                "express",
                                Function.class,
                                Class.class,
                                Class.class,
                                Class.class,
                                String.class,
                                String.class,
                                Context.class);
    Compiler.generateReturnFromMethod(mv);
    return classVisitor;
  }

  protected ClassVisitor
            generateDomainTypeMethod(ClassVisitor classVisitor) throws CompilerException
  {
    return generateTypeMethod(classVisitor,
                              "domainType",
                              Type.getType(domainType),
                              getDomainTypeMethodSignature());
  }

  public void logVariables()
  {
    accept(containingExpression -> log.debug("#{}: '{}': independentVariable={} indeterminateVariables={}",
                                             System.identityHashCode(containingExpression),
                                             containingExpression,
                                             containingExpression.independentVariable,
                                             containingExpression.indeterminateVariables));

  }

  protected ClassVisitor
            generateEvaluationMethod(ClassVisitor classVisitor) throws CompilerException
  {
    if (rootNode == null)
    {
      parseRoot();
    }

    Label startLabel = new Label();
    Label endLabel   = new Label();

    var   mv         = visitEvaluationMethod(classVisitor);
    mv.visitCode();

    if (orderLimited())
    {
      generateAssertionThatOrderIsLessThanOrEqualTo1(mv);
    }

    designateLabel(mv, startLabel);
    Compiler.annotateWithOverride(mv);
    if (needsInitializer())
    {
      generateConditionalInitializater(mv);
    }

    rootNode.isResult = true;
    if (coDomainType.isInterface())
    {
      generateFunctionalElement(mv);
    }
    else
    {
      rootNode.generate(mv, coDomainType);
    }

    designateLabel(mv, endLabel);
    declareEvaluateMethodsLocalVariableArguments(mv, startLabel, endLabel);
    Compiler.generateReturnFromMethod(mv);
    return classVisitor;
  }

  /**
   * Generate the code when the {@link #coDomainType} is an interface so that the
   * return value is itself a {@link Function}, in this case the result argument
   * is ignored since there is no way to use the {@link Function} reference as a
   * changeable object, since it is not {@link Becomable}
   * 
   * @param mv
   * @return initialized this{@link #newFunctionalExpression()}
   */
  protected Expression<Object, Object, Function<?, ?>> generateFunctionalElement(MethodVisitor mv)
  {
    var function = newFunctionalExpression();

    functionalDependsOnIndependentVariable = false;
    functionalIndependentVariable          = null;
    if (independentVariable != null)
    {
      functionalIndependentVariable          =
                                    independentVariable.spliceInto(function).asVariable();
      functionalDependsOnIndependentVariable =
                                             function.rootNode.dependsOn(functionalIndependentVariable);
    }

    if (!indeterminateVariables.isEmpty())
    {
      var indeterminantVariable = indeterminateVariables.peek();
      functionalIndeterminateVariable          =
                                      indeterminantVariable.spliceInto(function).asVariable();
      functionalDependsOnIndeterminateVariable =
                                               function.rootNode.dependsOn(functionalIndeterminateVariable);
    }

    function.generate();

    constructNewObject(mv, function.className);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, function.className);

    if (functionalDependsOnIndependentVariable)
    {
      propagateIndependentVariable(mv, function, functionalIndependentVariable);
    }

    if (context != null && context.variables != null)
    {
      propagateContext(mv, function);
    }

    propagateAscendentInputVariablesToFunctional(mv, function);

    invokeInitializationMethod(mv, function);

    return function.compile();
  }

  /**
   * Propagates ascendent input variables (variables from ancestor expressions) to
   * a newly created nested functional. This is called when generating code that
   * returns a Function, to ensure the returned function has access to variables
   * it references from outer scopes.
   * 
   * CRITICAL FIX for Issue #825: The parent expression's independent variable
   * must also be propagated if the nested function references it as an
   * ascendentInput field. The previous code incorrectly skipped this case,
   * assuming propagateIndependentVariable() would handle it - but that method
   * only handles the nested function's OWN independent variable, not ascendent
   * inputs that happen to share the same name as the parent's independent
   * variable.
   * 
   * @param mv       the method visitor for generating bytecode
   * @param function the nested functional expression being created
   */
  protected void propagateAscendentInputVariablesToFunctional(MethodVisitor mv,
                                                              Expression<?, ?, ?> function)
  {
    for (var entry : function.referencedVariables.entrySet())
    {
      String                varName = entry.getKey();
      VariableNode<?, ?, ?> varNode = entry.getValue();

      if (!varNode.ascendentInput)
      {
        continue;
      }

      Class<?> varType = varNode.type();
      if (varType == null || varType.equals(Object.class))
      {
        continue;
      }

      if (trace)
      {
        log.debug("propagateAscendentInputVariablesToFunctional: propagating {} to {} from {}",
                  varName,
                  function.className,
                  className);
      }

      duplicateTopOfTheStack(mv);

      // CRITICAL FIX for Issue #825: Check if this variable is the parent's
      // independent variable. If so, load it from the method parameter (slot 1),
      // not from a field (which doesn't exist for independent variables).
      if (independentVariable != null && varName.equals(independentVariable.getName()))
      {
        // Load the independent variable from method parameter slot 1
        mv.visitVarInsn(ALOAD, 1);
        // CRITICAL: Cast from Object to the actual type since evaluate() uses
        // Object in its erased signature due to generics
        mv.visitTypeInsn(CHECKCAST, Type.getInternalName(varType));
      }
      else
      {
        // Load from field as before
        loadThisFieldOntoStack(mv, varName, varType);
      }

      putField(mv, function.className, varName, varType);
    }
  }

  public VariableNode<D, C, F> getIndeterminateVariable()
  {
    return indeterminateVariables.isEmpty() ? null : indeterminateVariables.peek();
  }

  protected MethodVisitor generateFunctionInitializer(MethodVisitor mv,
                                                      FunctionMapping<?, ?, ?> nestedFunction,
                                                      List<String> assignments)
  {
    if (trace)
    {
      log.debug(String.format("generateFunctionInitializer for className=%s functionName=%s: nestedFunction=%s, assignments=%s )",
                              className,
                              functionName,
                              nestedFunction.functionName,
                              assignments));
    }

    if (nestedFunction.instance != null && nestedFunction.isGenerated())
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

  protected ClassVisitor generateGetContextMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "getContext",
                                                 Compiler.getMethodDescriptor(Context.class),
                                                 null,
                                                 null);

    methodVisitor.visitCode();
    Compiler.annotateWithOverride(methodVisitor);

    Compiler.getFieldFromThis(methodVisitor, className, "context", Context.class);

    Compiler.generateReturnFromMethod(methodVisitor);
    return classVisitor;
  }

  protected ClassVisitor generateGetNameMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "getName",
                                                 Compiler.getMethodDescriptor(String.class),
                                                 null,
                                                 null);

    methodVisitor.visitCode();
    Compiler.annotateWithOverride(methodVisitor);

    if (functionName != null)
    {
      methodVisitor.visitLdcInsn(functionName);
    }
    else
    {
      methodVisitor.visitInsn(Opcodes.ACONST_NULL);
    }
    Compiler.generateReturnFromMethod(methodVisitor);
    return classVisitor;
  }

  protected MethodVisitor generateInitializationCode(MethodVisitor mv)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(mv);
    if (trace)
    {
      log.debug("generateInitializationCode for className={} functionName={}: referencedFunctions={}",
                className,
                functionName,
                referencedFunctions.keySet());
    }
    addChecksForNullVariableReferences(mv);

    // Initialize in proper dependency order
    if (dependencies != null)
    {
      for (Dependency dependency : dependencies)
      {
        generateDependencyAssignments(mv, dependency);
      }
    }

    insideInitializer = true;
    initializers.forEach(initializer -> initializer.accept(mv));
    insideInitializer = false;

    // Propagate ascendent input variables to nested operand functions
    // NOTE: This only propagates variables that are FIELDS of this class,
    // NOT the independent variable (which is a method parameter)
    propagateAscendentInputVariablesToNestedFunctions(mv);

    if (recursive)
    {
      generateSelfReference(mv);
    }
    generateCodeToSetIsInitializedToTrue(mv);
    return mv;
  }

  /**
   * Propagates ascendent input variables (variables from ancestor expressions) to
   * nested operand functions that reference them.
   * 
   * This method should NOT propagate variables that are: 1. The independent
   * variable of this expression (it's a parameter, not a field) 2. Variables that
   * don't exist as fields in nested operand functions
   * 
   * This is called during initialization to set up context variables that are
   * fields (not input parameters) of both this expression and nested functions.
   */
  protected void propagateAscendentInputVariablesToNestedFunctions(MethodVisitor mv)
  {
    // For each referenced function (nested operand functions)
    for (var entry : referencedFunctions.entrySet())
    {
      String              nestedFunctionName = entry.getKey();
      FunctionMapping     mapping            = entry.getValue();

      // Get the nested expression to check what variables it actually references
      Expression<D, C, F> nestedExpr         = mapping.expression;
      if (nestedExpr == null)
      {
        continue;
      }

      // For each ascendent input variable in the nested expression
      for (var varEntry : nestedExpr.referencedVariables.entrySet())
      {
        String                varName = varEntry.getKey();
        VariableNode<D, C, F> varNode = varEntry.getValue();

        // Skip if this variable is NOT an ascendent input (it's local to the nested
        // expr)
        if (!varNode.ascendentInput)
        {
          continue;
        }

        // CRITICAL: Skip if this variable is the independent variable of THIS
        // expression
        // because it's a parameter, not a field, so this.varName doesn't exist
        if (independentVariable != null && varName.equals(independentVariable.getName()))
        {
          if (trace)
          {
            log.debug("propagateAscendentInputVariables: skipping {} (is independent variable of {}) for {}",
                      varName,
                      className,
                      nestedFunctionName);
          }
          continue;
        }

        // Check if this class actually has this field
        Class<?> varType = varNode.type();
        if (varType == null || varType.equals(Object.class))
        {
          continue;
        }

        // Check that WE have this field before trying to propagate
        boolean thisClassHasField = hasFieldInClass(varName, varType);
        if (!thisClassHasField)
        {
          if (trace)
          {
            log.debug("propagateAscendentInputVariables: skipping {} (not a field in {}) for {}",
                      varName,
                      className,
                      nestedFunctionName);
          }
          continue;
        }

        if (trace)
        {
          log.debug("propagateAscendentInputVariables: propagating {} to {} in {}",
                    varName,
                    nestedFunctionName,
                    className);
        }

        // Generate: this.nestedFunction.varName = this.varName;
        String nestedFunctionDescriptor = "L" + nestedFunctionName + ";";
        String varDescriptor            = varType.descriptorString();

        // Load this
        mv.visitVarInsn(ALOAD, 0);
        // Get the nested function field
        mv.visitFieldInsn(GETFIELD, className, nestedFunctionName, nestedFunctionDescriptor);
        // Load this again for the source field
        mv.visitVarInsn(ALOAD, 0);
        // Get the source field value
        mv.visitFieldInsn(GETFIELD, className, varName, varDescriptor);
        // Store into nested function's field
        mv.visitFieldInsn(PUTFIELD, nestedFunctionName, varName, varDescriptor);
      }
    }
  }

  /**
   * Checks if this class has a field with the given name and compatible type.
   * This is used to verify we can propagate a variable before attempting to do
   * so.
   * 
   * UPDATED for Issue #826: Only returns true for context variables if they are
   * actually in referencedVariables (since that's the only way they get
   * declared).
   */
  protected boolean hasFieldInClass(String fieldName, Class<?> expectedType)
  {
    // Check context variables - but ONLY if we reference them (Issue #826 fix)
    if (context != null)
    {
      Object contextVar = context.getVariable(fieldName);
      if (contextVar != null && referencedVariables.containsKey(fieldName))
      {
        return true;
      }
    }

    // Check if it's the ascendent expression's independent variable
    if (ascendentExpression != null && ascendentExpression.independentVariable != null)
    {
      if (fieldName.equals(ascendentExpression.independentVariable.getName()))
      {
        return true;
      }
    }

    // Check referenced variables that are fields (non-independent,
    // non-indeterminate)
    if (referencedVariables.containsKey(fieldName))
    {
      VariableNode<D, C, F> varNode = referencedVariables.get(fieldName);
      // Only return true if this variable is actually a field (not a parameter)
      return !varNode.isIndependent;
    }

    return false;
  }

  protected ClassVisitor generateInitializationMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 nameOfInitializerFunction,
                                                 "()V",
                                                 null,
                                                 null);
    Compiler.annotateWithOverride(methodVisitor);

    try
    {
      methodVisitor.visitCode();
      generateInitializationCode(methodVisitor);

    }
    finally
    {
      Compiler.generateReturnFromVoidMethod(methodVisitor);
    }

    return classVisitor;
  }

  private ClassVisitor generateIntegralMethod(ClassVisitor classVisitor)
  {
    assert functionClass.isInterface() : functionClass + " is not an interface";

    assert rootNode != null : "rootNode is null";

    var mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                      "integral",
                                      Compiler.getMethodDescriptor(functionClass),
                                      null,
                                      null);
    mv.visitCode();
    Compiler.annotateWithOverride(mv);

    mv.visitLdcInsn(Type.getType(domainType));
    mv.visitLdcInsn(Type.getType(coDomainType));
    mv.visitLdcInsn(Type.getType(functionClass));
    mv.visitLdcInsn("_int" + functionName);
    mv.visitLdcInsn(String.format("int(%s,%s)", rootNode.toString(), independentVariable));

    if (context != null)
    {
      loadThisFieldOntoStack(mv, "context", Context.class);

      Compiler.invokeStaticMethod(mv,
                                  Function.class,
                                  "express",
                                  Function.class,
                                  Class.class,
                                  Class.class,
                                  Class.class,
                                  String.class,
                                  String.class,
                                  Context.class);
    }
    else
    {
      Compiler.invokeStaticMethod(mv,
                                  Function.class,
                                  "express",
                                  Function.class,
                                  Class.class,
                                  Class.class,
                                  Class.class,
                                  String.class,
                                  String.class);

    }

    Compiler.generateReturnFromMethod(mv);

    return classVisitor;
  }

  protected MethodVisitor generateIntermediateVariableInitializers(MethodVisitor methodVisitor)
  {
    for (var intermediateVariable : sortedIntermediateVariables())
    {
      intermediateVariable.generateInitializer(methodVisitor);
    }
    return methodVisitor;
  }

  protected void generateInvocationOfDefaultNoArgConstructor(MethodVisitor methodVisitor,
                                                             boolean object)
  {
    loadThisOntoStack(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  object ? Type.getInternalName(Object.class)
                                         : className.replace(".", "/"),
                                  "<init>",
                                  "()V",
                                  false);
  }

  protected MethodVisitor generateLiteralConstantInitializers(MethodVisitor methodVisitor)
  {
    for (var literal : getSortedLiteralConstantNodes())
    {
      literal.generateLiteralConstantInitializer(methodVisitor);
    }
    return methodVisitor;
  }

  protected ClassVisitor generatePolynomialMethod(ClassVisitor classVisitor, String operation)
  {

    assert function