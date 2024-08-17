package arb.expressions;

import static arb.expressions.Parser.expressionToUniqueClassname;
import static org.objectweb.asm.Opcodes.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.*;
import arb.Integer;
import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.functions.Function;
import arb.functions.polynomials.ComplexPolynomialHypergeometricFunction;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;
import arb.functions.rational.ComplexRationalHypergeometricFunction;
import arb.functions.rational.RationalHypergeometricFunction;
import arb.functions.sequences.LommelPolynomialSequence;
import arb.utensils.Utensils;

/**
 * <pre>
 * The Compiler class in the arb.expressions package is a comprehensive utility for compiling expressions in a 
 * dynamic and flexible manner. This class provides a variety of static methods to generate, manipulate, and 
 * compile expressions, mainly focusing on the functionality surrounding the ASM bytecode manipulation framework. 
 * The class is designed to work with a coDomain of types represented by the generic parameters D, R, and F, 
 * corresponding to different field and function types in the expression's domain and coDomain.
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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
    mv.visitLdcInsn(fieldName + " shan't be null");
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL,
                       Type.getInternalName(AssertionError.class),
                       "<init>",
                       Compiler.getMethodDescriptor(Void.class, Object.class),
                       false);

    mv.visitInsn(Opcodes.ATHROW);

    mv.visitLabel(notNullLabel);

  }

  public static MethodVisitor checkClassCast(MethodVisitor methodVisitor, Class<?> type)
  {
    String checking = Type.getInternalName(type);
    methodVisitor.visitTypeInsn(Opcodes.CHECKCAST, checking);
    return methodVisitor;
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         compile(String expression,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 Class<? extends F> functionClass,
                 String functionName)
  {

    int punctuationMarkIndex = expression.indexOf(":");
    if (punctuationMarkIndex != -1)
    {
      String inlineFunctionName = expression.substring(0, punctuationMarkIndex);
      if (functionName != null && !functionName.equals(inlineFunctionName))
      {
        throw new CompilerException(String.format("functionName='%s' specified via function argument != inlineFunctionName='%s'",
                                                  functionName,
                                                  inlineFunctionName));
      }
      functionName = inlineFunctionName;
      expression   = expression.substring(punctuationMarkIndex + 1, expression.length());
    }

    FunctionMapping<D, R, F> mapping = null;
    if (functionName != null && context != null)
    {
      mapping = context.registerFunctionMapping(functionName,
                                                null,
                                                domainClass,
                                                coDomainClass,
                                                functionClass,
                                                false,
                                                null,
                                                expression);

    }

    Expression<D, R, F> compiledExpression = express(expression,
                                                     context,
                                                     domainClass,
                                                     coDomainClass,
                                                     functionClass,
                                                     functionName);
    compiledExpression.mapping = mapping;
    if (mapping != null)
    {
      mapping.expression = compiledExpression;
    }
    return compiledExpression;
  }

  public static <D, R, F extends Function<D, R>> Expression<D, R, F> compile(String className,
                                                                             String expression,
                                                                             Class<D> domainClass,
                                                                             Class<R> coDomainClass,
                                                                             Class<F> functionClass)
  {
    return express(className, expression, null, domainClass, coDomainClass, functionClass, false);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>, PD, PR, PF extends Function<? extends PD, ? extends PR>>
         Expression<D, R, F>
         compile(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 Class<? extends F> functionClass,
                 String functionName,
                 Expression<PD, PR, PF> containingExpression)
  {
    Expression<D, R, F> expression = Function.parse(className,
                                                    expressionString,
                                                    context,
                                                    domainClass,
                                                    coDomainClass,
                                                    functionClass,
                                                    functionName,
                                                    containingExpression);
    // expression.generate();
    // expression.defineClass();

    return expression;
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         compile(String className,
                 String expression,
                 Context context,
                 Class<D> domainClass,
                 Class<R> coDomainClass,
                 Class<F> functionClass,
                 boolean verbose)
  {
    return express(className, expression, context, domainClass, coDomainClass, functionClass, verbose);
  }

  public static void constructNewObject(MethodVisitor mv, String functionFieldType)
  {
    mv.visitTypeInsn(Opcodes.NEW, functionFieldType);
  }

  public static void constructNewObject(MethodVisitor mv, Class<?> functionFieldType)
  {
    mv.visitTypeInsn(Opcodes.NEW, Type.getInternalName(functionFieldType));
  }

  public static MethodVisitor defineMethod(ClassVisitor classVisitor, String methodName, String methodSignature)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           methodName,
                                                           methodSignature,
                                                           null,
                                                           null);
    return methodVisitor;
  }

  public static MethodVisitor duplicateTopOfTheStack(MethodVisitor mv)
  {
    mv.visitInsn(Opcodes.DUP);
    return mv;
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         express(String expression,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 Class<? extends F> functionClass,
                 String functionName)
  {
    String className = functionName != null ? functionName : expressionToUniqueClassname(expression);
    return express(className, expression, context, domainClass, coDomainClass, functionClass, functionName);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         express(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 Class<? extends F> functionClass,
                 boolean verbose)
  {
    return express(className, expressionString, context, domainClass, coDomainClass, functionClass, className);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         express(String className,
                 String expressionString,
                 Context context,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 Class<? extends F> functionClass,
                 String functionName)
  {
    return compile(className,
                   expressionString,
                   context,
                   domainClass,
                   coDomainClass,
                   functionClass,
                   functionName,
                   null);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression, String className, ClassVisitor classVisitor)
  {
    String classSignature = null;

    classSignature = expression.getFunctionClassTypeSignature(expression.functionClass);

    classVisitor.visit(V22 | V_PREVIEW,
                       ACC_PUBLIC | ACC_SUPER,
                       className,
                       classSignature,
                       objectDesc,
                       expression.implementedInterfaces());

    return classVisitor;
  }

  public static MethodVisitor
         getFieldFromThis(MethodVisitor mv, String thisClassInternalName, String fieldName, Class<?> type)
  {
    return getFieldFromThis(mv, thisClassInternalName, fieldName, type.descriptorString());
  }

  public static void getField(MethodVisitor mv, String classType, String functionFieldName, String typeDesc)
  {
    mv.visitFieldInsn(Opcodes.GETFIELD, classType, functionFieldName, typeDesc);
  }

  public static void
         getField(MethodVisitor mv, Class<?> classGettingFieldFrom, String functionFieldName, Class<?> fieldType)
  {
    getField(mv, Type.getInternalName(classGettingFieldFrom), functionFieldName, fieldType.descriptorString());
  }

  public static MethodVisitor getFieldFromThis(MethodVisitor methodVisitor,
                                               String thisClassInternalName,
                                               String fieldName,
                                               String fieldTypeSignature)
  {
    assert thisClassInternalName != null : "thisClassInternalName is null";
    loadThisOntoStack(methodVisitor).visitFieldInsn(GETFIELD, thisClassInternalName, fieldName, fieldTypeSignature);
    return methodVisitor;
  }

  public static String getMethodDescriptor(Class<?> ret, Class<?>... args)
  {
    return Type.getMethodDescriptor(Type.getType(ret), Utensils.classTypes(args).toArray(new Type[args.length]))
               .replace("Ljava/lang/Void;", "V");

  }

  public static HashMap<Class<?>, String> typePrefixes = new HashMap<>();

  static
  {
    typePrefixes.put(Real.class, "ℝ");
    typePrefixes.put(Complex.class, "ℂ");
    typePrefixes.put(Integer.class, "ℤ");
    typePrefixes.put(RealPolynomial.class, "Xℝ");
    typePrefixes.put(ComplexPolynomial.class, "Xℂ");
    typePrefixes.put(RealMatrix.class, "ℝᵐˣⁿ");
    typePrefixes.put(ComplexMatrix.class, "ℂᵐˣⁿ");
    typePrefixes.put(RationalFunction.class, "q");
    typePrefixes.put(ComplexRationalFunction.class, "qℂ");
    typePrefixes.put(Fraction.class, "f");
    typePrefixes.put(LommelPolynomialSequence.class, "qR");
    typePrefixes.put(RationalHypergeometricFunction.class, "qF");
    typePrefixes.put(RealPolynomialHypergeometricFunction.class, "XℝF");
    typePrefixes.put(ComplexPolynomialHypergeometricFunction.class, "XℂF");
    typePrefixes.put(ComplexRationalHypergeometricFunction.class, "qℂF");

  }

  public static String getVariablePrefix(Class<?> type)
  {

    String typePrefix = typePrefixes.get(type);
    if (typePrefix == null)
    {
      throw new RuntimeException("unrecognized type " + type);
    }
    return typePrefix;
  }

  public static void invokeBinaryOperationMethod(MethodVisitor mv,
                                                 String operator,
                                                 Class<?> leftType,
                                                 Class<?> rightType,
                                                 Class<?> returnType)
  {

    mv.visitMethodInsn(INVOKEVIRTUAL,
                       Type.getInternalName(leftType),
                       operator,
                       String.format("(%sI%s)%s",
                                     rightType.descriptorString(),
                                     returnType.descriptorString(),
                                     returnType.descriptorString()),
                       false);
  }

  public static void invokeConstructor(MethodVisitor mv, Class<?> returnType, Class<?>... argTypes)
  {
    invokeMethod(mv, INVOKESPECIAL, returnType, "<init>", Void.class, argTypes);
  }

  public static void invokeDefaultConstructor(MethodVisitor mv, Class<?> functionFieldType)
  {
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, Type.getInternalName(functionFieldType), "<init>", "()V", false);
  }

  public static void invokeDefaultConstructor(MethodVisitor mv, String functionFieldType)
  {
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, functionFieldType, "<init>", "()V", false);
  }

  public static MethodVisitor invokeMethod(MethodVisitor methodVisitor,
                                           Class<?> thisClass,
                                           String functionName,
                                           String methodSignature,
                                           boolean isInterface)
  {
    return invokeMethod(methodVisitor, Type.getInternalName(thisClass), functionName, methodSignature, isInterface);
  }

  public static MethodVisitor invokeMethod(MethodVisitor mv,
                                  int instruction,
                                  Class<?> whichClass,
                                  String methodName,
                                  Class<?> returnType,
                                  Class<?>... argTypes)
  {
    mv.visitMethodInsn(instruction,
                       Type.getInternalName(whichClass),
                       methodName,
                       Compiler.getMethodDescriptor(returnType, argTypes),
                       whichClass.isInterface());
    return mv;
  }

  public static MethodVisitor invokeInterfaceMethod(MethodVisitor methodVisitor,
                                                    Class<?> thisClass,
                                                    String methodName,
                                                    Class<?> retType,
                                                    Class<?>... argTypes)
  {
    return invokeMethod(methodVisitor, thisClass, methodName, retType, true, argTypes);
  }

  public static MethodVisitor invokeVirtualMethod(MethodVisitor methodVisitor,
                                                  Class<?> thisClass,
                                                  String methodName,
                                                  Class<?> retType,
                                                  Class<?>... argTypes)
  {
    return invokeMethod(methodVisitor, thisClass, methodName, retType, false, argTypes);
  }

  public static MethodVisitor invokeMethod(MethodVisitor methodVisitor,
                                           Class<?> thisClass,
                                           String methodName,
                                           Class<?> retType,
                                           boolean isInterface,
                                           Class<?>... argTypes)
  {
    return invokeMethod(methodVisitor,
                        Type.getInternalName(thisClass),
                        methodName,
                        getMethodDescriptor(retType, argTypes),
                        isInterface);
  }

  public static MethodVisitor invokeMethod(MethodVisitor methodVisitor,
                                           String classInternalName,
                                           String methodName,
                                           String methodSignature)
  {
    return invokeMethod(methodVisitor, classInternalName, methodName, methodSignature, false);
  }

  public static MethodVisitor invokeMethod(MethodVisitor methodVisitor,
                                           String classInternalName,
                                           String methodName,
                                           String methodSignature,
                                           boolean isInterface)
  {
    methodVisitor.visitMethodInsn(isInterface ? INVOKEINTERFACE : INVOKEVIRTUAL,
                                  classInternalName,
                                  methodName,
                                  methodSignature,
                                  isInterface);
    return methodVisitor;
  }

  public static MethodVisitor invokeSetMethod(MethodVisitor mv, Class<?> inType, Class<?> outType)
  {
    assert !outType.getClass().equals(Object.class) : "invokeSetMethod shouldn't be called for Object type";

    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(outType),
                       "set",
                       Type.getMethodDescriptor(Type.getType(outType), Type.getType(inType)),
                       false);
    return mv;
  }

  public static MethodVisitor
         invokeStaticMethod(MethodVisitor mv,
                                        Class<?> whichClass,
                                        String methodName,
                                        Class<?> returnType,
                                        Class<?>... argTypes)
  {

    return invokeMethod(mv, INVOKESTATIC, whichClass, methodName, returnType, argTypes);
  }

  public static MethodVisitor invokeSuperclassDefaultConstructor(MethodVisitor methodVisitor)
  {
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
    return methodVisitor;
  }

  public static MethodVisitor invokeCloseMethod(MethodVisitor methodVisitor, Class<?> type)
  {
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, Type.getInternalName(type), "close", "()V", false);
    return methodVisitor;
  }

  /**
   * Loads the 3rd argument (bits) onto the stack
   * 
   * The argument pattern for {@link Function#evaluate(Object, int, int, Object)}
   * methods is (this,order,bits,result)
   * 
   * @param methodVisitor the {@link MethodVisitor} to receive the instructions
   * @return methodVisitor the {@link MethodVisitor} parameter
   */
  public static MethodVisitor loadBitsParameterOntoStack(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(Opcodes.ILOAD, 3);
    return methodVisitor;
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>> Class<F> loadFunctionClass(String className,
                                                                                                byte[] bytecodes,
                                                                                                Context context)
  {
    assert className != null;
    if (Expression.trace)
    {
      System.err.println("Compiler.loadFunctionClass " + className);
    }
    try
    {
      CompiledExpressionClassLoader loader = context != null ? context.classLoader : new CompiledExpressionClassLoader();
      return (Class<F>) loader.defineClass(className, bytecodes);
      // return (Class<F>) loader.findClass(className);
    }
    catch (Exception e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
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

  public static void
         putField(MethodVisitor mv, String fieldType, String variableFieldName, Class<?> variableFieldType)
  {
    mv.visitFieldInsn(Opcodes.PUTFIELD, fieldType, variableFieldName, variableFieldType.descriptorString());
  }

  public static void putField(MethodVisitor mv, String fieldType, String variableFieldName, String variableFieldType)
  {
    mv.visitFieldInsn(Opcodes.PUTFIELD, fieldType, variableFieldName, variableFieldType);
  }

  public static HashSet<Class<?>> realScalarTypes    = new HashSet<>();
  public static HashSet<Class<?>> complexScalarTypes = new HashSet<>();

  static
  {
    realScalarTypes.addAll(Arrays.asList(Real.class,
                                         RealPolynomial.class,
                                         RealMatrix.class,
                                         RationalFunction.class));
    complexScalarTypes.addAll(Arrays.asList(Complex.class, ComplexPolynomial.class, ComplexMatrix.class));
  }

  public static Class<?> scalarType(Class<?> resultType)
  {
    if (resultType.equals(RationalFunction.class))
    {
      return Fraction.class;
    }
    else if (realScalarTypes.contains(resultType))
    {
      return Real.class;
    }
    else if (complexScalarTypes.contains(resultType))
    {
      return Complex.class;
    }
    else
    {
      return resultType;
    }
  }

  public static MethodVisitor swap(MethodVisitor mv)
  {
    mv.visitInsn(Opcodes.SWAP);
    return mv;
  }

  public static void loadStaticFieldOntoStack(MethodVisitor methodVisitor, String name, Class<?> fieldType)
  {
    methodVisitor.visitFieldInsn(GETSTATIC, Type.getInternalName(fieldType), name, fieldType.descriptorString());
  }

}
