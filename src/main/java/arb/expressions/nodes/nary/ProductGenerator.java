package arb.expressions.nodes.nary;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class ProductGenerator implements
                              Opcodes
{

  private static final String THIS_CLASS_INTERNAL_NAME = "arb/functions/real/Product";

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

  /**
   * generate 'Real evaluate(int bits, Real result)'
   * 
   * @param classWriter
   */
  private static void generateEvaluateMethod(ClassWriter classWriter)
  {
    Label         afterLoop  = new Label();
    Label         beforeLoop = new Label();
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "evaluate", "(ILarb/Real;)Larb/Real;", null, null);
    methodVisitor.visitCode();
    
    loadResult(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "one", "()Larb/Real;", false);
    pop(methodVisitor);
    getThisField(methodVisitor, "index", "Larb/Integer;");

    getThisField(methodVisitor, "startIndex", "Larb/Integer;");

    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
    
    pop(methodVisitor);

    methodVisitor.visitJumpInsn(GOTO, afterLoop);
    methodVisitor.visitLabel(beforeLoop);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
    loadResult(methodVisitor);
    getThisField(methodVisitor, "factor", "Larb/functions/Function;");
    getThisField(methodVisitor, "index", "Larb/Integer;");
    loadBits(methodVisitor);
    getThisField(methodVisitor, "value", "Larb/Real;");

    methodVisitor.visitMethodInsn(INVOKEINTERFACE,
                                  "arb/functions/Function",
                                  "evaluate",
                                  "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                  true);
    methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
    loadBits(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Field;I)Larb/Field;", false);
    pop(methodVisitor);

    getThisField(methodVisitor, "index", "Larb/Integer;");

    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
    pop(methodVisitor);
    methodVisitor.visitLabel(afterLoop);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "index", "Larb/Integer;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "endIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
    methodVisitor.visitJumpInsn(IFLE, beforeLoop);
    loadResult(methodVisitor);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 3);
    methodVisitor.visitEnd();
  }

  private static void loadBits(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ILOAD, 1);
  }

  private static void loadResult(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 2);
  }

  private static void pop(MethodVisitor methodVisitor)
  {
    methodVisitor.visitInsn(POP);
  }

  private static void getThisField(MethodVisitor methodVisitor, String fieldName, String fieldTypeSignature)
  {
    getField(methodVisitor, THIS_CLASS_INTERNAL_NAME, fieldName, fieldTypeSignature);
  }

  private static void getField(MethodVisitor methodVisitor,
                               String thisClassInternalName,
                               String fieldName,
                               String fieldTypeSignature)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, thisClassInternalName, fieldName, fieldTypeSignature);
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
    methodVisitor.visitVarInsn(ALOAD, 0);
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

  private static void generateEvaluationBridgeMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE
                  | ACC_SYNTHETIC, "evaluate", "(ILjava/lang/Object;)Ljava/lang/Object;", null, null);
    methodVisitor.visitCode();
    methodVisitor.visitVarInsn(ALOAD, 0);
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

  private static void generateCloseMethod(ClassWriter classWriter)
  {
    MethodVisitor methodVisitor;
    methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
    methodVisitor.visitCode();
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "index", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "value", "Larb/Real;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, THIS_CLASS_INTERNAL_NAME, "startIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    methodVisitor.visitVarInsn(ALOAD, 0);
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
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "startIndex", "Larb/Integer;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "endIndex", "Larb/Integer;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "index", "Larb/Integer;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Real");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, THIS_CLASS_INTERNAL_NAME, "value", "Larb/Real;");
    methodVisitor.visitInsn(RETURN);
    methodVisitor.visitMaxs(3, 1);
    methodVisitor.visitEnd();
  }

  private static void invokeDefaultConstructor(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
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
}
