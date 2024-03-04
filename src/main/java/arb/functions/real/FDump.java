package arb.functions.real;

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

public class FDump implements
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
                      "F",
                      "Ljava/lang/Object;Larb/functions/Function<Larb/Integer;Larb/Real;>;",
                      "java/lang/Object",
                      new String[]
                      { "arb/functions/Function" });

    {
      fieldVisitor = classWriter.visitField(ACC_PRIVATE, "isInitialized", "Z", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, "c1", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "p", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "q", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "\u03b1", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "\u03b2", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "value\u211d1", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "k", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "product\u211d1", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "endIndex\u21241", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "value\u211d2", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "product\u211d2", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "endIndex\u21242", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC | ACC_FINAL, "factor\u211d2", "Lfactor\u211d2;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC | ACC_FINAL, "factor\u211d1", "Lfactor\u211d1;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC,
                                              "evaluate",
                                              "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;",
                                              "(Larb/Integer;IILarb/Real;)Larb/Real;",
                                              null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "isInitialized", "Z");
      Label label1 = new Label();
      methodVisitor.visitJumpInsn(IFNE, label1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "F", "initialize", "()V", false);
      methodVisitor.visitLabel(label1);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Integer");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d1", "n", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "multiplicativeIdentity", "()Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "c1", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "p", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "value\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEINTERFACE,
                                    "arb/functions/Function",
                                    "evaluate",
                                    "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                    true);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Real;I)Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
      methodVisitor.visitJumpInsn(IFLE, label2);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Integer");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d2", "n", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "multiplicativeIdentity", "()Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "c1", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "q", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label3 = new Label();
      methodVisitor.visitLabel(label3);
      methodVisitor.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { "arb/Real" });
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "value\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEINTERFACE,
                                    "arb/functions/Function",
                                    "evaluate",
                                    "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                    true);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Real;I)Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
      methodVisitor.visitJumpInsn(IFLE, label3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "div", "(Larb/Real;ILarb/Real;)Larb/Real;", false);
      methodVisitor.visitInsn(ARETURN);
      Label label4 = new Label();
      methodVisitor.visitLabel(label4);
      methodVisitor.visitLocalVariable("this", "LF;", null, label0, label4, 0);
      methodVisitor.visitLocalVariable("in", "Larb/Integer;", null, label0, label4, 1);
      methodVisitor.visitLocalVariable("order", "I", null, label0, label4, 2);
      methodVisitor.visitLocalVariable("bits", "I", null, label0, label4, 3);
      methodVisitor.visitLocalVariable("result", "Larb/Real;", null, label0, label4, 4);
      methodVisitor.visitMaxs(6, 5);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "factor\u211d2");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "factor\u211d2", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "factor\u211d1");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "factor\u211d1", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("1");
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(Ljava/lang/String;)V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "c1", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "value\u211d1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "value\u211d2", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitInsn(RETURN);
      methodVisitor.visitMaxs(4, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "initialize", "()V", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "isInitialized", "Z");
      Label label0 = new Label();
      methodVisitor.visitJumpInsn(IFEQ, label0);
      methodVisitor.visitTypeInsn(NEW, "java/lang/AssertionError");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("Already initialized");
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    "java/lang/AssertionError",
                                    "<init>",
                                    "(Ljava/lang/Object;)V",
                                    false);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label0);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "p", "Larb/Integer;");
      Label label1 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label1);
      methodVisitor.visitTypeInsn(NEW, "java/lang/AssertionError");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("p is null");
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    "java/lang/AssertionError",
                                    "<init>",
                                    "(Ljava/lang/Object;)V",
                                    false);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label1);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "q", "Larb/Integer;");
      Label label2 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label2);
      methodVisitor.visitTypeInsn(NEW, "java/lang/AssertionError");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("q is null");
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    "java/lang/AssertionError",
                                    "<init>",
                                    "(Ljava/lang/Object;)V",
                                    false);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label2);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "p", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d2", "p", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "q", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d2", "q", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "\u03b1", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d2", "\u03b1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d2", "Lfactor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "\u03b2", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d2", "\u03b2", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "p", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d1", "p", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "q", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d1", "q", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "\u03b1", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d1", "\u03b1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "factor\u211d1", "Lfactor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "\u03b2", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "factor\u211d1", "\u03b2", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitFieldInsn(PUTFIELD, "F", "isInitialized", "Z");
      methodVisitor.visitInsn(RETURN);
      methodVisitor.visitMaxs(4, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
      methodVisitor.visitCode();
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "c1", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "value\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "k", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "value\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitInsn(RETURN);
      methodVisitor.visitMaxs(1, 1);
      methodVisitor.visitEnd();
    }
    classWriter.visitEnd();

    return classWriter.toByteArray();
  }
}
