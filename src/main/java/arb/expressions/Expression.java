package arb.expressions;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.GETFIELD;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
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

  public Variable<D, R, F>                   inputNode;

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
    String intermediateVarName = getNextIntermediatevarialbeFieldName();
    intermediateVariables.add(intermediateVarName);
    if (verbose)
    {
      System.out.println("Allocating intermediate variable " + intermediateVarName);
    }
    return intermediateVarName;
  }

  /**
   * 1. Calls this{@link #define()} if this{@link #compiledClass} is NULL<br>
   * 2. Instantiates the class and assigns it to this{@link #instance}
   * 
   * @param verbose
   * @param class3
   * @param class2
   * @param class1
   * @param variables2
   * @param expression2
   * 
   * @return this{@link #instance} after it has been compiled if necessary thenx
   *         instantiated
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
      throw new UnsupportedOperationException(e.getMessage(),
                                              e);
    }
    return instance;
  }

  public MethodVisitor generateSetResultMethodCall(MethodVisitor mv)
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
    return compiledClass = defineFunctionClass(instructions);
  }

  public boolean eat(int charToEat)
  {
    skipSpaces();
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
        if (verbose)
        {
          System.err.println("Closing literal constants : "
                        + literalConstants.stream().map(c -> c.fieldName).toList());
          System.err.flush();
        }

        generateLiteralClosingInstructions(methodVisitor);
      }

      if (intermediateVariableCount > 0)
      {
        if (verbose)
        {
          System.err.println("Closing intermediate variables : " + intermediateVariables);
          System.err.flush();
        }

        generateIntermediateVariableClosingInstructions(methodVisitor);
      }

      methodVisitor.visitInsn(Opcodes.RETURN);
      methodVisitor.visitMaxs(0, 0);
    }
    finally
    {
      methodVisitor.visitEnd();
    }
  }

  public void generateIntermediateVariableClosingInstructions(MethodVisitor methodVisitor)
  {

    for (String intermediateVariable : intermediateVariables)
    {
      generateCloseMethodCall(this, loadThis(methodVisitor), intermediateVariable);
    }
  }

  public void generateLiteralClosingInstructions(MethodVisitor methodVisitor)
  {

    for (LiteralConstant<D, R, F> constant : literalConstants)
    {
      generateCloseMethodCall(this, loadThis(methodVisitor), constant.fieldName);
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
    nextChar();
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
    rootNode = eatFirst();
    assert rootNode != null : "parseFirst() returned null, expression='" + expression + "'";
    rootNode.isLast = true;
    return rootNode;
  }

  public String getNextConstantFieldName()
  {
    return "c" + constantCount++;
  }

  public String getNextIntermediatevarialbeFieldName()
  {
    return "l" + intermediateVariableCount++;
  }

  private void injectVariableReferences() throws NoSuchFieldException, IllegalAccessException
  {
    if (variables != null)
    {
      for (Entry<String, Variable<D, R, F>> entry : referencedVariables.entrySet())
      {
        Field field = compiledClass.getField(entry.getKey());
        field.set(instance, variables.get(entry.getKey()));
      }
    }
  }

  private Node<D, R, F> newFunctionCall(String name, Node<D, R, F> arg)
  {

    if (verbose)
    {
      System.err.println("newFunctionCall name=" + name + " arg=" + arg);
    }
    Node<D, R, F> node;
    if (arg == null)
    {
      throw new RuntimeException("Parsed expression is null, name=" + name);
    }
    node = new FunctionCall<D, R, F>(this,
                                     name,
                                     arg,
                                     arg.depth + 1);
    return node;
  }

  private Node<D, R, F> newVariable(String identifier)
  {
    return new Variable<D, R, F>(this,
                                 identifier);
  }

  public void nextChar()
  {
    ch = (++position < expression.length()) ? expression.charAt(position) : -1;
  }

  private Node<D, R, F> eat()
  {
    if (verbose)
    {
      System.err.format("parse: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = null;

    skipSpaces();

    int startPos = this.position;

    if (eat('('))
    {
      node = eatSecond();
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

    node = eatPower(node);

    if (verbose)
    {
      System.err.println("parse returning " + node);
    }

    // assert node != null : "parse tried to return null";

    return node;
  }

  public Node<D, R, F> eatFirst()
  {
    if (verbose)
    {
      System.err.format("parseFirst: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = eatSecond();

    for (;;)
    {
      if (eat('+'))
      {
        assert node != null : "node before + cannot be null";
        node = new Add<D, R, F>(this,
                                node,
                                eatSecond());
      }
      else if (eat('-'))
      {
        assert node != null : "node before - cannot be null";
        node = new Subtract<D, R, F>(this,
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
   * invocation or a variable or a
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
      System.err.format("parseFunctionOrVariable: startPos=%s, position=%s, identifier='%s', isFunction=%s\n",
                        startPos,
                        position,
                        functionOrVariableName,
                        isFunction);
    }

    if (isFunction)
    {
      Node<D, R, F> arg = eatFirst();
      if (!eat(')'))
      {
        assert false : String.format("expected closing paranthesis at: startPos=%s, position=%s, identifier='%s', isFunction=%s\n",
                                     startPos,
                                     position,
                                     functionOrVariableName,
                                     isFunction);
      }
      return newFunctionCall(functionOrVariableName, arg);
    }
    else// if (ch == -1 || isPowerCharacter(ch) || eat(')'))
    {
      return newVariable(functionOrVariableName);
    }

////
//    // Create a new SubExpression instance
//    SubExpression subExpr = new SubExpression(this);
//    // Parse the contents of the parentheses as a new expression
//    subExpr.parseUntil(')');
//    // Use the SubExpression instance as the argument of the function

    // return subExpr;
  }

  private Node<D, R, F> eatLast()
  {
    if (verbose)
    {
      System.err.format("parseLast: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = eat();

    node = eatPower(node);

    return node;
  }

  private String eatName(int startPos)
  {
    while (isLatinOrGreek(ch, true))
      nextChar();
    String identifier = expression.substring(startPos, this.position);
    if (verbose)
    {
      System.err.format("parseName: startPos=%d, position=%d, identifier='%s' ch='%c'\n",
                        startPos,
                        position,
                        identifier,
                        ch == -1 ? '?' : ch);
    }
    return identifier;
  }

  private Node<D, R, F> eatNumber(int startPos)
  {
    Node<D, R, F> node;
    while (isDigitOrDot(ch))
      nextChar();

    String num = expression.substring(startPos, this.position);
    node = new LiteralConstant<D, R, F>(this,
                                        num);
    return node;
  }

  Node<D, R, F> eatSuperscript(Node<D, R, F> node, int superscript, String digit)
  {
    if (eat(superscript))
    {
      node = new RaiseToPower<D, R, F>(this,
                                       node,
                                       new LiteralConstant<>(this,
                                                             digit));
    }
    return node;
  }

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
      node = new RaiseToPower<D, R, F>(this,
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
    }
    return eatSuperscripts(node);
  }

  public Node<D, R, F> eatSuperscripts(Node<D, R, F> node)
  {
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

  private Node<D, R, F> eatSecond()
  {
    if (verbose)
    {
      System.err.format("eatSecond: ch=%c position=%d\n", ch, this.position);
    }

    Node<D, R, F> node = eatLast();

    for (;;)
    {
      if (eat('*'))
      {
        node = new Multiply<D, R, F>(this,
                                     node,
                                     eatLast());
      }
      else if (eat('/') || eat('÷'))
      {
        node = new Divide<D, R, F>(this,
                                   node,
                                   eatLast());
      }
      else
      {
        return node;
      }
    }
  }

  void skipSpaces()
  {
    while (ch == ' ')
      nextChar();
  }

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
   * emits an {@link Opcodes#CHECKCAST}
   * 
   * @param mv
   * @param range if true then checks if the top element on the stack is a
   *              this{@link #rangeClassInternalName} otherwise tests if its a
   *              this{@link #domainClassInternalName}
   * @return mv
   */
  public MethodVisitor checkClassCast(MethodVisitor mv, boolean range)
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
  public MethodVisitor loadField(MethodVisitor mv, String fieldName, boolean range)
  {
    mv.visitFieldInsn(GETFIELD, className, fieldName, range ? rangeClassDescriptor : domainClassDescriptor);
    return mv;
  }

  public static RealFunction express(String expression)
  {
    return express(expression, null);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         RealFunction
         express(String expression, Variables<Real> variables)
  {
    return instantiate(expression, variables, Real.class, Real.class, RealFunction.class, false);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         RealFunction
         express(String className, String expression, Variables<Real> variables, boolean verbose)
  {
    return instantiate(className, expression, variables, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         RealFunction
         express(String expression, Variables<Real> variables, boolean verbose)
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

  static String expressionToUniqueClassname(String expression)
  {
    return expression.replace(" ", "")
                     .replace("+", "Plus")
                     .replace("-", "Minus")
                     .replace("*", "Times")
                     .replace("/", "DividedBy")
                     .replace("^", "ToThePowerOf")
                     .replace("(", "")
                     .replace(")", "")
                     .replace("1", "One")
                     .replace("2", "Two")
                     .replace("3", "Three")
                     .replace("4", "Four")
                     .replace("5", "Five")
                     .replace("6", "Six")
                     .replace("7", "Seven")
                     .replace("8", "Eight")
                     .replace("9", "Nine")
                     .replace("0", "Zero")
                     .replace(".", "Point")
                  + System.nanoTime();
  }

}