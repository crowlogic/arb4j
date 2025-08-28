package arb.expressions;

import static arb.expressions.Compiler.addNullCheckForField;
import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.defineMethod;
import static arb.expressions.Compiler.designateLabel;
import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.generateFunctionInterface;
import static arb.expressions.Compiler.generateNewObjectInstruction;
import static arb.expressions.Compiler.generateReturnFromVoidMethod;
import static arb.expressions.Compiler.getField;
import static arb.expressions.Compiler.getFieldFromThis;
import static arb.expressions.Compiler.getVariablePrefix;
import static arb.expressions.Compiler.invokeCloseMethod;
import static arb.expressions.Compiler.invokeDefaultConstructor;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.jumpToIfNotEqual;
import static arb.expressions.Compiler.loadFunctionClass;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static arb.expressions.Compiler.putField;
import static arb.expressions.Compiler.swap;
import static arb.expressions.Parser.isAlphabeticalGreekSpecialOrBlackLetter;
import static arb.expressions.Parser.isNumeric;
import static arb.expressions.Parser.isSubscript;
import static arb.expressions.Parser.isSuperscript;
import static arb.expressions.Parser.transformToJavaAcceptableCharacters;
import static java.lang.String.format;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.ATHROW;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.IFEQ;
import static org.objectweb.asm.Opcodes.INVOKESPECIAL;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.NEW;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.util.TraceClassVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Becomable;
import arb.Complex;
import arb.ComplexFraction;
import arb.ComplexPolynomial;
import arb.ComplexRationalFunction;
import arb.Fraction;
import arb.GaussianInteger;
import arb.Initializable;
import arb.Integer;
import arb.IntegerPolynomial;
import arb.Named;
import arb.OrderedPair;
import arb.RationalFunction;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.context.Dependency;
import arb.expressions.context.TopologicalSorter;
import arb.expressions.nodes.DerivativeNode;
import arb.expressions.nodes.ElseNode;
import arb.expressions.nodes.FractionalDerivativeNode;
import arb.expressions.nodes.IntegralNode;
import arb.expressions.nodes.LiteralConstantNode;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.expressions.nodes.VectorNode;
import arb.expressions.nodes.binary.AdditionNode;
import arb.expressions.nodes.binary.AscendingFactorializationNode;
import arb.expressions.nodes.binary.BinaryOperationNode;
import arb.expressions.nodes.binary.DivisionNode;
import arb.expressions.nodes.binary.MultiplicationNode;
import arb.expressions.nodes.binary.SubtractionNode;
import arb.expressions.nodes.nary.NAryOperationNode;
import arb.expressions.nodes.nary.ProductNode;
import arb.expressions.nodes.nary.SumNode;
import arb.expressions.nodes.unary.BesselFunctionNodeOfTheFirstKind;
import arb.expressions.nodes.unary.BetaFunctionNode;
import arb.expressions.nodes.unary.BinomialCoefficientNode;
import arb.expressions.nodes.unary.FactorialNode;
import arb.expressions.nodes.unary.FloorNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.expressions.nodes.unary.FunctionalEvaluationNode;
import arb.expressions.nodes.unary.HypergeometricFunctionNode;
import arb.expressions.nodes.unary.LambertWFunctionNode;
import arb.expressions.nodes.unary.LommelPolynomialNode;
import arb.expressions.nodes.unary.SphericalBesselFunctionNodeOfTheFirstKind;
import arb.expressions.nodes.unary.UnaryOperationNode;
import arb.expressions.nodes.unary.WhenNode;
import arb.expressions.viz.ExpressionTree;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.ComplexFunction;
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
 * @author Stephen Andrew Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne#gett for the terms of use of the
 *      {@link TheArb4jLibrary}
 */
