package arb.expressions;

import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.*;

import java.io.Closeable;
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
 * The Compiler class in the arb.expressions package is a comprehensive utility for compiling expressions in a 
 * dynamic and flexible manner. This class provides a variety of static methods to generate, manipulate, and 
 * compile expressions, mainly focusing on the functionality surrounding the ASM bytecode manipulation framework. 
 * The class is designed to work with a range of types represented by the generic parameters D, R, and F, 
 * corresponding to different field and function types in the expression's domain and range.
 *
 * Key functionalities include:
 *  - Compiling expressions into Java bytecodes.
 *  - Handling field functions and registered functions through method invocations.
 *  - Loading and managing various types of arguments and variables, like zero, order, bits, results, 
 *    and the 'this' reference.
 *  - Handling literal constants and intermediate variables.
 *  - Preparing and managing the stack for different use cases, such as reusing left or right nodes.
 *  - Closing field resources and defining function classes.
 *
 * The class relies on various ASM classes like {@link MethodVisitor} and {@link ClassVisitor} to generate and 
 * manipulate bytecodes to generate implementations of {@link Function}s on-the-fly, chiefly thru the 
 * {@link Expression} class to provide a flexible and dynamic expression compilation environment.
 *
 * Usage of this class requires a thorough understanding of ASM bytecode manipulation and the arb library's 
 * structure and types. The verbose mode in various methods aids in debugging and understanding the internal 
 * processes during expression compilation.
 * 
 * </pre>
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
 */

public class Compiler
{
  private static final String objectDesc = Type.getInternalName(Object.class);

  /**
   * Generate an invocation of member function of an {@link Object} by its name
   * and the {@link Node} whose evaluated result is the independent variable, also
   * known as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return methodVisitor (for fluent-style function composition)
   */
  public static <D, R, F extends Function<D, R>> MethodVisitor callFunctionOfVariable(MethodVisitor methodVisitor,
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
    return expression.callBuiltinUnaryFunction(methodVisitor, functionName);
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
   * @return methodVisitor
   */
  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         generateRegisteredFunctionCall(MethodVisitor methodVisitor,
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

    F func = expression.context.functions.get(functionName);

    if (func == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s(.)", functionName));
    }
    expression.loadVariableReferenceOntoStack(loadThisOntoStack(methodVisitor),
                                              functionName,
                                              func.getClass().descriptorString());

    arg.generate(methodVisitor);
    loadOrder(methodVisitor);
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

    expression.callRegisteredUnaryFunction(methodVisitor, functionName, func);

    if (verbose)
    {
      err.println("Returning from callRegisteredFunction");
      err.flush();
    }
    return methodVisitor;
  }

  public static void loadZeroConstant(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(Opcodes.ICONST_0);
  }

  /**
   * Generate a call to the {@link Object}s {@link Closeable#close()} method
   * 
   * @param <D>
   * @param <R>
   * @param <F>
   * @param expression
   * @param methodVisitor
   * @param variableNameToBeClosed
   * @return
   */
  static <D, R, F extends Function<D, R>> MethodVisitor generateVariableClosure(Expression<D, R, F> expression,
                                                                                MethodVisitor methodVisitor,
                                                                                String variableNameToBeClosed)
  {
    methodVisitor.visitFieldInsn(GETFIELD,
                                 expression.className,
                                 variableNameToBeClosed,
                                 expression.domainClassDescriptor);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, expression.domainClassInternalName, "close", "()V", false);
    return methodVisitor;
  }

  static <D, R, F extends Function<D, R>> Expression<D, R, F> compile(String expression,
                                                                      Context context,
                                                                      Class<? extends D> domainClass,
                                                                      Class<? extends R> rangeClass,
                                                                      Class<? extends F> functionClass,
                                                                      boolean verbose)
  {
    String className = Parser.expressionToUniqueClassname(expression);
    return compile(className, expression, context, domainClass, rangeClass, functionClass, verbose);
  }

  public static <D, R, F extends Function<D, R>> Expression<Real, Real, RealFunction> compile(String className,
                                                                                              String expression,
                                                                                              boolean verbose)
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
  public static <D, R, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> rangeClass,
                 Class<? extends F> functionClass,
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

  public static <D, R, F extends Function<D, R>> Expression<Real, Real, RealFunction> compile(String className,
                                                                                              String expression,
                                                                                              Context context)
  {
    return compile(className, expression, context, false);
  }

  public static Expression<Real, Real, RealFunction>
         compile(String className, String expression, Context context, boolean verbose)
  {
    return compile(className, expression, context, Real.class, Real.class, RealFunction.class, verbose);
  }

  /**
   * Declares the given constants as fields in the class being generated.
   * 
   * @param classVisitor     The {@link ClassVisitor} for the class being
   *                         generated
   * @param typeDescriptor   the type of the fields
   * @param literalConstants An {@link Iterable} of {@link LiteralConstant}
   *                         objects representing the constants to be declared
   * @return classVisitor
   */
  public static <D, R, F extends Function<D, R>>
         ClassVisitor
         declareConstants(ClassVisitor classVisitor,
                          String typeDescriptor,
                          Iterable<LiteralConstant<D, R, F>> literals)
  {
    for (var constant : literals)
    {
      classVisitor.visitField(ACC_PUBLIC, constant.fieldName, typeDescriptor, null, null);
    }
    return classVisitor;
  }

