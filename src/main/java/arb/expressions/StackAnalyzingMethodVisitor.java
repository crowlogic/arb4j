package arb.expressions;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.commons.AnalyzerAdapter;

public class StackAnalyzingMethodVisitor extends
                                          AnalyzerAdapter
{

  public StackAnalyzingMethodVisitor(String owner, int access, String name, String desc, MethodVisitor mv)
  {
    super(Opcodes.ASM9,
          owner,
          access,
          name,
          desc,
          mv);
  }

  @Override
  public void visitFrame(int type, int nLocal, Object[] local, int nStack, Object[] stack)
  {
    mv.visitFrame(type, nLocal, local, nStack, stack);
    // Skip the analyzer
  }

}
