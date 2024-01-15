package arb.expressions;

import static arb.expressions.Parser.expressionToUniqueClassname;
import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.DUP2_X1;
import static org.objectweb.asm.Opcodes.DUP_X1;
import static org.objectweb.asm.Opcodes.DUP_X2;
import static org.objectweb.asm.Opcodes.INVOKESPECIAL;
import static org.objectweb.asm.Opcodes.POP2;
import static org.objectweb.asm.Opcodes.RETURN;
import static org.objectweb.asm.Opcodes.SWAP;
import static org.objectweb.asm.Opcodes.V21;
import static org.objectweb.asm.Opcodes.V_PREVIEW;

import java.util.Map;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.signature.SignatureVisitor;
import org.objectweb.asm.signature.SignatureWriter;

import arb.*;
import arb.Integer;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

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
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 */

public class Compiler
{
  public static final String objectDesc = Type.getInternalName(Object.class);

  public static <D, R, F extends Function<D, R>> Expression<D, R, F> compile(String expression,
                                                                             Context context,
                                                                             Class<? extends D> domainClass,
                                                                             Class<? extends R> rangeClass,
                                                                             Class<? extends F> functionClass,
                                                                             boolean verbose)
  {
    return compile(expression, context, domainClass, rangeClass, functionClass, verbose, null);
  }

  public static <D, R, F extends Function<D, R>> Expression<D, R, F> compile(String expression,
                                                                             Context context,
                                                                             Class<? extends D> domainClass,
                                                                             Class<? extends R> rangeClass,
                                                                             Class<? extends F> functionClass,
                                                                             boolean verbose,
                                                                             String functionName)
  {
    String className = functionName != null ? functionName : expressionToUniqueClassname(expression);
    return compile(className, expression, context, domainClass, rangeClass, functionClass, verbose, functionName);

  }

  public static <D, R, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> rangeClass,
                 Class<? extends F> functionClass,
                 boolean verbose,
                 String functionName) 
  {
    Expression<D, R, F> expression = new Expression<D, R, F>(className,
                                                             domainClass,
                                                             rangeClass,
                                                             functionClass,
                                                             expressionString,
                                                             context,
                                                             functionName);

    if (verbose)
    {
      expression.verbose = true;
    }

    expression.generate().define();

    return expression;
  }

  public static <D, R, F extends Function<D, R>>
         Expression<D, R, F>
         compile(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> rangeClass,
                 Class<? extends F> functionClass,
                 boolean verbose)
  {
    return compile(className, expressionString, context, domainClass, rangeClass, functionClass, verbose, null);
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

    IntermediateVariable.initializeIntermediateVariables(expression, methodVisitor);

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
         initializeRegisteredFunctions(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    if (expression.verbose && expression.context != null && !expression.referencedFunctions.isEmpty())
    {
      err.println("Preparing function references: " + expression.referencedFunctions);
      err.flush();
    }

    if (expression.context != null)
    {
      expression.referencedFunctions.values()
                                    .forEach(mapping -> expression.initializeRegisteredFunction(methodVisitor,
                                                                                                mapping));
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
      literal.initializeLiteralConstantWithString(methodVisitor);
    }
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
  public static MethodVisitor loadResult(MethodVisitor methodVisitor, boolean verbose)
  {
    if (verbose)
    {
      out.format("\nloadResult()\n\n");
      out.flush();
    }
    methodVisitor.visitVarInsn(Opcodes.ALOAD, 4);
    return methodVisitor;
  }

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

  public static MethodVisitor invokeSetMethod(MethodVisitor mv, Class<?> outType, Class<?> inType, boolean verbose)
  {
    if (verbose)
    {
      out.format("\ninvokeSetMethod( outType=%s, inType=%s, verbose=%s )\n\n", outType, inType, verbose);
      out.flush();
    }
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(outType),
                       "set",
                       Type.getMethodDescriptor(Type.getType(outType), Type.getType(inType)),
                       false);
    return mv;
  }

  public static MethodVisitor checkClassCast(MethodVisitor methodVisitor, Class<?> type)
  {
    String checking = Type.getInternalName(type);

    methodVisitor.visitTypeInsn(Opcodes.CHECKCAST, checking);
    return methodVisitor;
  }

  public static String getFunctionTypeSignature(Class<?> domain, Class<?> range)
  {

    SignatureWriter signatureWriter = new SignatureWriter();

    signatureWriter.visitClassType(Type.getInternalName(Function.class));

    SignatureVisitor functionType = signatureWriter.visitTypeArgument('=')
                                                   .visitTypeArgument(SignatureVisitor.INSTANCEOF);
    functionType.visitClassType(Type.getInternalName(domain));
    functionType.visitEnd();

    SignatureVisitor rangeTypeArg = functionType.visitTypeArgument(SignatureVisitor.INSTANCEOF);

    rangeTypeArg.visitClassType(Type.getInternalName(range));
    rangeTypeArg.visitEnd();

    functionType.visitEnd();

    return signatureWriter.toString();

  }

  public static <D, R, F extends Function<D, R>>
         ClassVisitor
         declareVariables(ClassVisitor classVisitor, Iterable<Map.Entry<String, Variable<D, R, F>>> variables)
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

  public static String getIntermediateVariablePrefix(Class<?> type)
  {
    String prefix = "l";
    if (type.equals(Real.class))
    {
      prefix = "r";
    }
    else if (type.equals(Integer.class))
    {
      prefix = "i";
    }
    else if (type.equals(RealPolynomial.class))
    {
      prefix = "rp";
    }
    else if (type.equals(ComplexPolynomial.class))
    {
      prefix = "cp";
    }
    else if (type.equals(Complex.class))
    {
      prefix = "c";
    }
    else if (type.equals(RealMatrix.class))
    {
      prefix = "rm";
    }
    else if (type.equals(ComplexMatrix.class))
    {
      prefix = "cm";
    }
    return prefix;
  }

}
