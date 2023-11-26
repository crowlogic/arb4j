package arb.expressions;

import static org.objectweb.asm.Opcodes.*;

import java.util.ArrayList;
import java.util.Collection;

import org.objectweb.asm.*;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.real.BesselFunctionOfTheFirstKind;
import arb.functions.real.RealFunction;

public class Compiler
{
  private static final String objectDesc = Type.getInternalName(Object.class);

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, boolean verbose)
  {
    return compile(className, expression, null, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, RealContext context, boolean verbose)
  {
    return compile(className, expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, RealContext context)
  {
    return compile(className, expression, context, Real.class, Real.class, RealFunction.class, false);
  }

  /**
   * Constructs and compiles an {@link Expression}
   * 
   * @param <D>
   * @param <R>
   * @param <F>
   * @param className
   * @param expressionString
   * @param context
   * @param domainClass
   * @param rangeClass
   * @param functionClass
   * @param verbose          if true then information about the parsing and code
   *                         generating is printed to {@link System#out} and
   *                         {@link System#err}
   * @return compiled {@link Expression}
   * @throws ExpressionCompilerException
   */
  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String className,
                 String expressionString,
                 Context<D, R, F> context,
                 Class<D> domainClass,
                 Class<R> rangeClass,
                 Class<F> functionClass,
                 boolean verbose) throws ExpressionCompilerException
  {
    Expression<D, R, F> expression = new Expression<D, R, F>(className,
                                                             domainClass,
                                                             rangeClass,
                                                             functionClass,
                                                             expressionString,
                                                             context);

    if (verbose)
    {
      expression.verbose = true;
    }

    expression.generate().define();

    return expression;
  }

  /**
   * Invokes {@link ByteArrayClassLoader} to define a {@link Class} extending
   * {@link Function}
   * 
   * @param <D>       the type of {@link Field} of the domain
   * @param <R>       the type of {@link Field} of the range
   * @param <F>       the type of {@link Function}
   * @param bytecodes the JVM opcodes defining the class
   * @return a {@link Class} ready to be instantiated and evaluated
   */
  @SuppressWarnings("unchecked")
  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Class<F>
         defineFunctionClass(String className, byte[] bytecodes)
  {

    try
    {
      ByteArrayClassLoader loader = new ByteArrayClassLoader(className,
                                                             bytecodes);
      return (Class<F>) loader.findClass(className);
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
  }

  /**
   * Declares the given constants as fields in the class being generated.
   * 
   * @param cw               The ClassVisitor for the class being generated
   * @param typeDescriptor   the type of the fields
   * @param literalConstants An {@link Iterable} of {@link LiteralConstant}
   *                         objects representing the constants to be declared
   * @return
   */
  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         declareConstants(ClassVisitor cw, String typeDescriptor, ArrayList<LiteralConstant<D, R, F>> literals)
  {
    if (!literals.isEmpty())
    {
      for (LiteralConstant<?, ?, ?> constant : literals)
      {
        cw.visitField(ACC_PUBLIC, constant.fieldName, typeDescriptor, null, null);
      }
    }
    return cw;
  }

  /**
   * Declares the given variables as fields in the class being generated.
   * 
   * @param cw        The ClassVisitor for the class being generated
   * @param variables A {@link Collection} of variable names to be declared as
   *                  fields
   * @return
   */
  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         declareVariables(Expression<D, R, F> expression, ClassVisitor cw, Collection<String> variables)
  {
    if (!variables.isEmpty())
    {
      for (String variableName : variables)
      {
        cw.visitField(ACC_PUBLIC, variableName, expression.domainClassDescriptor, null, null);
      }
    }
    return cw;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         closeField(Expression<D, R, F> expression, MethodVisitor mv, String fieldNameToBeClosed)
  {
    mv.visitFieldInsn(GETFIELD, expression.className, fieldNameToBeClosed, expression.domainClassDescriptor);
    mv.visitMethodInsn(INVOKEVIRTUAL, expression.domainClassInternalName, "close", "()V", false);
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         generateConstructor(Expression<D, R, F> expression, ClassVisitor cw)
  {
    if (expression.verbose)
    {
      System.out.println("Generating constructor for " + expression);
    }
    MethodVisitor mv = cw.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    // call the super class default no-arg constructor
    mv.visitVarInsn(ALOAD, 0);
    mv.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);

    if (!expression.literalConstants.isEmpty())
    {
      if (expression.verbose)
      {
        System.out.println("Preparing literal constants: " + expression.literalConstants);
      }

      initializeLiteralConstants(expression, mv);
    }

    if (expression.intermediateVariableCount > 0)
    {
      if (expression.verbose)
      {
        System.err.println("Preparing intermediate variables: " + expression.intermediateVariables);
      }
      initializeIntermediateVariables(expression, mv);
    }

    mv.visitInsn(RETURN);
    mv.visitMaxs(0, 0);
    mv.visitEnd();
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeLiteralConstants(Expression<D, R, F> expression, MethodVisitor mv)
  {

    for (LiteralConstant<D, R, F> literal : expression.literalConstants)
    {
      initializeLiteralConstantWithString(expression, mv, literal);
    }
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariables(Expression<D, R, F> expression, MethodVisitor mv)
  {
    for (String intermediateVariable : expression.intermediateVariables)
    {
      initializeField(expression, mv, intermediateVariable);
    }
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression, String className, ClassVisitor cw)
  {
    cw.visit(V20 | V_PREVIEW, ACC_PUBLIC, className, null, objectDesc, new String[]
    { expression.functionClassInternalName });
    return cw;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeField(Expression<D, R, F> expression, MethodVisitor mv, String intermediateVariable)
  {
    mv.visitVarInsn(ALOAD, 0);
    mv.visitTypeInsn(NEW, expression.domainClassInternalName);
    mv.visitInsn(DUP);
    mv.visitMethodInsn(INVOKESPECIAL, expression.domainClassInternalName, "<init>", "()V", false);
    mv.visitFieldInsn(PUTFIELD, expression.className, intermediateVariable, expression.domainClassDescriptor);
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeLiteralConstantWithPi(Expression<D, R, F> expression,
                                         MethodVisitor mv,
                                         LiteralConstant<D, R, F> constant)
  {

    mv.visitVarInsn(ALOAD, 0);
    mv.visitTypeInsn(NEW, expression.domainClassInternalName);
    mv.visitInsn(DUP);
    mv.visitLdcInsn(constant.value);
    mv.visitIntInsn(SIPUSH, constant.bits);
    mv.visitMethodInsn(INVOKESPECIAL, expression.domainClassInternalName, "<init>", "(Ljava/lang/String;I)V", false);

    mv.visitFieldInsn(PUTFIELD, expression.className, constant.fieldName, expression.domainClassDescriptor);
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeLiteralConstantWithString(Expression<D, R, F> expression,
                                             MethodVisitor mv,
                                             LiteralConstant<D, R, F> constant)
  {

    mv.visitVarInsn(ALOAD, 0);
    mv.visitTypeInsn(NEW, expression.domainClassInternalName);
    mv.visitInsn(DUP);
    mv.visitLdcInsn(constant.value);
    mv.visitIntInsn(SIPUSH, constant.bits);
    mv.visitMethodInsn(INVOKESPECIAL, expression.domainClassInternalName, "<init>", "(Ljava/lang/String;I)V", false);

    mv.visitFieldInsn(PUTFIELD, expression.className, constant.fieldName, expression.domainClassDescriptor);
    return mv;
  }

  /**
   * Checks whether a given character is a digit, a decimal point, or '½'
   * 
   * @param ch The character to check
   * @return true if the character is a digit or a decimal point; false otherwise
   */
  static boolean isNumeric(int ch)
  {
    return (ch >= '0' && ch <= '9') || ch == '.' || ch == '½';
  }

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean isDigit(int ch)
  {
    return ch >= '0' && ch <= '9';
  }

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean isLatinOrGreek(int ch, boolean digit)
  {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || isGreek(ch) || ch == '√' || ch == '₀'
                  || (digit && (ch >= '0' && ch <= '9'));
  }

  /**
   * 
   * @param ch
   * @return true if ch represents an upper or lowercase GreekRegistration
   */
  public static boolean isGreek(int ch)
  {
    return (ch >= 0x0391 && ch <= 0x03A9) || (ch >= 0x03B1 && ch <= 0x03C9);
  }

  /**
   * Loads the `this` reference onto the JVM stack.
   * 
   * @param mv The MethodVisitor to be used for adding the `this` reference
   * @return
   */
  public static MethodVisitor loadThis(MethodVisitor mv)
  {
    mv.visitVarInsn(ALOAD, 0); // Load `this` onto the stack
    return mv;
  }

  /**
   * Prepares the stack for reusing the left node. There is no direct JVM
   * instruction to duplicate the bottom value of the stack to the top, so a
   * combination of instructions is necessary.
   * 
   * Stack: (L, R, I) -> (L, R, I, L)
   * 
   * DUP2_X1: (L, R, I) -> (R, I, L, R, I).
   * 
   * POP2: (R, I, L, R, I) -> (R,I,L)
   * 
   * DUP_X2: (R,I,L) -> (L, R, I, L).
   * 
   * @param mv The {@link MethodVisitor} to which instructions to transform the
   *           stack are dispatched
   * 
   * @return mv (fluent pattern)
   */
  public static MethodVisitor prepareStackForReusingLeftSide(MethodVisitor mv)
  {
    mv.visitInsn(DUP2_X1);
    mv.visitInsn(POP2);
    mv.visitInsn(DUP_X2);
    return mv;
  }

  /**
   * Prepares the stack for reusing the right node.
   * 
   * Stack: (L, R, I) -> (L, R, I, R)
   *
   * The method uses the following bytecode instructions:
   *
   * SWAP: Swaps the top two operand stack values. (L, R, I) -> (L, I, R)
   *
   * DUP_X1: Duplicates the top operand stack value and inserts it beneath the
   * next-to-topmost value: (L, I, R) -> (L, R, I, R)
   * 
   * @param mv The {@link MethodVisitor} to which instructions to transform the
   *           stack are emitted
   * 
   * @return mv
   */
  public static MethodVisitor prepareStackForReusingRightSide(MethodVisitor mv)
  {
    mv.visitInsn(SWAP);
    mv.visitInsn(DUP_X1);
    return mv;
  }

  /**
   * Loads the 4th and last argument onto the stack, and since this follows the
   * fluent pattern, it is also the return variable
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param mv the {@link MethodVisitor} to receive the instructions
   * 
   * @return mv
   */
  public static MethodVisitor loadResult(MethodVisitor mv)
  {
    mv.visitVarInsn(Opcodes.ALOAD, 4);
    return mv;
  }

  /**
   * Loads the 3rd argument (bits) onto the stack
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param mv the {@link MethodVisitor} to receive the instructions
   * 
   * @return mv the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadBits(MethodVisitor mv)
  {
    mv.visitVarInsn(Opcodes.ILOAD, 3); // Load bits onto the stack
    return mv;
  }

  /**
   * Loads the 1st argument (this) onto the stack
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param mv the {@link MethodVisitor} to receive the instructions
   * 
   * @return mv the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadInput(MethodVisitor mv)
  {
    mv.visitVarInsn(Opcodes.ALOAD, 1); // Load `input` onto the stack
    return mv;
  }

  /**
   * 
   * @param ch
   * @return true if ch represents a caret or a UTF superscript digit except 0 or
   *         1 because it doesn't make sense to raise anything to the 0th power
   *         because thats just equal to 1 and it doesn't make sense to raise
   *         something to the 1st power because thats the identity operation
   * 
   */
  public static boolean isPowerCharacter(int ch)
  {
    return ch == '^' || ch == '⁰' || ch == '¹' || ch == '²' || ch == '³' || (ch >= '⁴' && ch <= '⁹');
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String expression,
                 Context<D, R, F> context,
                 Class<D> class1,
                 Class<R> class2,
                 Class<F> class3,
                 boolean verbose)
  {
    String className = Compiler.expressionToUniqueClassname(expression);
    return compile(className, expression, context, class1, class2, class3, verbose);
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
                     .replace('[', '_')
                     .replace(']', '_');
  }

  /**
   * Generate an invocation of member function of {@link Field} by its name and
   * the {@link Node} whose evaluated result is the independent variable, also
   * known as the argument, to be passed to the function represented by this node
   * 
   * @param mv
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return
   */
  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         callRegisteredFunction(MethodVisitor mv,
                                String functionName,
                                Node<D, R, F> arg,
                                boolean lastCall,
                                int depth)
  {
    var     expression = arg.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      System.err.format("callRegisteredFunction(functionName=%s, arg=%s, lastCall=%s, depth=%d)\n",
                        functionName,
                        arg,
                        lastCall,
                        depth);
    }

    arg.generate(mv);
    loadBits(mv);

    if (lastCall)
    {
      loadResult(mv);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          System.err.println("Preparing stack to reuse its argument " + arg.toString(-1));
        }

        arg.prepareStackForReuse(mv);
      }
      else
      {
        expression.locateExistingOrInstantiateNewIntermediateResultVariable(mv, depth);
      }
    }

    return expression.callRegisteredUnaryFunction(expression.checkClassCast(mv, false), functionName);
  }

  /**
   * Generate an invocation of member function of {@link Field} by its name and
   * the {@link Node} whose evaluated result is the independent variable, also
   * known as the argument, to be passed to the function represented by this node
   * 
   * @param mv
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return
   */
  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         callFieldMethod(MethodVisitor mv, String functionName, Node<D, R, F> arg, boolean lastCall, int depth)
  {
    var     expression = arg.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      System.err.format("callFunction(functionName=%s, arg=%s, lastCall=%s, depth=%d)\n",
                        functionName,
                        arg,
                        lastCall,
                        depth);
    }

    arg.generate(mv);
    loadBits(mv);

    if (lastCall)
    {
      loadResult(mv);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          System.err.println("Preparing stack to reuse its argument " + arg.toString(-1));
        }

        arg.prepareStackForReuse(mv);
      }
      else
      {
        expression.locateExistingOrInstantiateNewIntermediateResultVariable(mv, depth);
      }
    }

    return expression.callUnaryFunction(expression.checkClassCast(mv, false), functionName);
  }

  /**
   * Replaces UTF subscripts ₀-₉ with 0-9, so that J₀ can be parsed as a
   * {@link BesselFunctionOfTheFirstKind} and other similar expressions likewise
   * 
   * @param expression
   * 
   * @return expression with 0-9 substituted in place of ₀-₉
   */
  public static String replaceSubscripts(String expression)
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

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         F
         instantiate(String expression,
                     Context<D, R, F> context,
                     Class<D> class1,
                     Class<R> class2,
                     Class<F> class3,
                     boolean verbose)
  {
    return compile(expression, context, class1, class2, class3, verbose).instantiate();
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
    return compile(className, expression, context, domainClass, rangeClass, functionClass, verbose).instantiate();
  }

  public static RealFunction express(String expression)
  {
    return express(expression, null);
  }

  public static RealFunction express(String expression, RealContext context)
  {
    return instantiate(expression, context, Real.class, Real.class, RealFunction.class, false);
  }

  /**
   * Returns this{@link #express(String, RealContext)} after calling
   * {@link Context#registerFunction(String, Function)} to register the function
   * by name in the specified {@link Context}
   * 
   * @param name
   * @param expression
   * @param context
   * @return
   */
  public static RealFunction express(String name, String expression, RealContext context)
  {
    RealFunction func = instantiate(expression, context, Real.class, Real.class, RealFunction.class, false);
    context.registerFunction(name, func);
    assert false : "TODO: https://github.com/crowlogic/arb4j/issues/264: inject the function as a member variable in the expression class during initialization and load the field as the 1st operand, order=2 for the 2nd operand, bits for the 3rd, and then the result variable to be returned as the 4th operand";
    return func;
  }

  public static RealFunction express(String className, String expression, RealContext context, boolean verbose)
  {
    return instantiate(className, expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static RealFunction express(String expression, RealContext context, boolean verbose)
  {
    return instantiate(expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static RealFunction express(String expression, boolean verbose)
  {
    return instantiate(expression, null, Real.class, Real.class, RealFunction.class, verbose);
  }

}
