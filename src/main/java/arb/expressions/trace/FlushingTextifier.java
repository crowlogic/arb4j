package arb.expressions.trace;

import static org.objectweb.asm.Opcodes.ASM10_EXPERIMENTAL;

import java.util.List;

import org.objectweb.asm.*;
import org.objectweb.asm.util.Printer;
import org.objectweb.asm.util.Textifier;

public class FlushingTextifier extends
                               Textifier
{

  FlushingTraceClassVisitor classTracer;

  @Override
  public void visitIincInsn(int var, int increment)
  {
    super.visitIincInsn(var, increment);
    printAndFlush();
  }

  @Override
  public void visitTableSwitchInsn(int min, int max, Label dflt, Label... labels)
  {
    super.visitTableSwitchInsn(min, max, dflt, labels);
    printAndFlush();
  }

  @Override
  public void visitLookupSwitchInsn(Label dflt, int[] keys, Label[] labels)
  {
    super.visitLookupSwitchInsn(dflt, keys, labels);
    printAndFlush();
  }

  @Override
  public void visitMultiANewArrayInsn(String descriptor, int numDimensions)
  {
    super.visitMultiANewArrayInsn(descriptor, numDimensions);
    printAndFlush();
  }

  @Override
  public Printer visitInsnAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    Printer printer = super.visitInsnAnnotation(typeRef, typePath, descriptor, visible);
    printAndFlush();
    return printer;
  }

  @Override
  public void visitTryCatchBlock(Label start, Label end, Label handler, String type)
  {
    super.visitTryCatchBlock(start, end, handler, type);
    printAndFlush();
  }

  @Override
  public Printer visitTryCatchAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    Printer printer = super.visitTryCatchAnnotation(typeRef, typePath, descriptor, visible);
    printAndFlush();
    return printer;
  }

  @Override
  public void visitLocalVariable(String name, String descriptor, String signature, Label start, Label end, int index)
  {
    super.visitLocalVariable(name, descriptor, signature, start, end, index);
    printAndFlush();
  }

  @Override
  public Printer visitLocalVariableAnnotation(int typeRef,
                                              TypePath typePath,
                                              Label[] start,
                                              Label[] end,
                                              int[] index,
                                              String descriptor,
                                              boolean visible)
  {
    Printer printer = super.visitLocalVariableAnnotation(typeRef, typePath, start, end, index, descriptor, visible);
    printAndFlush();
    return printer;
  }

  @Override
  public void visitLineNumber(int line, Label start)
  {
    super.visitLineNumber(line, start);
    printAndFlush();
  }

  @Override
  public void visitMaxs(int maxStack, int maxLocals)
  {
    super.visitMaxs(maxStack, maxLocals);
    printAndFlush();
  }

  @Override
  public void visitMethodEnd()
  {
    super.visitMethodEnd();
    printAndFlush();
  }

  @Override
  public void visitIntInsn(int opcode, int operand)
  {
    super.visitIntInsn(opcode, operand);
    printAndFlush();
  }

  @SuppressWarnings("deprecation")
  public FlushingTextifier()
  {
    super(ASM10_EXPERIMENTAL);
  }

  @Override
  public void visit(final int version,
                    final int access,
                    final String name,
                    final String signature,
                    final String superName,
                    final String[] interfaces)
  {
    super.visit(version, access, name, signature, superName, interfaces);
    printAndFlush();
  }

  @Override
  public void visitSource(final String source, final String debug)
  {
    super.visitSource(source, debug);
    printAndFlush();
  }

  // Continue with the rest of the methods...
  // Example:

  @Override
  public Printer visitModule(final String name, final int access, final String version)
  {
    Printer printer = super.visitModule(name, access, version);
    printAndFlush();
    return printer;
  }

  @Override
  public void visitNestHost(final String nestHost)
  {
    super.visitNestHost(nestHost);
    printAndFlush();
  }

  @Override
  public void visitOuterClass(String owner, String name, String descriptor)
  {
    super.visitOuterClass(owner, name, descriptor);
    printAndFlush();
  }

  @Override
  public Textifier visitClassAnnotation(String descriptor, boolean visible)
  {
    Textifier printer = super.visitClassAnnotation(descriptor, visible);
    printAndFlush();
    return printer;
  }

  @Override
  public Printer visitClassTypeAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    Printer printer = super.visitClassTypeAnnotation(typeRef, typePath, descriptor, visible);
    printAndFlush();
    return printer;
  }

  @Override
  public void visitClassAttribute(Attribute attribute)
  {
    super.visitClassAttribute(attribute);
    printAndFlush();
  }

  @Override
  public void visitInnerClass(String name, String outerName, String innerName, int access)
  {
    super.visitInnerClass(name, outerName, innerName, access);
    printAndFlush();
  }

  @Override
  public Textifier visitField(int access, String name, String descriptor, String signature, Object value)
  {
    Textifier printer = super.visitField(access, name, descriptor, signature, value);
    printAndFlush();
    return printer;
  }

  @Override
  public Textifier visitMethod(int access, String name, String descriptor, String signature, String[] exceptions)
  {
    Textifier printer = super.visitMethod(access, name, descriptor, signature, exceptions);
    printAndFlush();
    return printer;
  }

  @Override
  public void visitClassEnd()
  {
    super.visitClassEnd();
    printAndFlush();
  }

  public void printAndFlush()
  {
    printAndFlush(this.text);
  }

  private void printAndFlush(List<?> list)
  {
    for (Object o : list)
    {
      if (o instanceof List)
      {
        printAndFlush((List<?>) o);
      }
      else
      {
        classTracer.printWriter.println(o);
      }
    }
    list.clear();
    classTracer.printWriter.flush();
  }
}
