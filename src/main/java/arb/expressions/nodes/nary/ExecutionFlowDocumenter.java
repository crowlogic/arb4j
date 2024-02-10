package arb.expressions.nodes.nary;

import static java.lang.System.out;

import java.util.HashMap;

import org.objectweb.asm.AnnotationVisitor;
import org.objectweb.asm.Attribute;
import org.objectweb.asm.Handle;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.TypePath;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * TODO: modify this so that it generates latex formatted file that also
 * includes the stack if the analyzer ever gets fixed , possibly use jatex for
 * generation
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExecutionFlowDocumenter extends
                                     MethodVisitor
{
  public static HashMap<Integer, String> opcodes = new HashMap<>();

  {
    opcodes.put(Integer.valueOf(87), "POP");
    opcodes.put(Integer.valueOf(25), "ALOAD");
    opcodes.put(Integer.valueOf(185), "INVOKEINTERFACE");
    opcodes.put(Integer.valueOf(182), "INVOKEVIRTUAL");
    opcodes.put(Integer.valueOf(180), "GETFIELD");
  }

  ExecutionFlowDocumenter(int api, MethodVisitor methodVisitor)
  {
    super(api,
          methodVisitor);
  }

  @Override
  public void visitParameter(String name, int access)
  {
    out.format("visitParameter(name=%s, access=%s)\n", name, access);
    super.visitParameter(name, access);
  }

  @Override
  public AnnotationVisitor visitAnnotationDefault()
  {
    out.println("visitAnnotationDefault()");
    return super.visitAnnotationDefault();
  }

  @Override
  public AnnotationVisitor visitAnnotation(String descriptor, boolean visible)
  {
    out.format("visitAnnotation(descriptor=%s, visible=%s)\n", descriptor, visible);
    return super.visitAnnotation(descriptor, visible);
  }

  @Override
  public AnnotationVisitor visitTypeAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    out.format("visitTypeAnnotation(typeRef=%d, typePath=%s, descriptor=%s, visible=%s)\n",
               typeRef,
               typePath,
               descriptor,
               visible);
    return super.visitTypeAnnotation(typeRef, typePath, descriptor, visible);
  }

  @Override
  public void visitAnnotableParameterCount(int parameterCount, boolean visible)
  {
    out.format("visitAnnotableParameterCount(parameterCount=%d, visible=%s)\n", parameterCount, visible);
    super.visitAnnotableParameterCount(parameterCount, visible);
  }

  @Override
  public AnnotationVisitor visitParameterAnnotation(int parameter, String descriptor, boolean visible)
  {
    out.format("visitParameterAnnotation(parameter=%d, descriptor=%s, visible=%s)\n",
               parameter,
               descriptor,
               visible);
    return super.visitParameterAnnotation(parameter, descriptor, visible);
  }

  @Override
  public void visitAttribute(Attribute attribute)
  {
    out.format("visitAttribute(attribute=%s)\n", attribute);
    super.visitAttribute(attribute);
  }

  @Override
  public void visitCode()
  {
    out.println("visitCode()");
    super.visitCode();
  }

  @Override
  public void visitFrame(int type, int numLocal, Object[] local, int numStack, Object[] stack)
  {
    out.format("visitFrame(type=%d, numLocal=%d, local=%s, numStack=%d, stack=%s)\n",
               type,
               numLocal,
               local,
               numStack,
               stack);
    super.visitFrame(type, numLocal, local, numStack, stack);
  }

  @Override
  public void visitIntInsn(int opcode, int operand)
  {
    out.format("visitIntInsn(opcode=%s, operand=%d)\n", getHumanReadableOpcode(opcode), operand);
    super.visitIntInsn(opcode, operand);
  }

  @Override
  public void visitTypeInsn(int opcode, String type)
  {
    out.format("visitTypeInsn(opcode=%s, type=%s)\n", getHumanReadableOpcode(opcode), type);
    super.visitTypeInsn(opcode, type);
  }

  @Override
  public void visitInvokeDynamicInsn(String name,
                                     String descriptor,
                                     Handle bootstrapMethodHandle,
                                     Object... bootstrapMethodArguments)
  {
    out.format("visitInvokeDynamicInsn(name=%s, descriptor=%s, bootstrapMethodHandle=%s, bootstrapMethodArguments=%s)\n",
               name,
               descriptor,
               bootstrapMethodHandle,
               bootstrapMethodArguments);
    super.visitInvokeDynamicInsn(name, descriptor, bootstrapMethodHandle, bootstrapMethodArguments);
  }

  @Override
  public void visitJumpInsn(int opcode, Label label)
  {
    out.format("visitJumpInsn(opcode=%s, label=%s)\n", getHumanReadableOpcode(opcode), label);
    super.visitJumpInsn(opcode, label);
  }

  @Override
  public void visitLabel(Label label)
  {
    out.format("visitLabel(label=%s)\n", label);
    super.visitLabel(label);
  }

  @Override
  public void visitLdcInsn(Object value)
  {
    out.format("visitLdcInsn(value=%s)\n", value);
    super.visitLdcInsn(value);
  }

  @Override
  public void visitIincInsn(int varIndex, int increment)
  {
    out.format("visitIincInsn(varIndex=%d, increment=%d)\n", varIndex, increment);
    super.visitIincInsn(varIndex, increment);
  }

  @Override
  public void visitTableSwitchInsn(int min, int max, Label dflt, Label... labels)
  {
    out.format("visitTableSwitchInsn(min=%d, max=%d, dflt=%s, labels=%s)\n", min, max, dflt, labels);
    super.visitTableSwitchInsn(min, max, dflt, labels);
  }

  @Override
  public void visitLookupSwitchInsn(Label dflt, int[] keys, Label[] labels)
  {
    out.format("visitLookupSwitchInsn(dflt=%s, keys=%s, labels=%s)\n", dflt, keys, labels);
    super.visitLookupSwitchInsn(dflt, keys, labels);
  }

  @Override
  public void visitMultiANewArrayInsn(String descriptor, int numDimensions)
  {
    out.format("visitMultiANewArrayInsn(descriptor=%s, numDimensions=%d)\n", descriptor, numDimensions);
    super.visitMultiANewArrayInsn(descriptor, numDimensions);
  }

  @Override
  public AnnotationVisitor visitInsnAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    out.format("visitInsnAnnotation(typeRef=%d, typePath=%s, descriptor=%s, visible=%s)\n",
               typeRef,
               typePath,
               descriptor,
               visible);
    return super.visitInsnAnnotation(typeRef, typePath, descriptor, visible);
  }

  @Override
  public void visitTryCatchBlock(Label start, Label end, Label handler, String type)
  {
    out.format("visitTryCatchBlock(start=%s, end=%s, handler=%s, type=%s)\n", start, end, handler, type);
    super.visitTryCatchBlock(start, end, handler, type);
  }

  @Override
  public AnnotationVisitor
         visitTryCatchAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    out.format("visitTryCatchAnnotation(typeRef=%d, typePath=%s, descriptor=%s, visible=%s)\n",
               typeRef,
               typePath,
               descriptor,
               visible);
    return super.visitTryCatchAnnotation(typeRef, typePath, descriptor, visible);
  }

  @Override
  public void visitLocalVariable(String name, String descriptor, String signature, Label start, Label end, int index)
  {
    out.format("visitLocalVariable(name=%s, descriptor=%s, signature=%s, start=%s, end=%s, index=%d)\n",
               name,
               descriptor,
               signature,
               start,
               end,
               index);
    super.visitLocalVariable(name, descriptor, signature, start, end, index);
  }

  @Override
  public AnnotationVisitor visitLocalVariableAnnotation(int typeRef,
                                                        TypePath typePath,
                                                        Label[] start,
                                                        Label[] end,
                                                        int[] index,
                                                        String descriptor,
                                                        boolean visible)
  {
    out.format("visitLocalVariableAnnotation(typeRef=%d, typePath=%s, start=%s, end=%s, index=%s, descriptor=%s, visible=%s)\n",
               typeRef,
               typePath,
               start,
               end,
               index,
               descriptor,
               visible);
    return super.visitLocalVariableAnnotation(typeRef, typePath, start, end, index, descriptor, visible);
  }

  @Override
  public void visitLineNumber(int line, Label start)
  {
    out.format("visitLineNumber(line=%d, start=%s)\n", line, start);
    super.visitLineNumber(line, start);
  }

  @Override
  public void visitMaxs(int maxStack, int maxLocals)
  {
    out.format("visitMaxs(maxStack=%d, maxLocals=%d)\n", maxStack, maxLocals);
    super.visitMaxs(maxStack, maxLocals);
  }

  @Override
  public void visitEnd()
  {
    out.println("visitEnd()");
    super.visitEnd();
  }

  @Override
  public void visitVarInsn(int opcode, int varIndex)
  {
    out.format("visitVarInsn(opcode=%s, varIndex=%s)\n", getHumanReadableOpcode(opcode), varIndex);
    super.visitVarInsn(opcode, varIndex);
  }

  @Override
  public void visitInsn(int opcode)
  {
    out.format("visitInsn(opcode=%s)\n", getHumanReadableOpcode(opcode));
    super.visitInsn(opcode);
  }

  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor)
  {
    out.format("visitMethodInsn(opcode=%s, owner=%s, name=%s, descriptor=%s)\n",
               getHumanReadableOpcode(opcode),
               owner,
               name,
               descriptor);
    super.visitMethodInsn(opcode, owner, name, descriptor);
  }

  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor, boolean isInterface)
  {
    out.format("visitMethodInsn(opcode=%s, owner=%s, name=%s, descriptor=%s, isInterface=%s)\n",
               getHumanReadableOpcode(opcode),
               owner,
               name,
               descriptor,
               isInterface);
    super.visitMethodInsn(opcode, owner, name, descriptor, isInterface);
  }

  @Override
  public void visitFieldInsn(int opcode, String owner, String name, String descriptor)
  {
    out.format("visitFieldInsn(opcode=%s, owner=%s, name=%s, descriptor=%s)\n",
               getHumanReadableOpcode(opcode),
               owner,
               name,
               descriptor);
    super.visitFieldInsn(opcode, owner, name, descriptor);
  }

  public static String getHumanReadableOpcode(int opcode)
  {
    String str = opcodes.get(opcode);
    if (str != null)
    {
      return str;
    }
    else
    {
      return String.format("%d(0x%x)", opcode, opcode);
    }
  }
}
