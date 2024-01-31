package arb.functions.real;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

public class ProductGenerator implements
                              Opcodes
{
  private static final int    THIS_LOCAL_VARIABLE_INDEX           = 0;
  private static final int    DUMMY_VARIABLE_LOCAL_VARIABLE_INDEX = 1;
  private static final int    ORDER_LOCAL_VARIABLE_INDEX          = 2;
  private static final int    BITS_LOCAL_VARIABLE_INDEX           = 3;
  private static final int    RESULT_LOCAL_VARIABLE_INDEX         = 4;
  private static final int    INDEX_LOCAL_VARIABLE_INDEX          = 5;

  private static final String INTERNAL_CLASSNAME                  = "arb/functions/real/Product";

  Label                       beginLabel                          = new Label();
  Label                       endLoopIndex                        = new Label();
  Label                       beginLoopLabel                      = new Label();
  Label                       endLabel                            = new Label();

  public byte[] dump(ClassWriter classWriter) throws Exception
  {
    MethodVisitor mv = classWriter.visitMethod(ACC_PUBLIC,
                                                          "evaluate",
                                                          "(Ljava/lang/Void;IILarb/Real;)Larb/Real;",
                                                          null,
                                                          null);
    mv.visitCode();

    initializeProductToTheIdentity(mv);
    loadThis(mv);
    mv.visitFieldInsn(GETFIELD, INTERNAL_CLASSNAME, "startIndex", "I");
    mv.visitVarInsn(ISTORE, INDEX_LOCAL_VARIABLE_INDEX);
    mv.visitJumpInsn(GOTO, endLoopIndex);
    mv.visitLabel(beginLoopLabel);
    mv.visitFrame(Opcodes.F_APPEND, 1, new Object[]
    { Opcodes.INTEGER }, 0, null);
    loadResult(mv);

    getField(loadThis(mv), "factor", "Larb/functions/Function;");

    getField(loadThis(mv), "index", "Larb/Integer;");
    getLocalVariable(mv, INDEX_LOCAL_VARIABLE_INDEX);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(I)Larb/Integer;", false);

    getLocalVariable(mv, BITS_LOCAL_VARIABLE_INDEX);
    getField(loadThis(mv), "value", "Larb/Real;");
    mv.visitMethodInsn(INVOKEINTERFACE,
                                  "arb/functions/Function",
                                  "evaluate",
                                  "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                                  true);
    mv.visitTypeInsn(CHECKCAST, "arb/Real");
    mv.visitVarInsn(ILOAD, BITS_LOCAL_VARIABLE_INDEX);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Field;I)Larb/Field;", false);
    mv.visitInsn(POP);
    incrementIndexVariable(mv);
    mv.visitLabel(endLoopIndex);
    mv.visitFrame(Opcodes.F_SAME, 0, null, 0, null);
    mv.visitVarInsn(ILOAD, INDEX_LOCAL_VARIABLE_INDEX);

    getField(loadThis(mv), "endIndex", "I");
    mv.visitFieldInsn(GETFIELD, INTERNAL_CLASSNAME, "endIndex", "I");
    mv.visitJumpInsn(IF_ICMPLE, beginLoopLabel);
    loadResult(mv);
    mv.visitInsn(ARETURN);
    mv.visitLabel(endLabel);

    defineLocalVariables(mv);
    mv.visitEnd();

    return classWriter.toByteArray();
  }

  private void getLocalVariable(MethodVisitor methodVisitor, int localVariableIndex)
  {
    methodVisitor.visitVarInsn(ILOAD, localVariableIndex);
  }

  private void defineLocalVariables(MethodVisitor methodVisitor)
  {
    methodVisitor.visitLocalVariable("this",
                                     "Larb/functions/real/Product;",
                                     null,
                                     beginLabel,
                                     endLabel,
                                     THIS_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitLocalVariable("t",
                                     "Ljava/lang/Void;",
                                     null,
                                     beginLabel,
                                     endLabel,
                                     DUMMY_VARIABLE_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitLocalVariable("order", "I", null, beginLabel, endLabel, ORDER_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitLocalVariable("bits", "I", null, beginLabel, endLabel, BITS_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitLocalVariable("product",
                                     "Larb/Real;",
                                     null,
                                     beginLabel,
                                     endLabel,
                                     RESULT_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitLocalVariable("k", "I", null, beginLabel, endLabel, INDEX_LOCAL_VARIABLE_INDEX);
    methodVisitor.visitMaxs(5, 6);
  }

  private void initializeProductToTheIdentity(MethodVisitor methodVisitor)
  {
    loadResult(methodVisitor);
    methodVisitor.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "one", "()Larb/Real;", false);
    methodVisitor.visitInsn(POP);
  }

  private void incrementIndexVariable(MethodVisitor methodVisitor)
  {
    methodVisitor.visitIincInsn(INDEX_LOCAL_VARIABLE_INDEX, 1);
  }

  private void getField(MethodVisitor methodVisitor, String field, String sig)
  {
    methodVisitor.visitFieldInsn(GETFIELD, INTERNAL_CLASSNAME, field, sig);
  }

  private MethodVisitor loadThis(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    return methodVisitor;
  }

  private void loadResult(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, RESULT_LOCAL_VARIABLE_INDEX);
  }
}