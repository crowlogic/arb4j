package arb.expressions;

import static arb.expressions.Compiler.compile;
import static arb.expressions.Compiler.declareConstants;
import static arb.expressions.Compiler.defineFunctionClass;
import static arb.expressions.Compiler.generateConstructor;
import static arb.expressions.Compiler.generateFunctionInterface;
import static arb.expressions.Compiler.getFunctionTypeSignature;
import static arb.expressions.Compiler.loadResult;
import static arb.expressions.Compiler.loadThisOntoStack;
import static arb.expressions.Parser.isNumeric;
import static java.lang.String.format;
import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.ACONST_NULL;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.GETFIELD;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.util.CheckClassAdapter;

import arb.ComplexPolynomial;
import arb.Field;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.expressions.nodes.binary.Add;
import arb.expressions.nodes.binary.Divide;
import arb.expressions.nodes.binary.Exponentiate;
import arb.expressions.nodes.binary.Multiply;
import arb.expressions.nodes.binary.Subtract;
import arb.expressions.nodes.unary.FunctionCall;
import arb.expressions.trace.FlushingTraceClassVisitor;
import arb.functions.Function;

/**
 * <p>
 * The <code>Expression</code> class in the <code>arb.expressions</code> package
 * is a versatile and dynamic expression compiler and evaluator which generates
 * high-performance {@link Function} implementations on-the-fly.
 *
 * <p>
 * Key Features:
 * </p>
 * <ul>
 * <li>Compiles expressions dynamically into Java bytecodes.</li>
 * <li>Supports operations like addition, subtraction, multiplication, division,
 * and exponentiation.</li>
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
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 * 
 * @param <D> domain type
 * @param <R> range type
 * @param <F> the function type of the expression, extending {@link Function}
 * 
 * @author ©2023 Stephen Crowley
 */
