package arb.expressions.nodes.nary;

import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.*;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public abstract class BoringPartsOfProductGenerator
{
  protected static final String evaluate                      = "evaluate";

  protected static String       factorEvaluateMethodSignature = Type.getMethodDescriptor(Type.getType(Object.class),
                                                                                         Type.getType(Object.class),
                                                                                         Type.getType(int.class),
                                                                                         Type.getType(Object.class));

  protected static final String factorFunction                = "factor";
  protected static final String factorValue                   = "value";
  String                        functionClass      ;

  protected void generateCloseMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
    methodVisitor.visitCode();
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, functionClass, "index", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, functionClass, factorValue, "Larb/Real;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, functionClass, "startIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, functionClass, "endIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(1, 1);
    methodVisitor.visitEnd();
  }

  protected void generateConstructor(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    methodVisitor.visitCode();
    invokeDefaultConstructor(methodVisitor);
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, functionClass, "startIndex", "Larb/Integer;");
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, functionClass, "endIndex", "Larb/Integer;");
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, functionClass, "index", "Larb/Integer;");
    loadThis(methodVisitor);
    methodVisitor.visitTypeInsn(NEW, "arb/Real");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, functionClass, factorValue, "Larb/Real;");
    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(3, 1);
    methodVisitor.visitEnd();
  }

  protected void getField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    getField(methodVisitor, functionClass, fieldName, fieldTypeSignature);
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
    assert thisClassInternalName != null : "thisClassInternalName is null";
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

  protected void loadEndIndex(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "endIndex", "Larb/Integer;");
  }

  public byte[] generate() throws Exception
  {

    ClassWriter classWriter = new ClassWriter(0);

    classWriter.visit(-65471,
                      ACC_PUBLIC | ACC_SUPER,
                      functionClass,
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

  protected void loadFactorFunction(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, factorFunction, Function.class);
  }

  void invokeMethod(MethodVisitor methodVisitor,
                    Class<?> thisClass,
                    String functionName,
                    String methodSignature,
                    boolean isInterface)
  {
    invokeMethod(methodVisitor, Type.getInternalName(thisClass), functionName, methodSignature, isInterface);
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
                                  functionClass,
                                  evaluate,
                                  "(ILarb/Real;)Larb/Real;",
                                  false);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(3, 3);
    methodVisitor.visitEnd();
  }

  void invokeMethod(MethodVisitor methodVisitor,
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
  }

  void invokeMethod(MethodVisitor methodVisitor, String classInternalName, String methodName, String methodSignature)
  {
    invokeMethod(methodVisitor, classInternalName, methodName, methodSignature, false);
  }

  protected MethodVisitor loadFieldFromThis(MethodVisitor mv, String fieldName, Class<?> type)
  {
    return getField(mv, functionClass, fieldName, type);
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
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "startIndex", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "endIndex", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "index", "Larb/Integer;", null, null);
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

  protected void loadStartIndex(MethodVisitor methodVisitor)
  {
    getField(methodVisitor, "startIndex", "Larb/Integer;");
  }

  protected static MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  protected Label justBeforeCheckingIfThisIsTheLastFactorAndJumpingToTheBeginningOfTheLoopIfNot = new Label();

  protected Label beginningOfTheLoop                                                            = new Label();

  public BoringPartsOfProductGenerator()
  {
    super();
  }

  protected void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }
}