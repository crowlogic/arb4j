package arb.expressions;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.*;
import static org.objectweb.asm.Opcodes.GETFIELD;

import java.io.*;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

import org.objectweb.asm.*;
import org.objectweb.asm.util.CheckClassAdapter;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.*;
import arb.expressions.trace.FlushingTraceClassVisitor;
import arb.functions.Function;
import arb.functions.real.RealFunction;

public class Expression<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
{
  protected int                              position                  = -1;

  public int                                 ch                        = 0;

  protected final String                     expression;

  public Variables<R>                        variables;

  public String                              className;

  final public Class<D>                      domainClass;

  final public Class<R>                      rangeClass;

  final public String                        domainClassDescriptor;

  final public String                        rangeClassDescriptor;

  final public String                        functionClassInternalName;

  public ArrayList<String>                   intermediateVariables     = new ArrayList<>();

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

  /**
   * if this is false then the result variable ( the last parameter to the
   * evaluate method at index 4) is available to be reused as an intermediate
   * variable
   **/
  public boolean                             resultInUse               = false;

  public Node<D, R, F>                       rootNode;

  public Class<F>                            functionClass;

  public HashMap<String, Variable<D, R, F>>  referencedVariables       = new HashMap<>();

  public Context<D, R, F>                    context;

  private static final String                evaluateMethodDesc        = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

  public final String                        evaluateMethodSignature;

