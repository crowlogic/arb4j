package arb.expressions;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.GETFIELD;

import java.io.*;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.Map.Entry;

import org.objectweb.asm.*;
import org.objectweb.asm.util.CheckClassAdapter;

import arb.Real;
import arb.expressions.nodes.*;
import arb.expressions.trace.FlushingTraceClassVisitor;
import arb.functions.Function;
import arb.functions.real.BesselFunctionOfTheFirstKind;
import arb.functions.real.RealFunction;

public class Expression<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
{
  protected int                              position                  = -1;

  public int                                 ch                        = 0;

  protected final String                     expression;

  public Variables<D>                        variables;

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

  protected String                           shortClassName;

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
  public boolean                             resultAllocated           = false;

  public Node<D, R, F>                       rootNode;

  public Class<F>                            functionClass;

  public HashMap<String, Variable<D, R, F>>  referencedVariables       = new HashMap<>();

  public Expression(String className,
                    Class<D> domainClass,
                    Class<R> rangeClass,
                    Class<F> functionClass,
                    String expression,
                    Variables<D> nameSpace)
  {
    this.rangeClassDescriptor      = Type.getDescriptor(rangeClass);
    this.domainClassDescriptor     = Type.getDescriptor(domainClass);
    this.shortClassName            = className;
    this.className                 = Expression.class.getPackageName().replace('.', '/') + "/" + className;
    this.domainClass               = domainClass;
    this.rangeClass                = rangeClass;
    this.functionClass             = functionClass;
    this.rangeClassInternalName    = Type.getInternalName(rangeClass);
    this.domainClassInternalName   = Type.getInternalName(domainClass);
    this.functionClassInternalName = Type.getInternalName(functionClass);
    this.expression                = replaceSubscripts(expression);
    this.variables                 = nameSpace;
  }

  /**
   * Replaces UTF subscripts ₀-₉ with 0-9, so that J₀ can be parsed as a
   * {@link BesselFunctionOfTheFirstKind} and other similar expressions likewise
   * 
   * @param expression
   * 
   * @return expression with 0-9 substituted in place of ₀-₉
   */
  private String replaceSubscripts(String expression)
  {
    return expression.replace('₀', '0')
                     .replace('₁', '1')
                     .replace('₂', '2')
                     .replace('₃', '3')
                     .replace('₄', '4')
                     .replace('₅', '5')
                     .replace('₆', '6')
                     .replace('₇', '7')
                     .replace('₈', '8')
                     .replace('₉', '9');
  }

  public String allocateNewIntermediateVariable()
  {
    String intermediateVarName = getNextIntermediatevariableFieldName();
    intermediateVariables.add(intermediateVarName);
    if (verbose)
    {
      System.out.println("Allocating intermediate variable " + intermediateVarName);
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

  public MethodVisitor generateSetResultMethodCall(MethodVisitor mv)
  {
    generateClassCastCheck(loadResult(mv), false);
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
    return compiledClass = defineFunctionClass(instructions);
  }

  public boolean eat(int... charsToEat)
  {
    skipSpaces();
    for (int charToEat : charsToEat)
    {
      if (ch == charToEat)
      {
        nextChar();
        if (verbose)
        {
          System.err.format("Ate expected '%c' and advanced to char '%c' at pos %d\n",
                            charToEat,
                            ch == -1 ? '?' : ch,
                            position);
        }
        return true;
      }
    }

    return false;
  }

  Expression<D, R, F> generate()
  {
    if (verbose)
    {
      System.out.println("Generating " + className + " from expression '" + expression + "'");
      System.out.flush();
    }

    ClassVisitor cw = new CheckClassAdapter(new ClassWriter(ClassWriter.COMPUTE_FRAMES));
    if (verbose)
    {
      cw = new FlushingTraceClassVisitor(cw,
                                         new PrintWriter(System.err));
    }
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
          System.err.println("Declaring variables: " + referencedVariables.keySet());
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
    }
    if (verbose)
    {
      cw = ((FlushingTraceClassVisitor) cw).getDelegate();
    }

    instructions = ((ClassWriter) cw.getDelegate()).toByteArray();

    if (verbose)
    {
      File file = new File(shortClassName + ".class");
      writeBytecodes(file);
    }
    return this;
  }

  /**
   * @return true if either this{@link #literalConstants} or
   *         this{@link #intermediateVariables} is populated
   */
  public boolean needsCloseMethod()
  {
    return !literalConstants.isEmpty() | intermediateVariableCount > 0;
  }

  protected void generateCloseMethod(ClassVisitor classVisitor)
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

        generateCloseMethodCalls(methodVisitor, constantList);
      }

