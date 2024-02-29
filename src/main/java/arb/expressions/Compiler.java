package arb.expressions;

import static arb.expressions.Parser.expressionToUniqueClassname;
import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.signature.SignatureVisitor;
import org.objectweb.asm.signature.SignatureWriter;

import arb.Complex;
import arb.ComplexMatrix;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.RealMatrix;
import arb.RealPolynomial;
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

  public static void addNullCheckForField(MethodVisitor mv, String className, String fieldName, String fieldDesc)
  {

    Label notNullLabel = new Label();
    mv.visitFieldInsn(Opcodes.GETFIELD, className, fieldName, fieldDesc);
    mv.visitJumpInsn(Opcodes.IFNONNULL, notNullLabel);
    mv.visitTypeInsn(Opcodes.NEW, Type.getInternalName(AssertionError.class));
    mv.visitInsn(Opcodes.DUP);
    mv.visitLdcInsn(fieldName + " is null");
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL,
                       Type.getInternalName(AssertionError.class),
                       "<init>",
                       "(Ljava/lang/Object;)V",
                       false);

    mv.visitInsn(Opcodes.ATHROW);

    mv.visitLabel(notNullLabel);
    mv.visitFrame(Opcodes.F_SAME, 0, null, 0, null);

  }

  public static MethodVisitor checkClassCast(MethodVisitor methodVisitor, Class<?> type)
  {
    String checking = Type.getInternalName(type);
    methodVisitor.visitTypeInsn(Opcodes.CHECKCAST, checking);
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>> Expression<D, R, F> express(String expression,
                                                                             Context context,
                                                                             Class<? extends D> domainClass,
                                                                             Class<? extends R> rangeClass,
                                                                             Class<? extends F> functionClass,
                                                                             String functionName)
  {
    String className = functionName != null ? functionName : expressionToUniqueClassname(expression);
    return express(className, expression, context, domainClass, rangeClass, functionClass, functionName);
  }

  public static <D, R, F extends Function<D, R>> Expression<D, R, F> express(String className,
                                                                             String expressionString,
                                                                             Context context,
                                                                             Class<? extends D> domainClass,
                                                                             Class<? extends R> rangeClass,
                                                                             Class<? extends F> functionClass,
                                                                             boolean verbose)
  {
    return express(className, expressionString, context, domainClass, rangeClass, functionClass, className);
  }

  public static <D, R, F extends Function<D, R>, PD, PR, PF extends Function<PD, PR>>
         Expression<D, R, F>
         express(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> rangeClass,
                 Class<? extends F> functionClass,
                 String functionName,
                 Expression<PD, PR, PF> containingExpression)
  {
    Expression<D, R, F> expression = new Expression<D, R, F>(className,
                                                             domainClass,
                                                             rangeClass,
                                                             functionClass,
                                                             expressionString,
                                                             context,
                                                             functionName,
                                                             containingExpression);

    expression.parse().compile().load();

    return expression;
  }

  public static <D, R, F extends Function<D, R>> Expression<D, R, F> express(String className,
                                                                             String expressionString,
                                                                             Context context,
                                                                             Class<? extends D> domainClass,
                                                                             Class<? extends R> rangeClass,
                                                                             Class<? extends F> functionClass,
                                                                             String functionName)
  {
    return express(className, expressionString, context, domainClass, rangeClass, functionClass, functionName, null);
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>> Class<F> loadFunctionClass(String className,
                                                                                                byte[] bytecodes,
                                                                                                Context context)
  {
    assert className != null;
    if (context != null && context.verbose)
    {
      System.out.println("Loading " + className);
    }
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

  public static <D, R, F extends Function<D, R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression, String className, ClassVisitor classVisitor)
  {
    String classSignature = null;

    if (expression.functionClass.equals(Function.class))
    {
      classSignature = expression.getFunctionClassTypeSignature();
    }

    classVisitor.visit(V21 | V_PREVIEW, ACC_PUBLIC | ACC_SUPER, className, classSignature, objectDesc, new String[]
    { expression.genericFunctionClassInternalName });
    return classVisitor;
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

  public static String getVariableSuffix(Class<?> type)
  {
    if (type.equals(Real.class))
    {
      return "ℝ";
    }
    else if (type.equals(Complex.class))
    {
      return "ℂ";
    }
    else if (type.equals(Integer.class))
    {
      return "ℤ";
    }
    else if (type.equals(RealPolynomial.class))
    {
      return "r̅";
    }
    else if (type.equals(ComplexPolynomial.class))
    {
      return "c̅";
    }
    else if (type.equals(RealMatrix.class))
    {
      return "ℝᵐˣⁿ";
    }
    else if (type.equals(ComplexMatrix.class))
    {
      return "ℂᵐˣⁿ";
    }
    else
    {
      throw new RuntimeException("unrecognized type " + type);
    }
  }

  public static MethodVisitor invokeSetMethod(MethodVisitor mv, Class<?> inType, Class<?> outType)
  {
    assert !outType.getClass().equals(Void.class) : "invokeSetMethod shouldnt be called for Void type";

    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(outType),
                       "set",
                       Type.getMethodDescriptor(Type.getType(outType), Type.getType(inType)),
                       false);
    return mv;
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
  public static MethodVisitor loadBitsParameter(MethodVisitor methodVisitor)
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
  public static MethodVisitor loadInputParameter(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ALOAD, 1);
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
  public static MethodVisitor loadOrderParameter(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ILOAD, 2);
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
  public static MethodVisitor loadResultParameter(MethodVisitor methodVisitor)
  {
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
   * DUP_X1: Duplicates the top(rightmost) operand stack value and inserts it
   * beneath the next-to-top value: (L, I, R) -> (L, R, I, R)
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

  public static void invokeSuperclassDefaultConstructor(MethodVisitor methodVisitor)
  {
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
  }

  public static void addTypeToStackMapFrame(MethodVisitor mv, Class<?> class1)
  {
    //System.out.println( "Adding " + class1 + " to StackMap");
    mv.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
    { Type.getInternalName(class1) });
  }

}
