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

  public void  generateProductMethod(MethodVisitor mv)
  {


    initializeProductToIdentity(mv);
    setupLoop(mv);

    Label loopStart = new Label();
    Label loopEnd   = new Label();

    mv.visitJumpInsn(GOTO, loopEnd);
    mv.visitLabel(loopStart);

    multiplyProductWithFactor(mv);

    incrementIndexVariable(mv);

    mv.visitLabel(loopEnd);
    mv.visitVarInsn(ILOAD, INDEX_LOCAL_VARIABLE_INDEX);
    loadField(mv, "endIndex", "I");
    mv.visitJumpInsn(IF_ICMPLE, loopStart);

    loadResult(mv);
    mv.visitInsn(ARETURN);

    defineLocalVariables(mv);
    mv.visitMaxs(5, 6); // Update stack and local variables size if needed
    mv.visitEnd();

  }

  private void initializeProductToIdentity(MethodVisitor mv)
  {
    loadResult(mv);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "one", "()Larb/Real;", false);
    mv.visitInsn(POP);
  }

  private void setupLoop(MethodVisitor mv)
  {
    mv.visitVarInsn(ALOAD, 0);
    loadField(mv, "startIndex", "I");
    mv.visitVarInsn(ISTORE, INDEX_LOCAL_VARIABLE_INDEX);
  }

  private void multiplyProductWithFactor(MethodVisitor mv)
  {
    loadField(mv, "factor", "Larb/functions/Function;");
    loadField(mv, "index", "Larb/Integer;");
    mv.visitVarInsn(ILOAD, INDEX_LOCAL_VARIABLE_INDEX);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Integer", "set", "(I)Larb/Integer;", false);
    mv.visitVarInsn(ILOAD, BITS_LOCAL_VARIABLE_INDEX);
    loadField(mv, "value", "Larb/Real;");
    mv.visitMethodInsn(INVOKEINTERFACE,
                       "arb/functions/Function",
                       "evaluate",
                       "(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;",
                       true);
    mv.visitTypeInsn(CHECKCAST, "arb/Real");
    mv.visitVarInsn(ILOAD, BITS_LOCAL_VARIABLE_INDEX);
    mv.visitMethodInsn(INVOKEVIRTUAL, "arb/Real", "mul", "(Larb/Field;I)Larb/Field;", false);
    mv.visitInsn(POP);
  }

  private void incrementIndexVariable(MethodVisitor mv)
  {
    mv.visitIincInsn(INDEX_LOCAL_VARIABLE_INDEX, 1);
  }

  private void loadField(MethodVisitor mv, String fieldName, String descriptor)
  {
    mv.visitVarInsn(ALOAD, 0);
    mv.visitFieldInsn(GETFIELD, INTERNAL_CLASSNAME, fieldName, descriptor);
  }

  private void loadResult(MethodVisitor mv)
  {
    mv.visitVarInsn(ALOAD, RESULT_LOCAL_VARIABLE_INDEX);
  }

  private void defineLocalVariables(MethodVisitor mv)
  {
    mv.visitLocalVariable("this",
                          "Larb/functions/real/Product;",
                          null,
                          beginLabel,
                          endLabel,
                          THIS_LOCAL_VARIABLE_INDEX);
    mv.visitLocalVariable("t", "Ljava/lang/Void;", null, beginLabel, endLabel, DUMMY_VARIABLE_LOCAL_VARIABLE_INDEX);
    mv.visitLocalVariable("order", "I", null, beginLabel, endLabel, ORDER_LOCAL_VARIABLE_INDEX);
    mv.visitLocalVariable("bits", "I", null, beginLabel, endLabel, BITS_LOCAL_VARIABLE_INDEX);
    mv.visitLocalVariable("product", "Larb/Real;", null, beginLabel, endLabel, RESULT_LOCAL_VARIABLE_INDEX);
    mv.visitLocalVariable("k", "I", null, beginLabel, endLabel, INDEX_LOCAL_VARIABLE_INDEX);
  }
}
