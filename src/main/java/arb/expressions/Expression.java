package arb.expressions;

import static arb.expressions.Compiler.*;
import static arb.expressions.Parser.isAlphabetical;
import static arb.expressions.Parser.isAlphabeticalOrNumericSubscript;
import static arb.expressions.Parser.isAlphabeticalSuperscript;
import static arb.expressions.Parser.isLatinGreekOrSpecial;
import static arb.expressions.Parser.isNumeric;
import static arb.utensils.Utensils.wrapOrThrow;
import static java.lang.String.format;
import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.*;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.objectweb.asm.*;
import org.objectweb.asm.signature.SignatureWriter;
import org.objectweb.asm.util.TraceClassVisitor;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.nodes.*;
import arb.expressions.nodes.binary.*;
import arb.expressions.nodes.nary.NAryOperation;
import arb.expressions.nodes.nary.Product;
import arb.expressions.nodes.nary.Sum;
import arb.expressions.nodes.unary.*;
import arb.functions.Function;
import arb.functions.NullaryFunction;
import arb.functions.sequences.Sequence;
import arb.utensils.Utensils;
import arb.utensils.text.trees.TextTree;
import arb.utensils.text.trees.TreeModel;
import arb.viz.ArbShellExecutionController;

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
 * an Abstract Syntax Tree (AST), where each {@link Node} represents a
 * {@link BinaryOperation}, {@link UnaryOperation}, {@link NAryOperation}, such
 * as {@link Addition} , {@link Subtraction}, {@link Multiplication}, and
 * {@link Division} or its operands like {@link Variable} and
 * {@link LiteralConstant}, etc. This {@link TreeModel} structure allows the
 * class to correctly manage operator precedence and associativity rules
 * inherent in mathematical expressions and facilitate their printing via the
 * {@link TextTree}. The AST is then traversed to generate the corresponding
 * Java bytecode, which can be executed to evaluate the expression.
 *
 * <h2>Key Features:</h2>
 * <ul>
 * <li>Dynamically compiles mathematical expressions into executable Java
 * bytecode, allowing for efficient evaluation.</li>
 * <li>Supports {@link Variable}, {@link LiteralConstant}, and
 * {@link FunctionCall}s within {@link Expression}, providing an extensive set
 * of features for constructing elaborate expressions, linked together via a
 * shared Context in which variables and other functions are registered for
 * mutual accessibility..</li>
 * <li>Effectively manages {@link IntermediateVariable} and
 * {@link LiteralConstant}, optimizing memory usage and performance.</li>
 * <li>Automatically injects {@link VariableReference}s to {@link Variable} and
 * {@link Function}s into the compiled bytecode, facilitating dynamic
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
 * compiled classes should be saved for inspection. Default is
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
 * @param <D> The domain type over which the expression operates, such as
 *            {@link Integer}, {@link Real}, {@link Complex},
 *            {@link RealPolynomial}, etc
 * @param <C> The codomain type that the expression evaluates to, representing
 *            the result of the expression.
 * @param <F> The function type of the expression, extending the
 *            {@link Function} interface, encapsulating the compiled expression
 *            as an evaluatable function in the sense of the Java
 * 
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne for the terms of use of the
 *      {@link TheArb4jLibrary}
 */
public class Expression<D, C, F extends Function<? extends D, ? extends C>> implements Typesettable
{

  private static final String                           ASSERTION_ERROR_METHOD_DESCRIPTOR = Compiler.getMethodDescriptor(Void.class,
                                                                                                                         Object.class);

  public static final String                            VOID_METHOD_DESCRIPTOR            = Compiler.getMethodDescriptor(Void.class);

  public static final Class<?>[]                        implementedInterfaces             = new Class[]
  { Typesettable.class, AutoCloseable.class, Initializable.class };

  public static final String                            evaluationMethodDescriptor        = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public static boolean                                 ignoreTODO                        = true;

  public static final String                            IS_INITIALIZED                    = "isInitialized";

  public static final String                            nameOfInitializerFunction         = "initialize";

  public static boolean                                 saveClasses                       = Boolean.valueOf(System.getProperty("arb4j.compiler.saveClasses",
                                                                                                                               "true"));

  public static boolean                                 trace                             = Boolean.valueOf(System.getProperty("arb4j.compiler.traceGeneration",
                                                                                                                               "false"));

  public Expression<?, ?, ?>                            ascendentExpression;

  public char                                           character                         = 0;

  public String                                         className;

  public Class<F>                                       compiledClass;

  int                                                   constantCount                     = 1;

  public Context                                        context;

  public final String                                   domainClassDescriptor;

  public final String                                   domainClassInternalName;

  public final Class<? extends D>                       domainType;

  public final String                                   evaluateMethodSignature;

  public String                                         expression;