public class Expression<D, R, F extends Function<D, R>> implements
                       Typesettable
{
  @Override
  public String toString()
  {
    return "Expression[" + expression + "]";
  }

  protected int                              position                  = -1;

  public int                                 ch                        = 0;

  protected final String                     expression;

  public Variables                           variables;

  public String                              className;

  final public Class<? extends D>            domainType;

  final public Class<? extends R>            rangeType;

  final public String                        domainClassDescriptor;

  final public String                        rangeClassDescriptor;

  final public String                        functionClassInternalName;

  public ArrayList<IntermediateVariable>     intermediateVariables     = new ArrayList<IntermediateVariable>();

  int                                        intermediateVariableCount = 0;

  int                                        constantCount;

  public ArrayList<LiteralConstant<D, R, F>> literalConstants          = new ArrayList<LiteralConstant<D, R, F>>();

  public Variable<D, R, F>                   independentVariableNode;

  protected Method                           evaluateMethod;

  protected byte[]                           instructions;

  public boolean                             verbose                   = false;

  Class<F>                                   compiledClass;

  F                                          instance;

  public final String                        rangeClassInternalName;

  public final String                        domainClassInternalName;

  public Node<D, R, F>                       rootNode;

  public Class<? extends F>                  functionClass;

  public String                              functionClassDescriptor;

  public HashMap<String, Mapping<?, ?>>      referencedFunctions       = new HashMap<>();

  public HashMap<String, Variable<D, R, F>>  referencedVariables       = new HashMap<>();

  public Context                             context;

  public static final String                 evaluateMethodDesc        = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public final String                        evaluateMethodSignature;

  public Variable<D, R, F>                   indeterminate;

  public String                              functionName;

  public Expression(String className,
                    Class<? extends D> domainClass,
                    Class<? extends R> rangeClass,
                    Class<? extends F> functionClass,
                    String expression,
                    Context context,
                    String functionName)
  {
    this.rangeClassDescriptor      = Type.getDescriptor(rangeClass);
    this.domainClassDescriptor     = Type.getDescriptor(domainClass);
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

  public Expression(String className2,
                    Class<? extends D> domainClass,
                    Class<? extends R> rangeClass,
                    Class<? extends F> functionClass,
                    String expressionString,
                    Context context2)
  {
    this(className2,
         domainClass,
         rangeClass,
         functionClass,
         expressionString,
         context2,
         null);
  }

  /**
   * Calls this{@link #getNextIntermediatevariableFieldName()} and adds it to
   * this{@link #intermediateVariables}
   * 
   * @param depth
   * 
   * @return the field name returned by
   *         this{@link #getNextIntermediatevariableFieldName()}
   */
  private String newIntermediateVariable(int depth, Class<?> type)
  {
    String intermediateVarName = getNextIntermediatevariableFieldName(depth);
    intermediateVariables.add(new IntermediateVariable(intermediateVarName,
                                                       type));
    if (verbose)
    {
      out.println("Allocating intermediate variable " + intermediateVarName + " at depth " + depth);
      out.flush();
    }
    return intermediateVarName;
  }

  /**
   * 1. Calls this{@link #define()} if this{@link #compiledClass} is NULL<br>
   * 2. Instantiates the class and assigns it to this{@link #instance} <br>
   * 3. Calls this{@link #injectVariableReferences()} <br>
   * 
   * @return this{@link #instance} after it has been compiled (if necessary),
   *         instantiated and injected with references to {@link Variable}s in
   *         {@link Variables}
   */
  protected F instantiate()
  {
    try
    {
      instance = (compiledClass != null ? compiledClass : define()).getDeclaredConstructor().newInstance();
      injectVariableReferences();
      injectRegisteredFunctionReferences();
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return instance;
  }

  /**
   * Calls {@link Compiler#loadResult(MethodVisitor)}, then
   * this{@link Compiler#checkClassCast(MethodVisitor, boolean)} then generates an
   * invocation of the {@link Field#set(Field)} method whose only argument and
   * return type is this{@link #domainClassDescriptor}
   * 
   * @param methodVisitor
   * @param class1
   * @return methodVisitor
   */
  public MethodVisitor setResult(MethodVisitor methodVisitor)
  {
    Compiler.checkClassCast(loadResult(methodVisitor, verbose), rangeType);
    methodVisitor.visitInsn(Opcodes.SWAP);
    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  rangeClassInternalName,
                                  "set",
                                  format("(%s)%s", rangeClassDescriptor, rangeClassDescriptor),
                                  false);
    return methodVisitor;
  }

  /**
   * Passes this{@link #instructions} to
   * {@link Compiler#defineFunctionClass(byte[])} and assigns the result to
   * this{@link #compiledClass}
   * 
   * @return this{@link #compiledClass} after it has been set
   */
  protected Class<F> define()
  {
    return compiledClass = defineFunctionClass(className, instructions, context);
  }

  /**
   * Calls this{@link #skipSpaces()} and checks if the current this{@link #ch} is
   * equal to one of the charsToEat
   * 
   * @param depth
   * @param charsToEat
   * 
   * @return true if the next non-space character is one of the characters in
   *         charsToEat
   */
  public boolean parse(int depth, char... charsToEat)
  {
    skipSpaces();
    for (int charToEat : charsToEat)
    {
      if (ch == charToEat)
      {
        nextChar();
        if (verboseParser)
        {
          err.format("Ate expected '%c' at depth %d and advanced to char '%c' at pos %d\n",
                     charToEat,
                     depth,
                     ch == -1 ? '?' : ch,
                     position);
          err.flush();
        }
        return true;
      }
    }

    return false;
  }

  /**
   * Generates the {@link Class} containing a {@link Function} implementation
   * which evaluates this{@link #expression}
   * 
   * @return this
   * @throws ExpressionCompilerException
   */
  Expression<D, R, F> generate() throws ExpressionCompilerException
  {
    if (verbose)
    {
      out.println("Generating " + className + " from expression '" + expression + "'");
      out.flush();
    }

    ClassVisitor classVisitor = constructClassVisitor();

    try
    {
      generateFunctionInterface(this, className, classVisitor);

      generateEvaluationMethod(classVisitor);

      declareFields(classVisitor);

      generateConstructor(this, classVisitor);

      if (needsCloseMethod())
      {
        if (verbose)
        {
          out.println("Generating close method");
          out.flush();
        }
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

    if (verbose)
    {
      File file = new File(className + ".class");
      writeBytecodes(file);
    }

    return this;
  }

  /**
   * Calls {@link Compiler#declareConstants(ClassVisitor, Iterable)},
   * this{@link #declareReferencedVariables(ClassVisitor)},
   * this{@link #declareIntermediateVariables(ClassVisitor)}, then
   * {@link Compiler#declareFunctions(Expression, ClassVisitor, FunctionMappings)}
   * 
   * @param classVisitor
   */
  public void declareFields(ClassVisitor classVisitor)
  {
    if (verbose)
    {
      err.println("Declaring constants: " + literalConstants);
      err.flush();
    }
    declareConstants(classVisitor, literalConstants);

    declareReferencedVariables(classVisitor);

    declareIntermediateVariables(classVisitor);

    declareFunctionReferences(classVisitor);

  }

  public ClassVisitor declareFunctionReferences(ClassVisitor classVisitor)
  {
    referencedFunctions.forEach((name, function) ->
    {
      String descriptor = function.functionInterface != null ? function.functionInterface.descriptorString() : function.func.getClass()
                                                                                                                            .descriptorString();

      classVisitor.visitField(ACC_PUBLIC,
                              name,
                              descriptor,
                              getFunctionTypeSignature(function.domain, function.range),
                              null);
    });
    return classVisitor;
  }

  public ClassVisitor declareVariables(ClassVisitor classVisitor,
                                       Iterable<Map.Entry<String, Variable<D, R, F>>> variables)
  {
    for (var variable : variables)
    {
      classVisitor.visitField(ACC_PUBLIC,
                              variable.getKey(),
                              variable.getValue().type().descriptorString(),
                              null,
                              null);
    }
    return classVisitor;
  }

  public void declareIntermediateVariables(ClassVisitor classVisitor)
  {
    for (var variable : intermediateVariables)
    {
      classVisitor.visitField(ACC_PUBLIC, variable.name, variable.type.descriptorString(), null, null);
    }
  }

  public void declareReferencedVariables(ClassVisitor classVisitor)
  {
    if (variables != null)
    {
      if (verbose)
      {
        err.println("Declaring variables: " + referencedVariables);
        err.flush();
      }
      declareVariables(classVisitor, referencedVariables.entrySet());
    }
  }

  boolean debug = verbose;

  private ClassVisitor constructClassVisitor()
  {
    ClassVisitor cw = debug ? new CheckClassAdapter(new ClassWriter(ClassWriter.COMPUTE_FRAMES)) : new ClassWriter(ClassWriter.COMPUTE_FRAMES);

    if (verbose)
    {
      cw = new FlushingTraceClassVisitor(cw,
                                         new PrintWriter(System.err));
    }
    return cw;
  }

  /**
   * @return true if either this{@link #literalConstants} or
   *         this{@link #intermediateVariables} is populated
   */
  public boolean needsCloseMethod()
  {
    return !literalConstants.isEmpty() | intermediateVariableCount > 0;
  }

  public MethodVisitor generateCloseFieldCall(MethodVisitor methodVisitor, String name, Class<?> type)
  {
    methodVisitor.visitFieldInsn(GETFIELD, className, name, type.descriptorString());
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, Type.getInternalName(type), "close", "()V", false);
    return methodVisitor;
  }

  protected ClassVisitor generateCloseMethod(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC, "close", "()V", null, null);
    try
    {
      methodVisitor.visitCode();

      literalConstants.forEach(constant -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                  constant.fieldName,
                                                                  constant.type()));

      if (intermediateVariableCount > 0)
      {
        if (verbose)
        {
          err.println("Closing intermediate variables : " + intermediateVariables);
          err.flush();
        }

        intermediateVariables.forEach(intermediateVariable -> generateCloseFieldCall(loadThisOntoStack(methodVisitor),
                                                                                     intermediateVariable.name,
                                                                                     intermediateVariable.type));
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

  private ClassVisitor generateEvaluationMethod(ClassVisitor classVisitor) throws ExpressionCompilerException
  {

    Label startLabel = new Label();
    Label endLabel   = new Label();

    if (verbose)
    {
      out.format("Generating evaluate with methodDesc='%s' signature='%s'\n",
                 evaluateMethodDesc,
                 evaluateMethodSignature);
      out.flush();
    }

    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           "evaluate",
                                                           evaluateMethodDesc,
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

    rootNode = rootNode.eliminateSubexpressions();

    rootNode.generate(methodVisitor, rangeType);

    if (verbose)
    {
      out.println("Returning from evaluate method...\n");
      out.flush();
    }

    methodVisitor.visitInsn(Opcodes.ARETURN);
    methodVisitor.visitLabel(endLabel);

    methodVisitor.visitLocalVariable("in", "Ljava/lang/Object;", domainClassDescriptor, startLabel, endLabel, 1);
    methodVisitor.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("result", "Ljava/lang/Object;", rangeClassDescriptor, startLabel, endLabel, 4);

    methodVisitor.visitMaxs(0, 0);

    methodVisitor.visitEnd();

    return classVisitor;
  }

  public Node<D, R, F> parseRootNode() throws ExpressionCompilerException
  {
    parseOptionalIndependentVariableSpecification();
    nextChar();
    rootNode = parseFirst(0);
    assert rootNode != null : "eatRootNode: eatFirst() returned null, expression='" + expression + "'";
    rootNode.isResult = true;
    return rootNode;
  }

  public void parseOptionalIndependentVariableSpecification()
  {
    int rightArrowIndex = expression.replace("->", "➔").indexOf('➔');
    if (rightArrowIndex != -1)
    {
      independentVariableNode = new Variable<D, R, F>(this,
                                                      new Reference(expression.substring(0, rightArrowIndex),
                                                                    null,
                                                                    domainType),
                                                      0);
      if (verbose)
      {
        out.println("independentVariableNode=" + independentVariableNode);
        out.flush();
      }
      position = rightArrowIndex;

    }
  }

  public String getNextConstantFieldName()
  {
    return "c" + constantCount++;
  }

  public String getNextIntermediatevariableFieldName(int depth)
  {
    return "l" + intermediateVariableCount++;
  }

  public void injectRegisteredFunctionReferences() throws NoSuchFieldException, IllegalAccessException
  {
    if (context != null)
    {
      referencedFunctions.entrySet().forEach(entry ->
      {
        try
        {
          String                  functionName = entry.getKey();
          // FIXME: create a referencedFunctions and only generate fields for functions
          // that are used instead of creating one for every function in the Context
          java.lang.reflect.Field field        = compiledClass.getField(functionName);
          Mapping<?, ?>           mapping      = entry.getValue();
          field.set(instance, mapping.func);
        }
        catch (Exception e)
        {
          throw new RuntimeException(e.getMessage(),
                                     e);
        }
      });
    }
  }

  public void injectVariableReferences() throws NoSuchFieldException, IllegalAccessException
  {
    if (referencedVariables != null)
    {
      referencedVariables.entrySet().forEach(entry ->
      {
        try
        {
          String                  variableName = entry.getKey();
          R                       value        = variables.get(variableName);
          java.lang.reflect.Field field        = compiledClass.getField(variableName);
          field.set(instance, value);
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
   * Increment this{@link #position} and set this{@link #ch} to the character at
   * offset this{@link #position} in the expressing {@link String}
   */
  public void nextChar()
  {
    ch = (++position < expression.length()) ? expression.charAt(position) : -1;
  }

  boolean verboseParser = false;

  /**
   * Consumes characters, calling this{@link #parseFirst(int)} to process
   * parenthesis and calling this{@link #eatNumber(int)} if this{@link #ch}
   * indicates a number a the current position or
   * this{@link #resolveFunctionInvocationOrVariableReference(int, int)} if
   * this{@link #ch} indicates the name of either a function or variable reference
   * 
   * @param depth
   * 
   * @return the next node in the syntax tree
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> parse(int depth) throws ExpressionCompilerException
  {
    if (verboseParser)
    {
      err.format("eat(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
      err.flush();
    }

    Node<D, R, F> node     = null;

    int           startPos = this.position;

    if (parse(depth + 1, '('))
    {
      node = parseFirst(depth + 1);
      if (!parse(depth + 1, ')'))
      {
        throw new ExpressionCompilerException(String.format("expected closing parenthesis at: depth=%d startPos=%s, position=%s in expression '%s' of length %d",
                                                            depth,
                                                            startPos,
                                                            position,
                                                            expression,
                                                            expression.length()));
      }

    }
    else if (Parser.isNumeric(ch))
    {
      node = parseNumber(depth, startPos);
      assert node != null : "eatNumber returned null";
    }
    else if (Parser.isLatinOrGreek(ch, false))
    {
      node = resolveFunctionInvocationOrVariableReference(depth, startPos);
      assert node != null : "eatFunctionInvocationOrVariableReference returned null";
    }
    else if (ch == ')')
    {
      assert false : "wack";
    }

    if (verboseParser)
    {
      out.println("eat() returning " + node);
      out.flush();
    }

    return node;
  }

  /**
   * Loop which instantiates {@link Add} and {@link Subtract} nodes
   * 
   * @param depth
   * 
   * @return new {@link Add} or {@link Subtract} node or result from
   *         this{@link #parseSecond(int)}
   * @throws ExpressionCompilerException
   */
  public Node<D, R, F> parseFirst(int depth) throws ExpressionCompilerException
  {
    if (verboseParser)
    {
      err.format("eatFirst(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
      err.flush();
    }

    Node<D, R, F> node = parseSecond(depth);

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
        node = new Add<>(this,
                         node,
                         parseSecond(depth),
                         depth);
      }
      else if (parse(depth, '-'))
      {
        node = new Subtract<>(this,
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

  /**
   * At this point it is only known that the present character this{@link #ch} at
   * this{@link #position} {@link Parser#isLatinOrGreek(int, boolean)} so that it
   * is the name of something, but unknown if its the name of a function
   * invocation or a variable reference
   * 
   * @param depth
   * @param startPos
   * 
   * @return
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> resolveFunctionInvocationOrVariableReference(int depth,
                                                                     int startPos) throws ExpressionCompilerException
  {
    Reference reference  = parseName(depth, startPos);
    boolean   isFunction = parse(depth, '(');
    if (verbose)
    {
      err.format("\nresolveFunctionInvocationOrVariableReference(depth=%d): startPos=%s, position=%s, reference='%s', isFunction=%s\n\n",
                 depth,
                 startPos,
                 position,
                 reference,
                 isFunction);
      err.flush();
    }

    if (isFunction)
    {
      Node<D, R, F> arg = parseFirst(depth + 1);
      if (parse(depth, ')'))
      {
        return new FunctionCall<>(this,
                                  reference.name,
                                  arg,
                                  depth);
      }
      else
      {
        throw new RuntimeException(String.format("expected closing paranthesis at: startPos=%s, position=%s, identifier='%s', isFunction=%s, depth=%d\n, expression=%s\n",
                                                 startPos,
                                                 position,
                                                 reference,
                                                 isFunction,
                                                 depth,
                                                 expression));
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
      Variable<D, R, F> variable = new Variable<D, R, F>(this,
                                                         reference,
                                                         depth + 1);
      return variable;
    }
  }

  /**
   * Calls this{@link #parse(int)} and if this{@link #ch} is '^' then a new
   * {@link Exponentiate} node is instantiated
   * 
   * @param depth
   * 
   * @return either a new {@link Exponentiate} node from
   *         this{@link #parsePower(int, Node)} or a node from
   *         this{@link #parse(int)}
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> parseLast(int depth) throws ExpressionCompilerException
  {
    if (verboseParser)
    {
      err.format("eatLast(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
      err.flush();
    }

    return parsePower(depth, parse(depth));
  }

  /**
   * Upon entrance, this{@link #ch} should already be known to be a Latin or Greek
   * character
   * 
   * @param depth
   * @param startPos
   * 
   * @return the {@link Reference} (having name and possibly index) at startPos
   */
  private Reference parseName(int depth, int startPos)
  {
    while (Parser.isLatinOrGreek(ch, true))
    {
      nextChar();
    }
    String identifier = expression.substring(startPos, position).trim();
    String index      = null;
    if (parse(depth, '['))
    {
      int indexPosition = position;

      while (!parse(depth, ']') && position < expression.length())
      {
        nextChar();
      }
      index = expression.substring(indexPosition, position - 1);
//      if ()
//      {
//        throw new ExpressionCompilerException("missing closing ']' at " + position + " of '" + expression + "'");
//      }
    }

    if (verboseParser)
    {
      err.format("eatName(depth=%d): startPos=%d, position=%d, identifier='%s' index='%s' ch='%c'\n",
                 depth,
                 startPos,
                 position,
                 identifier,
                 index,
                 ch == -1 ? '?' : ch);
      err.flush();
    }

    return new Reference(identifier,
                         index);
  }

  /**
   * On entrance it should already be known that this{@link #ch} is a digit or a
   * dot
   * 
   * @param startPos
   * 
   * @return a new {@link LiteralConstant} representing the base-10 number
   */
  private Node<D, R, F> parseNumber(int depth, int startPos)
  {
    while (isNumeric(ch))
    {
      nextChar();
    }

    return new LiteralConstant<>(this,
                                 expression.substring(startPos, position),
                                 depth);
  }

  /**
   * Checks if this{@link #ch} is a ^ numerical superscript and generates the
   * corresponding {@link Exponentiate} node if so
   * 
   * TODO: support numbers greater than 9 so something like "x²⁴" would mean
   * "x^(24)"
   * 
   * @param depth
   * @param node
   * 
   * @return node if this{@link #ch} does not indicate the specific power raising
   *         operation, otherwise returns a new {@link Exponentiate} operator with
   *         node as its parent node
   */
  Node<D, R, F> parseSuperscript(int depth, Node<D, R, F> node, char superscript, String digit)
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

  /**
   * Checks if this{@link #ch} is a ^ character or a numerical superscript and
   * generates the corresponding {@link Exponentiate} node if so
   * 
   * @param depth
   * @param node
   * 
   * @return node if this{@link #ch} does not indicate a power raising operation,
   *         otherwise returns a new {@link Exponentiate} operator with node as
   *         its parent node
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> parsePower(int depth, Node<D, R, F> node) throws ExpressionCompilerException
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
          throw new RuntimeException(String.format("eatPower expected closing parenthesis at: position=%d, ch='%c'\n",
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

  /**
   * Calls this{@link #parseSuperscript(int, Node, int, String)} for each digit of
   * the base 10 numeral system
   * 
   * @param depth
   * @param node
   * 
   * @return
   */
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

  /**
   * Loop which instantiates new {@link Multiply} and {@link Divide} nodes
   * 
   * @param depth
   * 
   * @return new {@link Multiply} or {@link Divide} node or result from
   *         this{@link #parseLast(int)}
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> parseSecond(int depth) throws ExpressionCompilerException
  {
    if (verboseParser)
    {
      err.format("eatSecond(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
      err.flush();
    }

    Node<D, R, F> node = parseLast(depth);

    while (true)
    {
      if (parse(depth, '*', '×'))
      {
        node = new Multiply<>(this,
                              node,
                              parseLast(depth),
                              depth);

      }
      else if (parse(depth, '/', '÷'))
      {
        node = new Divide<>(this,
                            node,
                            parseLast(depth),
                            depth);
      }
      else
      {
        return node;
      }
    }
  }

  /**
   * Calls this{@link #nextChar()} until ch != ' '
   */
  void skipSpaces()
  {
    while (ch == ' ')
    {
      nextChar();
    }
  }

  /**
   * Writes the contents of this{@link #instructions} to a file
   * 
   * @param file
   * @return
   */
  public Expression<D, R, F> writeBytecodes(File file)
  {
    try
    {
      Files.write(Paths.get(file.toURI()), instructions);
      out.println("Wrote " + file.getAbsolutePath());
    }
    catch (IOException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
    return this;
  }

  /**
   * Emits a {@link Opcodes#GETFIELD} instruction for the integer field with the
   * given name
   * 
   * @param methodVisitor
   * @param indexFieldName
   * @return
   */
  public MethodVisitor loadIndexField(MethodVisitor methodVisitor, String indexFieldName)
  {
    methodVisitor.visitFieldInsn(GETFIELD, functionClassInternalName, indexFieldName, "I");
    return methodVisitor;
  }

  public MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, Class<?> type)
  {
    return loadFieldOntoStack(methodVisitor, fieldName, type.descriptorString());
  }

  public MethodVisitor loadFieldOntoStack(MethodVisitor methodVisitor, String fieldName, String fieldDescriptor)
  {
    if (verbose)
    {
      err.format("\nloadFieldOntoStack(fieldName=%s, fieldDescriptor=%s)\n\n", fieldName, fieldDescriptor);
      err.flush();
    }
    methodVisitor.visitFieldInsn(GETFIELD, className, fieldName, fieldDescriptor);
    return methodVisitor;
  }

  /**
   * Either generates a reference to an existing intermediate variable thats not
   * already allocated and is of the specified type or allocates a new one and
   * generates a reference to it
   * 
   * @param methodVisitor
   * @param depth         the depth this intermediate variable is needed for. "x"
   *                      would be depth 0, "sin(x)" would be sin at depth 0 and x
   *                      at depth 1 for example
   * @param type          the type of variable
   * @return name of the intermediate variable
   */
  public String reserveIntermediateVariable(MethodVisitor methodVisitor, int depth, Class<?> type)
  {
    String intermediateVariableName = newIntermediateVariable(depth, type);
    loadFieldOntoStack(loadThisOntoStack(methodVisitor), intermediateVariableName, type);
    return intermediateVariableName;
  }

  /**
   * Emit an instruction to invoke the
   * {@link Function#evaluate(Object, int, Object)} method of a function
   * registered via a call to {@link Context#registerFunction(String, Function) .
   * The unary operation has the signature D functionName( int bits, D result)
   * 
   * @param methodVisitor
   * @param functionName
   * @return methodVisitor
   */
  public MethodVisitor callContextualUnaryFunction(MethodVisitor methodVisitor, Mapping<D, R> mapping, Class<?> type)
  {
    boolean isInterface = mapping.functionInterface != null;
    methodVisitor.visitMethodInsn(mapping.functionInterface != null ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(isInterface ? mapping.functionInterface : mapping.func.getClass()),
                                  "evaluate",
                                  evaluateMethodDesc,
                                  isInterface);
    return Compiler.checkClassCast(methodVisitor, type);
  }

  public static <D, R, F extends Function<D, R>> F instantiate(String expression,
                                                               Context context,
                                                               Class<? extends D> domainClass,
                                                               Class<? extends R> rangeClass,
                                                               Class<? extends F> functionClass,
                                                               boolean verbose,
                                                               String functionName)
  {
    Mapping<?, ?> mapping = null;
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
      out.println("instantiating $ " + compiledExpression.rootNode.typeset() + "$");
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

  @Override
  public String typeset()
  {
    return rootNode == null ? null : rootNode.typeset();
  }

  /**
   * 
   * @return true if this{@link #rangeType} {@link Object#equals(Object)}
   *         {@link RealPolynomial}
   */
  public boolean hasPolynomialRange()
  {
    return rangeType.equals(RealPolynomial.class) || rangeType.equals(ComplexPolynomial.class);
  }

  public MethodVisitor initializeRegisteredFunction(MethodVisitor methodVisitor, Mapping<?, ?> mapping)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitInsn(ACONST_NULL);
    boolean isInterface = mapping.functionInterface != null;

    methodVisitor.visitFieldInsn(PUTFIELD,
                                 className,
                                 mapping.name,
                                 isInterface ? mapping.functionInterface.descriptorString() : mapping.func.getClass()
                                                                                                          .descriptorString());

    return methodVisitor;
  }

}