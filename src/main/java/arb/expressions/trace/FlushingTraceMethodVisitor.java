package arb.expressions.trace;

import org.objectweb.asm.AnnotationVisitor;
import org.objectweb.asm.Attribute;
import org.objectweb.asm.Handle;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.TypePath;

public final class FlushingTraceMethodVisitor extends
                                              MethodVisitor
{

  @Override
  public AnnotationVisitor visitAnnotation(String descriptor, boolean visible)
  {
    AnnotationVisitor av = super.visitAnnotation(descriptor, visible);
    flush();
    return av;
  }

  @Override
  public AnnotationVisitor visitTypeAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    AnnotationVisitor av = super.visitTypeAnnotation(typeRef, typePath, descriptor, visible);
    flush();
    return av;
  }

  @Override
  public void visitAnnotableParameterCount(int parameterCount, boolean visible)
  {
    super.visitAnnotableParameterCount(parameterCount, visible);
    flush();
  }

  @Override
  public AnnotationVisitor visitParameterAnnotation(int parameter, String descriptor, boolean visible)
  {
    AnnotationVisitor av = super.visitParameterAnnotation(parameter, descriptor, visible);
    flush();
    return av;
  }

  @Override
  public void visitAttribute(Attribute attribute)
  {
    super.visitAttribute(attribute);
    flush();
  }

  @Override
  public void visitCode()
  {
    super.visitCode();
    flush();
  }

  @Override
  public void visitFrame(int type, int numLocal, Object[] local, int numStack, Object[] stack)
  {
    super.visitFrame(type, numLocal, local, numStack, stack);
    flush();
  }

  @SuppressWarnings("deprecation")
  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor)
  {
    super.visitMethodInsn(opcode, owner, name, descriptor);
    flush();
  }

  @Override
  public AnnotationVisitor visitInsnAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    AnnotationVisitor av = super.visitInsnAnnotation(typeRef, typePath, descriptor, visible);
    flush();
    return av;
  }

  @Override
  public void visitTryCatchBlock(Label start, Label end, Label handler, String type)
  {
    super.visitTryCatchBlock(start, end, handler, type);
    flush();
  }

  @Override
  public AnnotationVisitor
         visitTryCatchAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    AnnotationVisitor av = super.visitTryCatchAnnotation(typeRef, typePath, descriptor, visible);
    flush();
    return av;
  }

  @Override
  public void visitLocalVariable(String name, String descriptor, String signature, Label start, Label end, int index)
  {
    super.visitLocalVariable(name, descriptor, signature, start, end, index);
    flush();
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
    AnnotationVisitor visitLocalVariableAnnotation = super.visitLocalVariableAnnotation(typeRef,
                                                                                        typePath,
                                                                                        start,
                                                                                        end,
                                                                                        index,
                                                                                        descriptor,
                                                                                        visible);
    flush();
    return visitLocalVariableAnnotation;

  }

  @Override
  public void visitLineNumber(int line, Label start)
  {
    super.visitLineNumber(line, start);
    flush();

  }

  @Override
  public void visitMaxs(int maxStack, int maxLocals)
  {
    super.visitMaxs(maxStack, maxLocals);
    flush();

  }

  public final FlushingTextifier        printer;
  private FlushingTraceClassVisitor classTracer;

  public FlushingTraceMethodVisitor(final MethodVisitor methodVisitor,
                                    FlushingTraceClassVisitor classTracer,
                                    final FlushingTextifier printer)
  {
    super(Opcodes.ASM9,
          methodVisitor);
    this.printer     = printer;
    this.classTracer = classTracer;
  }

  private void flush()
  {
    printer.printAndFlush();
    classTracer.textifier.printAndFlush();
  }

  @Override
  public void visitParameter(final String name, final int access)
  {
    printer.visitParameter(name, access);
    super.visitParameter(name, access);
    flush();
  }

  @Override
  public AnnotationVisitor visitAnnotationDefault()
  {
    printer.visitAnnotationDefault();
    AnnotationVisitor visitAnnotationDefault = super.visitAnnotationDefault();
    flush();
    return visitAnnotationDefault;
  }

  @Override
  public void visitMethodInsn(int opcode, String owner, String name, String descriptor, boolean isInterface)
  {
    printer.visitMethodInsn(opcode, owner, name, descriptor, isInterface);
    super.visitMethodInsn(opcode, owner, name, descriptor, isInterface);
    flush();
  }

  @Override
  public void visitInsn(int opcode)
  {
    printer.visitInsn(opcode);
    super.visitInsn(opcode);
    flush();
  }

  @Override
  public void visitIntInsn(int opcode, int operand)
  {
    printer.visitIntInsn(opcode, operand);
    super.visitIntInsn(opcode, operand);
    flush();
  }

  @Override
  public void visitVarInsn(int opcode, int var)
  {
    printer.visitVarInsn(opcode, var);
    super.visitVarInsn(opcode, var);
    flush();
  }

  @Override
  public void visitTypeInsn(int opcode, String type)
  {
    printer.visitTypeInsn(opcode, type);
    super.visitTypeInsn(opcode, type);
    flush();
  }

  @Override
  public void visitFieldInsn(int opcode, String owner, String name, String descriptor)
  {
    printer.visitFieldInsn(opcode, owner, name, descriptor);
    super.visitFieldInsn(opcode, owner, name, descriptor);
    flush();
  }

  @Override
  public void visitInvokeDynamicInsn(String name,
                                     String descriptor,
                                     Handle bootstrapMethodHandle,
                                     Object... bootstrapMethodArguments)
  {
    printer.visitInvokeDynamicInsn(name, descriptor, bootstrapMethodHandle, bootstrapMethodArguments);
    super.visitInvokeDynamicInsn(name, descriptor, bootstrapMethodHandle, bootstrapMethodArguments);
    flush();
  }

  @Override
  public void visitJumpInsn(int opcode, Label label)
  {
    printer.visitJumpInsn(opcode, label);
    super.visitJumpInsn(opcode, label);
    flush();
  }

  @Override
  public void visitLabel(Label label)
  {
    printer.visitLabel(label);
    super.visitLabel(label);
    flush();
  }

  @Override
  public void visitLdcInsn(Object value)
  {
    printer.visitLdcInsn(value);
    super.visitLdcInsn(value);
    flush();
  }

  @Override
  public void visitIincInsn(int var, int increment)
  {
    printer.visitIincInsn(var, increment);
    super.visitIincInsn(var, increment);
    flush();
  }

  @Override
  public void visitTableSwitchInsn(int min, int max, Label dflt, Label... labels)
  {
    printer.visitTableSwitchInsn(min, max, dflt, labels);
    super.visitTableSwitchInsn(min, max, dflt, labels);
    flush();
  }

  @Override
  public void visitLookupSwitchInsn(Label dflt, int[] keys, Label[] labels)
  {
    printer.visitLookupSwitchInsn(dflt, keys, labels);
    super.visitLookupSwitchInsn(dflt, keys, labels);
    flush();
  }

  @Override
  public void visitMultiANewArrayInsn(String descriptor, int numDimensions)
  {
    printer.visitMultiANewArrayInsn(descriptor, numDimensions);
    super.visitMultiANewArrayInsn(descriptor, numDimensions);
    flush();
  }

  @Override
  public void visitEnd()
  {
    printer.visitMethodEnd();
    super.visitEnd();
    flush();
  }
}
