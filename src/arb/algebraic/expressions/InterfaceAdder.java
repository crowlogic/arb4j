package arb.algebraic.expressions;

import static org.objectweb.asm.Opcodes.ASM4;
import static org.objectweb.asm.Opcodes.V1_5;

import org.objectweb.asm.ClassVisitor;

public class InterfaceAdder extends
                                 ClassVisitor
{

  public InterfaceAdder(ClassVisitor cv)
  {
    super(ASM4,
          cv);
  }

  @Override
  public void visit(int version, int access, String name, String signature, String superName, String[] interfaces)
  {
    String[] holding = new String[interfaces.length + 1];
    holding[holding.length - 1] = CustomClassWriter.CLONEABLE;
    System.arraycopy(interfaces, 0, holding, 0, interfaces.length);

    cv.visit(V1_5, access, name, signature, superName, holding);
  }

}