package arb.expressions;

import static arb.expressions.Compiler.addNullCheckForField;
import static arb.expressions.Compiler.compile;
import static arb.expressions.Compiler.defineFunctionClass;
import static arb.expressions.Compiler.generateFunctionInterface;
import static arb.expressions.Compiler.getVariablePrefix;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static arb.expressions.Parser.isLatinOrGreek;
import static arb.expressions.Parser.isNumeric;
import static java.lang.String.format;
import static java.lang.System.out;
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
import java.io.PrintWriter;
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
import org.objectweb.asm.util.CheckClassAdapter;

import arb.ComplexPolynomial;
import arb.Field;
import arb.OrderedPair;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.exceptions.ExpressionCompilerException;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.expressions.nodes.binary.Addition;
import arb.expressions.nodes.binary.Division;
import arb.expressions.nodes.binary.Exponentiate;
import arb.expressions.nodes.binary.Multiplication;
import arb.expressions.nodes.binary.Subtraction;
import arb.expressions.nodes.unary.FunctionCall;
import arb.expressions.nodes.unary.When;
import arb.expressions.trace.FlushingTraceClassVisitor;
import arb.functions.Function;

/**
 * <p>
 * The <code>Expression</code> class in the <code>arb.expressions</code> package
 * is a versatile and dynamic expression compiler and evaluator which generates
 * high-performance {@link Function} implementations on-the-fly.
 *
 * <p>
 * Key features:
 * </p>
 * <ul>
 * <li>Compiles mathematical expressions dynamically into Java bytecodes.</li>
 * <li>Manages variables, constants, and function calls within expressions.</li>
 * <li>Handles intermediate variables and constants effectively.</li>
 * <li>Injects variable and function references into compiled instances.</li>
 * <li>Includes methods for parsing, evaluating, and generating necessary
 * bytecode for expressions.</li>
 * <li>Verbose mode for detailed logging during the compilation process.</li>
 * </ul>
 *
 * <p>
 * This class is integrated with other components of the <code>arb4j</code>
 * library, such as {@link Field}, {@link Function}, and various {@link Node}
 * types. It uses ASM's {@link MethodVisitor} and {@link ClassVisitor} for
 * bytecode generation.
 * </p>
 *
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * 
 * TODO: sum ⅀
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
  private static final String IS_INITIALIZED                    = "isInitialized";

  private static final String nameOfVariableInitializerFunction = "initializeVariableReferences";

  public static final String  evaluationMethodDescriptor        = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public static <D, R, F extends Function<D, R>> F instantiate(String expression,
                                                               Context context,
                                                               Class<? extends D> domainClass,
                                                               Class<? extends R> rangeClass,
                                                               Class<? extends F> functionClass,
                                                               boolean verbose,
                                                               String functionName)
  {
    FunctionMapping<?, ?> mapping = null;
    if (functionName != null)
    {
      mapping = context.registerFunctionMapping(functionName, null, domainClass, rangeClass, functionClass);
    }

    Expression<D, R, F> compiledExpression = compile(expression,
                                                     context,
                                                     domainClass,
                                                     rangeClass,
                                                     functionClass,
                                                     verbose,
                                                     functionName);
    F                   func               = compiledExpression.instantiate();
    if (mapping != null)
    {
      mapping.func = func;
    }

    if (verbose)
    {
      out.format("\ninstantiating $%s$\n\n", compiledExpression.rootNode.typeset());
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
    return compile(className, expression, context, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  public int                                      position              = -1;

  public int                                      ch                    = 0;

  public String                                   expression;

  public Variables                                variables;

  public String                                   className;

  final public Class<? extends D>                 domainType;

  final public Class<? extends R>                 rangeType;

  final public String                             domainClassDescriptor;

  final public String                             rangeClassDescriptor;

  final public String                             functionClassInternalName;

  public ArrayList<IntermediateVariable<D, R, F>> intermediateVariables = new ArrayList<>();

  int                                             constantCount         = 1;

  public ArrayList<LiteralConstant<D, R, F>>      literalConstants      = new ArrayList<>();

  public Variable<D, R, F>                        independentVariableNode;

  protected Method                                evaluateMethod;

  protected byte[]                                instructions;

  Class<F>                                        compiledClass;

  F                                               instance;

  public final String                             rangeClassInternalName;

  public final String                             domainClassInternalName;

  public Node<D, R, F>                            rootNode;

  public Class<? extends F>                       functionClass;

  public String                                   functionClassDescriptor;

  public HashMap<String, FunctionMapping<D, R>>   referencedFunctions   = new HashMap<>();

  public HashMap<String, Variable<D, R, F>>       referencedVariables   = new HashMap<>();

  public Context                                  context;

  public final String                             evaluateMethodSignature;

  public Variable<D, R, F>                        indeterminate;

  public String                                   functionName;

  boolean                                         save                  = false;

  boolean                                         checkClass            = false;

  public boolean                                  recursive             = false;

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
    this.rangeClassDescriptor      = rangeClass.descriptorString();
    this.domainClassDescriptor     = domainClass.descriptorString();
    this.className                 = className;
    this.domainType                = domainClass;
    this.rangeType                 = rangeClass;
    this.functionClass             = functionClass;
    this.rangeClassInternalName    = Type.getInternalName(rangeClass);
    this.domainClassInternalName   = Type.getInternalName(domainClass);
    this.functionClassInternalName = Type.getInternalName(functionClass);
    this.functionClassDescriptor   = functionClass.descriptorString();
    this.expression                = Parser.replaceSubscriptsAndArrows(expression);
    this.context                   = context;
    this.variables                 = context != null ? context.variables : null;
    evaluateMethodSignature        = String.format("(L%s;IIL%s;)L%s;",
                                                   domainClassInternalName,
                                                   rangeClassInternalName,
                                                   rangeClassInternalName);
    this.functionName              = functionName;
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

  public boolean traceBytecodeGeneration = false;

  public ClassVisitor constructClassVisitor()
  {
    ClassVisitor cw = new ClassWriter(ClassWriter.COMPUTE_FRAMES);
    if (checkClass)
    {
      cw = new CheckClassAdapter(cw);
    }
    if (traceBytecodeGeneration)
    {
      cw = new FlushingTraceClassVisitor(cw,
                                         new PrintWriter(System.err));
    }
    return cw;
  }

  public void declareFields(ClassVisitor cw)
  {
    if (!referencedFunctions.isEmpty())
    {
      cw.visitField(Opcodes.ACC_PRIVATE, IS_INITIALIZED, "Z", null, null);
    }

    declareConstants(cw);

    declareVariables(cw);

    declareIntermediateVariables(cw);

    declareFunctionReferences(cw);

  }

  public ClassVisitor declareConstants(ClassVisitor classVisitor)
  {
    for (var constant : literalConstants)
    {
      constant.declareField(classVisitor);
    }
    return classVisitor;
  }

  public ClassVisitor declareFunctionReferences(ClassVisitor classVisitor)
  {
    if (context != null)
    {
      referencedFunctions.forEach((name, function) ->
      {
        declareFunctionReference(classVisitor, name, function);
      });
    }
    return classVisitor;
  }

  public void declareFunctionReference(ClassVisitor classVisitor, String name, FunctionMapping<D, R> function)
  {
    String descriptor = "L" + function.name + ";";
    classVisitor.visitField(ACC_PUBLIC
                  | (function.name.equals(functionName) ? 0 : ACC_FINAL), name, descriptor, null, null);
  }

  public void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    for (var variable : intermediateVariables)
    {
      variable.declareField(classVisitor);
    }
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
  }

  public Class<F> define()
  {
    return compiledClass = defineFunctionClass(className, instructions, context);
  }

  public Expression<D, R, F> generate() throws ExpressionCompilerException
  {

    ClassVisitor classVisitor = constructClassVisitor();

    try
    {
      generateFunctionInterface(this, className, classVisitor);

      generateEvaluationMethod(classVisitor);

      declareFields(classVisitor);

      generateDefaultConstructor(classVisitor);

      if (!referencedFunctions.isEmpty())
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
      if (classVisitor instanceof FlushingTraceClassVisitor)
      {
        classVisitor = ((FlushingTraceClassVisitor) classVisitor).getDelegate();
      }
    }

    instructions = ((ClassWriter) classVisitor).toByteArray();

    if (save)
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
    try
    {
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
    }
    finally
    {
      methodVisitor.visitEnd();
    }

    return classVisitor;
  }

  public ClassVisitor generateEvaluationMethod(ClassVisitor classVisitor) throws ExpressionCompilerException
  {

    Label         startLabel    = new Label();
    Label         endLabel      = new Label();

    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           "evaluate",
                                                           evaluationMethodDescriptor,
                                                           evaluateMethodSignature,
                                                           null);

    methodVisitor.visitCode();
    methodVisitor.visitLabel(startLabel);

    Node<D, R, F> rootNode = parseRootNode();

    if (position < expression.length())
    {
      throw new ExpressionCompilerException(String.format("unexpected '%c' character at position=%s in expression '%s' of length %d\n",
                                                          ch,
                                                          position,
                                                          expression,
                                                          expression.length()));
    }

    if (!referencedFunctions.isEmpty())
    {
      generateConditionalInitializater(methodVisitor);
    }

    addChecksForNullVariableReferences(methodVisitor, false, false);

    rootNode.generate(methodVisitor, rangeType);

    methodVisitor.visitInsn(Opcodes.ARETURN);

    methodVisitor.visitLabel(endLabel);

    declareLocalVariables(methodVisitor, startLabel, endLabel);

    methodVisitor.visitMaxs(0, 0);

    methodVisitor.visitEnd();

    return classVisitor;
  }

  private void generateConditionalInitializater(MethodVisitor methodVisitor)
  {
    // FIXME: dont bother generating the initializing code if there is nothing to
    // initialize
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, className, IS_INITIALIZED, "Z");
    Label alreadyInitialized = new Label();
    methodVisitor.visitJumpInsn(Opcodes.IFNE, alreadyInitialized);

    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, className, nameOfVariableInitializerFunction, "()V", false);

    methodVisitor.visitLabel(alreadyInitialized);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
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

  public void addCheckForNullField(MethodVisitor methodVisitor, String varName, boolean variable)
  {

    Class<?> fieldClass = variable ? context.variables.map.get(varName).getClass() : context.functions.get(varName)
                                                                                                      .type();
    String   fieldDesc  = fieldClass.descriptorString();
    addNullCheckForField(methodVisitor, className, varName, fieldDesc);
  }

  public MethodVisitor declareLocalVariables(MethodVisitor methodVisitor, Label startLabel, Label endLabel)
  {
    // String objectClassDescriptor = Object.class.descriptorString();
    methodVisitor.visitLocalVariable("in", domainType.descriptorString(), null, startLabel, endLabel, 1);
    methodVisitor.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("result", rangeType.descriptorString(), null, startLabel, endLabel, 4);
    return methodVisitor;
  }

  public String getNextConstantFieldName()
  {

    return "const" + constantCount++;
  }

  public HashMap<String, AtomicInteger> intermediateVariableCounters = new HashMap<>();

  public String getNextIntermediatevariableFieldName(int depth, Class<?> type)
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

  public static class FieldAssignment
  {
    String fieldName;
    String fieldDescriptor;

    public FieldAssignment(String fieldName, String fieldDescriptor)
    {
      this.fieldName       = fieldName;
      this.fieldDescriptor = fieldDescriptor;
    }
  }

  public void initializeNestedFunctionVariableReferences(MethodVisitor mv,
                                                         String classType,
                                                         String fieldType,
                                                         String functionFieldName,
                                                         List<OrderedPair<String, Class<?>>> variables)
  {
    String typeDesc = "L" + fieldType + ";";

    // Set fields in the new object
    for (OrderedPair<String, Class<?>> variable : variables)
    {
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitFieldInsn(Opcodes.GETFIELD, classType, functionFieldName, typeDesc);
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      String variableFieldName = variable.getKey();
      String variableFieldType = variable.getValue().descriptorString();
      mv.visitFieldInsn(Opcodes.GETFIELD, classType, variableFieldName, variableFieldType);
      mv.visitFieldInsn(Opcodes.PUTFIELD, fieldType, variableFieldName, variableFieldType);
    }

  }

  public MethodVisitor generateContextInitializer(MethodVisitor mv, FunctionMapping<?, ?> nestedFunction)
  {

    if (nestedFunction.func != null)
    {
      var entryStream              = context.variableEntryStream();
      var nestedFunctionsVariables = entryStream.map(entry -> new OrderedPair<String, Class<?>>(entry.getKey(),
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
      assert nestedFunction.name.equals(functionName) : "nestedFunction.func should not be null if its not the recursive function referring to itself";

    }

    return mv;
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

  /**
   * 
   * 
   * @return a newly instantiated instance of the (equivalence) class of function
   *         defined by this {@link Expression}
   */
  public F instantiate()
  {
    try
    {
      F f;

      f = instance = (compiledClass != null ? compiledClass : define()).getDeclaredConstructor().newInstance();

      injectVariableReferences(f);

      return instance;
    }
    catch (Exception e)
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
  }

  public MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, String fieldDescriptor)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, fieldName, fieldDescriptor);
    return methodVisitor;
  }

  public MethodVisitor loadIndexField(MethodVisitor methodVisitor, String indexFieldName)
  {
    methodVisitor.visitFieldInsn(GETFIELD, functionClassInternalName, indexFieldName, "I");
    return methodVisitor;
  }

  public boolean needsCloseMethod()
  {
    return !literalConstants.isEmpty() | !intermediateVariables.isEmpty();
  }

  public String newIntermediateVariable(int depth, Class<?> type)
  {
    assert type != Void.class : "dont generate a variable for the Void type";
    String intermediateVarName = getNextIntermediatevariableFieldName(depth, type);
    intermediateVariables.add(new IntermediateVariable<>(this,
                                                         intermediateVarName,
                                                         type));

    return intermediateVarName;
  }

  public void nextCharacter()
  {
    ch = (++position < expression.length()) ? expression.charAt(position) : -1;
  }

  public Node<D, R, F> parse(int depth) throws ExpressionCompilerException
  {
    Node<D, R, F> node     = null;

    int           startPos = position;

    if (parse(depth + 1, '('))
    {
      node = parseFirst(depth + 1);
      if (!parse(depth + 1, ')'))
      {
        throw new ExpressionCompilerException(format("expected closing parenthesis at: depth=%d startPos=%s, position=%s in "
                      + "expression '%s' of length %d", depth, startPos, position, expression, expression.length()));
      }

    }
    else if (Parser.isNumeric(ch))
    {
      node = parseNumber(depth, startPos);
      assert node != null : "parseNumber returned null";
    }
    else if (Parser.isLatinOrGreek(ch, false))
    {
      node = resolveFunctionInvocationOrVariableReference(depth, startPos);
      assert node != null : "parseFunctionInvocationOrVariableReference returned null";
    }

    return node;
  }

  public int previousCharacter;

  public boolean parse(int depth, char... expectedCharacters)
  {
    skipSpaces();
    for (int expectedCharacter : expectedCharacters)
    {
      if (ch == expectedCharacter)
      {
        previousCharacter = ch;
        nextCharacter();
        return true;
      }
    }

    return false;
  }

  public Node<D, R, F> parseFirst(int depth) throws ExpressionCompilerException
  {
    Node<D, R, F> node = parseSecond(depth);

    return parseAdditionAndSubtractionOperations(depth, node);
  }

  public Node<D, R, F> parseAdditionAndSubtractionOperations(int depth, Node<D, R, F> node)
  {
    while (true)
    {
      if (node == null)
      {
        node = new LiteralConstant<>(this,
                                     "0",
                                     depth);
      }

      if (parse(depth, '+'))
      {
        node = new Addition<>(this,
                              node,
                              parseSecond(depth),
                              depth);
      }
      else if (parse(depth, '-'))
      {
        node = new Subtraction<>(this,
                                 node,
                                 parseSecond(depth),
                                 depth);
      }
      else
      {
        return node;
      }
    }
  }

  public Node<D, R, F> parseFinally(int depth) throws ExpressionCompilerException
  {
    return parseExponent(depth, parse(depth));
  }

  public Reference parseName(int depth, int startPos)
  {
    while (isLatinOrGreek(ch, true))
    {
      nextCharacter();
    }
    String identifier = expression.substring(startPos, position).trim();
    String index      = null;
    if (parse(depth, '['))
    {
      int indexPosition = position;

      while (!parse(depth, ']') && position < expression.length())
      {
        nextCharacter();
      }
      index = expression.substring(indexPosition, position - 1);
    }

    return new Reference(identifier,
                         index);
  }

  public Node<D, R, F> parseNumber(int depth, int startPos)
  {
    while (isNumeric(ch))
    {
      nextCharacter();
    }

    return new LiteralConstant<>(this,
                                 expression.substring(startPos, position),
                                 depth);
  }

  public void parseOptionalIndependentVariableSpecification()
  {
    expression = expression.replace("->", "➔");
    int rightArrowIndex = expression.indexOf('➔');
    if (rightArrowIndex != -1)
    {
      independentVariableNode = new Variable<D, R, F>(this,
                                                      new Reference(expression.substring(0, rightArrowIndex),
                                                                    null,
                                                                    domainType),
                                                      0);

      position                = rightArrowIndex;

    }
  }

  private Node<D, R, F> parseExponent(int depth, Node<D, R, F> node) throws ExpressionCompilerException
  {
    if (parse(depth, '^'))
    {
      boolean parenthetical = false;
      if (parse(depth, '('))
      {
        parenthetical = true;
      }
      node = new Exponentiate<>(this,
                                node,
                                parenthetical ? parseFirst(depth) : parse(depth),
                                depth + 1);
      if (parenthetical)
      {
        if (!parse(depth, ')'))
        {
          throw new RuntimeException(String.format("parsePower expected closing parenthesis at: position=%d, ch='%c'\n",
                                                   position,
                                                   ch == -1 ? '?' : ch));
        }
      }

      return node;
    }
    else
    {
      return parseSuperscripts(depth, node);
    }
  }

  public Node<D, R, F> parseRootNode() throws ExpressionCompilerException
  {
    parseOptionalIndependentVariableSpecification();
    nextCharacter();
    rootNode = parseFirst(0);
    assert rootNode != null : "parseRootNode: parseFirst() returned null, expression='" + expression + "'";
    rootNode.isResult = true;
    return rootNode;
  }

  public Node<D, R, F> parseSecond(int depth) throws ExpressionCompilerException
  {
    Node<D, R, F> node = parseFinally(depth);

    return parseMultiplicationAndDivisionOperations(depth, node);
  }

  public Node<D, R, F> parseMultiplicationAndDivisionOperations(int depth, Node<D, R, F> node)
  {
    while (true)
    {
      if (parse(depth, '*', '×'))
      {
        node = new Multiplication<>(this,
                                    node,
                                    parseFinally(depth),
                                    depth);

      }
      else if (parse(depth, '/', '÷'))
      {
        node = new Division<>(this,
                              node,
                              parseFinally(depth),
                              depth);
      }
      else
      {
        return node;
      }
    }
  }

  public Node<D, R, F> parseSuperscript(int depth, Node<D, R, F> node, char superscript, String digit)
  {
    if (parse(depth + 1, superscript))
    {
      node = new Exponentiate<>(this,
                                node,
                                new LiteralConstant<>(this,
                                                      digit,
                                                      depth + 2),
                                depth + 1);
    }
    return node;
  }

  public Node<D, R, F> parseSuperscripts(int depth, Node<D, R, F> node)
  {
    node = parseSuperscript(depth + 1, node, '⁰', "0");
    node = parseSuperscript(depth + 1, node, '¹', "1");
    node = parseSuperscript(depth + 1, node, '²', "2");
    node = parseSuperscript(depth + 1, node, '³', "3");
    node = parseSuperscript(depth + 1, node, '⁴', "4");
    node = parseSuperscript(depth + 1, node, '⁵', "5");
    node = parseSuperscript(depth + 1, node, '⁶', "6");
    node = parseSuperscript(depth + 1, node, '⁷', "7");
    node = parseSuperscript(depth + 1, node, '⁸', "8");
    node = parseSuperscript(depth + 1, node, '⁹', "9");
    return node;
  }

  public String reserveIntermediateVariable(MethodVisitor methodVisitor, int depth, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(depth, type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type.descriptorString());
    return intermediateVariableName;
  }

  public Node<D, R, F> resolveFunctionInvocationOrVariableReference(int depth,
                                                                    int startPos) throws ExpressionCompilerException
  {
    Reference reference  = parseName(depth, startPos);
    boolean   isFunction = parse(depth, '(');

    if (isFunction)
    {
      if ("when".equals(reference.name))
      {
        return When.parse(this, depth + 1);
      }
      else
      {
        Node<D, R, F> arg = parseFirst(depth + 1);
        if (parse(depth + 1, ')'))
        {
          return new FunctionCall<>(this,
                                    reference.name,
                                    arg,
                                    depth + 1);
        }
        else
        {
          throw new RuntimeException(String.format("expected closing parenthesis at: startPos=%s, position=%s,"
                        + " identifier='%s', isFunction=%s, depth=%d\n, expression=%s\n",
                                                   startPos,
                                                   position,
                                                   reference,
                                                   isFunction,
                                                   depth,
                                                   expression));
        }
      }
    }
    else if (LiteralConstant.constantSymbols.contains(reference.name))
    {
      return new LiteralConstant<>(this,
                                   reference.name,
                                   depth + 1);
    }
    else
    {
      var contextVar = context == null ? null : context.variables.get(reference.name);
      reference.type = (context == null || contextVar == null) ? domainType : contextVar.getClass();
      return new Variable<D, R, F>(this,
                                   reference,
                                   depth + 1);
    }
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
      if (e instanceof RuntimeException)
      {
        throw (RuntimeException) e;
      }
      else
      {
        throw new RuntimeException(e);
      }
    }
  }

  public MethodVisitor setResult(MethodVisitor methodVisitor, boolean swap, Class<?> inputType)
  {
    Compiler.checkClassCast(loadResultParameter(methodVisitor), rangeType);
    if (swap)
    {
      methodVisitor.visitInsn(Opcodes.SWAP);
    }
    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  rangeClassInternalName,
                                  "set",
                                  format("(%s)%s", inputType.descriptorString(), rangeClassDescriptor),
                                  false);
    return methodVisitor;
  }

  void skipSpaces()
  {
    while (ch == ' ')
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

  public MethodVisitor generateContextInitializer(MethodVisitor methodVisitor)
  {
    generateCodeToThrowErrorIfAlreadyInitialized(methodVisitor);

    addChecksForNullVariableReferences(methodVisitor, true, false);

    if (!referencedFunctions.isEmpty())
    {
      referencedFunctions.values().forEach(mapping -> generateContextInitializer(methodVisitor, mapping));

      generateCodeToSetIsInitializedToTrue(methodVisitor);
    }

    return methodVisitor;
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

  private void generateCodeToSetIsInitializedToTrue(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitInsn(Opcodes.ICONST_1);
    methodVisitor.visitFieldInsn(PUTFIELD, className, IS_INITIALIZED, "Z");
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

  public ClassVisitor generateCopyConstructor(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(ACC_PUBLIC,
                                                           "<init>",
                                                           "(L" + className + ";)V",
                                                           null,
                                                           null);
    methodVisitor.visitCode();

    generateInvocationOfDefaultNoArgConstructor(methodVisitor, false);

    addChecksForNullVariableReferences(methodVisitor, true, true);

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
      String typeDesc  = "L" + fieldType + ";";
      mv.visitVarInsn(Opcodes.ALOAD, 0);
      mv.visitTypeInsn(Opcodes.NEW, fieldType);
      mv.visitInsn(Opcodes.DUP);
      mv.visitMethodInsn(Opcodes.INVOKESPECIAL, fieldType, "<init>", "()V", false);
      mv.visitFieldInsn(Opcodes.PUTFIELD, className, mapping.name, typeDesc);
    });

    generateLiteralConstantInitializers(mv);

    generateIntermediateVariableInitializers(mv);

    mv.visitInsn(RETURN);
    mv.visitMaxs(0, 0);
    mv.visitEnd();
    return classVisitor;
  }

  public ClassVisitor generateInitializationMethod(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           nameOfVariableInitializerFunction,
                                                           "()V",
                                                           null,
                                                           null);
    try
    {

      methodVisitor.visitCode();

      generateContextInitializer(methodVisitor);

      methodVisitor.visitInsn(Opcodes.RETURN);
      methodVisitor.visitMaxs(0, 0);
    }
    finally
    {
      methodVisitor.visitEnd();
    }

    return classVisitor;
  }

  public MethodVisitor generateLiteralConstantInitializers(MethodVisitor methodVisitor)
  {

    for (var literal : literalConstants)
    {
      literal.generateLiteralConstantInitializerWithString(methodVisitor);
    }
    return methodVisitor;
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
      // out.println("Wrote " + file.getAbsolutePath());

    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return this;
  }

  public MethodVisitor generateIntermediateVariableInitializers(MethodVisitor methodVisitor)
  {
    for (var intermediateVariable : intermediateVariables)
    {
      intermediateVariable.generateInitializer(methodVisitor);
    }
    return methodVisitor;
  }

  public String getTypeSignature()
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

}