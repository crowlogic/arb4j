package arb.functions.real;

import org.objectweb.asm.AnnotationVisitor;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.RecordComponentVisitor;

public class FactorGenerator implements
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
                      "arb/functions/real/factorr\u03051",
                      "Ljava/lang/Object;Larb/functions/Function<Larb/Integer;Larb/RealPolynomial;>;",
                      "java/lang/Object",
                      new String[]
                      { "arb/functions/Function" });

    classWriter.visitSource("factorr\u03051.java", null);

    {
      fieldVisitor = classWriter.visitField(0, "c1", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "n", "Larb/Integer;", null, null);
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
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "r\u03051", "Larb/RealPolynomial;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(8, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
      Label label1 = new Label();
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(11, label1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("1");
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(Ljava/lang/String;)V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factorr\u03051", "c1", "Larb/Integer;");
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitLineNumber(17, label2);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD,
                                   "arb/functions/real/factorr\u03051",
                                   "r\u03051",
                                   "Larb/RealPolynomial;");
      Label label3 = new Label();
      methodVisitor.visitLabel(label3);
      methodVisitor.visitLineNumber(8, label3);
      methodVisitor.visitInsn(RETURN);
      Label label4 = new Label();
      methodVisitor.visitLabel(label4);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/factorr\u03051;", null, label0, label4, 0);
      methodVisitor.visitMaxs(4, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_STATIC, "main", "([Ljava/lang/String;)V", null, null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      Label label1 = new Label();
      Label label2 = new Label();
      methodVisitor.visitTryCatchBlock(label0, label1, label2, null);
      Label label3 = new Label();
      Label label4 = new Label();
      methodVisitor.visitTryCatchBlock(label3, label4, label4, null);
      Label label5 = new Label();
      methodVisitor.visitLabel(label5);
      methodVisitor.visitLineNumber(21, label5);
      methodVisitor.visitInsn(ACONST_NULL);
      methodVisitor.visitVarInsn(ASTORE, 1);
      methodVisitor.visitInsn(ACONST_NULL);
      methodVisitor.visitVarInsn(ASTORE, 2);
      methodVisitor.visitLabel(label3);
      methodVisitor.visitTypeInsn(NEW, "arb/functions/real/factorr\u03051");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/functions/real/factorr\u03051", "<init>", "()V", false);
      methodVisitor.visitVarInsn(ASTORE, 3);
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(23, label0);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitInsn(ICONST_4);
      methodVisitor.visitMethodInsn(INVOKESTATIC, "arb/Real", "newVector", "(I)Larb/Real;", false);
      methodVisitor.visitInsn(ICONST_4);
      methodVisitor.visitIntInsn(NEWARRAY, T_DOUBLE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_0);
      methodVisitor.visitInsn(DCONST_1);
      methodVisitor.visitInsn(DASTORE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitLdcInsn(new Double("2.0"));
      methodVisitor.visitInsn(DASTORE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_2);
      methodVisitor.visitLdcInsn(new Double("3.0"));
      methodVisitor.visitInsn(DASTORE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_3);
      methodVisitor.visitLdcInsn(new Double("4.0"));
      methodVisitor.visitInsn(DASTORE);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "set", "([D)Larb/Real;", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factorr\u03051", "\u03b1", "Larb/Real;");
      Label label6 = new Label();
      methodVisitor.visitLabel(label6);
      methodVisitor.visitLineNumber(24, label6);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(I)V", false);
      methodVisitor.visitVarInsn(ASTORE, 4);
      Label label7 = new Label();
      methodVisitor.visitLabel(label7);
      methodVisitor.visitLineNumber(25, label7);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitIntInsn(SIPUSH, 128);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/factorr\u03051",
                                    "evaluate",
                                    "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                    false);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/RealPolynomial");
      methodVisitor.visitVarInsn(ASTORE, 5);
      Label label8 = new Label();
      methodVisitor.visitLabel(label8);
      methodVisitor.visitLineNumber(26, label8);
      methodVisitor.visitFieldInsn(GETSTATIC, "java/lang/System", "out", "Ljava/io/PrintStream;");
      methodVisitor.visitLdcInsn("factor(%s)=%s\n");
      methodVisitor.visitInsn(ICONST_2);
      methodVisitor.visitTypeInsn(ANEWARRAY, "java/lang/Object");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_0);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitInsn(AASTORE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitVarInsn(ALOAD, 5);
      methodVisitor.visitInsn(AASTORE);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "java/io/PrintStream",
                                    "format",
                                    "(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;",
                                    false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(27, label1);
      methodVisitor.visitVarInsn(ALOAD, 3);
      Label label9 = new Label();
      methodVisitor.visitJumpInsn(IFNULL, label9);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/factorr\u03051", "close", "()V", false);
      methodVisitor.visitJumpInsn(GOTO, label9);
      methodVisitor.visitLabel(label2);
      methodVisitor.visitFrame(Opcodes.F_FULL, 4, new Object[]
      { "[Ljava/lang/String;", "java/lang/Throwable", "java/lang/Throwable", "arb/functions/real/factorr\u03051" },
                               1,
                               new Object[]
                               { "java/lang/Throwable" });
      methodVisitor.visitVarInsn(ASTORE, 1);
      methodVisitor.visitVarInsn(ALOAD, 3);
      Label label10 = new Label();
      methodVisitor.visitJumpInsn(IFNULL, label10);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/factorr\u03051", "close", "()V", false);
      methodVisitor.visitLabel(label10);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 1, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label4);
      methodVisitor.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { "java/lang/Throwable" });
      methodVisitor.visitVarInsn(ASTORE, 2);
      methodVisitor.visitVarInsn(ALOAD, 1);
      Label label11 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label11);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitVarInsn(ASTORE, 1);
      Label label12 = new Label();
      methodVisitor.visitJumpInsn(GOTO, label12);
      methodVisitor.visitLabel(label11);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitJumpInsn(IF_ACMPEQ, label12);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "java/lang/Throwable",
                                    "addSuppressed",
                                    "(Ljava/lang/Throwable;)V",
                                    false);
      methodVisitor.visitLabel(label12);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label9);
      methodVisitor.visitLineNumber(28, label9);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 2, null, 0, null);
      methodVisitor.visitInsn(RETURN);
      Label label13 = new Label();
      methodVisitor.visitLabel(label13);
      methodVisitor.visitLocalVariable("args", "[Ljava/lang/String;", null, label5, label13, 0);
      methodVisitor.visitLocalVariable("factor", "Larb/functions/real/factorr\u03051;", null, label0, label10, 3);
      methodVisitor.visitLocalVariable("in", "Larb/Integer;", null, label7, label1, 4);
      methodVisitor.visitLocalVariable("evaluate", "Larb/RealPolynomial;", null, label8, label1, 5);
      methodVisitor.visitMaxs(7, 6);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC,
                                              "evaluate",
                                              "(Larb/Integer;IILarb/RealPolynomial;)Larb/RealPolynomial;",
                                              null,
                                              null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(31, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/factorr\u03051", "\u03b1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "get", "(Larb/Integer;)Larb/Real;", false);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "identity",
                                    "()Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/factorr\u03051", "c1", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/factorr\u03051",
                                   "r\u03051",
                                   "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "sub",
                                    "(Larb/Integer;ILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/Real",
                                    "risingFactorial",
                                    "(Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitInsn(ARETURN);
      Label label1 = new Label();
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/factorr\u03051;", null, label0, label1, 0);
      methodVisitor.visitLocalVariable("in", "Larb/Integer;", null, label0, label1, 1);
      methodVisitor.visitLocalVariable("order", "I", null, label0, label1, 2);
      methodVisitor.visitLocalVariable("bits", "I", null, label0, label1, 3);
      methodVisitor.visitLocalVariable("result", "Larb/RealPolynomial;", null, label0, label1, 4);
      methodVisitor.visitMaxs(5, 5);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(36, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/factorr\u03051", "c1", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label1 = new Label();
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(37, label1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/factorr\u03051",
                                   "r\u03051",
                                   "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "close", "()V", false);
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitLineNumber(38, label2);
      methodVisitor.visitInsn(RETURN);
      Label label3 = new Label();
      methodVisitor.visitLabel(label3);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/factorr\u03051;", null, label0, label3, 0);
      methodVisitor.visitMaxs(1, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC | ACC_BRIDGE | ACC_SYNTHETIC,
                                              "evaluate",
                                              "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;",
                                              null,
                                              null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(1, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Integer");
      methodVisitor.visitVarInsn(ILOAD, 2);
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/RealPolynomial");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/factorr\u03051",
                                    "evaluate",
                                    "(Larb/Integer;IILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitInsn(ARETURN);
      methodVisitor.visitMaxs(5, 5);
      methodVisitor.visitEnd();
    }
    classWriter.visitEnd();

    return classWriter.toByteArray();
  }
}
