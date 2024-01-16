package arb.expressions;

import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.DUP;
import static org.objectweb.asm.Opcodes.INVOKESPECIAL;
import static org.objectweb.asm.Opcodes.NEW;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.functions.Function;

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

  public MethodVisitor initialize(MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    String intermediateTypeInternalName = Type.getInternalName(type);
    methodVisitor.visitTypeInsn(NEW, intermediateTypeInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, intermediateTypeInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, expression.className, name, type.descriptorString());
    return methodVisitor;
  }
}