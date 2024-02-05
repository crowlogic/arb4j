package arb.expressions.nodes.nary;

import static java.lang.System.out;

import java.util.HashMap;

import org.objectweb.asm.MethodVisitor;

public final class MethodVisitInterceptor extends
                                          MethodVisitor
{

  @Override
  public void visitVarInsn(int opcode, int varIndex)
  {
    out.format("visitVarInsn(opcode=%s, varIndex=%s)\n", reverse(opcode), varIndex);
    super.visitVarInsn(opcode, varIndex);
  }

  private HashMap<Integer, String> reverseOpcodes = new HashMap<>();

  {
    reverseOpcodes.put(Integer.valueOf(87), "POP");
    reverseOpcodes.put(Integer.valueOf(25), "ALOAD");

    reverseOpcodes.put(Integer.valueOf(185), "INVOKEINTERFACE");
    reverseOpcodes.put(Integer.valueOf(182), "INVOKEVIRTUAL");
    reverseOpcodes.put(Integer.valueOf(180), "GETFIELD");

  }

  public String reverse(int opcode)
  {
    String str = reverseOpcodes.get(opcode);
    if (str != null)
    {
      return str;
    }
    else
    {
      return String.format("%d", opcode);
    }
  }

  MethodVisitInterceptor(int api, MethodVisitor methodVisitor)
  {
    super(api,
          methodVisitor);
  }

  @Override
  public void visitInsn(int opcode)
  {
    out.format("visitInsn(opcode=%s)\n", reverse(opcode));
    super.visitInsn(opcode);
  }

  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor)
  {
    out.format("visitMethodInsn(opcode=%s, owner=%s, name=%s. descriptor=%s)\n",
               reverse(opcode),
               owner,
               name,
               descriptor);
    super.visitMethodInsn(opcode, owner, name, descriptor);
  }

  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor, boolean isInterface)
  {
    out.format("visitMethodInsn(opcode=%s, owner=%s, name=%s. descriptor=%s, isInterface=%s)\n",
               reverse(opcode),
               owner,
               name,
               descriptor,
               isInterface);

    super.visitMethodInsn(opcode, owner, name, descriptor, isInterface);
  }

  @Override
  public void visitFieldInsn(int opcode, String owner, String name, String descriptor)
  {
    out.format("Product..visitField(opcode=%s, owner=%s, name=%s, descriptor=%s)\n",
               reverse(opcode),
               owner,
               name,
               descriptor);
    out.flush();
    super.visitFieldInsn(opcode, owner, name, descriptor);
  }
}