package arb.expressions;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;

import java.util.Objects;

import org.objectweb.asm.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public final class FunctionMapping<D, R, F extends Function<? extends D, ? extends R>>
{
  private static final Logger log = LoggerFactory.getLogger(FunctionMapping.class);

  public Class<?>             domain;

  public Expression<D, R, F>  expression;

  public String               expressionString;

  public Class<?>             functionClass;

  public F                    instance;

  public String               functionName;

  public Class<?>             coDomain;

  public MethodVisitor call(MethodVisitor mv, Class<?> type)
  {
    boolean isInterface = functionClass != null && functionClass.isInterface();
    mv.visitMethodInsn(isInterface ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(isInterface ? functionClass : instance.getClass()),
                       "evaluate",
                       Expression.evaluationMethodDescriptor,
                       isInterface);
    return cast(mv, type);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    FunctionMapping<?, ?, ?> other = (FunctionMapping<?, ?, ?>) obj;
    return Objects.equals(domain, other.domain) && Objects.equals(functionName, other.functionName)
                  && Objects.equals(coDomain, other.coDomain);
  }

  public String functionFieldDescriptor()
  {
    return functionFieldDescriptor(false);
  }

  public String functionFieldDescriptor(boolean preferInterface)
  {
    if (preferInterface && functionClass != null)
    {
      return functionClass.descriptorString();
    }
    return instance != null ? instance.getClass().descriptorString()
                            : String.format("L%s;", functionName);
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(domain, functionName, coDomain);
  }

  public F instantiate()
  {
    if (Function.class.equals(expression.functionClass))
    {
      expression.compile();
    }
    return instance = expression.instantiate();
  }

  public void declare(ClassVisitor classVisitor, String name)
  {
    String functionFieldDescriptor = functionFieldDescriptor();
    if (Expression.trace)
    {
      log.debug("declare(name={}, fieldDescriptor={})", name, functionFieldDescriptor);
    }
    classVisitor.visitField(ACC_PUBLIC, name, functionFieldDescriptor, null, null);
  }

  public void loadReferenceOntoStack(MethodVisitor mv)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv), functionName, functionFieldDescriptor());
  }

  @Override
  public String toString()
  {
    return String.format("%s(#%s)[name=%s,\n instance=%s,\n domain=%s,\n coDomain=%s,\n functionClass=%s,\n expression=%s\n]",
                         getClass().getSimpleName(),
                         System.identityHashCode(this),
                         functionName,
                         instance,
                         domain != null ? domain.getName() : null,
                         coDomain != null ? coDomain.getName() : null,
                         functionClass,
                         expression);
  }

  public Class<?> type()
  {
    return instance == null ? functionClass : instance.getClass();
  }

}