package arb.expressions;

import java.util.ArrayList;
import java.util.List;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.commons.AnalyzerAdapter;

public class StackTrackingMethodVisitor extends
                                         AnalyzerAdapter
{

  public StackTrackingMethodVisitor(String owner, int access, String name, String desc, MethodVisitor mv)
  {
    super(Opcodes.ASM9,
          owner,
          access,
          name,
          desc,
          mv);
  }

  private static void visitFrameTypes(final int numTypes, final Object[] frameTypes, final List<Object> result)
  {
    for (int i = 0; i < numTypes; ++i)
    {
      Object frameType = frameTypes[i];
      result.add(frameType);
      if (frameType == Opcodes.LONG || frameType == Opcodes.DOUBLE)
      {
        result.add(Opcodes.TOP);
      }
    }
  }

  @Override
  public void visitFrame(final int type,
                         final int numLocal,
                         final Object[] local,
                         final int numStack,
                         final Object[] stack)
  {

    mv.visitFrame(type, numLocal, local, numStack, stack);

    if (type == Opcodes.F_NEW || type == Opcodes.F_FULL)
    {
      if (this.locals != null)
      {
        this.locals.clear();
        this.stack.clear();
      }
      else
      {
        this.locals = new ArrayList<>();
        this.stack  = new ArrayList<>();
      }
      visitFrameTypes(numLocal, local, this.locals);
      visitFrameTypes(numStack, stack, this.stack);
    }
    else if (type == Opcodes.F_SAME)
    {
      // For SAME, keep the locals unchanged and ensure the stack is clear
      if (this.stack != null)
      {
        this.stack.clear();
      }
      else
      {
        this.stack = new ArrayList<>();
      }
    }
    else if (type == Opcodes.F_SAME1)
    {
      // For SAME1, keep the locals unchanged and adjust the stack to have one entry
      if (this.stack != null)
      {
        this.stack.clear();
      }
      else
      {
        this.stack = new ArrayList<>();
      }
      // Ensure that stack is adjusted for one entry
      if (numStack == 1 && stack != null && stack.length > 0)
      {
        visitFrameTypes(numStack, stack, this.stack);
      }
    }
    else
    {
      assert false : "handle frameType=" + type;
    }
  }

}
