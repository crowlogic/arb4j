package arb.expressions.nodes.nary;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class ProductGenerator implements
                              Opcodes
{

  private static Label        afterLoop                = new Label();
  private static Label        beforeLoop               = new Label();
  private static final String THIS_CLASS_INTERNAL_NAME = "arb/functions/real/Product";

  private static void beginLoop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitJumpInsn(GOTO, afterLoop);
    methodVisitor.visitLabel(beforeLoop);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  private static void castClass(MethodVisitor methodVisitor, String classInternalName)
  {
    methodVisitor.visitTypeInsn(CHECKCAST, classInternalName);
  }

  private static void declareFields(ClassWriter classWriter)
  {
    FieldVisitor fieldVisitor;
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC,
                                            "factor",
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
      fieldVisitor = classWriter.visitField(0, "value", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
  }

  private static void endLoop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitLabel(afterLoop);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
  }

  public static byte[] generate() throws Exception
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

  private static void generateCloseMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
    methodVisitor.visitCode();
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "index", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    loadThis(methodVisitor);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "value", "Larb/Real;");
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

  private static void generateConstructor(ClassWriter classWriter)
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
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "value", "Larb/Real;");
    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(3, 1);
    methodVisitor.visitEnd();
  }

  /**
   * generate 'Real evaluate(int bits, Real result)'
   * 
   * @param classWriter
   */
  private static void generateEvaluateMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = beginEvaluationCode(classWriter);
    initializeProductToTheIdentity(methodVisitor);
    setIndexToTheStartIndex(methodVisitor);
    beginLoop(methodVisitor);
    loadResult(methodVisitor);
    loadFieldFromThis(methodVisitor, "factor", "Larb/functions/Function;");
    loadIndex(methodVisitor);
    loadBits(methodVisitor);
    loadFieldFromThis(methodVisitor, "value", "Larb/Real;");
    invokeMethod(methodVisitor,
                 "arb/functions/Function",
                 "evaluate",
                 "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;");
    castClass(methodVisitor, "arb/Real");
    loadBits(methodVisitor);
    invokeMethod(methodVisitor, "arb/Real", "mul", "(Larb/Field;I)Larb/Field;");
    pop(methodVisitor);
    incrementIndex(methodVisitor);
    endLoop(methodVisitor);
    loadThis(methodVisitor);
    loadIndex(methodVisitor);
    loadThis(methodVisitor);
    loadEndIndex(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "compareTo", "(Larb/Integer;)I");
    jumpToBeforeLoopIfIndexLessThanOrEqualToEndIndex(methodVisitor);
    loadResult(methodVisitor);
    endEvaluationCode(methodVisitor);
  }

  private static void endEvaluationCode(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 3);
    methodVisitor.visitEnd();
  }

  private static MethodVisitor beginEvaluationCode(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "evaluate", "(ILarb/Real;)Larb/Real;", null, null);
    methodVisitor.visitCode();
    return methodVisitor;
  }

  private static void generateEvaluationBridgeMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE
                  | ACC_SYNTHETIC, "evaluate", "(ILjava/lang/Object;)Ljava/lang/Object;", null, null);
    methodVisitor.visitCode();
    loadThis(methodVisitor);
    loadBits(methodVisitor);
    loadResult(methodVisitor);
    methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                  THIS_CLASS_INTERNAL_NAME,
                                  "evaluate",
                                  "(ILarb/Real;)Larb/Real;",
                                  false);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(3, 3);
    methodVisitor.visitEnd();
  }

  private static void generateEvaluationBridgeMethods(ClassWriter classWriter)
  {
    generateEvaluationBridgeMethod(classWriter);
    generateSyntheticEvaluationBridgeMethod(classWriter);
  }

  private static void generateSyntheticEvaluationBridgeMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE | ACC_SYNTHETIC,
                                                          "evaluate",
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
                                  "evaluate",
                                  "(Ljava/lang/Void;IILjava/lang/Object;)Ljava/lang/Object;",
                                  true);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 5);
    methodVisitor.visitEnd();
  }

  private static MethodVisitor getField(MethodVisitor methodVisitor,
                                        String thisClassInternalName,
                                        String fieldName,
                                        String fieldTypeSignature)
  {
    loadThis(methodVisitor).visitFieldInsn(GETFIELD, thisClassInternalName, fieldName, fieldTypeSignature);
    return methodVisitor;
  }

  private static void incrementIndex(MethodVisitor methodVisitor)
  {
    loadIndex(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "increment", "()Larb/Integer;");
    pop(methodVisitor);
  }

  private static void initializeProductToTheIdentity(MethodVisitor methodVisitor)
  {
    loadResult(methodVisitor);
    invokeMethod(methodVisitor, "arb/Real", "one", "()Larb/Real;");
    pop(methodVisitor);
  }

  private static void invokeDefaultConstructor(MethodVisitor methodVisitor)
  {
    loadThis(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
  }

  private static void invokeMethod(MethodVisitor methodVisitor,
                                   String classInternalName,
                                   String methodName,
                                   String methodSignature)
  {
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, classInternalName, methodName, methodSignature, false);
  }

  private static void jumpToBeforeLoopIfIndexLessThanOrEqualToEndIndex(MethodVisitor methodVisitor)
  {
    methodVisitor.visitJumpInsn(IFLE, beforeLoop);
  }

  private static void loadBits(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ILOAD, 1);
  }

  private static void loadEndIndex(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, "endIndex", "Larb/Integer;");
  }

  private static void loadFieldFromThis(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    getField(methodVisitor, THIS_CLASS_INTERNAL_NAME, fieldName, fieldTypeSignature);
  }

  private static void loadIndex(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, "index", "Larb/Integer;");
  }

  private static void loadResult(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 2);
  }

  private static void loadStartIndex(MethodVisitor methodVisitor)
  {
    loadFieldFromThis(methodVisitor, "startIndex", "Larb/Integer;");
  }

  private static MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  private static void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }

  private static void setIndexToTheStartIndex(MethodVisitor methodVisitor)
  {
    loadIndex(methodVisitor);
    loadStartIndex(methodVisitor);
    invokeMethod(methodVisitor, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;");
    pop(methodVisitor);
  }
}
