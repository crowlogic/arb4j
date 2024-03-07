package arb.expressions;

import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class IntermediateVariable<D, R, F extends Function<D, R>>
{
  public Expression<D, R, F> expression;

  @Override
  public String toString()
  {
    return String.format("IntermediateVariable[name=%s, type=%s]", name, type);
  }

  public IntermediateVariable(Expression<D, R, F> expression, String name, Class<?> type)
  {
    this.expression = expression;
    this.type       = type;
    this.name       = name;
  }

  public String   name;
  public Class<?> type;

  public MethodVisitor generateInitializer(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    String intermediateTypeInternalName = Type.getInternalName(type);
    methodVisitor.visitTypeInsn(NEW, intermediateTypeInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, intermediateTypeInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, expression.className, name, type.descriptorString());
    return methodVisitor;
  }

  public ClassVisitor declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC, name, type.descriptorString(), null, null);
    return classVisitor;
  }
}