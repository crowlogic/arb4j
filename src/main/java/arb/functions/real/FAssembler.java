package arb.functions.real;

import org.objectweb.asm.AnnotationVisitor;
import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.RecordComponentVisitor;

public class FAssembler implements
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
                      "arb/functions/real/F",
                      "Ljava/lang/Object;Larb/functions/Function<Larb/Integer;Larb/RealPolynomial;>;",
                      "java/lang/Object",
                      new String[]
                      { "arb/functions/Function" });

    classWriter.visitSource("F.java", null);

    {
      fieldVisitor = classWriter.visitField(ACC_PRIVATE, "isInitialized", "Z", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, "c1", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(0, "c2", "Larb/Integer;", null, null);
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
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "\u21241", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "r\u03051", "Larb/RealPolynomial;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "r\u03052", "Larb/RealPolynomial;", null, null);
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
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "r\u03053", "Larb/RealPolynomial;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "\u21243", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "\u21242", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "r\u03055", "Larb/RealPolynomial;", null, null);
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
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "\u211d1", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC, "F", "Larb/functions/real/F;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC
                    | ACC_FINAL, "factor\u211d2", "Larb/functions/real/factor\u211d2;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classWriter.visitField(ACC_PUBLIC
                    | ACC_FINAL, "factor\u211d1", "Larb/functions/real/factor\u211d1;", null, null);
      fieldVisitor.visitEnd();
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
      Label label6 = new Label();
      Label label7 = new Label();
      methodVisitor.visitTryCatchBlock(label5, label6, label7, null);
      Label label8 = new Label();
      Label label9 = new Label();
      methodVisitor.visitTryCatchBlock(label8, label9, label9, null);
      Label label10 = new Label();
      methodVisitor.visitLabel(label10);
      methodVisitor.visitLineNumber(15, label10);
      methodVisitor.visitInsn(ACONST_NULL);
      methodVisitor.visitVarInsn(ASTORE, 1);
      methodVisitor.visitInsn(ACONST_NULL);
      methodVisitor.visitVarInsn(ASTORE, 2);
      methodVisitor.visitLabel(label8);
      methodVisitor.visitTypeInsn(NEW, "arb/functions/real/F");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/functions/real/F", "<init>", "()V", false);
      methodVisitor.visitVarInsn(ASTORE, 3);
      methodVisitor.visitLabel(label5);
      methodVisitor.visitLineNumber(17, label5);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_2);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(I)V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      Label label11 = new Label();
      methodVisitor.visitLabel(label11);
      methodVisitor.visitLineNumber(18, label11);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(I)V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      Label label12 = new Label();
      methodVisitor.visitLabel(label12);
      methodVisitor.visitLineNumber(19, label12);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitInsn(ICONST_2);
      methodVisitor.visitMethodInsn(INVOKESTATIC, "arb/Real", "newVector", "(I)Larb/Real;", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u03b1", "Larb/Real;");
      Label label13 = new Label();
      methodVisitor.visitLabel(label13);
      methodVisitor.visitLineNumber(20, label13);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitMethodInsn(INVOKESTATIC, "arb/Real", "newVector", "(I)Larb/Real;", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u03b2", "Larb/Real;");
      Label label14 = new Label();
      methodVisitor.visitLabel(label14);
      methodVisitor.visitLineNumber(21, label14);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b2", "Larb/Real;");
      methodVisitor.visitLdcInsn(new Double("-0.5"));
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "set", "(D)Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      Label label15 = new Label();
      methodVisitor.visitLabel(label15);
      methodVisitor.visitLineNumber(22, label15);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b1", "Larb/Real;");
      methodVisitor.visitInsn(ICONST_2);
      methodVisitor.visitIntInsn(NEWARRAY, T_DOUBLE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_0);
      methodVisitor.visitLdcInsn(new Double("-3.0"));
      methodVisitor.visitInsn(DASTORE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitLdcInsn(new Double("7.5"));
      methodVisitor.visitInsn(DASTORE);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "set", "([D)Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      Label label16 = new Label();
      methodVisitor.visitLabel(label16);
      methodVisitor.visitLineNumber(23, label16);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitTypeInsn(NEW, "arb/functions/real/F");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/functions/real/F", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      Label label17 = new Label();
      methodVisitor.visitLabel(label17);
      methodVisitor.visitLineNumber(24, label17);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/F", "initialize", "()V", false);
      Label label18 = new Label();
      methodVisitor.visitLabel(label18);
      methodVisitor.visitLineNumber(26, label18);
      methodVisitor.visitInsn(ACONST_NULL);
      methodVisitor.visitVarInsn(ASTORE, 4);
      methodVisitor.visitInsn(ACONST_NULL);
      methodVisitor.visitVarInsn(ASTORE, 5);
      methodVisitor.visitLabel(label3);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitVarInsn(ASTORE, 6);
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(28, label0);
      methodVisitor.visitInsn(ICONST_0);
      methodVisitor.visitVarInsn(ISTORE, 7);
      Label label19 = new Label();
      methodVisitor.visitLabel(label19);
      Label label20 = new Label();
      methodVisitor.visitJumpInsn(GOTO, label20);
      Label label21 = new Label();
      methodVisitor.visitLabel(label21);
      methodVisitor.visitLineNumber(30, label21);
      methodVisitor.visitFrame(Opcodes.F_FULL, 8, new Object[]
      { "[Ljava/lang/String;", "java/lang/Throwable", "java/lang/Throwable", "arb/functions/real/F",
        "java/lang/Throwable", "java/lang/Throwable", "arb/Integer", Opcodes.INTEGER }, 0, new Object[]
      {});
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitVarInsn(ALOAD, 6);
      methodVisitor.visitVarInsn(ILOAD, 7);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(I)Larb/Integer;", false);
      methodVisitor.visitInsn(ICONST_0);
      methodVisitor.visitIntInsn(SIPUSH, 128);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/F",
                                    "evaluate",
                                    "(Larb/Integer;IILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ASTORE, 8);
      Label label22 = new Label();
      methodVisitor.visitLabel(label22);
      methodVisitor.visitLineNumber(31, label22);
      methodVisitor.visitFieldInsn(GETSTATIC, "java/lang/System", "out", "Ljava/io/PrintStream;");
      methodVisitor.visitLdcInsn("F(%d,x)=%s\n");
      methodVisitor.visitInsn(ICONST_2);
      methodVisitor.visitTypeInsn(ANEWARRAY, "java/lang/Object");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_0);
      methodVisitor.visitVarInsn(ILOAD, 7);
      methodVisitor.visitMethodInsn(INVOKESTATIC, "java/lang/Integer", "valueOf", "(I)Ljava/lang/Integer;", false);
      methodVisitor.visitInsn(AASTORE);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitVarInsn(ALOAD, 8);
      methodVisitor.visitInsn(AASTORE);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "java/io/PrintStream",
                                    "format",
                                    "(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;",
                                    false);
      methodVisitor.visitInsn(POP);
      Label label23 = new Label();
      methodVisitor.visitLabel(label23);
      methodVisitor.visitLineNumber(28, label23);
      methodVisitor.visitIincInsn(7, 1);
      methodVisitor.visitLabel(label20);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ILOAD, 7);
      methodVisitor.visitIntInsn(BIPUSH, 10);
      methodVisitor.visitJumpInsn(IF_ICMPLT, label21);
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(33, label1);
      methodVisitor.visitVarInsn(ALOAD, 6);
      methodVisitor.visitJumpInsn(IFNULL, label6);
      methodVisitor.visitVarInsn(ALOAD, 6);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitJumpInsn(GOTO, label6);
      methodVisitor.visitLabel(label2);
      methodVisitor.visitFrame(Opcodes.F_FULL, 7, new Object[]
      { "[Ljava/lang/String;", "java/lang/Throwable", "java/lang/Throwable", "arb/functions/real/F",
        "java/lang/Throwable", "java/lang/Throwable", "arb/Integer" }, 1, new Object[]
      { "java/lang/Throwable" });
      methodVisitor.visitVarInsn(ASTORE, 4);
      methodVisitor.visitVarInsn(ALOAD, 6);
      Label label24 = new Label();
      methodVisitor.visitJumpInsn(IFNULL, label24);
      methodVisitor.visitVarInsn(ALOAD, 6);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      methodVisitor.visitLabel(label24);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 1, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label4);
      methodVisitor.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { "java/lang/Throwable" });
      methodVisitor.visitVarInsn(ASTORE, 5);
      methodVisitor.visitVarInsn(ALOAD, 4);
      Label label25 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label25);
      methodVisitor.visitVarInsn(ALOAD, 5);
      methodVisitor.visitVarInsn(ASTORE, 4);
      Label label26 = new Label();
      methodVisitor.visitJumpInsn(GOTO, label26);
      methodVisitor.visitLabel(label25);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitVarInsn(ALOAD, 5);
      methodVisitor.visitJumpInsn(IF_ACMPEQ, label26);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitVarInsn(ALOAD, 5);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "java/lang/Throwable",
                                    "addSuppressed",
                                    "(Ljava/lang/Throwable;)V",
                                    false);
      methodVisitor.visitLabel(label26);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label6);
      methodVisitor.visitLineNumber(34, label6);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 2, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 3);
      Label label27 = new Label();
      methodVisitor.visitJumpInsn(IFNULL, label27);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/F", "close", "()V", false);
      methodVisitor.visitJumpInsn(GOTO, label27);
      methodVisitor.visitLabel(label7);
      methodVisitor.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { "java/lang/Throwable" });
      methodVisitor.visitVarInsn(ASTORE, 1);
      methodVisitor.visitVarInsn(ALOAD, 3);
      Label label28 = new Label();
      methodVisitor.visitJumpInsn(IFNULL, label28);
      methodVisitor.visitVarInsn(ALOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/F", "close", "()V", false);
      methodVisitor.visitLabel(label28);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 1, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label9);
      methodVisitor.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[]
      { "java/lang/Throwable" });
      methodVisitor.visitVarInsn(ASTORE, 2);
      methodVisitor.visitVarInsn(ALOAD, 1);
      Label label29 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label29);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitVarInsn(ASTORE, 1);
      Label label30 = new Label();
      methodVisitor.visitJumpInsn(GOTO, label30);
      methodVisitor.visitLabel(label29);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitJumpInsn(IF_ACMPEQ, label30);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 2);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "java/lang/Throwable",
                                    "addSuppressed",
                                    "(Ljava/lang/Throwable;)V",
                                    false);
      methodVisitor.visitLabel(label30);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label27);
      methodVisitor.visitLineNumber(35, label27);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 2, null, 0, null);
      methodVisitor.visitInsn(RETURN);
      Label label31 = new Label();
      methodVisitor.visitLabel(label31);
      methodVisitor.visitLocalVariable("args", "[Ljava/lang/String;", null, label10, label31, 0);
      methodVisitor.visitLocalVariable("F", "Larb/functions/real/F;", null, label5, label28, 3);
      methodVisitor.visitLocalVariable("index", "Larb/Integer;", null, label0, label24, 6);
      methodVisitor.visitLocalVariable("n", "I", null, label19, label1, 7);
      methodVisitor.visitLocalVariable("fn", "Larb/RealPolynomial;", null, label22, label23, 8);
      methodVisitor.visitMaxs(6, 9);
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
      methodVisitor.visitLineNumber(65, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "isInitialized", "Z");
      Label label1 = new Label();
      methodVisitor.visitJumpInsn(IFNE, label1);
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitLineNumber(67, label2);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/F", "initialize", "()V", false);
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(71, label1);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "getSignedValue", "()I", false);
      Label label3 = new Label();
      Label label4 = new Label();
      methodVisitor.visitTableSwitchInsn(0, 0, label4, new Label[]
      { label3 });
      methodVisitor.visitLabel(label3);
      methodVisitor.visitLineNumber(74, label3);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "set",
                                    "(Larb/Integer;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ASTORE, 5);
      Label label5 = new Label();
      methodVisitor.visitLabel(label5);
      methodVisitor.visitLineNumber(75, label5);
      Label label6 = new Label();
      methodVisitor.visitJumpInsn(GOTO, label6);
      methodVisitor.visitLabel(label4);
      methodVisitor.visitLineNumber(77, label4);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "identity",
                                    "()Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u21241", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/Integer",
                                    "sub",
                                    "(Larb/Integer;ILarb/Integer;)Larb/Integer;",
                                    false);
      methodVisitor.visitVarInsn(ILOAD, 2);
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03051", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/F",
                                    "evaluate",
                                    "(Larb/Integer;IILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03052", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "mul",
                                    "(Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ASTORE, 5);
      Label label7 = new Label();
      methodVisitor.visitLabel(label7);
      methodVisitor.visitLineNumber(78, label7);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d1", "n", "Larb/Integer;");
      Label label8 = new Label();
      methodVisitor.visitLabel(label8);
      methodVisitor.visitLineNumber(79, label8);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "multiplicativeIdentity", "()Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      Label label9 = new Label();
      methodVisitor.visitLabel(label9);
      methodVisitor.visitLineNumber(80, label9);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label10 = new Label();
      methodVisitor.visitLabel(label10);
      methodVisitor.visitLineNumber(81, label10);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label11 = new Label();
      methodVisitor.visitLabel(label11);
      methodVisitor.visitLineNumber(85, label11);
      methodVisitor.visitFrame(Opcodes.F_APPEND, 1, new Object[]
      { "arb/RealPolynomial" }, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "value\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/factor\u211d1",
                                    "evaluate",
                                    "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                    false);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Real;I)Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      Label label12 = new Label();
      methodVisitor.visitLabel(label12);
      methodVisitor.visitLineNumber(87, label12);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
      Label label13 = new Label();
      methodVisitor.visitLabel(label13);
      methodVisitor.visitLineNumber(83, label13);
      methodVisitor.visitJumpInsn(IFLE, label11);
      Label label14 = new Label();
      methodVisitor.visitLabel(label14);
      methodVisitor.visitLineNumber(89, label14);
      methodVisitor.visitVarInsn(ALOAD, 5);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03053", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "mul",
                                    "(Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitVarInsn(ASTORE, 5);
      Label label15 = new Label();
      methodVisitor.visitLabel(label15);
      methodVisitor.visitLineNumber(90, label15);
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u21243", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/Integer",
                                    "sub",
                                    "(Larb/Integer;ILarb/Integer;)Larb/Integer;",
                                    false);
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u21242", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/Integer",
                                    "factorial",
                                    "(ILarb/Integer;)Larb/Integer;",
                                    false);
      methodVisitor.visitVarInsn(ASTORE, 6);
      Label label16 = new Label();
      methodVisitor.visitLabel(label16);
      methodVisitor.visitLineNumber(91, label16);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 1);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d2", "n", "Larb/Integer;");
      Label label17 = new Label();
      methodVisitor.visitLabel(label17);
      methodVisitor.visitLineNumber(92, label17);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "multiplicativeIdentity", "()Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      Label label18 = new Label();
      methodVisitor.visitLabel(label18);
      methodVisitor.visitLineNumber(93, label18);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label19 = new Label();
      methodVisitor.visitLabel(label19);
      methodVisitor.visitLineNumber(94, label19);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
      methodVisitor.visitInsn(POP);
      Label label20 = new Label();
      methodVisitor.visitLabel(label20);
      methodVisitor.visitLineNumber(98, label20);
      methodVisitor.visitFrame(Opcodes.F_APPEND, 1, new Object[]
      { "arb/Integer" }, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "value\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/functions/real/factor\u211d2",
                                    "evaluate",
                                    "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                    false);
      methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Real;I)Larb/Real;", false);
      methodVisitor.visitInsn(POP);
      Label label21 = new Label();
      methodVisitor.visitLabel(label21);
      methodVisitor.visitLineNumber(100, label21);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
      Label label22 = new Label();
      methodVisitor.visitLabel(label22);
      methodVisitor.visitLineNumber(96, label22);
      methodVisitor.visitJumpInsn(IFLE, label20);
      Label label23 = new Label();
      methodVisitor.visitLabel(label23);
      methodVisitor.visitLineNumber(102, label23);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitVarInsn(ALOAD, 6);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "mul", "(Larb/Real;ILarb/Real;)Larb/Real;", false);
      methodVisitor.visitVarInsn(ILOAD, 3);
      methodVisitor.visitVarInsn(ALOAD, 4);
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    "arb/RealPolynomial",
                                    "div",
                                    "(Larb/Real;ILarb/RealPolynomial;)Larb/RealPolynomial;",
                                    false);
      methodVisitor.visitInsn(POP);
      methodVisitor.visitLabel(label6);
      methodVisitor.visitLineNumber(105, label6);
      methodVisitor.visitFrame(Opcodes.F_CHOP, 1, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 5);
      methodVisitor.visitInsn(ARETURN);
      Label label24 = new Label();
      methodVisitor.visitLabel(label24);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/F;", null, label0, label24, 0);
      methodVisitor.visitLocalVariable("in", "Larb/Integer;", null, label0, label24, 1);
      methodVisitor.visitLocalVariable("order", "I", null, label0, label24, 2);
      methodVisitor.visitLocalVariable("bits", "I", null, label0, label24, 3);
      methodVisitor.visitLocalVariable("result", "Larb/RealPolynomial;", null, label0, label24, 4);
      methodVisitor.visitLocalVariable("var10000", "Larb/RealPolynomial;", null, label5, label4, 5);
      methodVisitor.visitLocalVariable("var10000", "Larb/RealPolynomial;", null, label7, label24, 5);
      methodVisitor.visitLocalVariable("var10002", "Larb/Integer;", null, label16, label6, 6);
      methodVisitor.visitMaxs(6, 7);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(108, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
      Label label1 = new Label();
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(60, label1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/functions/real/factor\u211d2");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/functions/real/factor\u211d2", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitLineNumber(61, label2);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/functions/real/factor\u211d1");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/functions/real/factor\u211d1", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      Label label3 = new Label();
      methodVisitor.visitLabel(label3);
      methodVisitor.visitLineNumber(110, label3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("0");
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(Ljava/lang/String;)V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "c1", "Larb/Integer;");
      Label label4 = new Label();
      methodVisitor.visitLabel(label4);
      methodVisitor.visitLineNumber(111, label4);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("1");
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(Ljava/lang/String;)V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      Label label5 = new Label();
      methodVisitor.visitLabel(label5);
      methodVisitor.visitLineNumber(112, label5);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u21241", "Larb/Integer;");
      Label label6 = new Label();
      methodVisitor.visitLabel(label6);
      methodVisitor.visitLineNumber(113, label6);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "r\u03051", "Larb/RealPolynomial;");
      Label label7 = new Label();
      methodVisitor.visitLabel(label7);
      methodVisitor.visitLineNumber(114, label7);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "r\u03052", "Larb/RealPolynomial;");
      Label label8 = new Label();
      methodVisitor.visitLabel(label8);
      methodVisitor.visitLineNumber(115, label8);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "value\u211d1", "Larb/Real;");
      Label label9 = new Label();
      methodVisitor.visitLabel(label9);
      methodVisitor.visitLineNumber(116, label9);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      Label label10 = new Label();
      methodVisitor.visitLabel(label10);
      methodVisitor.visitLineNumber(117, label10);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "product\u211d1", "Larb/Real;");
      Label label11 = new Label();
      methodVisitor.visitLabel(label11);
      methodVisitor.visitLineNumber(118, label11);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "endIndex\u21241", "Larb/Integer;");
      Label label12 = new Label();
      methodVisitor.visitLabel(label12);
      methodVisitor.visitLineNumber(119, label12);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "r\u03053", "Larb/RealPolynomial;");
      Label label13 = new Label();
      methodVisitor.visitLabel(label13);
      methodVisitor.visitLineNumber(120, label13);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u21243", "Larb/Integer;");
      Label label14 = new Label();
      methodVisitor.visitLabel(label14);
      methodVisitor.visitLineNumber(121, label14);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u21242", "Larb/Integer;");
      Label label15 = new Label();
      methodVisitor.visitLabel(label15);
      methodVisitor.visitLineNumber(122, label15);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "r\u03055", "Larb/RealPolynomial;");
      Label label16 = new Label();
      methodVisitor.visitLabel(label16);
      methodVisitor.visitLineNumber(123, label16);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "value\u211d2", "Larb/Real;");
      Label label17 = new Label();
      methodVisitor.visitLabel(label17);
      methodVisitor.visitLineNumber(124, label17);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "product\u211d2", "Larb/Real;");
      Label label18 = new Label();
      methodVisitor.visitLabel(label18);
      methodVisitor.visitLineNumber(125, label18);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Integer");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "endIndex\u21242", "Larb/Integer;");
      Label label19 = new Label();
      methodVisitor.visitLabel(label19);
      methodVisitor.visitLineNumber(126, label19);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/Real");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u211d1", "Larb/Real;");
      Label label20 = new Label();
      methodVisitor.visitLabel(label20);
      methodVisitor.visitLineNumber(127, label20);
      methodVisitor.visitInsn(RETURN);
      Label label21 = new Label();
      methodVisitor.visitLabel(label21);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/F;", null, label0, label21, 0);
      methodVisitor.visitMaxs(4, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "initialize", "()V", null, null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(131, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "isInitialized", "Z");
      Label label1 = new Label();
      methodVisitor.visitJumpInsn(IFEQ, label1);
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitLineNumber(133, label2);
      methodVisitor.visitTypeInsn(NEW, "java/lang/AssertionError");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("Already initialized");
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    "java/lang/AssertionError",
                                    "<init>",
                                    "(Ljava/lang/Object;)V",
                                    false);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(135, label1);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      Label label3 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label3);
      Label label4 = new Label();
      methodVisitor.visitLabel(label4);
      methodVisitor.visitLineNumber(137, label4);
      methodVisitor.visitTypeInsn(NEW, "java/lang/AssertionError");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("p is null");
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    "java/lang/AssertionError",
                                    "<init>",
                                    "(Ljava/lang/Object;)V",
                                    false);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label3);
      methodVisitor.visitLineNumber(139, label3);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      Label label5 = new Label();
      methodVisitor.visitJumpInsn(IFNONNULL, label5);
      Label label6 = new Label();
      methodVisitor.visitLabel(label6);
      methodVisitor.visitLineNumber(141, label6);
      methodVisitor.visitTypeInsn(NEW, "java/lang/AssertionError");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitLdcInsn("q is null");
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    "java/lang/AssertionError",
                                    "<init>",
                                    "(Ljava/lang/Object;)V",
                                    false);
      methodVisitor.visitInsn(ATHROW);
      methodVisitor.visitLabel(label5);
      methodVisitor.visitLineNumber(145, label5);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d2", "p", "Larb/Integer;");
      Label label7 = new Label();
      methodVisitor.visitLabel(label7);
      methodVisitor.visitLineNumber(146, label7);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d2", "q", "Larb/Integer;");
      Label label8 = new Label();
      methodVisitor.visitLabel(label8);
      methodVisitor.visitLineNumber(147, label8);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b1", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d2", "\u03b1", "Larb/Real;");
      Label label9 = new Label();
      methodVisitor.visitLabel(label9);
      methodVisitor.visitLineNumber(148, label9);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d2",
                                   "Larb/functions/real/factor\u211d2;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b2", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d2", "\u03b2", "Larb/Real;");
      Label label10 = new Label();
      methodVisitor.visitLabel(label10);
      methodVisitor.visitLineNumber(149, label10);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d1", "p", "Larb/Integer;");
      Label label11 = new Label();
      methodVisitor.visitLabel(label11);
      methodVisitor.visitLineNumber(150, label11);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d1", "q", "Larb/Integer;");
      Label label12 = new Label();
      methodVisitor.visitLabel(label12);
      methodVisitor.visitLineNumber(151, label12);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b1", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d1", "\u03b1", "Larb/Real;");
      Label label13 = new Label();
      methodVisitor.visitLabel(label13);
      methodVisitor.visitLineNumber(152, label13);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD,
                                   "arb/functions/real/F",
                                   "factor\u211d1",
                                   "Larb/functions/real/factor\u211d1;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b2", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/factor\u211d1", "\u03b2", "Larb/Real;");
      Label label14 = new Label();
      methodVisitor.visitLabel(label14);
      methodVisitor.visitLineNumber(153, label14);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitTypeInsn(NEW, "arb/functions/real/F");
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/functions/real/F", "<init>", "()V", false);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      Label label15 = new Label();
      methodVisitor.visitLabel(label15);
      methodVisitor.visitLineNumber(154, label15);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "p", "Larb/Integer;");
      Label label16 = new Label();
      methodVisitor.visitLabel(label16);
      methodVisitor.visitLineNumber(155, label16);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "q", "Larb/Integer;");
      Label label17 = new Label();
      methodVisitor.visitLabel(label17);
      methodVisitor.visitLineNumber(156, label17);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b1", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u03b1", "Larb/Real;");
      Label label18 = new Label();
      methodVisitor.visitLabel(label18);
      methodVisitor.visitLineNumber(157, label18);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u03b2", "Larb/Real;");
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "\u03b2", "Larb/Real;");
      Label label19 = new Label();
      methodVisitor.visitLabel(label19);
      methodVisitor.visitLineNumber(158, label19);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitInsn(ICONST_1);
      methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/F", "isInitialized", "Z");
      Label label20 = new Label();
      methodVisitor.visitLabel(label20);
      methodVisitor.visitLineNumber(160, label20);
      methodVisitor.visitInsn(RETURN);
      Label label21 = new Label();
      methodVisitor.visitLabel(label21);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/F;", null, label0, label21, 0);
      methodVisitor.visitMaxs(3, 1);
      methodVisitor.visitEnd();
    }
    {
      methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
      methodVisitor.visitCode();
      Label label0 = new Label();
      methodVisitor.visitLabel(label0);
      methodVisitor.visitLineNumber(164, label0);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c1", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label1 = new Label();
      methodVisitor.visitLabel(label1);
      methodVisitor.visitLineNumber(165, label1);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "c2", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label2 = new Label();
      methodVisitor.visitLabel(label2);
      methodVisitor.visitLineNumber(166, label2);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u21241", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label3 = new Label();
      methodVisitor.visitLabel(label3);
      methodVisitor.visitLineNumber(167, label3);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03051", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "close", "()V", false);
      Label label4 = new Label();
      methodVisitor.visitLabel(label4);
      methodVisitor.visitLineNumber(168, label4);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03052", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "close", "()V", false);
      Label label5 = new Label();
      methodVisitor.visitLabel(label5);
      methodVisitor.visitLineNumber(169, label5);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "value\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      Label label6 = new Label();
      methodVisitor.visitLabel(label6);
      methodVisitor.visitLineNumber(170, label6);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "k", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label7 = new Label();
      methodVisitor.visitLabel(label7);
      methodVisitor.visitLineNumber(171, label7);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      Label label8 = new Label();
      methodVisitor.visitLabel(label8);
      methodVisitor.visitLineNumber(172, label8);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "endIndex\u21241", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label9 = new Label();
      methodVisitor.visitLabel(label9);
      methodVisitor.visitLineNumber(173, label9);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03053", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "close", "()V", false);
      Label label10 = new Label();
      methodVisitor.visitLabel(label10);
      methodVisitor.visitLineNumber(174, label10);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u21243", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label11 = new Label();
      methodVisitor.visitLabel(label11);
      methodVisitor.visitLineNumber(175, label11);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u21242", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label12 = new Label();
      methodVisitor.visitLabel(label12);
      methodVisitor.visitLineNumber(176, label12);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "r\u03055", "Larb/RealPolynomial;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "close", "()V", false);
      Label label13 = new Label();
      methodVisitor.visitLabel(label13);
      methodVisitor.visitLineNumber(177, label13);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "value\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      Label label14 = new Label();
      methodVisitor.visitLabel(label14);
      methodVisitor.visitLineNumber(178, label14);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "product\u211d2", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      Label label15 = new Label();
      methodVisitor.visitLabel(label15);
      methodVisitor.visitLineNumber(179, label15);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "endIndex\u21242", "Larb/Integer;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
      Label label16 = new Label();
      methodVisitor.visitLabel(label16);
      methodVisitor.visitLineNumber(180, label16);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "\u211d1", "Larb/Real;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
      Label label17 = new Label();
      methodVisitor.visitLabel(label17);
      methodVisitor.visitLineNumber(181, label17);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      Label label18 = new Label();
      methodVisitor.visitJumpInsn(IFNULL, label18);
      Label label19 = new Label();
      methodVisitor.visitLabel(label19);
      methodVisitor.visitLineNumber(183, label19);
      methodVisitor.visitVarInsn(ALOAD, 0);
      methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/F", "F", "Larb/functions/real/F;");
      methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/functions/real/F", "close", "()V", false);
      methodVisitor.visitLabel(label18);
      methodVisitor.visitLineNumber(185, label18);
      methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
      methodVisitor.visitInsn(RETURN);
      Label label20 = new Label();
      methodVisitor.visitLabel(label20);
      methodVisitor.visitLocalVariable("this", "Larb/functions/real/F;", null, label0, label20, 0);
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
                                    "arb/functions/real/F",
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
