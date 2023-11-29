package arb.expressions;

import static java.lang.System.*;
import static org.objectweb.asm.Opcodes.*;

import java.util.Collection;

import org.objectweb.asm.*;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class Compiler
{
  private static final String objectDesc = Type.getInternalName(Object.class);

  /**
   * Generate an invocation of member function of {@link Field} by its name and
   * the {@link Node} whose evaluated result is the independent variable, also
   * known as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return
   */
  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         callFieldFunction(MethodVisitor methodVisitor,
                           String functionName,
                           Node<D, R, F> arg,
                           boolean lastCall,
                           int depth)
  {
    var     expression = arg.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      err.format("callFunction(functionName=%s, arg=%s, lastCall=%s, depth=%d)\n",
                 functionName,
                 arg,
                 lastCall,
                 depth);
      err.flush();
    }

    arg.generate(methodVisitor);
    loadBits(methodVisitor);

    if (lastCall)
    {
      loadResult(methodVisitor);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + arg.toString(-1));
          err.flush();
        }

        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.locateExistingOrInstantiateNewIntermediateResultVariable(methodVisitor, depth);
      }
    }

    expression.checkClassCast(methodVisitor, false);
    return expression.callUnaryFunction(methodVisitor, functionName);
  }

  /**
   * Generate an invocation of function registered via
   * {@link Context#registerFunction(String, Function)} by its name and the
   * {@link Node} whose evaluated result is the independent variable, also known
   * as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return
   */
  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         callRegisteredFunction(MethodVisitor methodVisitor,
                                String functionName,
                                Node<D, R, F> arg,
                                boolean lastCall,
                                int depth)
  {
    var     expression = arg.expression;
    boolean verbose    = expression.verbose;

    if (verbose)
    {
      err.format("callRegisteredFunction(functionName=%s, arg=%s, lastCall=%s, depth=%d)\n",
                 functionName,
                 arg,
                 lastCall,
                 depth);
      err.flush();

    }
    loadThisOntoStack(methodVisitor);
    expression.loadFieldOntoStack(methodVisitor, functionName, true);

    arg.generate(methodVisitor);
    loadZero(methodVisitor);
    loadBits(methodVisitor);

    if (lastCall)
    {
      loadResult(methodVisitor);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + arg.toString(-1));
          err.flush();
        }

        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.locateExistingOrInstantiateNewIntermediateResultVariable(methodVisitor, depth);
      }
    }

    return expression.callRegisteredUnaryFunction(expression.checkClassCast(methodVisitor, false), functionName);
  }

  public static void loadZero(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(Opcodes.ICONST_0);
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         closeField(Expression<D, R, F> expression, MethodVisitor methodVisitor, String fieldNameToBeClosed)
  {
    methodVisitor.visitFieldInsn(GETFIELD,
                                 expression.className,
                                 fieldNameToBeClosed,
                                 expression.domainClassDescriptor);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, expression.domainClassInternalName, "close", "()V", false);
    return methodVisitor;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String expression,
                 Context<D, R, F> context,
                 Class<D> domainClass,
                 Class<R> rangeClass,
                 Class<F> functionClass,
                 boolean verbose)
  {
    String className = Parser.expressionToUniqueClassname(expression);
    return compile(className, expression, context, domainClass, rangeClass, functionClass, verbose);
  }

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, boolean verbose)
  {
    return compile(className, expression, null, verbose);
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

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, RealContext context)
  {
    return compile(className, expression, context, false);
  }

  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         Expression<Real, Real, RealFunction>
         compile(String className, String expression, RealContext context, boolean verbose)
  {
    return compile(className, expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  /**
   * Declares the given constants as fields in the class being generated.
   * 
   * @param classVisitor     The ClassVisitor for the class being generated
   * @param typeDescriptor   the type of the fields
   * @param literalConstants An {@link Iterable} of {@link LiteralConstant}
   *                         objects representing the constants to be declared
   * @return
   */
  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         declareConstants(ClassVisitor classVisitor,
                          String typeDescriptor,
                          Iterable<LiteralConstant<D, R, F>> literals)
  {
    for (LiteralConstant<?, ?, ?> constant : literals)
    {
      classVisitor.visitField(ACC_PUBLIC, constant.fieldName, typeDescriptor, null, null);
    }
    return classVisitor;
  }

  /**
   * Declares the given variables as fields in the class being generated.
   * 
   * @param classVisitor The ClassVisitor for the class being generated
   * @param variables    A {@link Collection} of variable names to be declared as
   *                     fields
   * @return
   */
  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         declareVariables(Expression<D, R, F> expression, ClassVisitor classVisitor, Iterable<String> variables)
  {
    for (String variableName : variables)
    {
      classVisitor.visitField(ACC_PUBLIC, variableName, expression.domainClassDescriptor, null, null);
    }
    return classVisitor;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         declareFunctions(Expression<D, R, F> expression, ClassVisitor classVisitor, Functions<F> functions)
  {
    for (String functionName : functions.keySet())
    {
      classVisitor.visitField(ACC_PUBLIC, functionName, expression.functionClassDescriptor, null, null);
    }
    return classVisitor;
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

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         generateConstructor(Expression<D, R, F> expression, ClassVisitor classVisitor)
  {
    if (expression.verbose)
    {
      out.println("Generating constructor for " + expression);
      out.flush();
    }
    MethodVisitor mv = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    mv.visitCode();

    // call the super class default no-arg constructor
    mv.visitVarInsn(ALOAD, 0);
    mv.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);

    if (!expression.literalConstants.isEmpty())
    {
      if (expression.verbose)
      {
        out.println("Preparing literal constants: " + expression.literalConstants);
        out.flush();
      }

      initializeLiteralConstants(expression, mv);
    }

    if (expression.intermediateVariableCount > 0)
    {
      if (expression.verbose)
      {
        err.println("Preparing intermediate variables: " + expression.intermediateVariables);
        err.flush();
      }
      initializeIntermediateVariables(expression, mv);
    }

    mv.visitInsn(RETURN);
    mv.visitMaxs(0, 0);
    mv.visitEnd();
    return mv;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression, String className, ClassVisitor classVisitor)
  {
    classVisitor.visit(V20 | V_PREVIEW, ACC_PUBLIC, className, null, objectDesc, new String[]
    { expression.functionClassInternalName });
    return classVisitor;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeField(Expression<D, R, F> expression, MethodVisitor methodVisitor, String intermediateVariable)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, expression.domainClassInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, expression.domainClassInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD,
                                 expression.className,
                                 intermediateVariable,
                                 expression.domainClassDescriptor);
    return methodVisitor;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariables(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    for (String intermediateVariable : expression.intermediateVariables)
    {
      initializeField(expression, methodVisitor, intermediateVariable);
    }
    return methodVisitor;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeLiteralConstants(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {

    for (LiteralConstant<D, R, F> literal : expression.literalConstants)
    {
      initializeLiteralConstantWithString(expression, methodVisitor, literal);
    }
    return methodVisitor;
  }

  static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         initializeLiteralConstantWithString(Expression<D, R, F> expression,
                                             MethodVisitor methodVisitor,
                                             LiteralConstant<D, R, F> constant)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, expression.domainClassInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitLdcInsn(constant.value);
    methodVisitor.visitIntInsn(SIPUSH, constant.bits);
    methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                  expression.domainClassInternalName,
                                  "<init>",
                                  "(Ljava/lang/String;I)V",
                                  false);
    methodVisitor.visitFieldInsn(PUTFIELD,
                                 expression.className,
                                 constant.fieldName,
                                 expression.domainClassDescriptor);
    return methodVisitor;
  }

  /**
   * Loads the 3rd argument (bits) onto the stack
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param methodVisitor the {@link MethodVisitor} to receive the instructions
   * 
   * @return mv the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadBits(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ILOAD, 3); // Load bits onto the stack
    return methodVisitor;
  }

  /**
   * Loads the 1st argument (this) onto the stack
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param methodVisitor the {@link MethodVisitor} to receive the instructions
   * 
   * @return mv the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadInput(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ALOAD, 1); // Load `input` onto the stack
    return methodVisitor;
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
   * Loads the `this` reference onto the JVM stack.
   * 
   * @param methodVisitor The MethodVisitor to be used for adding the `this`
   *                      reference
   * @return
   */
  public static MethodVisitor loadThisOntoStack(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0); // Load `this` onto the stack
    return methodVisitor;
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
   * @param methodVisitor The {@link MethodVisitor} to which instructions to
   *                      transform the stack are dispatched
   * 
   * @return mv (fluent pattern)
   */
  public static MethodVisitor prepareStackForReusingLeftSide(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(DUP2_X1);
    methodVisitor.visitInsn(POP2);
    methodVisitor.visitInsn(DUP_X2);
    return methodVisitor;
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
   * @param methodVisitor The {@link MethodVisitor} to which instructions to
   *                      transform the stack are emitted
   * 
   * @return mv
   */
  public static MethodVisitor prepareStackForReusingRightSide(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(SWAP);
    methodVisitor.visitInsn(DUP_X1);
    return methodVisitor;
  }

}