public class Expression<D, C, F extends Function<? extends D, ? extends C>> implements
                       Typesettable,
                       Cloneable,
                       Supplier<F>
{
  private static String    ASSERTION_ERROR_METHOD_DESCRIPTOR =
                                                             Compiler.getMethodDescriptor(Void.class,
                                                                                          Object.class);

  private static final char COMBINING_DOT_ABOVE      = '\u0307';

  private static final char COMBINING_TWO_DOTS_ABOVE = '\u0308';

  static File              compiledClassDir                  = new File("compiled");

  public static String     evaluationMethodDescriptor        =
                                                      "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public static Class<?>[] implementedInterfaces             = new Class[]
  { Typesettable.class, AutoCloseable.class, Initializable.class };

  static HashSet<Class<?>>                             indeterminantTypes = new HashSet<>();

  public static String     IS_INITIALIZED                    = "isInitialized";

  private static String    JAVA_LANG_ASSERTION_ERROR         = "java/lang/AssertionError";

  private static final char MIDDLE_DOT               = '\u00B7';

  public static String     nameOfInitializerFunction         = "initialize";

  public static boolean    saveClasses                       =
                                       Boolean.valueOf(System.getProperty("arb4j.compiler.saveClasses",
                                                                          "false"));

  public static boolean    saveGraphs                        =
                                      Boolean.valueOf(System.getProperty("arb4j.compiler.saveGraphs",
                                                                         "false"));

  public static boolean    trace                             =
                                 Boolean.valueOf(System.getProperty("arb4j.compiler.trace",
                                                                    "false"));

  public static String     VOID_METHOD_DESCRIPTOR            =
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

  HashMap<Class<?>, AtomicInteger> constantCounts = new HashMap<>();

  public Context                                        context;

  HashSet<String>                                       declaredIntermediateVariables =
                                                                                      new HashSet<>();

  public List<Dependency>                              dependencies;

  public Class<? extends D>                             domainType;

  public String                                         expression;

  public boolean                                       functionalDependsOnIndependentVariable;

  public boolean                                        functionalDependsOnIndeterminantVariable;

  private VariableNode<Object, Object, Function<?, ?>> functionalIndependentVariable;

  public VariableNode<Object, Object, Function<?, ?>>   functionalIndeterminantVariable;

  public Class<? extends F>                             functionClass;

  public String                                         functionClassDescriptor;

  public String                                         functionName;

  public boolean functionNameSpecified = true;

  public HashMap<Node<D, C, F>, String>                generatedNodes     = new HashMap<>();

  public String                                         genericFunctionClassInternalName;

  public boolean                                        inAbsoluteValue               = false;

  public VariableNode<D, C, F>                          independentVariable;

  public VariableNode<D, C, F>                          indeterminateVariable;

  public LinkedList<Consumer<MethodVisitor>>            initializers                  =
                                                                     new LinkedList<>();

  public boolean                                        insideInitializer             = false;

  protected F                                           instance;

  public byte[]                                         instructions;

  public HashMap<String, IntermediateVariable<D, C, F>> intermediateVariables         =
                                                                              new HashMap<>();

  private ArrayList<LiteralConstantNode<D, C, F>>      literalConstantNodes;

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

  boolean                                               verboseTrace                  = false;

  public Expression(Class<? extends D> domain,
                    Class<? extends C> codomain,
                    Class<? extends F> function)
  {
    this.ascendentExpression              = null;
    this.domainType                       = domain;
    this.coDomainType                     = codomain;
    this.functionClass                    = function;
    this.genericFunctionClassInternalName = Type.getInternalName(function);
    this.functionClassDescriptor          = function.descriptorString();

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
    this.className                        = className;
    this.domainType                       = domain;
    this.coDomainType                     = codomain;
    this.functionClass                    = function;

    this.genericFunctionClassInternalName = Type.getInternalName(function);
    this.functionClassDescriptor          = function.descriptorString();
    this.expression                       = Parser.transformToJavaAcceptableCharacters(expression);
    this.context                          = context;
    this.functionName                     = functionName;

    if (context != null && context.saveClasses)
    {
      saveClasses = true;
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

    addNullCheckForField(mv, className, varName, fieldClass.descriptorString());
  }

  protected void addChecksForNullVariableReferences(MethodVisitor mv)
  {
    if (context != null)
    {
      context.variableClassStream()
             .forEach(entry -> addCheckForNullField(loadThisOntoStack(mv), entry.getLeft(), true));
    }
  }

  public String allocateIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    assert !type.isInterface() : "cannot instantiate interface " + type;
    String intermediateVariableName = newIntermediateVariable(type);
    loadThisFieldOntoStack(methodVisitor, intermediateVariableName, type);
    return intermediateVariableName;
  }

  public String
         allocateIntermediateVariable(MethodVisitor methodVisitor, String prefix, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(prefix, type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor),
                       intermediateVariableName,
                       type.descriptorString());
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

  protected void assignIndependentVariable(VariableNode<D, C, F> variable)
  {
    independentVariable               = variable;
    independentVariable.isIndependent = true;
  }

  protected void assignIndeterminantVariable(VariableNode<D, C, F> variable)
  {
    indeterminateVariable                 = variable;
    indeterminateVariable.isIndeterminate = true;
  }

  /**
   * Assigns a variable to either this{@link #indeterminateVariable} or
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
    if (indeterminant)
    {
      assignIndeterminantVariable(variable);
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
      if (!Parser.isAlphabeticalGreekSpecialOrBlackLetter(inputVariableName.charAt(i), false))
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
    expr.functionNameSpecified = functionNameSpecified;
    expr.position              = position;
    expr.character             = character;
    expr.previousCharacter     = previousCharacter;
    return expr;
  }

  public Expression<D, C, F> cloneExpression()
  {
    return (Expression<D, C, F>) clone();
  }

  public Expression<D, C, F> compile()
  {
    if (compiledClass != null)
    {
      return this;
    }
    if (trace)
    {
      System.err.format("\nExpression(#%s).defineClass(expression=%s\n,className=%s\n, context=%s)\n\n",
                        System.identityHashCode(this),
                        expression,
                        className,
                        context);
    }
    if (instructions == null)
    {
      generate();
    }
    compiledClass = loadFunctionClass(className, instructions, context);
    return this;
  }

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
      assert type != null : "type is  null for mapping=" + mapping;
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
    }
  }

  protected VariableNode<D, C, F> createNewVariableReference(String inputVariableName)
  {
    return new VariableNode<>(this,
                              new VariableReference<>(inputVariableName,
                                                      null,
                                                      coDomainType),
                              position,
                              false);
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
    dependencies =
                 TopologicalSorter.determineDependencyOrderUsingDepthFirstSearch(context.functionReferenceGraph,
                                                                                 referencedFunctions);

    if (saveGraphs)
    {
      var graphFile = context.saveDependencyGraph(dependencies);
    }
    // Declare functions in dependency order
    for (Dependency dependency : dependencies)
    {
      String dependencyVariableName = dependency.variableName;
      var    function               = referencedFunctions.get(dependencyVariableName);

      if (function != null)
      {
        function.declare(classVisitor, dependencyVariableName);
      }
    }

    return classVisitor;
  }

  protected void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    getSortedIntermediateVariables().stream()
                                    .filter(variable -> !declaredIntermediateVariables.contains(variable.name))
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

    if (context != null)
    {
      var varList = context.variableEntryStream()
                           .sorted((a, b) -> a.getKey().compareTo(b.getKey()))
                           .toList();
      if (trace)
      {
        String vars = varList.stream().map(f -> f.getKey()).collect(Collectors.joining(","));
        System.out.println("declareVariables: " + vars);
      }
      for (var variable : varList)
      {
        declareVariableEntry(classVisitor, variable);
      }
    }

    variablesDeclared = true;
  }

  public boolean defaultToIntegerConstantsWhenPossible()
  {
    return coDomainType.equals(Integer.class);
  }

  /**
   * 
   * @return
   * @throws CompilerException
   */
  public Node<D, C, F> evaluate() throws CompilerException
  {
    Node<D, C, F> node = null;

    if (nextCharacterIs('['))
    {
      node = new VectorNode<D, C, F>(this);
    }
    else if (nextCharacterIs('(', '⁽'))
    {
      node = resolve();
      require(')', '⁾');
    }
    else if (nextCharacterIs('∂'))
    {
      node = new DerivativeNode<D, C, F>(this);
    }
    else if (nextCharacterIs('Đ'))
    {
      node = new FractionalDerivativeNode<D, C, F>(this);
    }
    else if (nextCharacterIs('∫'))
    {
      node = new IntegralNode<D, C, F>(this);
    }
    else if (nextCharacterIs('Π', '∏'))
    {
      node = new ProductNode<D, C, F>(this);
    }
    else if (nextCharacterIs('∑', 'Σ'))
    {
      node = new SumNode<D, C, F>(this);
    }
    else if (isNumeric(character))
    {
      node = evaluateNumericLiteralConstant();
    }
    else if (isIdentifierCharacter())
    {
      node = resolveIdentifier();
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

  protected Expression<D, C, F> evaluateOptionalIndependentVariableSpecification()
  {
    if (log.isDebugEnabled())
    {
      log.debug("evaluateOptionalIndependentVariableSpecification: before applying transformToJavaAcceptableCharacters expression={}",
                expression);
    }
    expression = transformToJavaAcceptableCharacters(expression);

    int rightArrowIndex = expression.indexOf('➔');

    if (log.isDebugEnabled())
    {
      log.debug("evaluateOptionalIndependentVariableSpecification: after applying transformToJavaAcceptableCharacters expression={}\nrightArrowIndex={}",
                expression,
                rightArrowIndex);
    }

    if (rightArrowIndex != -1)
    {
      String  inputVariableName        = expression.substring(0, rightArrowIndex);
      boolean isInputVariableSpecified = true;

      if (log.isDebugEnabled())
      {
        log.debug("evaluateOptionalIndependentVariableSpecification: before assureNoNumbersInTheInputVariable inputVariableName={} isInputVariableSpecified={}\n",
                  inputVariableName,
                  isInputVariableSpecified);
      }

      isInputVariableSpecified = assureNoNumbersInTheInputVariable(inputVariableName,
                                                                   isInputVariableSpecified);

      if (log.isDebugEnabled())
      {
        log.debug("evaluateOptionalIndependentVariableSpecification: after assureNoNumbersInTheInputVariable inputVariableName={} isInputVariableSpecified={}\n",
                  inputVariableName,
                  isInputVariableSpecified);
      }

      if (isInputVariableSpecified)
      {
        assureInputNameHasNotAlreadyBeenAssociatedWithAContextVariable(inputVariableName);
        assignVariable(createNewVariableReference(inputVariableName), hasIndeterminateVariable());
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

  protected VariableReference<D, C, F> evaluateVariableReference(int startPos)
  {
    String identifier = parseName(startPos);
    var    index      = evaluateIndex();
    return new VariableReference<D, C, F>(identifier,
                                          index);
  }

  protected Node<D, C, F> exponentiate() throws CompilerException
  {
    return exponentiate(evaluate());
  }

  protected <N extends Node<D, C, F>> N exponentiate(N node) throws CompilerException
  {
    if (nextCharacterIs('^'))
    {
      boolean parenthetical = nextCharacterIs('(', '⁽');
      node = node.pow(parenthetical ? resolve() : evaluate());
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
    if (log.isDebugEnabled())
    {
      log.debug("Expression(#{}).generate() className={} expression='{}'\n\n",
                System.identityHashCode(this),
                className,
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
      }
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

    }
    finally
    {
      classVisitor.visitEnd();
    }

    return

    storeInstructions(classVisitor);
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

      getSortedIntermediateVariables().forEach(intermediateVariable -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                                              intermediateVariable.name,
                                                                                              intermediateVariable.type));

      referencedFunctions.forEach((name,
                                   mapping) -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
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

    if (!coDomainType.isInterface())
    {
      generateLiteralConstantInitializers(mv);
    }

    generateIntermediateVariableInitializers(mv);

    generateReturnFromVoidMethod(mv);

    mv.visitMaxs(10, 10);
    mv.visitEnd();
    return classVisitor;
  }

  private ClassVisitor generateDerivativeMethod(ClassVisitor classVisitor)
  {
    assert rootNode != null : "rootNode is null";

    var mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                      "derivative",
                                      String.format("()L%s;", Type.getInternalName(Function.class)),
                                      getFunctionClassTypeSignature(functionClass),
                                      null);
    mv.visitCode();
    mv.visitLdcInsn(Type.getType(domainType));
    mv.visitLdcInsn(Type.getType(coDomainType));
    mv.visitLdcInsn(Type.getType(Function.class));
    mv.visitLdcInsn(String.format("diff(%s,%s)", expression, independentVariable));
    Compiler.invokeStaticMethod(mv,
                                Function.class,
                                "express",
                                Function.class,
                                Class.class,
                                Class.class,
                                Class.class,
                                String.class);
    mv.visitInsn(Opcodes.ARETURN);
    mv.visitMaxs(10, 10);
    mv.visitEnd();
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

    mv.visitInsn(Opcodes.ARETURN);
    designateLabel(mv, endLabel);
    declareEvaluateMethodsLocalVariableArguments(mv, startLabel, endLabel);
    mv.visitMaxs(10, 10);
    mv.visitEnd();
    return classVisitor;
  }

  /**
   * Generate the code when the {@link #coDomainType} {@link Class#isInterface()}
   * so that the return value is itself a {@link Function}, in this case the
   * result argument is ignored since there is no possible way to use the
   * {@link Function} reference as a changeable object, since it is not
   * {@link Becomable}
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
    if (indeterminateVariable != null)
    {
      functionalIndeterminantVariable          =
                                      indeterminateVariable.spliceInto(function).asVariable();
      functionalDependsOnIndeterminantVariable =
                                               function.rootNode.dependsOn(functionalIndeterminantVariable);
    }

    function.generate();

    generateNewObjectInstruction(mv, function.className);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, function.className);

    if (functionalDependsOnIndependentVariable)
    {
      propagateIndependentVariableToFunctionalElement(mv, function, functionalIndependentVariable);
    }

    if (context != null && context.variables != null)
    {
      propagateContextVariablesAndFunctionsToFunctionalElement(mv, function);
    }

    invokeInitializationMethod(mv, function);

    return function.compile();
  }

  protected MethodVisitor generateFunctionInitializer(MethodVisitor mv,
                                                      FunctionMapping<?, ?, ?> nestedFunction,
                                                      List<String> assignments)
  {
    if (trace)
    {
      err.format("Expression.generateFunctionInitializer( nestedFunction=%s, assignments=%s )\n\n",
                 nestedFunction,
                 assignments);
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

  protected MethodVisitor generateInitializationCode(MethodVisitor mv)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(mv);
    if (trace)
    {
      System.err.println("referencedFunctions=" + referencedFunctions);
    }
    addChecksForNullVariableReferences(mv);

    // Initialize in proper dependency order
    if (dependencies != null)
    {
      for (Dependency dependency : dependencies)
      {
        var assignments        =
                        dependency.reverseDependencies.stream()
                                                      .filter(key -> referencedFunctions.containsKey(key)
                                                                    && !key.equals(className))
                                                      .toList();

        var functionName       = dependency.variableName;
        var mapping            = referencedFunctions.get(functionName);
        var functionDescriptor = String.format("L%s;", functionName);

        if (mapping != null)
        {
          if (mapping.instance != null)
          {
            functionDescriptor = mapping.instance.getClass().descriptorString();
          }
          constructReferencedFunctionInstanceIfItIsNull(mv, mapping);
          generateFunctionInitializer(mv, mapping, assignments);

          for (String assignment : assignments)
          {
            loadThisOntoStack(mv).visitFieldInsn(GETFIELD,
                                                 className,
                                                 assignment,
                                                 String.format("L%s;", assignment));
            loadThisOntoStack(mv).visitFieldInsn(GETFIELD,
                                                 className,
                                                 functionName,
                                                 functionDescriptor);
            mv.visitFieldInsn(PUTFIELD, assignment, functionName, functionDescriptor);
          }
        }
      }
    }

    initializers.forEach(initializer -> initializer.accept(mv));
    if (recursive)
    {
      generateSelfReference(mv);
    }
    generateCodeToSetIsInitializedToTrue(mv);
    return mv;
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
    for (var intermediateVariable : getSortedIntermediateVariables())
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

  public void generateReferencedFunctionInstances(MethodVisitor mv)
  {
    referencedFunctions.values()
                       .forEach(mapping -> constructReferencedFunctionInstanceIfItIsNull(mv,
                                                                                         mapping));
  }

  protected MethodVisitor generateSelfReference(MethodVisitor mv)
  {
    generateNewObjectInstruction(loadThisOntoStack(mv), functionName);
    invokeDefaultConstructor(duplicateTopOfTheStack(mv), functionName);
    putField(mv, className, functionName, String.format("L%s;", functionName));
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
    cast(mv, coDomainType);
    swap(mv);
    return invokeSetMethod(mv, inputType, coDomainType);
  }

  protected ClassVisitor generateToStringMethod(ClassVisitor classVisitor)
  {
    if (log.isDebugEnabled())
    {
      log.debug("generateToStringMethod(expression={}\nfunctionName={},functionNameSpecified={},independentVariable={})",
                expression,
                functionName,
                functionNameSpecified,
                independentVariable);
    }

    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "toString",
                                                 Compiler.getMethodDescriptor(String.class),
                                                 null,
                                                 null);

    methodVisitor.visitCode();

    String name = (functionName != null && functionNameSpecified) ? (functionName + ":") : "";
    updateStringRepresentation();
    String arrow = expression.contains("➔")
                  || independentVariable == null ? "" : (independentVariable.getName() + "➔");
    // TODO: need to generate instructions so that the toString() uses String.format
    // to include the value (only if it was part of the independent variable because
    // thats the only timneits fixed for the whole class, if its just a Context
    // variable then it can change between invocations
//    assert !functionalDependsOnIndependentVariable : "TODO: handle functionalDependsOnIndependentVariable "
//                                                     + functionalIndependentVariable + "  " + context.getVariable(functionalIndependentVariable));
//                                                                  
//                                                    
    methodVisitor.visitLdcInsn(String.format("%s%s%s",
                                             name,
                                             arrow,
                                             expression.replace("sqrt", "√")));
    Compiler.generateReturnFromMethod(methodVisitor);
    return classVisitor;
  }

  private ClassVisitor generateTypeMethod(ClassVisitor classVisitor,
                                          String which,
                                          Type type,
                                          String methodSignature)
  {
    var mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                      which,
                                      Compiler.getMethodDescriptor(Class.class),
                                      methodSignature,
                                      null);

    Compiler.annotateWithOverride(mv);

    mv.visitCode();
    mv.visitLdcInsn(type);
    Compiler.generateReturnFromMethod(mv);

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

  @Override
  public F get()
  {
    return instantiate();
  }

  protected String getCoDomainTypeMethodSignature()
  {
    return Compiler.getTypeMethodSignature(coDomainType);
  }

  public AtomicInteger getConstantCounter(Class<?> type)
  {
    AtomicInteger counter = constantCounts.get(type);
    if (counter == null)
    {
      counter = new AtomicInteger();
      constantCounts.put(type, counter);
    }
    return counter;
  }

  protected String getDomainTypeMethodSignature()
  {
    return Compiler.getTypeMethodSignature(domainType);
  }

  private String getEvaluationMethodSignature()
  {
    return String.format("(L%s;IIL%s;)L%s;",
                         Type.getInternalName(domainType),
                         Type.getInternalName(coDomainType),
                         Type.getInternalName(coDomainType));
  }

  protected String getFunctionClassTypeSignature(Class<? extends Function<?, ?>> functionClass)
  {
    return Compiler.getFunctionClassTypeSignature(functionClass,
                                                  domainType,
                                                  coDomainType,
                                                  implementedInterfaces);
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

  public String getNextConstantFieldName(Class<?> type)
  {
    return "c"
           + getVariablePrefix(type)
           + String.format("%04d", getConstantCounter(type).getAndIncrement());
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

  protected Collection<IntermediateVariable<D, C, F>> getSortedIntermediateVariables()
  {
    var intermediateVariableValues = new ArrayList<>(intermediateVariables.values()
                                                                          .stream()
                                                                          .toList());
    Collections.sort(intermediateVariableValues, (a, b) -> a.name.compareTo(b.name));
    return intermediateVariableValues;
  }

  protected ArrayList<LiteralConstantNode<D, C, F>> getSortedLiteralConstantNodes()
  {
    if (literalConstantNodes == null)
    {
      literalConstantNodes = new ArrayList<>(literalConstants.values().stream().toList());
      Collections.sort(literalConstantNodes, (a, b) -> a.fieldName.compareTo(b.fieldName));
      return literalConstantNodes;
    }
    return literalConstantNodes;
  }

  public <Q> Q getVariable(VariableReference<D, C, F> reference)
  {
    return context == null ? null : context.variables.get(reference.name);
  }

  public boolean hasIndeterminateVariable()
  {
    return (domainType.equals(Object.class)
                  && thisOrAnyAscendentExpressionHasIndeterminateVariable());
  }

  public boolean hasScalarCodomain()
  {
    return coDomainType.equals(Real.class) || coDomainType.equals(Complex.class)
                  || coDomainType.equals(Fraction.class) || coDomainType.equals(Integer.class)
                  || coDomainType.equals(ComplexFraction.class)
                  || coDomainType.equals(GaussianInteger.class);
  }

  protected String[] implementedInterfaces()
  {
    return Stream.concat(Stream.of(genericFunctionClassInternalName),
                         Stream.of(implementedInterfaces).map(Type::getInternalName))
                 .toArray(n -> new String[n]);
  }

  /**
   * Propagates {@link VariableReference}s from this function to a nested function
   * specified
   * 
   * @param mv
   * @param generatedFunctionClassInternalName
   * @param fieldType
   * @param functionFieldName                  name of the field to have its
   *                                           variables injected from this one
   * @param variables
   */
  protected void
            initializeReferencedFunctionVariableReferences(MethodVisitor mv,
                                                           String generatedFunctionClassInternalName,
                                                           String fieldType,
                                                           String functionFieldName,
                                                           Stream<OrderedPair<String,
                                                                         Class<?>>> variables)
  {
    String typeDesc = String.format("L%s;", fieldType);

    variables.forEach(variable ->
    {
      var variableFieldName           = variable.getLeft();
      var variableFieldTypeDescriptor = variable.getRight().descriptorString();
      getField(loadThisOntoStack(mv),
               generatedFunctionClassInternalName,
               functionFieldName,
               typeDesc);
      getField(loadThisOntoStack(mv),
               generatedFunctionClassInternalName,
               variableFieldName,
               variableFieldTypeDescriptor);
      putField(mv, fieldType, variableFieldName, variableFieldTypeDescriptor);
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

  public TextTree<Node<D, C, F>> inspect(F f)
  {
    return new TextTree<>(syntaxTree(),
                          f);
  }

  public F instantiate()
  {

    if (trace)
    {
      System.err.format("\nInstantiating %s\n", this);
    }
    instance = newInstance();
    if (trace)
    {
      System.err.format("\nInjecting references %s\n", this);
    }

    injectReferences(instance);

    return instance;
  }

  protected void invokeInitializationMethod(MethodVisitor mv,
                                            Expression<Object, Object, Function<?, ?>> function)
  {
    duplicateTopOfTheStack(mv);
    Compiler.invokeMethod(mv, function.className, "initialize", "()V", false);
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

  protected boolean isIdentifierCharacter()
  {
    return isAlphabeticalGreekSpecialOrBlackLetter(character, false) || isSubscript(character)
                  || isSuperscript(character);
  }

  public boolean isNullaryFunction()
  {
    return domainType.equals(Object.class);
  }

  protected MethodVisitor
            loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, Class<?> fieldType)
  {
    if (verboseTrace)
    {
      System.out.format("Expression(#%s).loadFieldOntoStack(fieldName=%s, fieldDescriptor=%s)\n",
                        System.identityHashCode(this),
                        fieldName,
                        fieldType.descriptorString());
    }
    assert fieldName != null : "fieldName is null";
    assert fieldType != null : "fieldType is null";

    methodVisitor.visitFieldInsn(GETFIELD, className, fieldName, fieldType.descriptorString());
    return methodVisitor;
  }

  public MethodVisitor
         loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, String fieldDescriptor)
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
    methodVisitor.visitFieldInsn(GETFIELD,
                                 className,
                                 indexFieldName,
                                 Integer.class.descriptorString());
    return methodVisitor;
  }

  public MethodVisitor loadThisFieldOntoStack(MethodVisitor mv, String name, Class<?> referenceType)
  {
    return loadFieldOntoStack(loadThisOntoStack(mv), name, referenceType);
  }

  public Expression<D, C, F> merge(Node<?, ?, ?> node)
  {
    var nodeExpression = node.expression;
    initializers.addAll(nodeExpression.initializers);
    context.mergeFrom(nodeExpression.context);
    return this;
  }

  protected Node<D, C, F> multiplyAndDivide(Node<D, C, F> node)
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

  public boolean needsInitializer()
  {
    return (context != null && !context.variables.isEmpty()) || !initializers.isEmpty()
                  || (dependencies != null && !dependencies.isEmpty()) || recursive
                  || !referencedFunctions.isEmpty();
  }

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
    else if (ComplexFunction.class.equals(coDomainType))
    {
      funcDomain   = Complex.class;
      funcCoDomain = Complex.class;
      funcClass    = ComplexFunction.class;
    }
    else if (RealToComplexFunction.class.equals(coDomainType))
    {
      funcDomain   = Real.class;
      funcCoDomain = Complex.class;
      funcClass    = RealToComplexFunction.class;
    }
    else
    {
      throw new UnsupportedOperationException("TODO: implement "
                                              + coDomainType
                                              + " codomain functional");
    }

    var functionalExpression = new Expression<Object, Object, Function<?, ?>>(funcDomain,
                                                                              funcCoDomain,
                                                                              funcClass);
    functionalExpression.ascendentExpression = this;
    functionalExpression.context             = context;
    if (indeterminateVariable != null)
    {
      functionalExpression.independentVariable =
                                               indeterminateVariable.spliceInto(functionalExpression)
                                                                    .asVariable();
    }
    rootNode.isResult                      = true;
    functionalExpression.rootNode          = rootNode.spliceInto(functionalExpression);
    functionalExpression.rootNode.isResult = true;
    functionalExpression.className         = className + "func";
    return functionalExpression;
  }

  private F newInstance()
  {
    if (compiledClass == null)
    {
      compile();
    }
    try
    {
      return instance = compiledClass.getDeclaredConstructor().newInstance();
    }
    catch (Exception e)
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

  public String newIntermediateVariable(String prefix, Class<?> type, boolean initialize)
  {
    assert prefix != null : "name shan't be null";
    var intermediateVarName = getNextIntermediateVariableFieldName(prefix, type);
    return registerIntermediateVariable(intermediateVarName, type, initialize);
  }

  public LiteralConstantNode<D, C, F> newLiteralConstant(int i)
  {
    return new LiteralConstantNode<>(this,
                                     java.lang.Integer.toString(i));
  }

  public LiteralConstantNode<D, C, F> newLiteralConstant(String i)
  {
    return new LiteralConstantNode<>(this,
                                     i);
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
    character = (++position < expression.length()) ? expression.charAt(position)
                                                   : Character.MIN_VALUE;

    return character;
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

  public Expression<D, C, F> optimize()
  {
    if (trace)
    {
      rootNode.accept(node -> System.out.println("node=" + node + " " + node.getFieldName()));
    }
    return this;

  }

  public ElseNode<D, C, F> otherwise()
  {
    return new ElseNode<D, C, F>(this);
  }

  /**
   * @return this{@link #parseName(int)}(this{@link #position})
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
    while ((isLatinOrGreek = isAlphabeticalGreekSpecialOrBlackLetter(character, true))
                  || (entirelySubscripted && !isLatinOrGreek && Parser.isSubscript(character))
                  || (entirelySuperscripted && !isLatinOrGreek && Parser.isSuperscript(character)))
    {
      nextCharacter();
      if (isLatinOrGreek)
      {
        entirelySubscripted = false;
      }
    }
    var substring = expression.substring(startPos, position).trim();
    return Parser.subscriptAndSuperscriptsToRegular(substring);
  }

  /**
   * Calls this{@link #evaluateOptionalIndependentVariableSpecification()} before
   * calling this{@link #resolve()} and assigning the result to
   * this{@link #rootNode}
   * 
   * @return this
   * @throws CompilerException
   */
  public <E extends Expression<D, C, F>> E parseRoot()
  {
    assert rootNode
                  == null : "parse must only be called before anything else has been parsed but rootNode="
                            + rootNode;
    evaluateOptionalIndependentVariableSpecification();
    nextCharacter();
    if (log.isDebugEnabled())
    {
      log.debug("parseRoot expression='{}' of Expression(#%s)\n",
                expression,
                System.identityHashCode(this));
    }

    rootNode = resolve().simplify();
    assert rootNode != null : "evaluateRootNode: determine() returned null, expression='"
                              + expression
                              + "'";
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

  public void propagateContextFunctionsToFunctionalElement(MethodVisitor mv,
                                                           Expression<Object,
                                                                         Object,
                                                                         Function<?, ?>> function)
  {
    context.functionEntryStream()
           .filter(entry -> function.referencedFunctions.containsKey(entry.getKey())
                         && !functionName.equals(entry.getKey()))
           .forEach(entry -> propagateContextFunctionToFunctionalElement(mv, function, entry));
  }

  protected void propagateContextFunctionToFunctionalElement(MethodVisitor mv,
                                                             Expression<Object,
                                                                           Object,
                                                                           Function<?, ?>> function,
                                                             Map.Entry<String,
                                                                           FunctionMapping<?,
                                                                                         ?,
                                                                                         ?>> entry)
  {
    var fieldName = entry.getKey();
    var fieldType = entry.getValue().functionClass;
    loadThisFieldOntoStack(duplicateTopOfTheStack(mv), fieldName, fieldType);
    putField(mv, function.className, fieldName, fieldType);
  }

  protected void
            propagateContextVariablesAndFunctionsToFunctionalElement(MethodVisitor mv,
                                                                     Expression<Object,
                                                                                   Object,
                                                                                   Function<?,
                                                                                                 ?>> function)
  {
    propagateContexVariablesToFunctionalElement(mv, function);
    propagateContextFunctionsToFunctionalElement(mv, function);
  }

  public void propagateContexVariablesToFunctionalElement(MethodVisitor mv,
                                                          Expression<Object,
                                                                        Object,
                                                                        Function<?, ?>> function)
  {
    for (var entry : context.variables.map.entrySet())
    {
      var fieldName = entry.getKey();
      var fieldType = entry.getValue().getClass();
      loadThisFieldOntoStack(duplicateTopOfTheStack(mv), fieldName, fieldType);
      putField(mv, function.className, fieldName, fieldType);
    }
  }

  protected void
            propagateIndependentVariableToFunctionalElement(MethodVisitor mv,
                                                            Expression<?,
                                                                          ?,
                                                                          Function<?, ?>> function,
                                                            VariableNode<?,
                                                                          ?,
                                                                          Function<?,
                                                                                        ?>> independentVariableMappedToFunctional)
  {
    var fieldName = independentVariableMappedToFunctional.getName();
    duplicateTopOfTheStack(mv);
    independentVariable.generate(mv, domainType);
    putField(mv, function.className, fieldName, domainType);
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

  public Expression<D, C, F> registerInitializer(Consumer<MethodVisitor> consumer)
  {
    initializers.add(consumer);
    return this;
  }

  public String
         registerIntermediateVariable(String intermediateVarName, Class<?> type, boolean initialize)
  {
    assert !type.isInterface() : "cannot instantiate interface " + type;

    if (!isFunctional())
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
//      System.err.format("hmm %s type=%s initial=%s\n", implementedInterfaces, type, initialize);
      // if the coDomain is a functon, then it will be an interface and thus
      // no intermediate variables will be declare in this class, but only declared in
      // the class that will be returned
      return null;
    }

    return intermediateVarName;
  }

  public String remaining()
  {
    return expression == null ? null
                              : expression.substring(Math.max(0, position), expression.length());
  }

  protected void rename(String from, String to)
  {
    if (trace)
    {
      err.format("Expression(#%s).rename(from=%s, to=%s)\n",
                 System.identityHashCode(this),
                 from,
                 to);
    }
    if (independentVariable != null)
    {
      independentVariable.renameIfNamed(from, to);
    }
    if (indeterminateVariable != null)
    {
      indeterminateVariable.renameIfNamed(from, to);
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

  protected <N extends Node<D, C, F>> N resolveFactorials(N node)
  {
    if (nextCharacterIs('!'))
    {
      return (N) new FactorialNode<D, C, F>(this,
                                            node);
    }
    if (nextCharacterIs('₍'))
    {
      return (N) new AscendingFactorializationNode<D, C, F>(node,
                                                            resolve(),
                                                            require('₎'));
    }
    if (nextCharacterIs('⋰'))
    {
      return (N) new AscendingFactorializationNode<D, C, F>(node,
                                                            resolve(),
                                                            this);
    }

    return node;
  }

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
    case "diff":
      return new DerivativeNode<D, C, F>(this,
                                         true);
    case "int":
      return new IntegralNode<D, C, F>(this,
                                       true);
    case "J":
      return new BesselFunctionNodeOfTheFirstKind<>(this);
    case "W":
      return new LambertWFunctionNode<>(this);
    case "j":
      return new SphericalBesselFunctionNodeOfTheFirstKind<>(this);
    case "R":
      return new LommelPolynomialNode<>(this);
    case "ℭ":
    case "binom":
    case "binomial":
      return new BinomialCoefficientNode<>(this);
    case "pFq":
    case "pfq":
      return new HypergeometricFunctionNode<>(this);
    case "Beta":
    case "beta":
      return new BetaFunctionNode<D, C, F>(this);
    default:

      // Regular function call with parentheses
      return new FunctionNode<>(reference.name,
                                resolve(),
                                require(')'));
    }
  }

  Node<D, C, F> resolveFunctionDerivative(int startPos, VariableReference<D, C, F> reference)
  {
    return require('(').resolveFunction(startPos, reference).differentiate();
  }

  Node<D, C, F> resolveFunctionSecondDerivative(int startPos, VariableReference<D, C, F> reference)
  {
    return resolveFunctionDerivative(startPos, reference).differentiate();
  }

  protected Node<D, C, F> resolveIdentifier() throws CompilerException
  {
    int startPos  = position;
    var reference = evaluateVariableReference(startPos);

    if (nextCharacterIs('('))
    {
      return resolveFunction(startPos, reference);
    }

    if (nextCharacterIs(COMBINING_DOT_ABOVE))
    {
      return resolveFunctionDerivative(startPos, reference);
    }

    if (nextCharacterIs(COMBINING_TWO_DOTS_ABOVE))
    {
      return resolveFunctionSecondDerivative(startPos, reference);
    }

    return resolveSymbolicLiteralConstantKeywordOrVariable(startPos, reference);
  }

  protected Node<D, C, F> resolvePostfixOperators(Node<D, C, F> node)
  {
    node = resolveFactorials(node);
    node = resolveFloor(node);
    node = resolveAbsoluteValue(node);
    if (nextCharacterIs('('))
    {
      node = new FunctionalEvaluationNode<D, C, F>(this,
                                                   node);
    }
    return node;
  }

  protected Node<D, C, F>
            resolveSymbolicLiteralConstantKeywordOrVariable(int startPos,
                                                            VariableReference<D, C, F> reference)
  {
    if (reference.isLiteralConstant())
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

  public MethodVisitor setThisField(MethodVisitor mv, String fieldName, Class<?> fieldType)
  {
    putField(mv, className, fieldName, fieldType);
    return mv;
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

    instructions = ((ClassWriter) classVisitor).toByteArray();

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

  public <E, S, G extends Function<? extends E, ? extends S>>
         Expression<D, C, F>
         substitute(String variableToChange, Node<E, S, G> substitution)
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

  public ExpressionTree<D, C, F> syntaxTree()
  {
    return new ExpressionTree<D, C, F>(rootNode);
  }

  public boolean thisOrAnyAscendentExpressionHasIndeterminateVariable()
  {
    if (indeterminantTypes.contains(coDomainType))
    {
      return true;
    }
    return ascendentExpression != null
                  && ascendentExpression.thisOrAnyAscendentExpressionHasIndeterminateVariable();
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

    throw new CompilerException(format("Expecting %s %s at position %d but got char '%c' instead in expr='%s', remaining=%s%s\n",
                                       which.length > 1 ? "one of" : "",
                                       result,
                                       position,
                                       character == 0 ? '0' : character,
                                       expression,
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
    if (functionName != null && !functionName.startsWith("_")
                  && !functionName.startsWith("operand"))
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

  protected MethodVisitor visitEvaluationMethod(ClassVisitor classVisitor)
  {
    return classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                    "evaluate",
                                    evaluationMethodDescriptor,
                                    getEvaluationMethodSignature(),
                                    null);
  }

  protected Expression<D, C, F> writeBytecodes(File file)
  {
    try
    {
      if (!file.getParentFile().exists())
      {
        file.getParentFile().mkdir();
      }
      Files.write(file.toPath(), instructions);
    }
    catch (IOException e)
    {
      Utensils.throwOrWrap(e);
    }
    return this;
  }

}
