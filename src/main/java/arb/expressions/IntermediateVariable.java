package arb.expressions;

import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.functions.Function;

public class IntermediateVariable
{
  @Override
  public String toString()
  {
    return String.format("IntermediateVariable[name=%s, type=%s]", name, type);
  }

  public IntermediateVariable(String name, Class<?> type)
  {
    this.type = type;
    this.name = name;
  }

  public String   name;
  public Class<?> type;

  public <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariable(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    String intermediateTypeInternalName = Type.getInternalName(type);
    methodVisitor.visitTypeInsn(NEW, intermediateTypeInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, intermediateTypeInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD, expression.className, name, type.descriptorString());
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariables(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    if (!expression.intermediateVariables.isEmpty() && expression.verbose)
    {
      err.println("Preparing intermediate variables: " + expression.intermediateVariables);
      err.flush();
    }

    for (var intermediateVariable : expression.intermediateVariables)
    {
      intermediateVariable.initializeIntermediateVariable(expression, methodVisitor);
    }
    return methodVisitor;
  }
}