  /**
   * Declares the given variables as fields in the class being generated.
   * 
   * TODO: needs to be refactored so that the variable type is passed in
   * 
   * @param classVisitor The {@link ClassVisitor} for the class being generated
   * @param variables    A {@link Collection} of variable names to be declared as
   *                     fields
   * @return classVisitor
   */
  public static <D, R, F extends Function<D, R>> ClassVisitor declareVariables(Expression<D, R, F> expression,
                                                                               ClassVisitor classVisitor,
                                                                               Iterable<String> variables)
  {
    for (var variableName : variables)
    {
      classVisitor.visitField(ACC_PUBLIC, variableName, expression.domainClassDescriptor, null, null);
    }
    return classVisitor;
  }

  public static <D, R, F extends Function<D, R>> ClassVisitor declareFunctions(Expression<D, R, F> expression,
                                                                               ClassVisitor classVisitor,
                                                                               Functions functions)
  {
    functions.map.forEach((name, function) ->
    {
      String descriptor = function.getClass().descriptorString();

      if (expression.verbose)
      {
        out.format("declareFunction: name=%s classDescriptor=%s\n", name, descriptor);
        out.flush();
      }
      classVisitor.visitField(ACC_PUBLIC, name, descriptor, null, null);
    });
    return classVisitor;
  }

  /**
   * Invokes {@link CompiledExpressionClassLoader} to define a {@link Class}
   * extending {@link Function}
   * 
   * @param <D>       the type of {@link Field} of the domain
   * @param <R>       the type of {@link Field} of the range
   * @param <F>       the type of {@link Function}
   * @param bytecodes the JVM opcodes defining the class
   * @return a {@link Class} ready to be instantiated and evaluated
   */
  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>> Class<F> defineFunctionClass(String className,
                                                                                                  byte[] bytecodes,
                                                                                                  Context context)
  {

    try
    {
      CompiledExpressionClassLoader loader = context != null ? context.classLoader : new CompiledExpressionClassLoader();
      loader.defineClass(className, bytecodes);
      return (Class<F>) loader.findClass(className);
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
  }

  public static <D, R, F extends Function<D, R>> MethodVisitor generateConstructor(Expression<D, R, F> expression,
                                                                                   ClassVisitor classVisitor)
  {
    if (expression.verbose)
    {
      out.println("Generating constructor for " + expression);
      out.flush();
    }
    MethodVisitor methodVisitor = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    methodVisitor.visitCode();

    generateInvocationOfDefaultNoArgConstructor(methodVisitor);

    initializeLiteralConstants(expression, methodVisitor);

    initializeIntermediateVariables(expression, methodVisitor);

    initializeRegisteredFunctions(expression, methodVisitor);

    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(0, 0);
    methodVisitor.visitEnd();
    return methodVisitor;
  }

  public static void generateInvocationOfDefaultNoArgConstructor(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
  }

  public static <D, R, F extends Function<D, R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression, String className, ClassVisitor classVisitor)
  {
    classVisitor.visit(V21 | V_PREVIEW, ACC_PUBLIC, className, null, objectDesc, new String[]
    { expression.functionClassInternalName });
    return classVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeRegisteredFunction(Expression<D, R, F> expression,
                                      MethodVisitor methodVisitor,
                                      String functionName,
                                      Function<?, ?> function)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitInsn(ACONST_NULL);
    methodVisitor.visitFieldInsn(PUTFIELD,
                                 expression.className,
                                 functionName,
                                 function.getClass().descriptorString());
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeRegisteredFunctions(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    if (expression.verbose && expression.context != null && !expression.context.functions.isEmpty())
    {
      err.println("Preparing intermediate variables: " + expression.intermediateVariables);
      err.flush();
    }

    if (expression.context != null)
    {
      expression.context.functions.map.forEach((name, function) ->
      {
        initializeRegisteredFunction(expression, methodVisitor, name, function);
      });
    }
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariable(Expression<D, R, F> expression,
                                        MethodVisitor methodVisitor,
                                        String intermediateVariable)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, expression.rangeClassInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, expression.rangeClassInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD,
                                 expression.className,
                                 intermediateVariable,
                                 expression.rangeClassDescriptor);
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariables(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    if (expression.intermediateVariableCount > 0 && expression.verbose)
    {
      err.println("Preparing intermediate variables: " + expression.intermediateVariables);
      err.flush();
    }

    for (var intermediateVariable : expression.intermediateVariables)
    {
      initializeIntermediateVariable(expression, methodVisitor, intermediateVariable);
    }
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeLiteralConstants(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    if (expression.verbose && !expression.literalConstants.isEmpty())
    {

      out.println("Preparing literal constants: " + expression.literalConstants);
      out.flush();
    }

    for (var literal : expression.literalConstants)
    {
      initializeLiteralConstantWithString(expression, methodVisitor, literal);
    }
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
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
   * Loads the 2nd argument (order) onto the stack
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param methodVisitor the {@link MethodVisitor} to receive the instructions
   * 
   * @return methodVisitor the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadOrder(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ILOAD, 2);
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
   * @return methodVisitor the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadBits(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ILOAD, 3);
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
   * @return methodVisitor the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadInput(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ALOAD, 1);
    return methodVisitor;
  }

  /**
   * Loads the 4th and last argument onto the stack, and since this follows the
   * fluent pattern, it is also the return variable
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param methodVisitor the {@link MethodVisitor} to receive the instructions
   * 
   * @return methodVisitor
   */
  public static MethodVisitor loadResult(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ALOAD, 4);
    return methodVisitor;
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
    methodVisitor.visitVarInsn(ALOAD, 0);
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
   * @return methodVisitor (fluent pattern)
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
   * @return methodVisitor
   */
  public static MethodVisitor prepareStackForReusingRightSide(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(SWAP);
    methodVisitor.visitInsn(DUP_X1);
    return methodVisitor;
  }

}
