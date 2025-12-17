package arb.expressions;

import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.*;

import org.objectweb.asm.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class IntermediateVariable<D, R, F extends Function<? extends D, ? extends R>>
{
  protected final Logger     logger = LoggerFactory.getLogger(getClass());

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
    if (Expression.trace)
    {
      logger.debug("declareField(): this={} in {}", this, expression);
    }
    classVisitor.visitField(ACC_PUBLIC, name, type.descriptorString(), null, null);
    return classVisitor;
  }
}