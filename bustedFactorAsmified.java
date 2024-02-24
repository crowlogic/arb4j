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
public class factorr̅1Dump implements Opcodes {

public static byte[] dump () throws Exception {

ClassWriter classWriter = new ClassWriter(0);
FieldVisitor fieldVisitor;
RecordComponentVisitor recordComponentVisitor;
MethodVisitor methodVisitor;
AnnotationVisitor annotationVisitor0;

classWriter.visit(-65471, ACC_PUBLIC | ACC_SUPER, "factorr\u03051", "Ljava/lang/Object;Larb/functions/Function<Larb/Integer;Larb/RealPolynomial;>;", "java/lang/Object", new String[] { "arb/functions/Function" });

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
methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "evaluate", "(Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;", "(Larb/Integer;IILarb/RealPolynomial;)Larb/RealPolynomial;", null);
methodVisitor.visitCode();
Label label0 = new Label();
methodVisitor.visitLabel(label0);
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitFieldInsn(GETFIELD, "factorr\u03051", "\u03b1", "Larb/Real;");
methodVisitor.visitVarInsn(ALOAD, 1);
methodVisitor.visitTypeInsn(CHECKCAST, "arb/Integer");
methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "get", "(Larb/Integer;)Larb/Real;", false);
methodVisitor.visitVarInsn(ALOAD, 4);
methodVisitor.visitTypeInsn(CHECKCAST, "arb/RealPolynomial");
methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "identity", "()Larb/RealPolynomial;", false);
Label label1 = new Label();
methodVisitor.visitLabel(label1);
methodVisitor.visitFrame(Opcodes.F_SAME1, 0, null, 1, new Object[] {"arb/RealPolynomial"});
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitFieldInsn(GETFIELD, "factorr\u03051", "c1", "Larb/Integer;");
methodVisitor.visitVarInsn(ILOAD, 3);
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitFieldInsn(GETFIELD, "factorr\u03051", "r\u03051", "Larb/RealPolynomial;");
methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "sub", "(Larb/Integer;ILarb/RealPolynomial;)Larb/RealPolynomial;", false);
methodVisitor.visitVarInsn(ILOAD, 3);
methodVisitor.visitVarInsn(ALOAD, 4);
methodVisitor.visitTypeInsn(CHECKCAST, "arb/RealPolynomial");
methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "risingFactorial", "(Larb/RealPolynomial;ILarb/RealPolynomial;)Larb/RealPolynomial;", false);
methodVisitor.visitInsn(ARETURN);
Label label2 = new Label();
methodVisitor.visitLabel(label2);
methodVisitor.visitLocalVariable("this", "Lfactorr\u03051;", null, label0, label2, 0);
methodVisitor.visitLocalVariable("in", "Larb/Integer;", null, label0, label2, 1);
methodVisitor.visitLocalVariable("order", "I", null, label0, label2, 2);
methodVisitor.visitLocalVariable("bits", "I", null, label0, label2, 3);
methodVisitor.visitLocalVariable("result", "Larb/RealPolynomial;", null, label0, label2, 4);
methodVisitor.visitMaxs(10, 10);
methodVisitor.visitEnd();
}
{
methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
methodVisitor.visitCode();
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitTypeInsn(NEW, "arb/Integer");
methodVisitor.visitInsn(DUP);
methodVisitor.visitLdcInsn("1");
methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "(Ljava/lang/String;)V", false);
methodVisitor.visitFieldInsn(PUTFIELD, "factorr\u03051", "c1", "Larb/Integer;");
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitTypeInsn(NEW, "arb/RealPolynomial");
methodVisitor.visitInsn(DUP);
methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/RealPolynomial", "<init>", "()V", false);
methodVisitor.visitFieldInsn(PUTFIELD, "factorr\u03051", "r\u03051", "Larb/RealPolynomial;");
methodVisitor.visitInsn(RETURN);
methodVisitor.visitMaxs(10, 10);
methodVisitor.visitEnd();
}
{
methodVisitor = classWriter.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
methodVisitor.visitCode();
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitFieldInsn(GETFIELD, "factorr\u03051", "c1", "Larb/Integer;");
methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
methodVisitor.visitVarInsn(ALOAD, 0);
methodVisitor.visitFieldInsn(GETFIELD, "factorr\u03051", "r\u03051", "Larb/RealPolynomial;");
methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/RealPolynomial", "close", "()V", false);
methodVisitor.visitInsn(RETURN);
methodVisitor.visitMaxs(10, 10);
methodVisitor.visitEnd();
}
classWriter.visitEnd();

return classWriter.toByteArray();
}
}
