package arb.expressions;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadThisOntoStack;
import static org.objectweb.asm.Opcodes.ACC_FINAL;
import static org.objectweb.asm.Opcodes.ACC_PUBLIC;

import java.util.Objects;

import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
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
public final class FunctionMapping<D, R, F extends Function<? extends D, ? extends R>>
{
  public Class<?>            domain;

  public Expression<D, R, F> expression;

  public String              expressionString;

  public Class<?>            functionClass;

  public F                   instance;

  public String              functionName;

  public Class<?>            coDomain;

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
    return instance != null ? instance.getClass().descriptorString() : String.format("L%s;", functionName);
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
      expression.defineClass();
    }
    return instance = expression.instantiate();
  }

  public void declare(ClassVisitor classVisitor, String name)
  {
    classVisitor.visitField(ACC_PUBLIC, name, functionFieldDescriptor(), null, null);
  }

  public void loadReferenceOntoStack(MethodVisitor mv)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv), functionName, functionFieldDescriptor());
  }

  @Override
  public String toString()
  {
    return String.format("%s(#%s)\n[name=%s,\n instance=%s,\n domain=%s,\n coDomain=%s,\n functionClass=%s,\n expression=%s\n]",
                         getClass().getSimpleName(),
                         System.identityHashCode(this),
                         functionName,
                         instance,
                         domain != null ? domain.getName() : null,
                         coDomain != null ? coDomain.getName() : null,
                         functionClass,
                         System.identityHashCode(expression));
  }

  public Class<?> type()
  {
    return instance == null ? functionClass : instance.getClass();
  }

  public void checkForUndefinedReferenced()
  {
    if (instance == null && functionClass == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s", this));
    }
  }

}