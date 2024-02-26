package arb.expressions;

import java.util.List;

import org.objectweb.asm.Handle;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.commons.AnalyzerAdapter;
import org.objectweb.asm.util.Textifier;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Like {@link Textifier} but also includes stack information from the
 * {@link StackAnalyzingMethodVisitor} which is a version of the
 * {@link AnalyzerAdapter} that doesn't require the expanded frames option
 * (which apparently degrades performance)
 * 
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class StackTrackingTextifier extends
                                    Textifier
{

  public StackTrackingTextifier(StackAnalyzingMethodVisitor analyzer)
  {
    super();
    this.analyzer = analyzer;
  }

  public StackTrackingTextifier()
  {
    super(Opcodes.ASM9);
  }

  @Override
  public void visitInsn(int opcode)
  {
    super.visitInsn(opcode);
    appendStackInfo();
  }

  @Override
  public void visitIntInsn(int opcode, int operand)
  {
    super.visitIntInsn(opcode, operand);
    appendStackInfo();
  }

  @Override
  public void visitVarInsn(int opcode, int var)
  {
    super.visitVarInsn(opcode, var);
    appendStackInfo();
  }

  @Override
  public void visitTypeInsn(int opcode, String type)
  {
    super.visitTypeInsn(opcode, type);
    appendStackInfo();
  }

  @Override
  public void visitFieldInsn(int opcode, String owner, String name, String descriptor)
  {
    super.visitFieldInsn(opcode, owner, name, descriptor);
    appendStackInfo();
  }

  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor, boolean isInterface)
  {
    super.visitMethodInsn(opcode, owner, name, descriptor, isInterface);
    appendStackInfo();
  }

  @Override
  public void visitInvokeDynamicInsn(String name,
                                     String descriptor,
                                     Handle bootstrapMethodHandle,
                                     Object... bootstrapMethodArguments)
  {
    super.visitInvokeDynamicInsn(name, descriptor, bootstrapMethodHandle, bootstrapMethodArguments);
    appendStackInfo();
  }

  @Override
  public void visitJumpInsn(int opcode, org.objectweb.asm.Label label)
  {
    super.visitJumpInsn(opcode, label);
    appendStackInfo();
  }

  @Override
  public void visitLdcInsn(Object value)
  {
    super.visitLdcInsn(value);
    appendStackInfo();
  }

  @Override
  public void visitIincInsn(int var, int increment)
  {
    super.visitIincInsn(var, increment);
    appendStackInfo();
  }

  @Override
  public void visitTableSwitchInsn(int min, int max, org.objectweb.asm.Label dflt, org.objectweb.asm.Label... labels)
  {
    super.visitTableSwitchInsn(min, max, dflt, labels);
    appendStackInfo();
  }

  @Override
  public void visitLookupSwitchInsn(org.objectweb.asm.Label dflt, int[] keys, org.objectweb.asm.Label[] labels)
  {
    super.visitLookupSwitchInsn(dflt, keys, labels);
    appendStackInfo();
  }

  @Override
  public void visitMultiANewArrayInsn(String descriptor, int numDimensions)
  {
    super.visitMultiANewArrayInsn(descriptor, numDimensions);
    appendStackInfo();
  }

  private void appendStackInfo()
  {
    List<Object> stack = getStack();
    if (stack != null && !stack.isEmpty())
    {
      for (Object item : stack)
      {
        System.out.print("// Stack: ");
        System.out.print(item.toString());
        System.out.println();
      }
    }
  }

  StackAnalyzingMethodVisitor analyzer;

  private List<Object> getStack()
  {
    return analyzer.stack;
  }
}