  public Class<? extends F>                             functionClass;

  public String                                         functionClassDescriptor;

  public String                                         functionName;

  public final String                                   genericFunctionClassInternalName;

  public Variable<D, C, F>                              independentVariable;

  public Variable<D, C, F>                              indeterminateVariable;

  public F                                              instance;

  public byte[]                                         instructionByteCodes;

  public HashMap<String, IntermediateVariable<D, C, F>> intermediateVariables             = new HashMap<>();

  public HashMap<String, LiteralConstant<D, C, F>>      literalConstants                  = new HashMap<>();

  public FunctionMapping<D, C, F>                       mapping;

  public int                                            position                          = -1;

  public char                                           previousCharacter;

  public final String                                   coDomainClassDescriptor;

  public final String                                   coDomainClassInternalName;

  public final Class<? extends C>                       coDomainType;

  public boolean                                        recursive                         = false;

  public HashMap<String, FunctionMapping<?, ?, ?>>      referencedFunctions               = new HashMap<>();

  public HashMap<String, Variable<D, C, F>>             referencedVariables               = new HashMap<>();

  public Node<D, C, F>                                  rootNode;

  public Variables                                      variables;

  public boolean                                        variablesDeclared                 = false;

  boolean                                               verboseTrace                      = false;

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

  static
  {
    assert arb.functions.sequences.Sequence.class.equals(Sequence.class) : "you forgot to import arb.functions.sequences.Sequence or imported a class named sequence in another package";
  }

