package arb.expressions;

import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;
import static org.objectweb.asm.Opcodes.DUP;
import static org.objectweb.asm.Opcodes.INVOKESPECIAL;
import static org.objectweb.asm.Opcodes.NEW;
import static org.objectweb.asm.Opcodes.PUTFIELD;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class IntermediateVariable<D, R, F extends Function<? extends D, ? extends R>>
{
  public Expression<D, R, F> expression;

  @Override
  public String toString()
  {
    return String.format("IntermediateVariable[name=%s, type=%s]", name, type);
  }

  public IntermediateVariable(Expression<D, R, F> expression,
                              String name,
                              Class<?> type,
                              boolean initialize)
  {
    this.expression = expression;
    this.type       = type;
    this.name       = name;
    this.initialize = initialize;
  }

  public String        name;
  public Class<?>      type;
  public final boolean initialize;

  public MethodVisitor generateInitializer(MethodVisitor methodVisitor)
  {
    if (initialize)
    {
      loadThisOntoStack(methodVisitor);
      String intermediateTypeInternalName = Type.getInternalName(type);
      methodVisitor.visitTypeInsn(NEW, intermediateTypeInternalName);
      methodVisitor.visitInsn(DUP);
      methodVisitor.visitMethodInsn(INVOKESPECIAL,
                                    intermediateTypeInternalName,
                                    "<init>",
                                    "()V",
                                    false);
      methodVisitor.visitFieldInsn(PUTFIELD, expression.className, name, type.descriptorString());
    }
    return methodVisitor;
  }

  public ClassVisitor declareField(ClassVisitor classVisitor)
  {
    classVisitor.visitField(ACC_PUBLIC, name, type.descriptorString(), null, null);
    return classVisitor;
  }
}