package arb.expressions;

import static java.lang.System.err;
import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.MethodVisitor;

import arb.functions.Function;

public class IntermediateVariable
{
  public IntermediateVariable(String name, Class<?> type)
  {
    this.type = type;
    this.name = name;
  }

  public String   name;
  public Class<?> type;

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariable(Expression<D, R, F> expression,
                                        MethodVisitor methodVisitor,
                                        IntermediateVariable intermediateVariable)
  {
    methodVisitor.visitVarInsn(ALOAD, 0);
    methodVisitor.visitTypeInsn(NEW, expression.rangeClassInternalName);
    methodVisitor.visitInsn(DUP);
    methodVisitor.visitMethodInsn(INVOKESPECIAL, expression.rangeClassInternalName, "<init>", "()V", false);
    methodVisitor.visitFieldInsn(PUTFIELD,
                                 expression.className,
                                 intermediateVariable.name,
                                 intermediateVariable.type.descriptorString());
    return methodVisitor;
  }

  public static <D, R, F extends Function<D, R>>
         MethodVisitor
         initializeIntermediateVariables(Expression<D, R, F> expression, MethodVisitor methodVisitor)
  {
    if (expression.intermediateVariableCount > 0 && expression.verbose)
    {
      err.println("Preparing intermediate variables: " + expression.intermediateVariables);
      err.flush();
    }

    for (var intermediateVariable : expression.intermediateVariables)
    {
      initializeIntermediateVariable(expression, methodVisitor, intermediateVariable);
    }
    return methodVisitor;
  }
}