  public Expression(String className,
                    Class<D> domainClass,
                    Class<R> rangeClass,
                    Class<F> functionClass,
                    String expression,
                    Context<D, R, F> context)
  {
    this.rangeClassDescriptor      = Type.getDescriptor(rangeClass);
    this.domainClassDescriptor     = Type.getDescriptor(domainClass);
    this.className                 = className;
    this.domainClass               = domainClass;
    this.rangeClass                = rangeClass;
    this.functionClass             = functionClass;
    this.rangeClassInternalName    = Type.getInternalName(rangeClass);
    this.domainClassInternalName   = Type.getInternalName(domainClass);
    this.functionClassInternalName = Type.getInternalName(functionClass);
    this.expression                = Parser.replaceSubscripts(expression);
    this.context                   = context;
    this.variables                 = context != null ? context.variables : null;
    evaluateMethodSignature        = String.format("(L%s;IIL%s;)L%s;",
                                                   domainClassInternalName,
                                                   rangeClassInternalName,
                                                   rangeClassInternalName);
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
  public String newIntermediateVariable(int depth)
  {
    String intermediateVarName = getNextIntermediatevariableFieldName(depth);
    intermediateVariables.add(intermediateVarName);
    if (verbose)
    {
      System.out.println("Allocating intermediate variable " + intermediateVarName + " at depth " + depth);
    }
    return intermediateVarName;
  }

  /**
   * 1. Calls this{@link #define()} if this{@link #compiledClass} is NULL<br>
   * 2. Instantiates the class and assigns it to this{@link #instance} 3. Calls
   * this{@link #injectVariableReferences()}
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
   * this{@link #checkClassCast(MethodVisitor, boolean)} then generates an
   * invocation of the "set" method whose only argument and return type is
   * this{@link #domainClassDescriptor}
   * 
   * @param mv
   * @return mv
   */
  public MethodVisitor setResult(MethodVisitor mv)
  {
    checkClassCast(loadResult(mv), false);
    mv.visitInsn(Opcodes.SWAP);
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       domainClassInternalName,
                       "set",
                       format("(%s)%s", domainClassDescriptor, domainClassDescriptor),
                       false);
    return mv;
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
    return compiledClass = defineFunctionClass(this.className, instructions);
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
  public boolean eat(int depth, char... charsToEat)
  {
    skipSpaces();
    for (int charToEat : charsToEat)
    {
      if (ch == charToEat)
      {
        nextChar();
        if (verbose)
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
   * Generates the {@link Class} containing a {@link RealFunction} implementation
   * which evaluates this{@link #expression}
   * 
   * @return this
   * @throws ExpressionCompilerException
   */
  Expression<D, R, F> generate() throws ExpressionCompilerException
  {
    if (verbose)
    {
      System.out.println("Generating " + className + " from expression '" + expression + "'");
      System.out.flush();
    }

    ClassVisitor cw = constructClassVisitor();

    try
    {
      generateFunctionInterface(this, className, cw);

      generateEvaluationMethod(cw);

      if (verbose)
      {
        System.err.println("Declaring constants: " + literalConstants);
      }
      declareConstants(cw, domainClassDescriptor, literalConstants);

      if (variables != null)
      {
        if (verbose)
        {
          System.err.println("Declaring variables: " + referencedVariables);
        }
        declareVariables(this, cw, referencedVariables.keySet());
      }

      declareVariables(this, cw, intermediateVariables);

      generateConstructor(this, cw);

      if (needsCloseMethod())
      {
        if (verbose)
        {
          System.out.println("Generating close method");
        }
        generateCloseMethod(cw);
      }

    }
    finally
    {
      cw.visitEnd();
      if (verbose)
      {
        cw = ((FlushingTraceClassVisitor) cw).getDelegate();
      }
    }

    instructions = ((ClassWriter) cw.getDelegate()).toByteArray();

    if (verbose)
    {
      File file = new File(className + ".class");
      writeBytecodes(file);
    }
    return this;
  }

  private ClassVisitor constructClassVisitor()
  {
    ClassVisitor cw = new CheckClassAdapter(new ClassWriter(ClassWriter.COMPUTE_FRAMES));
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

  /**
   * Generates the {@link RealFunction#close()} method
   * 
   * @param classVisitor
   * @return
   */
  protected ClassVisitor generateCloseMethod(ClassVisitor classVisitor)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC, "close", "()V", null, null);
    try
    {
      methodVisitor.visitCode();

      if (!literalConstants.isEmpty())
      {
        List<String> constantList = literalConstants.stream().map(c -> c.fieldName).toList();
        if (verbose)
        {
          System.err.println("Closing literal constants : " + constantList);
          System.err.flush();
        }

        closeFields(methodVisitor, constantList);
      }

      if (intermediateVariableCount > 0)
      {
        if (verbose)
        {
          System.err.println("Closing intermediate variables : " + intermediateVariables);
          System.err.flush();
        }

        closeFields(methodVisitor, intermediateVariables);
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

  /**
   * Calls this{@link #closeField(ClassVisitor)} for each named {@link Field}
   * whether it be a {@link LiteralConstant} or a {@link Variable}
   * 
   * @param methodVisitor
   * @param fields        an {@link Iterable} of {@link String}s naming the
   *                      {@link Field}s to be closed
   */
  public void closeFields(MethodVisitor methodVisitor, Iterable<String> fields)
  {
    for (String variables : fields)
    {
      closeField(this, loadThis(methodVisitor), variables);
    }
  }

  /**
   * Generates the {@link RealFunction#evaluate(Real, int, int, Real)} method
   * 
   * @param cv
   * @return cv
   */
  private ClassVisitor generateEvaluationMethod(ClassVisitor cv) throws ExpressionCompilerException
  {

    Label startLabel = new Label();
    Label endLabel   = new Label();

    if (verbose)
    {
      System.out.format("Generating evaluate with methodDesc='%s' signature='%s'\n",
                        evaluateMethodDesc,
                        evaluateMethodSignature);
    }

    MethodVisitor mv = cv.visitMethod(Opcodes.ACC_PUBLIC,
                                      "evaluate",
                                      evaluateMethodDesc,
                                      evaluateMethodSignature,
                                      null);

    mv.visitCode();
    mv.visitLabel(startLabel);

    eatRootNode().generate(mv);

    if (verbose)
    {
      System.out.println("Returning from evaluate method...\n");
    }

    mv.visitInsn(Opcodes.ARETURN);
    mv.visitLabel(endLabel);

    mv.visitLocalVariable("in", "Ljava/lang/Object;", domainClassDescriptor, startLabel, endLabel, 1);
    mv.visitLocalVariable("order", "I", null, startLabel, endLabel, 2);
    mv.visitLocalVariable("bits", "I", null, startLabel, endLabel, 3);
    mv.visitLocalVariable("result", "Ljava/lang/Object;", rangeClassDescriptor, startLabel, endLabel, 4);

    mv.visitMaxs(0, 0);

    mv.visitEnd();

    return cv;
  }

  public Node<D, R, F> eatRootNode() throws ExpressionCompilerException
  {
    nextChar();
    rootNode = eatFirst(0);
    assert rootNode != null : "eatRootNode: eatFirst() returned null, expression='" + expression + "'";
    rootNode.isResult = true;
    return rootNode;
  }

  public String getNextConstantFieldName()
  {
    return "c" + constantCount++;
  }

  public String getNextIntermediatevariableFieldName(int depth)
  {
    return "l" + intermediateVariableCount++;
  }

  public void injectVariableReferences() throws NoSuchFieldException, IllegalAccessException
  {
    if (referencedVariables != null)
    {
      referencedVariables.entrySet().forEach(entry ->
      {
        try
        {
          compiledClass.getField(entry.getKey()).set(instance, variables.get(entry.getKey()));
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

  /**
   * Consumes characters, calling this{@link #eatFirst(int)} to process
   * parenthesis and calling this{@link #eatNumber(int)} if this{@link #ch}
   * indicates a number a the current position or
   * this{@link #eatFunctionInvocationOrVariableReference(int, int)} if
   * this{@link #ch} indicates the name of either a function or variable reference
   * 
   * @param depth
   * 
   * @return the next node in the syntax tree
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> eat(int depth) throws ExpressionCompilerException
  {
    if (verbose)
    {
      System.err.format("eat(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
    }

    Node<D, R, F> node     = null;

    int           startPos = this.position;

    if (eat(depth + 1, '('))
    {
      node = eatFirst(depth + 1);
      if (!eat(depth + 1, ')'))
      {
        throw new ExpressionCompilerException(String.format("expected closing parenthesis at: depth=%d startPos=%s, position=%s, node=%s\n",
                                                            depth,
                                                            startPos,
                                                            position,
                                                            node.toString()));
      }
    }
    else if (Parser.isNumeric(ch))
    {
      node = eatNumber(depth, startPos);
      assert node != null : "eatNumber returned null";
    }
    else if (Parser.isLatinOrGreek(ch, false))
    {
      node = eatFunctionInvocationOrVariableReference(depth, startPos);
      assert node != null : "eatFunctionInvocationOrVariableReference returned null";
    }

    if (verbose)
    {
      System.out.println("eat() returning " + node);
    }

    return node;
  }

  /**
   * Loop which instantiates {@link Add} and {@link Subtract} nodes
   * 
   * @param depth
   * 
   * @return new {@link Add} or {@link Subtract} node or result from
   *         this{@link #eatSecond(int)}
   * @throws ExpressionCompilerException
   */
  public Node<D, R, F> eatFirst(int depth) throws ExpressionCompilerException
  {
    if (verbose)
    {
      System.err.format("eatFirst(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
    }

    Node<D, R, F> node = eatSecond(depth);

    while (true)
    {
      if (node == null)
      {
        node = new LiteralConstant<>(this,
                                     "0",
                                     depth);
      }

      if (eat(depth, '+'))
      {
        node = new Add<>(this,
                         node,
                         eatSecond(depth),
                         depth);
      }
      else if (eat(depth, '-'))
      {
        node = new Subtract<>(this,
                              node,
                              eatSecond(depth),
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
   * @param node
   * 
   * @return
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> eatFunctionInvocationOrVariableReference(int depth,
                                                                 int startPos) throws ExpressionCompilerException
  {
    Reference functionOrVariableName = eatName(depth, startPos);
    boolean   isFunction             = eat(depth, '(');
    if (verbose)
    {
      System.err.format("eatFunctionInvocationOrVariableReference(depth=%d): startPos=%s, position=%s, identifier='%s', isFunction=%s\n",
                        depth,
                        startPos,
                        position,
                        functionOrVariableName,
                        isFunction);
    }

    if (isFunction)
    {
      Node<D, R, F> arg = eatFirst(depth + 1);
      if (!eat(depth, ')'))
      {
        throw new RuntimeException(String.format("expected closing paranthesis at: startPos=%s, position=%s, identifier='%s', isFunction=%s, depth=%d\n",
                                                 startPos,
                                                 position,
                                                 functionOrVariableName,
                                                 isFunction,
                                                 depth));
      }
      return new FunctionCall<>(this,
                                functionOrVariableName.name,
                                arg,
                                depth);
    }
    else if (LiteralConstant.constantSymbols.contains(functionOrVariableName.name))
    {
      return new LiteralConstant<>(this,
                                   functionOrVariableName.name,
                                   depth + 1);
    }
    else
    {
      return new Variable<D, R, F>(this,
                                   functionOrVariableName,
                                   depth + 1);
    }
  }

  /**
   * Calls this{@link #eat(int)} and if this{@link #ch} is '^' then a new
   * {@link RaiseToPower} node is instantiated
   * 
   * @param depth
   * 
   * @return either a new {@link RaiseToPower} node from
   *         this{@link #eatPower(int, Node)} or a node from this{@link #eat(int)}
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> eatLast(int depth) throws ExpressionCompilerException
  {
    if (verbose)
    {
      System.err.format("eatLast(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
    }

    return eatPower(depth, eat(depth));
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
  private Reference eatName(int depth, int startPos)
  {
    while (Parser.isLatinOrGreek(ch, true))
    {
      nextChar();
    }
    String identifier = expression.substring(startPos, position).trim();
    String index      = null;
    if (eat(depth, '['))
    {
      int indexPosition = position;

      while (ch != ']')
      {
        nextChar();
      }
      index = expression.substring(indexPosition, position);
    }
    if (verbose)
    {
      System.err.format("eatName(depth=%d): startPos=%d, position=%d, identifier='%s' index='%s' ch='%c'\n",
                        depth,
                        startPos,
                        position,
                        identifier,
                        index,
                        ch == -1 ? '?' : ch);
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
  private Node<D, R, F> eatNumber(int depth, int startPos)
  {
    while (Parser.isNumeric(ch))
    {
      nextChar();
    }

    return new LiteralConstant<>(this,
                                 expression.substring(startPos, position),
                                 depth);
  }

  /**
   * Checks if this{@link #ch} is a ^ numerical superscript and generates the
   * corresponding {@link RaiseToPower} node if so
   * 
   * TODO: support numbers greater than 9 so something like "x²⁴" would mean
   * "x^(24)"
   * 
   * @param depth
   * @param node
   * 
   * @return node if this{@link #ch} does not indicate the specific power raising
   *         operation, otherwise returns a new {@link RaiseToPower} operator with
   *         node as its parent node
   */
  Node<D, R, F> eatSuperscript(int depth, Node<D, R, F> node, char superscript, String digit)
  {
    if (eat(depth + 1, superscript))
    {
      node = new RaiseToPower<>(this,
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
   * generates the corresponding {@link RaiseToPower} node if so
   * 
   * @param depth
   * @param node
   * 
   * @return node if this{@link #ch} does not indicate a power raising operation,
   *         otherwise returns a new {@link RaiseToPower} operator with node as
   *         its parent node
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> eatPower(int depth, Node<D, R, F> node) throws ExpressionCompilerException
  {
    if (eat(depth, '^'))
    {
      boolean parenthetical = false;
      if (eat(depth, '('))
      {
        parenthetical = true;
      }
      node = new RaiseToPower<>(this,
                                node,
                                parenthetical ? eatFirst(depth) : eat(depth),
                                depth + 1);
      if (parenthetical)
      {
        if (!eat(depth, ')'))
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
      return eatSuperscripts(depth, node);
    }
  }

  /**
   * Calls this{@link #eatSuperscript(int, Node, int, String)} for each digit of
   * the base 10 numeral system
   * 
   * @param depth
   * @param node
   * 
   * @return
   */
  public Node<D, R, F> eatSuperscripts(int depth, Node<D, R, F> node)
  {
    node = eatSuperscript(depth + 1, node, '⁰', "0");
    node = eatSuperscript(depth + 1, node, '¹', "1");
    node = eatSuperscript(depth + 1, node, '²', "2");
    node = eatSuperscript(depth + 1, node, '³', "3");
    node = eatSuperscript(depth + 1, node, '⁴', "4");
    node = eatSuperscript(depth + 1, node, '⁵', "5");
    node = eatSuperscript(depth + 1, node, '⁶', "6");
    node = eatSuperscript(depth + 1, node, '⁷', "7");
    node = eatSuperscript(depth + 1, node, '⁸', "8");
    node = eatSuperscript(depth + 1, node, '⁹', "9");
    return node;
  }

  /**
   * Loop which instantiates new {@link Multiply} and {@link Divide} nodes
   * 
   * @param depth
   * 
   * @return new {@link Multiply} or {@link Divide} node or result from
   *         this{@link #eatLast(int)}
   * @throws ExpressionCompilerException
   */
  private Node<D, R, F> eatSecond(int depth) throws ExpressionCompilerException
  {
    if (verbose)
    {
      System.err.format("eatSecond(depth=%d): ch=%c position=%d\n", depth, ch, this.position);
    }

    Node<D, R, F> node = eatLast(depth);

    while (true)
    {
      if (eat(depth, '*', '×'))
      {
        node = new Multiply<>(this,
                              node,
                              eatLast(depth),
                              depth);

      }
      else if (eat(depth, '/', '÷'))
      {
        node = new Divide<>(this,
                            node,
                            eatLast(depth),
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

  @Override
  public String toString()
  {
    return "Expression[expression=" + expression + ", shortClassName=" + className + "]";
  }

  /**
   * emits an {@link Opcodes#CHECKCAST} instruction
   * 
   * @param mv
   * @param range if true then emits an instruction to check if the top element on
   *              the stack is a this{@link #rangeClassInternalName} otherwise
   *              tests if its a this{@link #domainClassInternalName}
   * @return mv
   */
  public MethodVisitor checkClassCast(MethodVisitor mv, boolean range)
  {
    mv.visitTypeInsn(Opcodes.CHECKCAST, range ? rangeClassInternalName : domainClassInternalName);
    return mv;
  }

  /**
   * Emits a {@link Opcodes#GETFIELD} instruction for the integer field with the
   * given name
   * 
   * @param mv
   * @param indexFieldName
   * @return
   */
  public MethodVisitor loadIndexField(MethodVisitor mv, String indexFieldName)
  {
    mv.visitFieldInsn(GETFIELD, functionClassInternalName, indexFieldName, "I");
    return mv;
  }

  /**
   * Emit a {@link Opcodes#GETFIELD} instruction
   * 
   * @param mv
   * @param fieldName
   * @param range     if true then the field is of type
   *                  this{@link #domainClassDescriptor} otherwise of type
   *                  this{@link #rangeClassDescriptor}
   * @return
   */
  public MethodVisitor loadField(MethodVisitor mv, String fieldName, boolean range)
  {
    mv.visitFieldInsn(GETFIELD, className, fieldName, range ? rangeClassDescriptor : domainClassDescriptor);
    return mv;
  }

  /**
   * Emit an instruction to invoke a {@link UnaryOperation} on a field. The unary
   * operation has the signature D functionName( int bits, D result)
   * 
   * @param mv
   * @param functionName
   * @return mv
   */
  public MethodVisitor callUnaryFunction(MethodVisitor mv, String functionName)
  {
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       domainClassInternalName,
                       functionName,
                       format("(I%s)%s", domainClassDescriptor, domainClassDescriptor),
                       false);
    return mv;
  }

  /**
   * 
   * @param mv
   * @param depth the depth this intermediate variable is needed for. "x" would be
   *              depth 0, "sin(x)" would be sin at depth 0 and x at depth 1 for
   *              example
   * @return name of the intermediate variable
   */
  public String locateExistingOrInstantiateNewIntermediateResultVariable(MethodVisitor mv, int depth)
  {

    if (!resultInUse)
    {
      checkClassCast(loadResult(mv), true);
      resultInUse = true;
      return "<RESULT>";
    }
    else
    {
      String intermediateVariableName = newIntermediateVariable(depth);
      loadField(loadThis(mv), intermediateVariableName, true);
      return intermediateVariableName;
    }
  }

  /**
   * Emit an instruction to invoke the
   * {@link Function#evaluate(Object, int, Object)} method of a function
   * registered via a call to {@link Context#registerFunction(String, Function) .
   * The unary operation has the signature D functionName( int bits, D result)
   * 
   * @param mv
   * @param functionName
   * @return mv
   */
  public MethodVisitor callRegisteredUnaryFunction(MethodVisitor mv, String functionName)
  {
    F func = context.functions.get(functionName);
    assert func != null : format(" function named '%s' not found in context", functionName );

    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       functionClassInternalName,
                       "evaluate",
                       evaluateMethodDesc,
                       false);
    return mv;
  }

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         F
         instantiate(String expression,
                     Context<D, R, F> context,
                     Class<D> class1,
                     Class<R> class2,
                     Class<F> class3,
                     boolean verbose)
  {
    return Compiler.compile(expression, context, class1, class2, class3, verbose).instantiate();
  }

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         F
         instantiate(String className,
                     String expression,
                     Context<D, R, F> context,
                     Class<D> domainClass,
                     Class<R> rangeClass,
                     Class<F> functionClass,
                     boolean verbose)
  {
    return Compiler.compile(className, expression, context, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  public static RealFunction express(String expression)
  {
    return express(expression, null);
  }

  public static RealFunction express(String expression, RealContext context)
  {
    return Expression.instantiate(expression, context, Real.class, Real.class, RealFunction.class, false);
  }

  /**
   * Returns the result of
   * {@link Expression#instantiate(String, Context, Class, Class, Class, boolean)}
   * after calling {@link Context#registerFunction(String, Function)} to register
   * the function by name in the specified {@link Context}
   * 
   * @param name
   * @param expression
   * @param context
   * @return
   */
  public static RealFunction express(String name, String expression, RealContext context)
  {
    RealFunction func = Expression.instantiate(expression, context, Real.class, Real.class, RealFunction.class, false);
    context.registerFunction(name, func);
    //assert false : "TODO: https://github.com/crowlogic/arb4j/issues/264: inject the function as a member variable in the expression class during initialization and load the field as the 1st operand, order=2 for the 2nd operand, bits for the 3rd, and then the result variable to be returned as the 4th operand";
    return func;
  }

  public static RealFunction express(String className, String expression, RealContext context, boolean verbose)
  {
    return Expression.instantiate(className, expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static RealFunction express(String expression, RealContext context, boolean verbose)
  {
    return Expression.instantiate(expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static RealFunction express(String expression, boolean verbose)
  {
    return Expression.instantiate(expression, null, Real.class, Real.class, RealFunction.class, verbose);
  }

}