      if (intermediateVariableCount > 0)
      {
        if (verbose)
        {
          System.err.println("Closing intermediate variables : " + intermediateVariables);
          System.err.flush();
        }

        generateCloseMethodCalls(methodVisitor, intermediateVariables);
      }

      methodVisitor.visitInsn(Opcodes.RETURN);
      methodVisitor.visitMaxs(0, 0);
    }
    finally
    {
      methodVisitor.visitEnd();
    }
  }

  public void generateCloseMethodCalls(MethodVisitor methodVisitor, Iterable<String> intermediateVariables)
  {
    for (String intermediateVariable : intermediateVariables)
    {
      generateCloseMethodCall(this, generateLoadThis(methodVisitor), intermediateVariable);
    }
  }

  private void generateEvaluationMethod(ClassVisitor cw)
  {

    String methodDesc      = "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;";

    String methodSignature = String.format("(L%s;IIL%s;)L%s;",
                                           domainClassInternalName,
                                           rangeClassInternalName,
                                           rangeClassInternalName);
    Label  startLabel      = new Label();
    Label  endLabel        = new Label();

    if (verbose)
    {
      System.out.format("Generating evaluate with methodDesc='%s' signature='%s'\n", methodDesc, methodSignature);
    }

    MethodVisitor mv = cw.visitMethod(Opcodes.ACC_PUBLIC, "evaluate", methodDesc, methodSignature, null);

    mv.visitCode();
    mv.visitLabel(startLabel);
    eatRootNode();
    rootNode.generate(mv);

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
  }

  public Node<D, R, F> eatRootNode()
  {
    nextChar();
    rootNode = eatFirst();
    assert rootNode != null : "eatRootNode: eatFirst() returned null, expression='" + expression + "'";
    rootNode.isLast = true;
    return rootNode;
  }

  public String getNextConstantFieldName()
  {
    return "c" + constantCount++;
  }

  public String getNextIntermediatevariableFieldName()
  {
    return "l" + intermediateVariableCount++;
  }

  private void injectVariableReferences() throws NoSuchFieldException, IllegalAccessException
  {
    if (variables != null)
    {
      for (Entry<String, Variable<D, R, F>> entry : referencedVariables.entrySet())
      {
        java.lang.reflect.Field field = compiledClass.getField(entry.getKey());
        field.set(instance, variables.get(entry.getKey()));
      }
    }
  }

  /**
   * 
   * @param name
   * @param arg
   * @return
   */
  private Node<D, R, F> newFunctionCall(String name, Node<D, R, F> arg)
  {
    assert arg != null : "arg is null in function call named '" + name + "'";

    if (arg == null)
    {
      throw new RuntimeException("Parsed expression is null, name=" + name);
    }

    if (verbose)
    {
      System.err.println("newFunctionCall name=" + name + " arg=" + arg);
    }

    return new FunctionCall<>(this,
                              name,
                              arg);
  }

  /**
   * instantiate a new {@link Variable}
   * 
   * @param name
   * @return a new {@link Variable}
   */
  private Node<D, R, F> newVariable(String name)
  {
    return new Variable<>(this,
                          name);
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
   * Consumes characters, calling this{@link #eatFirst()} to process paranthesis
   * and calling this{@link #eatNumber(int)} if this{@link #ch} indicates a number
   * a the current position or
   * this{@link #eatFunctionInvocationOrVariableReference(int)} if this{@link #ch}
   * indicates the name of either a function or variable reference
   * 
   * @return the next node in the syntax tree
   */
  private Node<D, R, F> eat()
  {
    if (verbose)
    {
      System.err.format("eat: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = null;

    skipSpaces();

    int startPos = this.position;

    if (eat('('))
    {
      node = eatFirst();
      if (!eat(')'))
      {
        assert false : String.format("expected closing paranthesis at: startPos=%s, position=%s, node=%s\n",
                                     startPos,
                                     position,
                                     node.toString(-1));
      }
    }
    else if (isDigitOrDot(ch))
    {
      node = eatNumber(startPos);
      assert node != null : "eatNumber returned null";
    }
    else if (isLatinOrGreek(ch, false))
    {
      node = eatFunctionInvocationOrVariableReference(startPos);
      assert node != null : "eatFunctionInvocationOrVariableReference returned null";
    }

    if (verbose)
    {
      System.err.println("parse returning " + node);
    }

    return node;
  }

  /**
   * Loop which instantiates {@link Add} and {@link Subtract} nodes
   * 
   * @return new {@link Add} or {@link Subtract} node or result from
   *         this{@link #eatSecond()}
   */
  public Node<D, R, F> eatFirst()
  {
    if (verbose)
    {
      System.err.format("eatFirst: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = eatSecond();

    while (true)
    {
      if (eat('+'))
      {
        assert node != null : "node before + cannot be null";
        node = new Add<>(this,
                         node,
                         eatSecond());
      }
      else if (eat('-'))
      {
        assert node != null : "node before - cannot be null";
        node = new Subtract<>(this,
                              node,
                              eatSecond());
      }
      else
      {
        return node;
      }
    }
  }

  /**
   * At this point it is only known that the present character this{@link #ch} at
   * this{@link #position} is a {@link Compiler#isLatinOrGreek(int, boolean)} so
   * that it is the name of something, but unknown if its the name of a function
   * invocation or a variable reference
   * 
   * @param node
   * @param startPos
   * @return
   */
  private Node<D, R, F> eatFunctionInvocationOrVariableReference(int startPos)
  {
    String functionOrVariableName = eatName(startPos);
    skipSpaces();
    boolean isFunction = false;
    if (eat('('))
    {
      isFunction = true;
    }
    if (verbose)
    {
      System.err.format("eatFunctionInvocationOrVariableReference: startPos=%s, position=%s, identifier='%s', isFunction=%s\n",
                        startPos,
                        position,
                        functionOrVariableName,
                        isFunction);
    }

    if (isFunction)
    {
      Node<D, R, F> independentVariable = eatFirst();
      if (!eat(')'))
      {
        throw new RuntimeException(String.format("expected closing paranthesis at: startPos=%s, position=%s, identifier='%s', isFunction=%s\n",
                                                 startPos,
                                                 position,
                                                 functionOrVariableName,
                                                 isFunction));
      }
      return newFunctionCall(functionOrVariableName, independentVariable);
    }
    else
    {
      return newVariable(functionOrVariableName);
    }
  }

  /**
   * Calls this{@link #eat()} and if this{@link #ch} indicates a power-raising
   * operation then a new {@link RaiseToPower} node is instantiated
   * 
   * @return either a new {@link RaiseToPower} node from
   *         this{@link #eatPower(Node)} or a node from this{@link #eat()}
   */
  private Node<D, R, F> eatLast()
  {
    if (verbose)
    {
      System.err.format("eatLast: ch=%c position=%d\n", ch, this.position);
    }

    return eatPower(eat());
  }

  /**
   * Upon entrance, this{@link #ch} should already be known to be a latin or greek
   * character
   * 
   * @param startPos
   * 
   * @return the name at startPos
   */
  private String eatName(int startPos)
  {
    while (isLatinOrGreek(ch, true))
    {
      nextChar();
    }
    String identifier = expression.substring(startPos, position);
    if (verbose)
    {
      System.err.format("eatName: startPos=%d, position=%d, identifier='%s' ch='%c'\n",
                        startPos,
                        position,
                        identifier,
                        ch == -1 ? '?' : ch);
    }
    return identifier;
  }

  /**
   * On entrance it should already be known that this{@link #ch} is a digit or a
   * dot
   * 
   * @param startPos
   * @return a new {@link LiteralConstant} representing the base-10 number
   */
  private Node<D, R, F> eatNumber(int startPos)
  {
    while (isDigitOrDot(ch))
    {
      nextChar();
    }

    return new LiteralConstant<>(this,
                                 expression.substring(startPos, position));
  }

  /**
   * Checks if this{@link #ch} is a ^ numerical superscript and generates the
   * corresponding {@link RaiseToPower} node if so
   * 
   * TODO: support numbers greater than 9 so something like "x²⁴" would mean
   * "x^(24)"
   * 
   * @param node
   * @return node if this{@link #ch} does not indicate the specific power raising
   *         operation, otherwise returns a new {@link RaiseToPower} operator with
   *         node as its parent node
   */
  Node<D, R, F> eatSuperscript(Node<D, R, F> node, int superscript, String digit)
  {
    if (eat(superscript))
    {
      node = new RaiseToPower<>(this,
                                node,
                                new LiteralConstant<>(this,
                                                      digit));
    }
    return node;
  }

  /**
   * Checks if this{@link #ch} is a ^ character or a numerical superscript and
   * generates the corresponding {@link RaiseToPower} node if so
   * 
   * @param node
   * @return node if this{@link #ch} does not indicate a power raising operation,
   *         otherwise returns a new {@link RaiseToPower} operator with node as
   *         its parent node
   */
  private Node<D, R, F> eatPower(Node<D, R, F> node)
  {
    if (eat('^'))
    {
      boolean parenthetical = false;
      skipSpaces();
      if (eat('('))
      {
        parenthetical = true;
      }
      node = new RaiseToPower<>(this,
                                node,
                                parenthetical ? eatFirst() : eat());
      if (parenthetical)
      {
        if (!eat(')'))
        {
          throw new RuntimeException(String.format("eatPower expected closing paranthesis at: position=%d, ch='%c'\n",
                                                   position,
                                                   ch == -1 ? '?' : ch));
        }
      }

      return node;
    }
    else
    {
      return eatSuperscripts(node);
    }
  }

  /**
   * Calls this{@link #eatSuperscript(Node, int, String)} for each digit of the
   * base 10 numeral system
   * 
   * @param node
   * @return
   */
  public Node<D, R, F> eatSuperscripts(Node<D, R, F> node)
  {
    node = eatSuperscript(node, '⁰', "0");
    node = eatSuperscript(node, '¹', "1");
    node = eatSuperscript(node, '²', "2");
    node = eatSuperscript(node, '³', "3");
    node = eatSuperscript(node, '⁴', "4");
    node = eatSuperscript(node, '⁵', "5");
    node = eatSuperscript(node, '⁶', "6");
    node = eatSuperscript(node, '⁷', "7");
    node = eatSuperscript(node, '⁸', "8");
    node = eatSuperscript(node, '⁹', "9");
    return node;
  }

  /**
   * Loop which instantiates new {@link Multiply} and {@link Divide} nodes
   * 
   * @return new {@link Multiply} or {@link Divide} node or result from
   *         this{@link #eatLast()}
   */
  private Node<D, R, F> eatSecond()
  {
    if (verbose)
    {
      System.err.format("eatSecond: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = eatLast();

    while (true)
    {
      if (eat('*', '×'))
      {
        node = new Multiply<>(this,
                              node,
                              eatLast());
      }
      else if (eat('/', '÷'))
      {
        node = new Divide<>(this,
                            node,
                            eatLast());
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
    return "Expression[expression=" + expression + ", shortClassName=" + shortClassName + "]";
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
  public MethodVisitor generateClassCastCheck(MethodVisitor mv, boolean range)
  {
    mv.visitTypeInsn(Opcodes.CHECKCAST, range ? rangeClassInternalName : domainClassInternalName);
    return mv;
  }

  /**
   * Emit an {@link Opcodes#GETFIELD} instruction
   * 
   * @param mv
   * @param fieldName
   * @param range     if true then the field is of type
   *                  this{@link #domainClassDescriptor} otherwise of type
   *                  this{@link #rangeClassDescriptor}
   * @return
   */
  public MethodVisitor generateLoadField(MethodVisitor mv, String fieldName, boolean range)
  {
    mv.visitFieldInsn(GETFIELD, className, fieldName, range ? rangeClassDescriptor : domainClassDescriptor);
    return mv;
  }

  public static RealFunction express(String expression)
  {
    return express(expression, null);
  }

  public static RealFunction express(String className, String expression, Variables<Real> variables)
  {
    return instantiate(className, expression, variables, Real.class, Real.class, RealFunction.class, false);
  }

  public static RealFunction express(String expression, Variables<Real> variables)
  {
    return instantiate(expression, variables, Real.class, Real.class, RealFunction.class, false);
  }

  public static RealFunction express(String className, String expression, Variables<Real> variables, boolean verbose)
  {
    return instantiate(className, expression, variables, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static RealFunction express(String expression, Variables<Real> variables, boolean verbose)
  {
    return instantiate(expression, variables, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         F
         instantiate(String className,
                     String expression,
                     Variables<D> variables,
                     Class<D> domainClass,
                     Class<R> rangeClass,
                     Class<F> functionClass,
                     boolean verbose)
  {
    return compile(className, expression, variables, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         F
         instantiate(String expression,
                     Variables<D> variables,
                     Class<D> domainClass,
                     Class<R> rangeClass,
                     Class<F> functionClass,
                     boolean verbose)
  {
    return compile(expression, variables, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  /**
   * Emit an instruction to invoke a unary function on the field type. The unary
   * function has the signature D functionName( int bits, D result)
   * 
   * @param mv
   * @param functionName
   * @return mv
   */
  public MethodVisitor generateUnaryFunctionCall(MethodVisitor mv, String functionName)
  {
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       domainClassInternalName,
                       functionName,
                       format("(I%s)%s", domainClassDescriptor, domainClassDescriptor),
                       false);
    return mv;
  }

}