  public Expression(String className,
                    Class<? extends D> class1,
                    Class<? extends C> class2,
                    Class<? extends F> class3,
                    String expression,
                    Context context,
                    String functionName,
                    Expression<?, ?, ?> parentExpression)
  {
    assert className != null : "className needs to be specified";
    this.ascendentExpression              = parentExpression;
    this.coDomainClassDescriptor          = class2.descriptorString();
    this.domainClassDescriptor            = class1.descriptorString();
    this.className                        = className;
    this.domainType                       = class1;
    this.coDomainType                     = class2;
    this.functionClass                    = class3;
    this.coDomainClassInternalName        = Type.getInternalName(class2);
    this.domainClassInternalName          = Type.getInternalName(class1);
    this.genericFunctionClassInternalName = Type.getInternalName(class3);
    this.functionClassDescriptor          = class3.descriptorString();
    this.expression                       = Parser.replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(expression);
    this.context                          = context;
    this.variables                        = context != null ? context.variables : null;
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

  public Node<D, C, F> addAndSubtract(Node<D, C, F> node)
  {
    while (true)
    {
      if (nextCharacterIs('+', '₊'))
      {
        node = new Addition<>(this,
                              node,
                              exponentiateMultiplyAndDivide());
      }
      else if (nextCharacterIs('-', '₋', '−'))
      {
        // assert node != null : "TODO: map this to the neg function instead of filling
        // in 0";
        if (node == null)
        {
          node = new Negation<>(this,
                                exponentiateMultiplyAndDivide());
        }
        else
        {
          node = new Subtraction<>(this,
                                   node,
                                   exponentiateMultiplyAndDivide());
        }
      }
      else
      {
        return node;
      }
    }
  }

  public void addCheckForNullField(MethodVisitor mv, String varName, boolean variable)
  {
    Class<?> fieldClass;
    if (variable)
    {
      Object field = context.getVariable(varName);
      if (field == null)
      {
        if (varName != null && independentVariable != null && !varName.equals(independentVariable.reference.name))
        {
          if (ascendentExpression != null && ascendentExpression.independentVariable != null
                        && varName.equals(ascendentExpression.independentVariable.reference.name))
          {
            assert ignoreTODO : "TODO: add check for null superexpression input here: " + ascendentExpression;
          }
          else
          {
            assert ignoreTODO : "no contextual variable for varName='" + varName + "'";
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

  public void addChecksForNullVariableReferences(MethodVisitor mv)
  {
    if (context != null)
    {
      context.variableClassStream()
             .forEach(entry -> addCheckForNullField(loadThisOntoStack(mv), entry.getLeft(), true));
    }
  }

  public String allocateIntermediateVariable(MethodVisitor methodVisitor, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  public String allocateIntermediateVariable(MethodVisitor methodVisitor, String prefix, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(prefix, type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  public MethodVisitor annotateWith(MethodVisitor methodVisitor, Class<? extends Annotation> annotation)
  {
    AnnotationVisitor av = methodVisitor.visitAnnotation(annotation.descriptorString(), true);
    av.visitEnd();
    return methodVisitor;
  }

  public MethodVisitor annotateWithOverride(MethodVisitor methodVisitor)
  {
    return annotateWith(methodVisitor, Override.class);
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

  public ClassVisitor constructClassVisitor()
  {
    // ClassVisitor cw = new ClassWriter(ClassWriter.COMPUTE_MAXS);
    ClassVisitor cw = new ClassWriter(ClassWriter.COMPUTE_FRAMES);
    return cw;
  }

  public ClassVisitor declareConstants(ClassVisitor classVisitor)
  {
    for (var constant : literalConstants.values())
    {
      constant.declareField(classVisitor);
    }
    return classVisitor;
  }

  public MethodVisitor
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

  public void declareFields(ClassVisitor cw)
  {
    cw.visitField(Opcodes.ACC_PUBLIC, IS_INITIALIZED, "Z", null, null);

    declareConstants(cw);

    declareVariables(cw);

    declareIntermediateVariables(cw);

    declareFunctionReferences(cw);
  }

  public ClassVisitor declareFunctionReferences(ClassVisitor classVisitor)
  {
    if (context != null)
    {
      referencedFunctions.forEach((name, function) -> function.declare(classVisitor, name));
    }
    return classVisitor;
  }

  public void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    for (var variable : intermediateVariables.values())
    {
      variable.declareField(classVisitor);
    }
  }

  public void declareVariableEntry(ClassVisitor classVisitor, Entry<String, Object> variable)
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

  public void declareVariables(ClassVisitor classVisitor)
  {
    // assert !variablesDeclared : "variables have already been declared";
    if (ascendentExpression != null)
    {
      var parentIndependentVariableNode = ascendentExpression.independentVariable;
      if (parentIndependentVariableNode != null && !parentIndependentVariableNode.type().equals(Object.class))
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

  public Class<F> defineClass()
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
   * @return a parenthetical {@link Node}, a {@link Product}, a
   *         {@link LiteralConstant},a {@link Function}, a {@link Variable} or
   *         null if for instance "-t" is encountered, as a 0 is implied by the
   *         absence of a node before the {@link Subtraction} operator is
   *         encountered, also handles {@link Product} also known as the product
   *         operator and {@link Sum}
   * 
   * @throws CompilerException
   */
  public Node<D, C, F> evaluate() throws CompilerException
  {
    Node<D, C, F> node = null;

    if (nextCharacterIs('['))
    {
      node = new Vector<>(this);
    }
    else if (nextCharacterIs('('))
    {
      node = resolve();
      require(')');
    }
    else if (nextCharacterIs('∫'))
    {
      node = new Integral<>(this);
    }
    else if (nextCharacterIs('Π', '∏'))
    {
      node = new Product<>(this);
    }
    else if (nextCharacterIs('∑', 'Σ'))
    {
      node = new Sum<>(this);
    }
    else if (isNumeric(character))
    {
      node = evaluateNumber();
    }
    else if (isIdentifier())
    {
      node = resolveIdentifier();
    }

    return resolvePostfixOperators(node);
  }

  /**
   * @return true if this{@link #character} any of
   *         {@link Parser#isLatinGreekOrSpecial(char, boolean)},
   *         {@link Parser#isAlphabeticalSuperscript(char)} or
   *         {@link Parser#isAlphabeticalOrNumericSubscript(char)} are true
   */
  public boolean isIdentifier()
  {
    return isLatinGreekOrSpecial(character, false) || isAlphabeticalOrNumericSubscript(character)
                  || isAlphabeticalSuperscript(character);
  }

  public Node<D, C, F> evaluateIndex()
  {
    var index = evaluateSquareBracketedIndex();
    return index == null ? index = evaluateSubscriptedIndex() : index;
  }

  public VariableReference<D, C, F> evaluateName(int startPos)
  {
    String identifier = parseName(startPos);
    var    index      = evaluateIndex();
    return new VariableReference<D, C, F>(identifier,
                                          index);
  }

  public Node<D, C, F> evaluateNumber()
  {
    int startingPosition = position;
    while (isNumeric(character))
    {
      nextCharacter();
    }

    return new LiteralConstant<>(this,
                                 expression.substring(startingPosition, position));
  }

  public Expression<D, C, F> evaluateOptionalIndependentVariableSpecification()
  {
    int rightArrowIndex = (expression = expression.replace("->", "➔")).indexOf('➔');
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
        var variable = new Variable<>(this,
                                      new VariableReference<>(inputVariableName,
                                                              null,
                                                              domainType),
                                      position,
                                      false);

        if (isNullaryPolynomialFunction())
        {
          indeterminateVariable               = variable;
          indeterminateVariable.isIndetermate = true;
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

  public Node<D, C, F> evaluateSquareBracketedIndex()
  {
    Node<D, C, F> index = null;
    if (nextCharacterIs('['))
    {
      index = resolve();
      require(']');
    }
    return index;
  }

  public Node<D, C, F> evaluateSubscriptedIndex()
  {
    if (nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
    {
      if (!nextCharacterIs(Parser.SUBSCRIPT_DIGITS_ARRAY))
      {
        return new LiteralConstant<>(this,
                                     String.valueOf(previousCharacter));
      }
      else
      {
        throw new CompilerException(String.format("TODO: handle subscripted index starting with"
                      + " lastCharacter=%c this could be either a numeric literal constant or a "
                      + "alphanumeric variable reference"));
      }
    }
    else
    {
      return null;
    }
  }

  public Node<D, C, F> exponentiate() throws CompilerException
  {
    return exponentiate(evaluate());
  }

  public Node<D, C, F> exponentiate(Node<D, C, F> node) throws CompilerException
  {
    if (nextCharacterIs('^'))
    {
      final boolean parenthetical = nextCharacterIs('(');
      node = new Exponentiation<>(this,
                                  node,
                                  parenthetical ? resolve() : evaluate());
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
  public Node<D, C, F> exponentiateMultiplyAndDivide()
  {
    var node = exponentiate();
    return multiplyAndDivide(node);
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
    if (trace)
    {
      System.err.format("Expression(#%s).generate() className=%s\n\n", System.identityHashCode(this), className);
    }
    ClassVisitor classVisitor = constructClassVisitor();

    try
    {
      generateFunctionInterface(this, className, classVisitor);

      generateCoDomainTypeMethod(classVisitor);

      generateEvaluationMethod(classVisitor);

      declareFields(classVisitor);

      generateConstructor(classVisitor);

      generateInitializationMethod(classVisitor);

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

    return storeInstructions(classVisitor);
  }

  /**
   * TODO: See how this can be intetegrated with
   * {@link ArbShellExecutionController} via
   * 
   * @param classVisitor
   * @return
   */
  public Expression<D, C, F> storeInstructions(ClassVisitor classVisitor)
  {
    if (classVisitor instanceof TraceClassVisitor)
    {
      classVisitor = ((TraceClassVisitor) classVisitor).getDelegate();
    }

    instructionByteCodes = ((ClassWriter) classVisitor).toByteArray();

    if (saveClasses)
    {
      File file = new File(className + ".class");
      writeBytecodes(file);
    }
    return this;
  }

  public MethodVisitor generateCloseFieldCall(MethodVisitor methodVisitor, String fieldName, Class<?> fieldType)
  {
    getFieldFromThis(methodVisitor, className, fieldName, fieldType);
    return invokeCloseMethod(methodVisitor, fieldType);
  }

  public ClassVisitor generateCloseMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = defineMethod(classVisitor, "close", VOID_METHOD_DESCRIPTOR);

    methodVisitor.visitCode();

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

    methodVisitor.visitInsn(Opcodes.RETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();

    return classVisitor;
  }

  public void generateCodeToSetIsInitializedToTrue(MethodVisitor methodVisitor)
  {
    loadThisOntoStack(methodVisitor).visitInsn(Opcodes.ICONST_1);
    methodVisitor.visitFieldInsn(PUTFIELD, className, IS_INITIALIZED, "Z");
  }

  public void generateCodeToThrowErrorIfAlreadyInitialized(MethodVisitor mv)
  {
    loadThisOntoStack(mv);
    mv.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    var alreadyInitializedLabel = new Label();

    mv.visitJumpInsn(IFEQ, alreadyInitializedLabel);

    mv.visitTypeInsn(NEW, "java/lang/AssertionError");
    duplicateTopOfTheStack(mv).visitLdcInsn("Already initialized");
    mv.visitMethodInsn(INVOKESPECIAL,
                       "java/lang/AssertionError",
                       "<init>",
                       ASSERTION_ERROR_METHOD_DESCRIPTOR,
                       false);
    mv.visitInsn(ATHROW);
    mv.visitLabel(alreadyInitializedLabel);

  }

  public void generateConditionalInitializater(MethodVisitor mv)
  {
    loadThisOntoStack(mv);
    mv.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    var alreadyInitialized = new Label();
    mv.visitJumpInsn(Opcodes.IFNE, alreadyInitialized);

    loadThisOntoStack(mv);
    mv.visitMethodInsn(INVOKEVIRTUAL, className, nameOfInitializerFunction, "()V", false);

    mv.visitLabel(alreadyInitialized);
  }

  public ClassVisitor generateConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor mv = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    generateInvocationOfDefaultNoArgConstructor(mv, true);

    if (trace)
    {
      System.err.println("referencedFunctions=" + referencedFunctions);
    }

    referencedFunctions.values()
                       .stream()
                       .filter(func -> func.functionName == null || functionName == null
                                     || !functionName.equals(func.functionName))
                       .filter(func -> func.expression != null)
                       .forEach(mapping -> generateFunctionInstance(mv, mapping));

    generateLiteralConstantInitializers(mv);

    generateIntermediateVariableInitializers(mv);

    mv.visitInsn(RETURN);
    mv.visitMaxs(10, 10);
    mv.visitEnd();
    return classVisitor;
  }

  public ClassVisitor generateEvaluationMethod(ClassVisitor classVisitor) throws CompilerException
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

    annotateWithOverride(mv);

    generateConditionalInitializater(mv);

    if (trace)
    {
      System.out.format("Expression(#%s) Generating %s\n\n", System.identityHashCode(this), expression);
    }
    rootNode.generate(coDomainType, mv);

    mv.visitInsn(Opcodes.ARETURN);

    mv.visitLabel(endLabel);

    declareEvaluateMethodsLocalVariableArguments(mv, startLabel, endLabel);

    mv.visitMaxs(10, 10);

    mv.visitEnd();

    return classVisitor;
  }

  public MethodVisitor generateFunctionInitializer(MethodVisitor mv, FunctionMapping<?, ?, ?> nestedFunction)
  {
    if (trace)
    {
      err.format("Expression.generateFunctionInitializer( nestedFunction=%s )\n\n", nestedFunction);
    }

    if (nestedFunction.instance != null)
    {
      initializeNestedFunctionVariableReferences(loadThisOntoStack(mv),
                                                 className,
                                                 Type.getInternalName(nestedFunction.type()),
                                                 nestedFunction.functionName,
                                                 context.variableClassStream());
    }
    else
    {
      referencedFunctions.put(nestedFunction.functionName, nestedFunction);

      if (!nestedFunction.functionName.equals(functionName))
      {
        throw new CompilerException("nestedFunction.func should not be null if its"
                      + " not the recursive function referring to itself, "
                      + String.format("nestedFunction.name=%s, name=%s\n",
                                      nestedFunction.functionName,
                                      functionName));

      }

    }

    return mv;
  }

  public void generateFunctionInstance(MethodVisitor mv, FunctionMapping<?, ?, ?> mapping)
  {
    Class<?> type = mapping.type();
    if (type == null)
    {
      mapping.instantiate();
      type = mapping.type();
    }
    assert type != null : "type is  null for mapping=" + mapping;
    loadThisOntoStack(mv);
    constructNewObject(mv, type);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, type);
    Compiler.putField(mv, className, mapping.functionName, type);
  }

  public MethodVisitor generateInitializationCode(MethodVisitor mv)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(mv);

    addChecksForNullVariableReferences(mv);

    referencedFunctions.values().forEach(mapping -> generateFunctionInitializer(mv, mapping));

    initializers.forEach(initializer -> initializer.accept(mv));

    if (recursive)
    {
      generateSelfReference(mv);
    }

    generateCodeToSetIsInitializedToTrue(mv);

    return mv;
  }

  public ClassVisitor generateInitializationMethod(ClassVisitor classVisitor)
  {
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC, nameOfInitializerFunction, "()V", null, null);
    annotateWithOverride(methodVisitor);

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
    for (var intermediateVariable : intermediateVariables.values())
    {
      intermediateVariable.generateInitializer(methodVisitor);
    }
    return methodVisitor;
  }

  public void generateInvocationOfDefaultNoArgConstructor(MethodVisitor methodVisitor, boolean object)
  {
    loadThisOntoStack(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  object ? Type.getInternalName(Object.class) : className.replace(".", "/"),
                                  "<init>",
                                  "()V",
                                  false);
  }

  public MethodVisitor generateLiteralConstantInitializers(MethodVisitor methodVisitor)
  {
    for (var literal : literalConstants.values())
    {
      literal.generateLiteralConstantInitializerWithString(methodVisitor);
    }
    return methodVisitor;
  }

  public ClassVisitor generateCoDomainTypeMethod(ClassVisitor classVisitor) throws CompilerException
  {

    MethodVisitor mv = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                "coDomainType",
                                                Compiler.getMethodDescriptor(Class.class),
                                                getCoDomainTypeMethodSignature(),
                                                null);

    annotateWithOverride(mv);

    mv.visitCode();
    mv.visitLdcInsn(Type.getType(coDomainType));
    mv.visitInsn(Opcodes.ARETURN);
    mv.visitMaxs(1, 0);
    mv.visitEnd();

    return classVisitor;
  }

  public MethodVisitor generateSelfReference(MethodVisitor mv)
  {
    loadThisOntoStack(mv);
    constructNewObject(mv, functionName);
    duplicateTopOfTheStack(mv);
    invokeDefaultConstructor(mv, functionName);
    Compiler.putField(mv, className, functionName, "L" + functionName + ";");

    initializeNestedFunctionVariableReferences(loadThisOntoStack(mv),
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

  public ClassVisitor generateToStringMethod(ClassVisitor classVisitor)
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

    String name  = functionName != null ? (functionName + ":") : "";
    String arrow = expression.contains("➔")
                  || independentVariable == null ? "" : (independentVariable.getName() + "➔");
    methodVisitor.visitLdcInsn(String.format("%s%s%s", name, arrow, expression.replace("sqrt", "√")));

    methodVisitor.visitInsn(Opcodes.ARETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();

    return classVisitor;
  }

  public ClassVisitor generateTypesetMethod(ClassVisitor classVisitor)
  {
    if (Expression.trace)
    {
      System.err.format("generateTypesetMethod(expression=%s)\n", expression);
    }

    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "typeset",
                                                 Compiler.getMethodDescriptor(String.class),
                                                 null,
                                                 null);

    annotateWithOverride(methodVisitor);

    methodVisitor.visitCode();

    methodVisitor.visitLdcInsn(typeset());

    methodVisitor.visitInsn(Opcodes.ARETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();

    return classVisitor;
  }

  public String getFunctionClassTypeSignature(Class<?> functionClass)
  {

    String classSignature;
    var    sw = new SignatureWriter();

    sw.visitSuperclass().visitClassType(Type.getInternalName(Object.class));
    sw.visitEnd();

    {
      sw.visitInterface();
      sw.visitClassType(Type.getInternalName(functionClass));
      if (Sequence.class.isAssignableFrom(functionClass) || NullaryFunction.class.isAssignableFrom(functionClass))
      {
        sw.visitTypeArgument('=').visitClassType(Type.getInternalName(coDomainType));
        sw.visitEnd();
      }
      else if (Function.class.isAssignableFrom(functionClass))
      {
        sw.visitTypeArgument('=').visitClassType(Type.getInternalName(domainType));
        sw.visitEnd();
        sw.visitTypeArgument('=').visitClassType(Type.getInternalName(coDomainType));
        sw.visitEnd();
      }

      sw.visitEnd();
    }

    for (var interfaceClass : implementedInterfaces)
    {
      sw.visitInterface();
      sw.visitClassType(Type.getInternalName(interfaceClass));

      sw.visitEnd();
    }
    classSignature = sw.toString();
    return classSignature;
  }

  public Variable<D, C, F> getIndependentVariable()
  {
    return independentVariable;
  }

  public String getInputName()
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

  Variable<D, C, F> getInputVariable()
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
    catch (Throwable e)
    {
      wrapOrThrow(e);
      return null;
    }
  }

  public String getNextConstantFieldName(Class<?> type)
  {
    return "c" + getVariablePrefix(type) + constantCount++;
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
    return prefix + counter.getAndIncrement();
  }

  public String getCoDomainTypeMethodSignature()
  {
    SignatureWriter sigWriter = new SignatureWriter();
    sigWriter.visitParameterType();
    sigWriter.visitReturnType();
    sigWriter.visitClassType(Type.getInternalName(Class.class));
    sigWriter.visitTypeArgument('=');
    sigWriter.visitClassType(Type.getInternalName(coDomainType));
    sigWriter.visitEnd();
    sigWriter.visitEnd();
    return sigWriter.toString();
  }

  public Class<?> getThisOrAnyAscendentExpressionsPolynomialCoDomain()
  {
    if (coDomainType.equals(RealPolynomial.class) || coDomainType.equals(ComplexPolynomial.class))
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
  public void initializeNestedFunctionVariableReferences(MethodVisitor mv,
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

  public void injectReferences(F f)
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
    F instance = getInstance();
    if (trace)
    {
      System.err.format("\nInjecting references %s\n", this);
    }

    injectReferences(instance);

    return instance;
  }

  public boolean isHypergeometricFunctionSymbolBeingUsedByAContextualFunction()
  {
    return context != null && context.functions.map.containsKey("F");
  }

  public boolean isNullaryPolynomialFunction()
  {
    return (domainType.equals(Object.class) && thisOrAnyAscendentExpressionHasPolynomialOrQuasiPolynomialCoDomain());
  }

  public MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, Class<?> fieldType)
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

  public MethodVisitor loadIndexField(MethodVisitor methodVisitor, String indexFieldName)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, indexFieldName, Integer.class.descriptorString());
    return methodVisitor;
  }

  public Node<D, C, F> multiplyAndDivide(Node<D, C, F> node)
  {
    while (true)
    {
      if (nextCharacterIs('*', '×', 'ₓ', '⋅'))
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
      else if (nextCharacterIs('ℭ'))
      {
        node = new BinomialCoeffecient<>(this,
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

  public String newIntermediateVariable(Class<?> type)
  {
    return newIntermediateVariable("", type);
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
    assert type != Object.class : "dont generate a variable for the Object type";
    var intermediateVarName = getNextIntermediateVariableFieldName(prefix, type);
    return registerIntermediateVariable(intermediateVarName, type, initialize);
  }

  public Variable<D, C, F> newVariable(int startPos, VariableReference<D, C, F> reference)
  {
    return new Variable<D, C, F>(this,
                                 reference,
                                 startPos,
                                 true);
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

  /**
   * expression.charAt(position)
   * 
   * @return
   */
  public String parseName()
  {
    return parseName(position);
  }

  public String parseName(int startPos)
  {
    boolean entirelySubscripted   = true;
    boolean entirelySuperscripted = true;
    boolean isLatinOrGreek;
    while ((isLatinOrGreek = isLatinGreekOrSpecial(character, true))
                  || (entirelySubscripted && !isLatinOrGreek && Parser.isAlphabeticalOrNumericSubscript(character))
                  || (entirelySuperscripted && !isLatinOrGreek && Parser.isAlphabeticalSuperscript(character)))
    {
      nextCharacter();
      if (isLatinOrGreek)
      {
        entirelySubscripted = false;
        entirelySubscripted = false;
      }
    }
    var substring = expression.substring(startPos, position);
    if (trace)

    {
      if (substring.equals("ln"))
      {
        // https://docs.oracle.com/javase/7/docs/api/java/lang/Character.html#unicode
        // dammit dammit sonofabitch
        err.println("substring=" + substring);
      }
    }
    return Utensils.subscriptToRegular(substring.trim());
  }

  /**
   * Calls this{@link #evaluateOptionalIndependentVariableSpecification()} before
   * calling this{@link #resolve()} and assigning the result to
   * this{@link #rootNode}
   * 
   * @return this
   * @throws CompilerException
   */
  public Expression<D, C, F> parseRoot()
  {
    assert rootNode == null : "parse must only be called before anything else has been parsed but rootNode="
                  + rootNode;
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
        throwNewUnexpectedCharacterException();
      }
    }
    return this;
  }

  public Node<D, C, F> parseSuperscript(Node<D, C, F> node, char superscript, String digit)
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

  public Node<D, C, F> parseSuperscripts(Node<D, C, F> node)
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

  public boolean references(VariableReference<D, C, F> reference)
  {
    return referencedVariables.containsKey(reference.name);
  }

  public String registerIntermediateVariable(String intermediateVarName, Class<?> type, boolean initialize)
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

    return intermediateVarName;
  }

  public String remaining()
  {
    return expression.substring(Math.max(0, position), expression.length());
  }

  public void rename(String from, String to)
  {
    if (trace)
    {
      err.format("Expression(#%s).rename(from=%s, to=%s)\n", System.identityHashCode(this), from, to);
    }
    renameIfNamed(independentVariable, from, to);
    renameIfNamed(indeterminateVariable, from, to);

  }

  public boolean renameIfNamed(Variable<D, C, F> thevar, String from, String to)
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
    if (!nextCharacterIs(which))
    {
      String result = Arrays.asList(which).stream().map(String::valueOf).collect(Collectors.joining());

      throw new CompilerException(format("Missing expected %s at position %d got char '%c' instead, remaining=%s\n",
                                         result,
                                         position,
                                         character == 0 ? '0' : character,
                                         remaining()));
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
  public Node<D, C, F> resolve()
  {
    var node = exponentiateMultiplyAndDivide();
    return addAndSubtract(node);
  }

  public Node<D, C, F> resolveFactorials(Node<D, C, F> node)
  {
    if (nextCharacterIs('!'))
    {
      return new Factorialization<>(this,
                                    node);
    }

    else if (nextCharacterIs('₍'))
    {
      return new AscendingFactorialization<>(node,
                                             resolve(),
                                             require('₎'));
    }
    else if (nextCharacterIs('⋰'))
    {
      return new AscendingFactorialization<>(node,
                                             resolve(),
                                             this);
    }
    else
    {
      return node;
    }
  }

  public boolean inAbsoluteValue = false;

  public Node<D, C, F> resolveAbsoluteValue(Node<D, C, F> node)
  {
    if (!inAbsoluteValue && nextCharacterIs('|'))
    {
      inAbsoluteValue = true;
      node            = new AbsoluteValue<D, C, F>(this,
                                                   resolve());
      require('|');
      inAbsoluteValue = false;
    }
    return node;
  }

  public Node<D, C, F> resolveFloor(Node<D, C, F> node)
  {
    if (nextCharacterIs('⌊'))
    {
      node = new Floor<D, C, F>(this,
                                resolve());
      require('⌋');
    }
    return node;
  }

  public Node<D, C, F> resolveFunction(int startPos, VariableReference<D, C, F> reference)
  {
    if (reference.isHypergeometricFunction() && !isHypergeometricFunctionSymbolBeingUsedByAContextualFunction())
    {
      return new HypergeometricFunction<>(this);
    }
    else if ("when".equals(reference.name))
    {
      return new When<>(this);
    }
    else if ("J".equals(reference.name))
    {
      return new BesselFunctionOfTheFirstKind<>(this);
    }

    return new FunctionCall<>(reference.name,
                              resolve(),
                              require(')'));

  }

  public Node<D, C, F> resolveIdentifier() throws CompilerException
  {
    final int startPos  = position;
    final var reference = evaluateName(startPos);

    if (nextCharacterIs('('))
    {
      return resolveFunction(startPos, reference);
    }
    else
    {
      return resolveSymbolicLiteralConstantsKeywordsAndVariables(startPos, reference);
    }
  }

  public Node<D, C, F> resolveSymbolicLiteralConstantsKeywordsAndVariables(int startPos,
                                                                           VariableReference<D, C, F> reference)
  {
    if (LiteralConstant.constantSymbols.contains(reference.name))
    {
      return new LiteralConstant<>(this,
                                   reference.name);
    }
    else
    {
      if (reference.isElse())
      {
        return new Else<D, C, F>(this);
      }
      else
      {
        return newVariable(startPos, reference);
      }
    }
  }

  public Node<D, C, F> resolvePostfixOperators(Node<D, C, F> node)
  {
    node = resolveFactorials(node);
    node = resolveFloor(node);
    node = resolveAbsoluteValue(node);
    return node;
  }

  public void skip(int n)
  {
    character = expression.charAt(position += n);
  }

  public void skipSpaces()
  {
    while (character == ' ')
    {
      nextCharacter();
    }
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
      context   = new Context();
      variables = context.variables;
    }

    if (Expression.trace)
    {
      System.err.format("Expression(#%s).substitute %s for %s into %s\n \n\n",
                        System.identityHashCode(this),
                        substitution,
                        variableToChange,
                        this);
    }

    Variable<E, S, G> substituteInputVariable     = substitution.getInputVariable();
    String            substituteInputVariableName = substituteInputVariable.getName();
    if (!variableToChange.equals(substituteInputVariableName))
    {
      substitution.rename(substituteInputVariableName, variableToChange);
    }

    rootNode = rootNode.substitute(variableToChange, substitution.rootNode);

    updateStringRepresentation();

    return this;
  }

  public TextTree<Node<D, C, F>> syntaxTextTree()
  {
    return new TextTree<>(syntaxTree());
  }

  public SyntaxTree<D, C, F> syntaxTree()
  {
    return new SyntaxTree<>(rootNode);
  }

  public boolean thisOrAnyAscendentExpressionHasPolynomialOrQuasiPolynomialCoDomain()
  {
    boolean isPolynomial = ascendentExpression != null
                  && ascendentExpression.thisOrAnyAscendentExpressionHasPolynomialOrQuasiPolynomialCoDomain();
    return coDomainType.equals(RealQuasiPolynomial.class) || coDomainType.equals(ComplexPolynomial.class)
                  || coDomainType.equals(RealPolynomial.class) || coDomainType.equals(ComplexPolynomial.class)
                  || isPolynomial;
  }

  public void throwNewUnexpectedCharacterException()
  {
    throw new CompilerException(String.format("unexpected '%s'(0x%x) character at position=%s in expression '%s' of length %d, remaining=%s\n",
                                              character,
                                              (int) character,
                                              position,
                                              expression,
                                              expression.length(),
                                              remaining()));

  }

  @Override
  public String toString()
  {
    if (Object.class.equals(domainType))
    {
      return rootNode != null ? rootNode.toString() : expression;
    }
    if (rootNode != null)
    {
      if (independentVariable == null)
      {
        return rootNode.toString();
      }
      else
      {
        return String.format("%s➔%s", independentVariable.getName(), rootNode.toString());
      }
    }
    else
    {
      return expression;
    }
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

  public Expression<D, C, F> writeBytecodes(File file)
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

  public String[] implementedInterfaces()
  {
    var ifaces = new ArrayList<>();
    ifaces.add(genericFunctionClassInternalName);
    for (var iface : implementedInterfaces)
    {
      ifaces.add(Type.getInternalName(iface));
    }
    return ifaces.toArray(new String[ifaces.size()]);
  }

  public LinkedList<Consumer<MethodVisitor>> initializers = new LinkedList<>();

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

  public Expression<D, C, F> putField(MethodVisitor mv, String fieldName, Class<?> fieldType)
  {
    Compiler.putField(mv, className, fieldName, fieldType);
    return this;
  }

  public MethodVisitor loadThisFieldOntoStack(MethodVisitor mv, String name, Class<?> referenceType)
  {
    return loadFieldOntoStack(loadThisOntoStack(mv), name, referenceType);
  }

  public boolean hasScalarCodomain()
  {
    return coDomainType.equals(Real.class) || coDomainType.equals(Complex.class);
  }

}
