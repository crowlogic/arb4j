package arb.expressions;

import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.ACC_STATIC;
import static org.objectweb.asm.Opcodes.GOTO;
import static org.objectweb.asm.Opcodes.ILOAD;
import static org.objectweb.asm.Opcodes.RETURN;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;

public class SwitchExample
{
  public static void main(String[] args) throws Exception
  {
    ClassWriter   cw      = new ClassWriter(0);
    // Omitted: class definition code

    // Method for TableSwitchInsnNode example
    MethodVisitor mvTable = cw.visitMethod(ACC_PUBLIC + ACC_STATIC, "testTableSwitch", "(I)V", null, null);
    createTableSwitch(mvTable);

    // Method for LookupSwitchInsnNode example
    MethodVisitor mvLookup = cw.visitMethod(ACC_PUBLIC + ACC_STATIC, "testLookupSwitch", "(I)V", null, null);
    createLookupSwitch(mvLookup);

    // Omitted: class finalization and saving
  }

  private static void createTableSwitch(MethodVisitor mv)
  {
    mv.visitCode();
    try
    {
      Label   endSwitch    = new Label();
      Label   defaultLabel = new Label();
      Label[] labels       = new Label[]
      { new Label(), new Label(), new Label() };

      mv.visitVarInsn(ILOAD, 0);
      mv.visitTableSwitchInsn(1, 3, defaultLabel, labels);

      for (int i = 0; i < labels.length; i++)
      {
        mv.visitLabel(labels[i]);
        // Your case code goes here
        mv.visitJumpInsn(GOTO, endSwitch);
      }

      mv.visitLabel(defaultLabel);
      // Your default case code goes here

      mv.visitLabel(endSwitch);
      mv.visitInsn(RETURN);
      mv.visitMaxs(3, 1);
    }
    finally
    {
      mv.visitEnd();
    }
  }

  private static void createLookupSwitch(MethodVisitor mv)
  {
    mv.visitCode();
    Label   endSwitch    = new Label();
    Label   defaultLabel = new Label();
    int[]   keys         =
    { 10, 20, 30 };
    Label[] labels       = new Label[]
    { new Label(), new Label(), new Label() };

    mv.visitVarInsn(ILOAD, 0);
    mv.visitLookupSwitchInsn(defaultLabel, keys, labels);

    for (int i = 0; i < labels.length; i++)
    {
      mv.visitLabel(labels[i]);
      // Your case code goes here
      mv.visitJumpInsn(GOTO, endSwitch);
    }

    mv.visitLabel(defaultLabel);
    // Your default case code goes here

    mv.visitLabel(endSwitch);
    mv.visitInsn(RETURN);
    mv.visitMaxs(3, 1);
    mv.visitEnd();
  }
}
