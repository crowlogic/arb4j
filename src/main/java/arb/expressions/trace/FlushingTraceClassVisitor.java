package arb.expressions.trace;

import java.io.PrintWriter;

import org.objectweb.asm.AnnotationVisitor;
import org.objectweb.asm.Attribute;
import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.ModuleVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.RecordComponentVisitor;
import org.objectweb.asm.TypePath;
import org.objectweb.asm.util.TraceClassVisitor;

/**
 * Like {@link TraceClassVisitor} but flushes the output before returning from
 * the visit methods. Contrary to what the ASM documentation says, the vast
 * majority of the time you can indeed get perfectly valid results with no need
 * to buffer it all up until the visitEnd() method is called
 * 
 *
 */
public class FlushingTraceClassVisitor extends
                                       ClassVisitor
{

  @Override
  public ModuleVisitor visitModule(String name, int access, String version)
  {
    textifier.visitModule(name, access, version);
    ModuleVisitor visitModule = super.visitModule(name, access, version);
    print();
    return visitModule;
  }

  @Override
  public void visitNestHost(String nestHost)
  {
    textifier.visitNestHost(nestHost);
    super.visitNestHost(nestHost);
    print();
  }

  @Override
  public AnnotationVisitor visitAnnotation(String descriptor, boolean visible)
  {
    textifier.visitAnnotation(descriptor, visible);
    AnnotationVisitor visitAnnotation = super.visitAnnotation(descriptor, visible);
    print();
    return visitAnnotation;
  }

  @Override
  public AnnotationVisitor visitTypeAnnotation(int typeRef, TypePath typePath, String descriptor, boolean visible)
  {
    AnnotationVisitor visitTypeAnnotation = super.visitTypeAnnotation(typeRef, typePath, descriptor, visible);
    textifier.visitTypeAnnotation(typeRef, typePath, descriptor, visible);
    print();
    return visitTypeAnnotation;
  }

  @Override
  public RecordComponentVisitor visitRecordComponent(String name, String descriptor, String signature)
  {
    RecordComponentVisitor visitRecordComponent = super.visitRecordComponent(name, descriptor, signature);
    textifier.visitRecordComponent(name, descriptor, signature);
    return visitRecordComponent;
  }

  @Override
  public FieldVisitor visitField(int access, String name, String descriptor, String signature, Object value)
  {
    FieldVisitor visitField = super.visitField(access, name, descriptor, signature, value);
    textifier.visitField(access, name, descriptor, signature, value);
    return visitField;
  }

  public FlushingTextifier textifier;
  final PrintWriter        printWriter;

  public FlushingTraceClassVisitor(final PrintWriter printWriter)
  {
    this(null,
         printWriter);
  }

  public FlushingTraceClassVisitor(final ClassVisitor classVisitor,
                                   final PrintWriter printWriter)
  {
    this(classVisitor,
         new FlushingTextifier(),
         printWriter);
    textifier.classTracer = this;
  }

  public FlushingTraceClassVisitor(final ClassVisitor classVisitor,
                                   final FlushingTextifier printer,
                                   final PrintWriter printWriter)
  {
    super(Opcodes.ASM9,
          classVisitor);
    this.textifier   = printer;
    this.printWriter = printWriter;
  }

  public void print()
  {
    if (printWriter != null)
    {
      textifier.print(printWriter);
      printWriter.flush();
    }
  }

  @Override
  public void visit(int version, int access, String name, String signature, String superName, String[] interfaces)
  {
    super.visit(version, access, name, signature, superName, interfaces);
    textifier.visit(version, access, name, signature, superName, interfaces);
    print();
  }

  @Override
  public void visitSource(String source, String debug)
  {
    super.visitSource(source, debug);
    textifier.visitSource(source, debug);
    print();
  }

  @Override
  public void visitOuterClass(String owner, String name, String descriptor)
  {
    super.visitOuterClass(owner, name, descriptor);
    textifier.visitOuterClass(owner, name, descriptor);
    print();
  }

  @Override
  public void visitInnerClass(String name, String outerName, String innerName, int access)
  {
    super.visitInnerClass(name, outerName, innerName, access);
    textifier.visitInnerClass(name, outerName, innerName, access);
    print();
  }

  @Override
  public void visitAttribute(Attribute attribute)
  {
    super.visitAttribute(attribute);
    textifier.visitAttribute(attribute);
    print();
  }

  @Override
  public void visitNestMember(String nestMember)
  {
    super.visitNestMember(nestMember);
    textifier.visitNestMember(nestMember);
    print();
  }

  @Override
  public void visitPermittedSubclass(String permittedSubclass)
  {
    super.visitPermittedSubclass(permittedSubclass);
    textifier.visitPermittedSubclass(permittedSubclass);
    print();
  }

  @Override
  public void visitEnd()
  {
    super.visitEnd();
    textifier.visitClassEnd();
    print();
  }

  @Override
  public MethodVisitor visitMethod(final int access,
                                   final String name,
                                   final String descriptor,
                                   final String signature,
                                   final String[] exceptions)
  {
    textifier.visitMethod(access, name, descriptor, signature, exceptions);
    MethodVisitor mv = cv == null ? null : cv.visitMethod(access, name, descriptor, signature, exceptions);
    return new FlushingTraceMethodVisitor(mv,
                                          this,
                                          textifier);
  }
}
