package arb.functions.real;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.expressions.nodes.Node;
import arb.expressions.nodes.nary.Product;
import arb.functions.Function;

public class ProductGenerator<D, R, F extends Function<D, R>> implements
                             Opcodes
{

  private static final int RESULT_LOCAL_VARIABLE_INDEX = 4;
  private ClassVisitor     classVisitor;
  private MethodVisitor    mv;
  private Product<D, R, F> indexVar;
  private Node<D, R, F>    startIndex;
  private Node<D, R, F>    endIndex;

  public ProductGenerator(ClassVisitor classVisitor,
                          MethodVisitor mv,
                          Product<D, R, F> indexVar,
                          Node<D, R, F> startIndex,
                          Node<D, R, F> endIndex)
  {
    this.classVisitor = classVisitor;
    this.mv           = mv;
    this.indexVar     = indexVar;
    this.startIndex   = startIndex;
    this.endIndex     = endIndex;
  }

  public void generateProductMethod()
  {
    declareFields();
    initializeFieldValues();
    generateCloseMethod();
    generateEvaluateMethod();
    generateSyntheticBridgeMethod(classVisitor);
    classVisitor.visitEnd();

  }

  private void generateEvaluateMethod()
  {
    MethodVisitor methodVisitor = mv;
    Label         beginLabel    = new Label();
    methodVisitor.visitLabel(beginLabel);
    methodVisitor.visitVarInsn(ALOAD, RESULT_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "one", "()Larb/Real;", false);
    methodVisitor.visitInsn(POP);
    Label label1 = new Label();
    methodVisitor.visitLabel(label1);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "startIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(Larb/Integer;)Larb/Integer;", false);
    methodVisitor.visitInsn(POP);
    Label label2 = new Label();
    methodVisitor.visitJumpInsn(GOTO, label2);
    Label label3 = new Label();
    methodVisitor.visitLabel(label3);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
    methodVisitor.visitVarInsn(ALOAD, RESULT_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "factor", "Larb/functions/Function;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "increment", "()Larb/Integer;", false);
    methodVisitor.visitVarInsn(ILOAD, 3);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "value", "Larb/Real;");
    methodVisitor.visitMethodInsn(INVOKEINTERFACE,
                                  "arb/functions/Function",
                                  "evaluate",
                                  "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                  true);
    methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
    methodVisitor.visitVarInsn(ILOAD, 3);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Field;I)Larb/Field;", false);
    methodVisitor.visitInsn(POP);
    methodVisitor.visitLabel(label2);
    methodVisitor.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "endIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "compareTo", "(Larb/Integer;)I", false);
    methodVisitor.visitJumpInsn(IFLE, label3);
    Label label4 = new Label();
    methodVisitor.visitLabel(label4);
    methodVisitor.visitVarInsn(ALOAD, RESULT_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitInsn(ARETURN);
    Label endLabel = new Label();
    methodVisitor.visitLabel(endLabel);
    methodVisitor.visitLocalVariable("this", "Larb/functions/real/Product;", null, beginLabel, endLabel, 0);
    methodVisitor.visitLocalVariable("t", "Ljava/lang/Void;", null, beginLabel, endLabel, 1);
    methodVisitor.visitLocalVariable("order", "I", null, beginLabel, endLabel, 2);
    methodVisitor.visitLocalVariable("bits", "I", null, beginLabel, endLabel, 3);
    methodVisitor.visitLocalVariable("product",
                                     "Larb/Real;",
                                     null,
                                     beginLabel,
                                     endLabel,
                                     RESULT_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitMaxs(5, 5);
    methodVisitor.visitEnd();
  }

  private void generateSyntheticBridgeMethod(ClassVisitor ClassVisitor)
  {
    MethodVisitor methodVisitor;
    methodVisitor = ClassVisitor.visitMethod(ACC_PUBLIC | ACC_BRIDGE | ACC_SYNTHETIC,
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
    methodVisitor.visitTypeInsn(CHECKCAST, "java/lang/Void");
    methodVisitor.visitVarInsn(ILOAD, 2);
    methodVisitor.visitVarInsn(ILOAD, 3);
    methodVisitor.visitVarInsn(ALOAD, RESULT_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitTypeInsn(CHECKCAST, "arb/Real");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                  "arb/functions/real/Product",
                                  "evaluate",
                                  "(Ljava/lang/Void;IILarb/Real;)Larb/Real;",
                                  false);
    methodVisitor.visitInsn(ARETURN);
    methodVisitor.visitMaxs(5, 5);
    methodVisitor.visitEnd();
  }

  private void generateCloseMethod()
  {
    MethodVisitor methodVisitor;
    methodVisitor = classVisitor.visitMethod(ACC_PUBLIC, "close", "()V", null, null);
    methodVisitor.visitCode();
    Label label0 = new Label();
    methodVisitor.visitLabel(label0);
    methodVisitor.visitLineNumber(14, label0);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    Label label1 = new Label();
    methodVisitor.visitLabel(label1);
    methodVisitor.visitLineNumber(15, label1);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "value", "Larb/Real;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "close", "()V", false);
    Label label2 = new Label();
    methodVisitor.visitLabel(label2);
    methodVisitor.visitLineNumber(16, label2);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "startIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    Label label3 = new Label();
    methodVisitor.visitLabel(label3);
    methodVisitor.visitLineNumber(17, label3);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitFieldInsn(GETFIELD, "arb/functions/real/Product", "endIndex", "Larb/Integer;");
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "close", "()V", false);
    Label label4 = new Label();
    methodVisitor.visitLabel(label4);
    methodVisitor.visitLineNumber(18, label4);
    methodVisitor.visitInsn(RETURN);
    Label label5 = new Label();
    methodVisitor.visitLabel(label5);
    methodVisitor.visitLocalVariable("this", "Larb/functions/real/Product;", null, label0, label5, 0);
    methodVisitor.visitMaxs(1, 1);
    methodVisitor.visitEnd();
  }

  private void initializeFieldValues()
  {
    MethodVisitor methodVisitor;
    methodVisitor = classVisitor.visitMethod(ACC_PUBLIC, "<init>", "()V", null, null);
    methodVisitor.visitCode();
    Label label0 = new Label();
    methodVisitor.visitLabel(label0);
    methodVisitor.visitLineNumber(7, label0);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "java/lang/Object", "<init>", "()V", false);
    Label label1 = new Label();
    methodVisitor.visitLabel(label1);
    methodVisitor.visitLineNumber(21, label1);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "startIndex", "Larb/Integer;");
    Label label2 = new Label();
    methodVisitor.visitLabel(label2);
    methodVisitor.visitLineNumber(22, label2);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "endIndex", "Larb/Integer;");
    Label label3 = new Label();
    methodVisitor.visitLabel(label3);
    methodVisitor.visitLineNumber(24, label3);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Integer");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Integer", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "index", "Larb/Integer;");
    Label label4 = new Label();
    methodVisitor.visitLabel(label4);
    methodVisitor.visitLineNumber(25, label4);
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, "arb/Real");
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, "arb/Real", "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, "arb/functions/real/Product", "value", "Larb/Real;");
    Label label5 = new Label();
    methodVisitor.visitLabel(label5);
    methodVisitor.visitLineNumber(7, label5);
    methodVisitor.visitInsn(RETURN);
    Label label6 = new Label();
    methodVisitor.visitLabel(label6);
    methodVisitor.visitLocalVariable("this", "Larb/functions/real/Product;", null, label0, label6, 0);
    methodVisitor.visitMaxs(3, 1);
    methodVisitor.visitEnd();
  }

  private void declareFields()
  {
    FieldVisitor fieldVisitor;
    {
      fieldVisitor = classVisitor.visitField(0,
                                             "factor",
                                             "Larb/functions/Function;",
                                             "Larb/functions/Function<Larb/Integer;Larb/Real;>;",
                                             null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classVisitor.visitField(ACC_FINAL, "startIndex", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classVisitor.visitField(ACC_FINAL, "endIndex", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classVisitor.visitField(ACC_FINAL, "index", "Larb/Integer;", null, null);
      fieldVisitor.visitEnd();
    }
    {
      fieldVisitor = classVisitor.visitField(ACC_FINAL, "value", "Larb/Real;", null, null);
      fieldVisitor.visitEnd();
    }
  }

}
