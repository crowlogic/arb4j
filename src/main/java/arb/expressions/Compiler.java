package arb.expressions;

import static org.objectweb.asm.Opcodes.*;

import java.lang.annotation.Annotation;
import java.util.*;

import org.objectweb.asm.*;
import org.objectweb.asm.signature.SignatureWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.nodes.LiteralConstantNode;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.RealSequence;
import arb.functions.integer.RealSequenceSequence;
import arb.functions.polynomials.ComplexHypergeometricPolynomialFunction;
import arb.functions.polynomials.RealHypergeometricPolynomialFunction;
import arb.functions.rational.*;
import arb.functions.real.RealFunction;
import arb.functions.real.SphericalBesselFunction;
import arb.utensils.Utensils;

/**
 * <pre>
 * The Compiler class in the arb.expressions package is a comprehensive utility for compiling expressions in a 
 * dynamic and flexible manner. This class provides a variety of static methods to generate, manipulate, and 
 * compile expressions, mainly focusing on the functionality surrounding the ASM bytecode manipulation framework. 
 * The class is designed to work with types represented by the generic parameters D, R, and F, 
 * corresponding to different field and function types in the expression's domain and coDomain.
 *
 * 
 * 
 * Key functionalities include:
 *  - Compiling expressions into Java bytecodes.
 *  - Handling field functions (e.g. member methods such as {@link Real#J0(int, Real)} ) and {@link Function}s 
 *    that have been registered with the {@link Context#registerFunction(String, Function)} method.
 *  - Loading and managing various types of arguments and {@link VariableReference}s 
 *    and the 'this' reference.
 *  - Handling {@link LiteralConstantNode}s and {@link IntermediateVariable}s.
 *  - Preparing and managing the stack for different use cases, such as reusing left or right nodes.
 *  - Closing field resources and defining {@link Function} classes.
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
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Compiler
{

  private final static Logger             log                =
                                              LoggerFactory.getLogger(Compiler.class);

  public static HashSet<Class<?>>         complexScalarTypes =
                                                             new HashSet<>(Arrays.asList(Complex.class,
                                                                                         ComplexPolynomial.class,
                                                                                         ComplexMatrix.class,
                                                                                         Complex.class,
                                                                                         ComplexRationalFunction.class,
                                                                                         ComplexFunction.class,
                                                                                         ComplexFraction.class,
                                                                                         RealToComplexFunction.class));

  public static final String              objectDesc         = Type.getInternalName(Object.class);

  public static HashSet<Class<?>>         realScalarTypes    =
                                                          new HashSet<>(Arrays.asList(AlgebraicNumber.class,
                                                                                      Integer.class,
                                                                                      Real.class,
                                                                                      RealPolynomial.class,
                                                                                      RealMatrix.class,
                                                                                      Fraction.class,
                                                                                      RationalFunction.class,
                                                                                      RealFunction.class));

  public static HashMap<Class<?>, String> typePrefixes       = new HashMap<>();

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
    typePrefixes.put(Fraction.class, "q");
    typePrefixes.put(LommelPolynomial.class, "XR");
    typePrefixes.put(RationalHypergeometricFunction.class, "ℚF");
    typePrefixes.put(RealHypergeometricPolynomialFunction.class, "XℝF");
    typePrefixes.put(ComplexHypergeometricPolynomialFunction.class, "XℂF");
    typePrefixes.put(ComplexRationalHypergeometricFunction.class, "ℚℂF");
    typePrefixes.put(ComplexFraction.class, "fℂ");
    typePrefixes.put(SphericalBesselFunction.class, "sph");
    typePrefixes.put(IntegerPolynomial.class, "Xℤ");

  }

  public static void addNullCheckForField(MethodVisitor mv,
                                          String className,
                                          String fieldName,
                                          String fieldDesc)
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
                       Compiler.getMethodDescriptor(Void.class, Object.class),
                       false);
    mv.visitInsn(Opcodes.ATHROW);
    mv.visitLabel(notNullLabel);
  }

  protected static MethodVisitor annotateWith(MethodVisitor methodVisitor,
                                              Class<? extends Annotation> annotation)
  {
    methodVisitor.visitAnnotation(annotation.descriptorString(), true).visitEnd();
    return methodVisitor;
  }

  protected static MethodVisitor annotateWithOverride(MethodVisitor methodVisitor)
  {
    return annotateWith(methodVisitor, Override.class);
  }

  /**
   * TODO: make this more robust and complete it, maybe using hashmaps of hashmaps
   * or something
   * 
   * @param from
   * @param to
   * @return true if the from type can be converted to the to type without losing
   *         information
   */
  public static boolean canBeAssignedTo(Class<?> from, Class<?> to)
  {
    if (from.equals(to))
    {
      return true;
    }

    if (from.equals(Real.class))
    {
      if (to.equals(Complex.class) || to.equals(RealPolynomial.class)
                    || to.equals(RationalFunction.class) || to.equals(Fraction.class))
      {
        return true;
      }
    }
    else if (from.equals(Complex.class))
    {
      if (to.equals(ComplexFraction.class) || to.equals(ComplexRationalFunction.class))
      {
        return true;
      }
    }
    else if (from.equals(Fraction.class))
    {
      if (to.equals(Real.class) || to.equals(ComplexFraction.class) || to.equals(Complex.class)
                    || to.equals(RationalFunction.class) || to.equals(ComplexRationalFunction.class)
                    || to.equals(AlgebraicNumber.class))
      {
        return true;
      }
    }
    else if (from.equals(Integer.class))
    {
      if (to.equals(Real.class) || to.equals(Complex.class) || to.equals(Fraction.class))
      {
        return true;
      }
    }
    else if (from.equals(AlgebraicNumber.class))
    {
      if (to.equals(Real.class) || to.equals(Complex.class) || to.equals(RationalFunction.class))
      {
        return true;
      }
    }

    return false;
  }

  public static MethodVisitor cast(MethodVisitor methodVisitor, Class<?> type)
  {
    methodVisitor.visitTypeInsn(Opcodes.CHECKCAST, Type.getInternalName(type));
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
    return Parser.parse(expression,
                        context,
                        domainClass,
                        coDomainClass,
                        functionClass,
                        functionName);
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
    return express(className,
                   expression,
                   context,
                   domainClass,
                   coDomainClass,
                   functionClass,
                   verbose);
  }

  public static ClassVisitor constructClassVisitor()
  {
    return new ClassWriter(ClassWriter.COMPUTE_FRAMES);
  }

  public static MethodVisitor
         defineMethod(ClassVisitor classVisitor, String methodName, String methodSignature)
  {
    MethodVisitor methodVisitor = classVisitor.visitMethod(Opcodes.ACC_PUBLIC,
                                                           methodName,
                                                           methodSignature,
                                                           null,
                                                           null);
    return methodVisitor;
  }

  public static MethodVisitor designateLabel(org.objectweb.asm.MethodVisitor mv,
                                             org.objectweb.asm.Label label)
  {
    mv.visitLabel(label);
    return mv;
  }

  public static MethodVisitor duplicateTopOfTheStack(MethodVisitor mv)
  {
    mv.visitInsn(Opcodes.DUP);
    return mv;
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
    return Parser.parse(className,
                        expressionString,
                        context,
                        domainClass,
                        coDomainClass,
                        functionClass,
                        className);
  }

  public static MethodVisitor generateCallToGetUnsignedIntValue(MethodVisitor mv)
  {
    invokeVirtualMethod(mv, Integer.class, "getUnsignedIntValue", int.class);
    return mv;
  }

  public static MethodVisitor generateCallToLoadUnsignedLong(MethodVisitor mv)
  {
    invokeVirtualMethod(mv, Integer.class, "getUnsignedValue", long.class);
    return mv;
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         ClassVisitor
         generateFunctionInterface(Expression<D, R, F> expression,
                                   String className,
                                   ClassVisitor classVisitor)
  {
    String classSignature = null;

    classSignature = expression.getFunctionClassTypeSignature(expression.functionClass);

    classVisitor.visit(V25 | V_PREVIEW,
                       ACC_PUBLIC | ACC_SUPER,
                       className,
                       classSignature,
                       objectDesc,
                       expression.implementedInterfaces());

    return classVisitor;
  }

  public static void generateFunctionTypeParameterSignature(Class<?> fclass,
                                                            Class<?> domainClass,
                                                            Class<?> codomainClass,
                                                            SignatureWriter sw)
  {
    switch (fclass.getTypeParameters().length)
    {
    case 0:
      break;
    case 1:
      sw.visitTypeArgument('=').visitClassType(Type.getInternalName(codomainClass));
      sw.visitEnd();
      break;
    case 2:
      sw.visitTypeArgument('=').visitClassType(Type.getInternalName(domainClass));
      sw.visitEnd();
      sw.visitTypeArgument('=').visitClassType(Type.getInternalName(codomainClass));
      sw.visitEnd();
      break;
    default:
      assert false : "this can't happen";
    }
  }

  public static MethodVisitor generateNewObjectInstruction(MethodVisitor mv,
                                                           String functionFieldTypeDescriptor)
  {
    mv.visitTypeInsn(Opcodes.NEW, functionFieldTypeDescriptor);
    return mv;
  }

  public static MethodVisitor generateNewObjectInstruction(MethodVisitor mv,
                                                           Class<?> functionFieldType)
  {
    return generateNewObjectInstruction(mv, Type.getInternalName(functionFieldType));
  }

  public static MethodVisitor constructNewObject(MethodVisitor mv, String functionFieldType)
  {
    mv.visitTypeInsn(Opcodes.NEW, functionFieldType);
    return mv;
  }

  public static void generateReturnFromMethod(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(Opcodes.ARETURN);
    methodVisitor.visitMaxs(10, 10);
    methodVisitor.visitEnd();
  }

  public static MethodVisitor generateReturnFromVoidMethod(MethodVisitor mv)
  {
    mv.visitInsn(RETURN);
    return mv;
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
    generateReturnFromMethod(methodVisitor);
    return classVisitor;
  }

  public static void getField(MethodVisitor mv,
                              Class<?> classGettingFieldFrom,
                              String functionFieldName,
                              Class<?> fieldType)
  {
    getField(mv,
             Type.getInternalName(classGettingFieldFrom),
             functionFieldName,
             fieldType.descriptorString());
  }

  public static void
         getField(MethodVisitor mv, String classType, String functionFieldName, String typeDesc)
  {
    mv.visitFieldInsn(Opcodes.GETFIELD, classType, functionFieldName, typeDesc);
  }

  public static MethodVisitor getFieldFromThis(MethodVisitor mv,
                                               String thisClassInternalName,
                                               String fieldName,
                                               Class<?> type)
  {
    return getFieldFromThis(mv, thisClassInternalName, fieldName, type.descriptorString());
  }

  public static MethodVisitor getFieldFromThis(MethodVisitor methodVisitor,
                                               String thisClassInternalName,
                                               String fieldName,
                                               String fieldTypeSignature)
  {
    assert thisClassInternalName != null : "thisClassInternalName is null";
    loadThisOntoStack(methodVisitor).visitFieldInsn(GETFIELD,
                                                    thisClassInternalName,
                                                    fieldName,
                                                    fieldTypeSignature);
    return methodVisitor;
  }

  public static String getFunctionClassTypeSignature(Class<? extends Function<?, ?>> functionClass,
                                                     Class<?> domainClass,
                                                     Class<?> coDomainClass,
                                                     Class<?>[] implementedInterfaces)
  {
    var sw = new SignatureWriter();

    sw.visitSuperclass().visitClassType(Type.getInternalName(Object.class));
    sw.visitEnd();

    sw.visitInterface().visitClassType(Type.getInternalName(functionClass));
    generateFunctionTypeParameterSignature(functionClass, domainClass, coDomainClass, sw);
    sw.visitEnd();

    for (var interfaceClass : implementedInterfaces)
    {
      sw.visitInterface();
      sw.visitClassType(Type.getInternalName(interfaceClass));
      sw.visitEnd();
    }
    return sw.toString();
  }

  public static String getMethodDescriptor(Class<?> ret, Class<?>... args)
  {
    return Type.getMethodDescriptor(Type.getType(ret),
                                    Utensils.classTypes(args).toArray(new Type[args.length]))
               .replace("Ljava/lang/Void;", "V");

  }

  public static String getTypeMethodSignature(Class<?> type)
  {
    SignatureWriter sigWriter = new SignatureWriter();
    sigWriter.visitParameterType();
    sigWriter.visitReturnType();
    sigWriter.visitClassType(Type.getInternalName(Class.class));
    sigWriter.visitTypeArgument('=');
    sigWriter.visitClassType(Type.getInternalName(type));
    sigWriter.visitEnd();
    sigWriter.visitEnd();
    return sigWriter.toString();
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

  public static MethodVisitor invokeCloseMethod(MethodVisitor methodVisitor, Class<?> type)
  {
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, Type.getInternalName(type), "close", "()V", false);
    return methodVisitor;
  }

  public static void invokeConstructor(MethodVisitor mv, Class<?> returnType, Class<?>... argTypes)
  {
    invokeMethod(mv, INVOKESPECIAL, returnType, "<init>", Void.class, argTypes);
  }

  public static void invokeDefaultConstructor(MethodVisitor mv, Class<?> functionFieldType)
  {
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL,
                       Type.getInternalName(functionFieldType),
                       "<init>",
                       "()V",
                       false);
  }

  public static void invokeDefaultConstructor(MethodVisitor mv, String functionFieldType)
  {
    mv.visitMethodInsn(Opcodes.INVOKESPECIAL, functionFieldType, "<init>", "()V", false);
  }

  public static MethodVisitor invokeInterfaceMethod(MethodVisitor methodVisitor,
                                                    Class<?> thisClass,
                                                    String methodName,
                                                    Class<?> retType,
                                                    Class<?>... argTypes)
  {
    return invokeMethod(methodVisitor, thisClass, methodName, retType, true, argTypes);
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
                                           Class<?> thisClass,
                                           String functionName,
                                           String methodSignature,
                                           boolean isInterface)
  {
    return invokeMethod(methodVisitor,
                        Type.getInternalName(thisClass),
                        functionName,
                        methodSignature,
                        isInterface);
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
    assert !outType.getClass()
                   .equals(Object.class) : "invokeSetMethod shouldn't be called for Object type";
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

  public static MethodVisitor invokeVirtualMethod(MethodVisitor methodVisitor,
                                                  Class<?> thisClass,
                                                  String methodName,
                                                  Class<?> retType,
                                                  Class<?>... argTypes)
  {
    return invokeMethod(methodVisitor, thisClass, methodName, retType, false, argTypes);
  }

  public static void jumpTo(org.objectweb.asm.MethodVisitor methodVisitor,
                            org.objectweb.asm.Label label)
  {
    methodVisitor.visitJumpInsn(GOTO, label);
  }

  public static void jumpToIfGreaterThan(org.objectweb.asm.MethodVisitor methodVisitor,
                                         org.objectweb.asm.Label label)
  {
    methodVisitor.visitJumpInsn(IFGT, label);
  }

  public static org.objectweb.asm.MethodVisitor
         jumpToIfLessThanOrEquals(org.objectweb.asm.MethodVisitor methodVisitor,
                                  org.objectweb.asm.Label label)
  {
    methodVisitor.visitJumpInsn(IFLE, label);
    return methodVisitor;
  }

  public static MethodVisitor jumpToIfNotEqual(MethodVisitor mv, Label alreadyInitialized)
  {
    mv.visitJumpInsn(Opcodes.IFNE, alreadyInitialized);
    return mv;
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

  public static void loadComplexConstantOntoStack(MethodVisitor mv, String fn)
  {
    loadConstantOntoStack(mv, fn, Complex.class, ComplexConstants.class);
  }

  public static void loadConstantOntoStack(MethodVisitor mv,
                                           String fieldName,
                                           Class<?> typeClass,
                                           Class<?> staticConstantsClass)
  {
    mv.visitFieldInsn(Opcodes.GETSTATIC,
                      Type.getInternalName(staticConstantsClass),
                      fieldName,
                      typeClass.descriptorString());
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>>
         Class<F>
         loadFunctionClass(String className, byte[] bytecodes, Context context)
  {
    assert className != null;
    if (Expression.trace)
    {
      log.debug("loadFunctionClass(className={}) into Context#{}",
                className,
                System.identityHashCode(context));
    }
    try
    {
      var loader = context != null ? context.classLoader : new ExpressionClassLoader();
      if (context != null && context.classLoader == null)
      {
        context.classLoader = loader;
      }
      return (Class<F>) loader.defineClass(className, bytecodes);
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

  public static MethodVisitor loadPointer(MethodVisitor mv)
  {
    getField(mv, Integer.class, "swigCPtr", long.class);
    return mv;
  }

  public static void loadRealConstantOntoStack(MethodVisitor mv, String fn)
  {
    loadConstantOntoStack(mv, fn, Real.class, RealConstants.class);
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

  public static void pop(org.objectweb.asm.MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }

  public static MethodVisitor putField(MethodVisitor mv,
                                       String fieldType,
                                       String variableFieldName,
                                       Class<?> variableFieldType)
  {
    mv.visitFieldInsn(Opcodes.PUTFIELD,
                      fieldType,
                      variableFieldName,
                      variableFieldType.descriptorString());
    return mv;
  }

  public static void putField(MethodVisitor mv,
                              String owner,
                              String variableFieldName,
                              String variableFieldType)
  {
    mv.visitFieldInsn(Opcodes.PUTFIELD, owner, variableFieldName, variableFieldType);
  }

  public static Class<?> scalarType(Class<?> resultType)
  {
    if (realScalarTypes.contains(resultType))
    {
      return Real.class;
    }
    else if (complexScalarTypes.contains(resultType))
    {
      return Complex.class;
    }
    else if (IntegerPolynomial.class.equals(resultType) || Integer.class.equals(resultType))
    {
      return Integer.class;
    }
    else if (Quaternion.class.equals(resultType))
    {
      return Quaternion.class;
    }
    else if (RealSequenceSequence.class.equals(resultType))
    {
      return Real.class;
    }
    else if (RealSequence.class.equals(resultType))
    {
      return Real.class;
    }
    else
    {
      throw new CompilerException("dont know what the scalar type is for " + resultType);
    }
  }

  public static MethodVisitor swap(MethodVisitor mv)
  {
    mv.visitInsn(Opcodes.SWAP);
    return mv;
  }

  public static boolean isScalar(Class<?> t)
  {
    return scalarTypes.contains(t);
  }

  public static final HashSet<
                Class<?>> scalarTypes = new HashSet<>(Arrays.asList(Real.class,
                                                                    Complex.class,
                                                                    Integer.class,
                                                                    Fraction.class,
                                                                    ComplexFraction.class,
                                                                    AlgebraicNumber.class,
                                                                    GaussianInteger.class));

}
