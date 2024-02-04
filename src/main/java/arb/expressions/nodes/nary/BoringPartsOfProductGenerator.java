package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.*;

import arb.Real;
import arb.expressions.nodes.unary.Function;

public abstract class BoringPartsOfProductGenerator
{
  protected static final String evaluate                 = "evaluate";

  protected static String       evaluateMethodSignature  = Type.getMethodDescriptor(Type.getType(Real.class),
                                                                                    Type.getType(Integer.class),
                                                                                    Type.getType(int.class),
                                                                                    Type.getType(Real.class));

  protected static final String factorFunction           = "factor";
  protected static final String factorValue              = "value";
  protected static final String THIS_CLASS_INTERNAL_NAME = "arb/functions/real/Product";

  protected static void generateCloseMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
    methodVisitor.visitCode();
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "index", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, factorValue, "Larb/Real;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "startIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "endIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(1, 1);
    methodVisitor.visitEnd();
  }

  protected static void generateConstructor(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    methodVisitor.visitCode();
    invokeDefaultConstructor(methodVisitor);
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "startIndex", "Larb/Integer;");
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "endIndex", "Larb/Integer;");
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "index", "Larb/Integer;");
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Real");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, factorValue, "Larb/Real;");
    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(3, 1);
    methodVisitor.visitEnd();
  }

  protected static void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    getField(methodVisitor, THIS_CLASS_INTERNAL_NAME, fieldName, fieldTypeSignature);
  }

  protected static MethodVisitor
            getField(MethodVisitor mv, String thisClassInternalName, String fieldName, Class<?> type)
  {
    return getField(mv, thisClassInternalName, fieldName, type.descriptorString());
  }

  protected static MethodVisitor getField(MethodVisitor methodVisitor,
                                          String thisClassInternalName,
                                          String fieldName,
                                          String fieldTypeSignature)
  {
    loadThis(methodVisitor).visitFieldInsn(GETFIELD, thisClassInternalName, fieldName, fieldTypeSignature);
    return methodVisitor;
  }

  static void invokeDefaultConstructor(MethodVisitor methodVisitor)
  {
    loadThis(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
  }

  protected static void loadBits(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ILOAD, 1);
  }

  protected static void loadEndIndex(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "endIndex", "Larb/Integer;");
  }

  public byte[] generate() throws Exception
  {

    ClassWriter classWriter = new ClassWriter(0);

    classWriter.visit(-65471,
                      ACC_PUBLIC | ACC_SUPER,
                      THIS_CLASS_INTERNAL_NAME,
                      "Ljava/lang/Object;Ljava/lang/AutoCloseable;Larb/functions/real/NullaryFunction<Larb/Real;>;",
                      "java/lang/Object",
                      new String[]
                      { "java/lang/AutoCloseable", "arb/functions/real/NullaryFunction" });

    declareFields(classWriter);
    generateConstructor(classWriter);
    generateCloseMethod(classWriter);
    generateEvaluateMethod(classWriter);
    generateEvaluationBridgeMethods(classWriter);
    classWriter.visitEnd();

    return classWriter.toByteArray();
  }

  abstract void generateEvaluateMethod(ClassWriter classWriter);

  protected static void loadFactorFunction(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorFunction, Function.class);
  }

  void invokeMethod(MethodVisitor methodVisitor, Class<?> thisClass, String functionName, String methodSignature)
  {
    invokeMethod(methodVisitor, Type.getInternalName(thisClass), functionName, methodSignature);
  }

  void generateEvaluationBridgeMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE
                  | ACC_SYNTHETIC, evaluate, "(ILjava/lang/Object;)Ljava/lang/Object;", null, null);
    methodVisitor.visitCode();
    loadThis(methodVisitor);
    loadBits(methodVisitor);
    loadResultingProductVariable(methodVisitor);
    methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                  THIS_CLASS_INTERNAL_NAME,
                                  evaluate,
                                  "(ILarb/Real;)Larb/Real;",
                                  false);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(3, 3);
    methodVisitor.visitEnd();
  }

  void invokeMethod(MethodVisitor methodVisitor, String classInternalName, String methodName, String methodSignature)
  {
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, classInternalName, methodName, methodSignature, false);
  }

  protected static MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getField(mv, THIS_CLASS_INTERNAL_NAME, fieldName, type);
  }

  protected void generateEvaluationBridgeMethods(ClassWriter classWriter)
  {
    generateEvaluationBridgeMethod(classWriter);
    generateSyntheticEvaluationBridgeMethod(classWriter);
  }

  protected void generateSyntheticEvaluationBridgeMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE | ACC_SYNTHETIC,
                                                          evaluate,
                                                          "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;",
                                                          null,
                                                          null);
    methodVisitor.visitCode();
    loadThis(methodVisitor);
    methodVisitor.visitVarInsn(ALOAD, 1);
    methodVisitor.visitTypeInsn(CHECKCAST, "java/lang/Void");
    methodVisitor.visitVarInsn(ILOAD, 2);
    methodVisitor.visitVarInsn(ILOAD, 3);
    methodVisitor.visitVarInsn(ALOAD, 4);
    methodVisitor.visitTypeInsn(CHECKCAST, "java/lang/Object");
    methodVisitor.visitMethodInsn(INVOKEINTERFACE,
                                  "arb/functions/real/NullaryFunction",
                                  evaluate,
                                  "(Ljava/lang/Void;IILjava/lang/Object;)Ljava/lang/Object;",
                                  true);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 5);
    methodVisitor.visitEnd();
  }

  protected void declareFields(ClassWriter classWriter)
  {
    FieldVisitor fieldVisitor;
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC,
                                            factorFunction,
                                            "Larb/functions/Function;",
                                            "Larb/functions/Function<Larb/Integer;Larb/Real;>;",
                                            null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, "startIndex", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, "endIndex", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, "index", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, factorValue, "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
  }

  protected static void loadResultingProductVariable(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 2);
  }

  protected static void loadStartIndex(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "startIndex", "Larb/Integer;");
  }

  protected static MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  protected Label justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot  = new Label();

  protected Label beginningOfTheLoop = new Label();

  public BoringPartsOfProductGenerator()
  {
    super();
  }

  protected void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }
}