package arb.expressions;

import static org.objectweb.asm.Opcodes.*;

import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodHandles.Lookup;
import java.util.ArrayList;
import java.util.Collection;

import org.objectweb.asm.*;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.LiteralConstant;
import arb.functions.Function;
import arb.functions.real.RealFunction;

public class Compiler
{
  private static final String objectDesc = Type.getInternalName(Object.class);

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, boolean verbose)
  {
    return compile(className, expression, null, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, Variables<Real> variables, boolean verbose)
  {
    return compile(className, expression, variables, Real.class, Real.class, RealFunction.class, verbose);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, Variables<Real> variables)
  {
    return compile(className, expression, variables, Real.class, Real.class, RealFunction.class, false);
  }

  /**
   * this{@link #construct(String, String, Variables, Class, Class, Class)}s and
   * {@link Expression#compile()}s a given expression and corresponding
   * specifications of types and variables
   * 
   * @param <D>
   * @param <R>
   * @param <F>
   * @param className
   * @param expressionString
   * @param variables
   * @param domainClass
   * @param rangeClass
   * @param functionClass
   * @param verbose
   * @return
   */
  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String className,
                 String expressionString,
                 Variables<D> variables,
                 Class<D> domainClass,
                 Class<R> rangeClass,
                 Class<F> functionClass,
                 boolean verbose)
  {
    Expression<D, R, F> expression = new Expression<>(className,
                                                      domainClass,
                                                      rangeClass,
                                                      functionClass,
                                                      expressionString,
                                                      variables);

    if (verbose)
    {
      expression.verbose = true;
    }

    expression.generate().define();

    return expression;
  }

  /**
   * Calls {@link Lookup#defineClass(byte[])} to generate a {@link Class}
   * extending {@link Function}
   * 
   * @param <D>       the type of {@link Field} of the domain
   * @param <R>       the type of {@link Field} of the range
   * @param <F>       the type of {@link Function}
   * @param bytecodes
   * @return a {@link Class} ready to be instantiated and evaluated
   */
  @SuppressWarnings("unchecked")
  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         Class<F>
         defineFunctionClass(byte[] bytecodes)
  {

    try
    {
      Lookup lookup = MethodHandles.lookup();
      synchronized (lookup)
      {
        return (Class<F>) lookup.defineClass(bytecodes);
      }
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
   * @param literalConstants An Iterable of {@link LiteralConstant} objects
   *                         representing the constants to be declared
   * @return
   */
  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
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
  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
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

  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         MethodVisitor
         closeField(Expression<D, R, F> expression, MethodVisitor mv, String fieldNameToBeClosed)
  {
    mv.visitFieldInsn(GETFIELD, expression.className, fieldNameToBeClosed, expression.domainClassDescriptor);
    mv.visitMethodInsn(INVOKEVIRTUAL, expression.domainClassInternalName, "close", "()V", false);
    return mv;
  }

  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
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

  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
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
   * Injects code to cause an AnalyzerException by attempting to pass a string as
   * an argument to a method that expects an integer. The method used here is
   * System.exit(int), which is intended to terminate the JVM with an exit code
   * provided as an integer. By passing a string instead, this causes an
   * AnalyzerException, which can be used to debug bytecode generation.
   *
   * This code is intended to trigger an exception in the CheckClassAdapter, which
   * checks the correctness of the Java bytecode produced by a MethodVisitor. The
   * CheckClassAdapter will dump the state of the stack in response to this
   * exception. This includes the bytecode instructions along with the state of
   * the operand stack and local variable array after each instruction, allowing
   * detailed insight into the state of the JVM at the time of the exception.
   *
   * Note: As of the time of this writing, this method is guaranteed to crash in
   * all conditions, since the System.exit method universally expects an integer
   * as an argument, and we're intentionally providing a string.
   * 
   * @param mv the MethodVisitor to which the crash code is to be added
   * @return
   */
  static MethodVisitor causeStacktrace(MethodVisitor mv)
  {
    mv.visitLdcInsn("intentional bogus instruction to halt program and print the stack");
    mv.visitMethodInsn(INVOKESTATIC, "java/lang/Thread", "sleep", "(I)V", false);
    return mv;
  }

  /**
   * Checks whether a given character is a digit or a decimal point.
   * 
   * @param ch The character to check
   * @return true if the character is a digit or a decimal point; false otherwise
   */
  static boolean isDigitOrDot(int ch)
  {
    return (ch >= '0' && ch <= '9') || ch == '.';
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
   * Prepares the stack for reusing the left node.
   * 
   * Stack: (L, R, I) -> (L, R, I, L)
   * 
   * DUP2_X1: (L, R, I) -> (R, I, L, R, I).
   * 
   * POP2: (R, I, L, R, I) -> (R,I,L)
   * 
   * DUP_X2: (R,I,L) -> (L, R, I, L).
   * 
   * @param mv The MethodVisitor to manipulate the stack
   * @return
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
   * @param mv The MethodVisitor to manipulate the stack
   * @return
   */
  public static MethodVisitor prepareStackForReusingRightSide(MethodVisitor mv)
  {
    mv.visitInsn(SWAP);
    mv.visitInsn(DUP_X1);
    return mv;
  }

  public static MethodVisitor loadResult(MethodVisitor mv)
  {
    mv.visitVarInsn(Opcodes.ALOAD, 4);
    return mv;
  }

  public static MethodVisitor loadBits(MethodVisitor mv)
  {
    mv.visitVarInsn(Opcodes.ILOAD, 3); // Load bits onto the stack
    return mv;
  }

  public static MethodVisitor loadInput(MethodVisitor mv)
  {
    mv.visitVarInsn(Opcodes.ALOAD, 1); // Load `input` onto the stack
    return mv;
  }

  /**
   * 
   * @param ch
   * @return true if ch represents a caret or a UTF superscript digit except 0 or
   *         1 because it doesnt make sense to raise anything to the 0th power
   *         because thats just equal to 1 and it doesnt make sense to raise
   *         something to the 1st power because thats the identity operation
   * 
   */
  public static boolean isPowerCharacter(int ch)
  {
    return ch == '^' || ch == '⁰' || ch == '¹' || ch == '²' || ch == '³' || (ch >= '⁴' && ch <= '⁹');
  }

  static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String expression,
                 Variables<D> variables,
                 Class<D> domainClass,
                 Class<R> rangeClass,
                 Class<F> functionClass,
                 boolean verbose)
  {
    String className = Compiler.expressionToUniqueClassname(expression);
    return compile(className, expression, variables, domainClass, rangeClass, functionClass, verbose);
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
