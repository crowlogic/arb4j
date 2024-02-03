package arb.expressions.nodes.nary;

import org.objectweb.asm.AnnotationVisitor;
import org.objectweb.asm.Attribute;
import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.ConstantDynamic;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Handle;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.RecordComponentVisitor;
import org.objectweb.asm.Type;
import org.objectweb.asm.TypePath;

public class ProductGenerator implements
                              Opcodes
{

  public static byte[] dump() throws Exception
  {

    ClassWriter            classWriter = new ClassWriter(0);
    FieldVisitor           fieldVisitor;
    RecordComponentVisitor recordComponentVisitor;
    MethodVisitor          methodVisitor;
    AnnotationVisitor      annotationVisitor0;

    classWriter.visit(-65471,
                      ACC_PUBLIC | ACC_SUPER,
                      "arb/functions/real/Product",
                      "Ljava/lang/Object;Ljava/lang/AutoCloseable;Larb/functions/real/NullaryFunction<Larb/Real;>;",
                      "java/lang/Object",
                      new String[]
                      { "java/lang/AutoCloseable", "arb/functions/real/NullaryFunction" });

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
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "startIndex", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "endIndex", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "value", "Larb/Real;");
      methodVisitor.visitInsn(RETURN);
      methodVisitor.visitMaxs(3, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "value", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "startIndex", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "endIndex", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitInsn(RETURN);
      methodVisitor.visitMaxs(1, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "evaluate", "(ILarb/Real;)Larb/Real;", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "one", "()Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "startIndex", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label0 = new Label();
      methodVisitor.visitJumpInsn(GOTO, label0);
      Label label1 = new Label();
      methodVisitor.visitLabel(label1);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "factor", "Larb/functions/Function;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "value", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEINTERFACE,
                                    "arb/functions/Function",
                                    "evaluate",
                                    "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                    true);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitVarInsn(ILOAD, 1);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Field;I)Larb/Field;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitLabel(label0);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "endIndex", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
      methodVisitor.visitJumpInsn(IFLE, label1);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitInsn(ARETURN);
      methodVisitor.visitMaxs(5, 3);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE
                    | ACC_SYNTHETIC, "evaluate", "(ILjava/lang/Object;)Ljava/lang/Object;", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitVarInsn(ILOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/Product",
                                    "evaluate",
                                    "(ILarb/Real;)Larb/Real;",
                                    false);
      methodVisitor.visitInsn(ARETURN);
      methodVisitor.visitMaxs(3, 3);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE | ACC_SYNTHETIC,
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
    classWriter.visitEnd();

    return classWriter.toByteArray();
  }
}
