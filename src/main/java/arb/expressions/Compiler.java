package arb.expressions;

import static arb.expressions.Parser.expressionToUniqueClassname;
import static org.objectweb.asm.Opcodes.*;

import java.lang.annotation.Annotation;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

import org.objectweb.asm.*;
import org.objectweb.asm.signature.SignatureWriter;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.functions.Function;
import arb.functions.NullaryFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.Sequence;
import arb.functions.polynomials.ComplexHypergeometricPolynomialFunction;
import arb.functions.polynomials.RealHypergeometricPolynomialFunction;
import arb.functions.rational.ComplexRationalHypergeometricFunction;
import arb.functions.rational.LommelPolynomial;
import arb.functions.rational.RationalHypergeometricFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.SphericalBesselFunction;
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
    mv.visitLdcInsn(className + "." + fieldName + " is null");
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
    expression = expression.replace(" ", "");

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

    Expression<D, R,
                  F> compiledExpression = express(expression,
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

  public static <D, R, F extends Function<? extends D, ? extends R>, PD, PR,
                PF extends Function<? extends PD, ? extends PR>>
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
    Expression<D, R,
                  F> expression = Function.parse(className,
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

  public static <D, R, F extends Function<? extends D, ? extends R>> Expression<D, R, F> compile(String className,
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
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC, methodName, methodSignature, null, null);
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
    return compile(className, expressionString, context, domainClass, coDomainClass, functionClass, functionName, null);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression, String className, ClassVisitor classVisitor)
  {
    String classSignature = null;

    classSignature = expression.getFunctionClassTypeSignature(expression.functionClass);

    classVisitor.visit(V23 | V_PREVIEW,
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
    typePrefixes.put(AlgebraicNumber.class, "𝔸");
    typePrefixes.put(Real.class, "ℝ");
    typePrefixes.put(Complex.class, "ℂ");
    typePrefixes.put(Integer.class, "ℤ");
    typePrefixes.put(RealPolynomial.class, "Xℝ");
    typePrefixes.put(ComplexPolynomial.class, "Xℂ");
    typePrefixes.put(RealMatrix.class, "ℝᵐˣⁿ");
    typePrefixes.put(ComplexMatrix.class, "ℂᵐˣⁿ");
    typePrefixes.put(RationalFunction.class, "ℚ");
    typePrefixes.put(ComplexRationalFunction.class, "ℚℂ");
    typePrefixes.put(Fraction.class, "f");
    typePrefixes.put(LommelPolynomial.class, "XR");
    typePrefixes.put(RationalHypergeometricFunction.class, "ℚF");
    typePrefixes.put(RealHypergeometricPolynomialFunction.class, "XℝF");
    typePrefixes.put(ComplexHypergeometricPolynomialFunction.class, "XℂF");
    typePrefixes.put(ComplexRationalHypergeometricFunction.class, "ℚℂF");
    typePrefixes.put(ComplexFraction.class, "fℂ");
    typePrefixes.put(SphericalBesselFunction.class, "sph");
    typePrefixes.put(IntegerPolynomial.class, "Xℤ");
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

    String returnTypeDescriptor = returnType.descriptorString();
    mv.visitMethodInsn(INVOKEVIRTUAL,
                       Type.getInternalName(leftType),
                       operator,
                       String.format("(%sI%s)%s",
                                     rightType.descriptorString(),
                                     returnTypeDescriptor,
                                     returnTypeDescriptor),
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

  public static MethodVisitor
         invokeMethod(MethodVisitor methodVisitor, String classInternalName, String methodName, String methodSignature)
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

    // Compiler.invokeVirtualMethod(mv, inType, objectDesc, outType, null)
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(outType),
                       "set",
                       Type.getMethodDescriptor(Type.getType(outType), Type.getType(inType)),
                       false);
    return mv;
  }

  public static MethodVisitor invokeStaticMethod(MethodVisitor mv,
                                                 Class<?> whichClass,
                                                 String methodName,
                                                 Class<?> returnType,
                                                 Class<?>... argTypes)
  {

    return invokeMethod(mv, INVOKESTATIC, whichClass, methodName, returnType, argTypes);
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
      CompiledExpressionClassLoader loader =
                                           context != null ? context.classLoader : new CompiledExpressionClassLoader();
      if (context != null && context.classLoader == null)
      {
        context.classLoader = loader;
      }
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
   * Loads the 4th (last) argument onto the stack, and since this follows the
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

  public static void putField(MethodVisitor mv, String fieldType, String variableFieldName, Class<?> variableFieldType)
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
    realScalarTypes.addAll(Arrays.asList(Object.class,
                                         Real.class,
                                         RealPolynomial.class,
                                         RealMatrix.class,
                                         RationalFunction.class));
    complexScalarTypes.addAll(Arrays.asList(Complex.class, ComplexPolynomial.class, ComplexMatrix.class));
  }

  public static Class<?> scalarType(Class<?> resultType)
  {

    if (resultType.equals(RationalFunction.class) || resultType.equals(Fraction.class))
    {
      return Fraction.class;
    }
    else if (resultType.equals(ComplexRationalFunction.class) || resultType.equals(ComplexFraction.class))
    {
      return ComplexFraction.class;
    }
    else if (realScalarTypes.contains(resultType))
    {
      return Real.class;
    }
    else if (complexScalarTypes.contains(resultType))
    {
      return Complex.class;
    }
    else if (IntegerPolynomial.class.equals(resultType))
    {
      return Integer.class;
    }
    else if (Integer.class.equals(resultType))
    {
      return resultType;
    }
    else if (Quaternion.class.equals(resultType))
    {
      return Quaternion.class;
    }
    else if (ComplexFunction.class.equals(resultType))
    {
      return Complex.class;
    }
    else if (RealFunction.class.equals(resultType))
    {
      return Real.class;
    }
    else
    {
      assert false : "dont know what the scalar type is for " + resultType;
      return resultType;
    }
  }

  public static MethodVisitor swap(MethodVisitor mv)
  {
    mv.visitInsn(Opcodes.SWAP);
    return mv;
  }

  public static void generateReturnInstructionAndEndTheVisit(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(Opcodes.ARETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();
  }

  public static String getFunctionClassTypeSignature(Class<?> fclass,
                                                     Class<?> domainClass,
                                                     Class<?> codomainClass,
                                                     Class<?>[] implementations)
  {
    String classSignature;

    var    sw = new SignatureWriter();

    sw.visitSuperclass().visitClassType(Type.getInternalName(Object.class));
    sw.visitEnd();
    sw.visitInterface();
    sw.visitClassType(Type.getInternalName(fclass));
    if (Sequence.class.isAssignableFrom(fclass) || NullaryFunction.class.isAssignableFrom(fclass))
    {
      if (fclass.getTypeParameters().length == 1)
      {
        sw.visitTypeArgument('=').visitClassType(Type.getInternalName(codomainClass));
        sw.visitEnd();
      }
    }
    else if (Function.class.isAssignableFrom(fclass))
    {
      if (fclass.getTypeParameters().length == 2)
      {
        sw.visitTypeArgument('=').visitClassType(Type.getInternalName(domainClass));
        sw.visitEnd();
        sw.visitTypeArgument('=').visitClassType(Type.getInternalName(codomainClass));
        sw.visitEnd();
      }
    }

    sw.visitEnd();

    for (var interfaceClass : implementations)
    {
      sw.visitInterface();
      sw.visitClassType(Type.getInternalName(interfaceClass));
      sw.visitEnd();
    }
    classSignature = sw.toString();
    return classSignature;
  }

  protected static MethodVisitor annotateWith(MethodVisitor methodVisitor, Class<? extends Annotation> annotation)
  {
    AnnotationVisitor av = methodVisitor.visitAnnotation(annotation.descriptorString(), true);
    av.visitEnd();
    return methodVisitor;
  }

  protected static MethodVisitor annotateWithOverride(MethodVisitor methodVisitor)
  {
    return annotateWith(methodVisitor, Override.class);
  }

  public static ClassVisitor generateTypesetMethod(ClassVisitor classVisitor, String typeset)
  {
    var methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                 "typeset",
                                                 getMethodDescriptor(String.class),
                                                 null,
                                                 null);

    annotateWithOverride(methodVisitor);
    methodVisitor.visitCode();
    methodVisitor.visitLdcInsn(typeset);
    generateReturnInstructionAndEndTheVisit(methodVisitor);
    return classVisitor;
  }

  public static String getCoDomainTypeMethodSignature(Class<?> coDomainType2)
  {
    SignatureWriter sigWriter = new SignatureWriter();
    sigWriter.visitParameterType();
    sigWriter.visitReturnType();
    sigWriter.visitClassType(Type.getInternalName(Class.class));
    sigWriter.visitTypeArgument('=');
    sigWriter.visitClassType(Type.getInternalName(coDomainType2));
    sigWriter.visitEnd();
    sigWriter.visitEnd();
    return sigWriter.toString();
  }

  public static ClassVisitor constructClassVisitor()
  {
    return new ClassWriter(ClassWriter.COMPUTE_FRAMES);
  }

}
