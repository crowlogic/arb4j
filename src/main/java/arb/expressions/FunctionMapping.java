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
 * Maps a function name to its complete type signature — domain type, codomain
 * type, and {@link Function} interface class — together with its
 * {@link Expression} and compiled {@link #instance}, while also participating
 * directly in ASM-based JVM bytecode emission for that declaration.
 *
 * <p>
 * This is not a Prototype in the Gang-of-Four design pattern sense — that
 * pattern, described by Gamma, Helm, Johnson, and Vlissides in <i>Design
 * Patterns: Elements of Reusable Object-Oriented Software</i> (1994), defines
 * an object that serves as a canonical exemplar of its kind and produces new
 * instances by cloning itself rather than by constructing from scratch. A
 * {@code FunctionMapping} is never cloned and has no such stamp-copying
 * semantics; its {@link #instance} field is compiled and cached exactly once.
 * Nor is it a mere lookup-table entry. The closest linguistic analogue is a
 * <em>function declaration</em> in a language specification — something that
 * carries both the full type signature and the body, and maps that declaration
 * into executable form.
 *
 * <p>
 * {@link arb.expressions.context.FunctionMappings} holds all
 * {@code FunctionMapping} instances registered in a given {@link Context},
 * which may itself be shared across multiple {@link Expression}s.
 *
 * @param <D> the domain (argument) type of the {@link Function}
 * @param <R> the codomain (return) type of the {@link Function}
 * @param <F> the {@link Function} interface type, extending {@link Function
 *            Function&lt;? extends D, ? extends R&gt;}
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

  private String              functionFieldDescriptor;

  private String              declaredAs;

  public MethodVisitor call(MethodVisitor mv, Class<?> type)
  {
    boolean isInterface = functionClass != null && functionClass.isInterface();
    mv.visitMethodInsn(isInterface ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(isInterface ? functionClass : instance.getClass()),
                       "evaluate",
                       Compiler.evaluationMethodDescriptor,
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
    return Objects.equals(domain, other.domain) && Objects.equals(functionName, other.functionName) && Objects.equals(coDomain, other.coDomain);
  }

  public String functionFieldDescriptor()
  {
    return functionFieldDescriptor = functionFieldDescriptor(false);
  }

  public String functionFieldDescriptor(boolean preferInterface)
  {
    if ((preferInterface || (functionClass != null && !functionClass.isInterface())) && functionClass != null)
    {
      return declaredAs = functionClass.descriptorString();
    }
    if (declaredAs != null)
    {
      return declaredAs;
    }
    return declaredAs = String.format("L%s;", functionName);
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(domain, functionName, coDomain);
  }

  public F instantiate()
  {
    if (instance != null)
    {
      return instance;
    }

    if (expression != null && Function.class.isAssignableFrom(expression.functionClass))
    {
      expression.compile();
    }
    return instance = expression.instantiate();
  }

  public void declare(ClassVisitor classVisitor, String name)
  {
    assert name != null : "name shan't be null in " + this;
    functionFieldDescriptor = functionFieldDescriptor();
    if (Expression.trace)
    {
      log.debug("declare(name={}, fieldDescriptor={})", name, functionFieldDescriptor);
    }
    classVisitor.visitField(ACC_PUBLIC, name, functionFieldDescriptor, null, null);
    declaredAs = functionFieldDescriptor;
  }

  public void loadReferenceOntoStack(MethodVisitor mv)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv), functionName, functionFieldDescriptor());
  }

  @Override
  public String toString()
  {
    return String.format("%s(#%s)[name=%s,\n instance=%s,\n domain=%s,\n coDomain=%s,\n functionClass=%s,\n expression=%s\n, expressionString=%s\n, declaredAs=%s]",
                         getClass().getSimpleName(),
                         System.identityHashCode(this),
                         functionName,
                         instance,
                         domain != null ? domain.getName() : null,
                         coDomain != null ? coDomain.getName() : null,
                         functionClass,
                         expression,
                         expressionString,
                         declaredAs);
  }

  public Class<?> type()
  {
    return instance == null ? functionClass : instance.getClass();
  }

  public boolean isGenerated()
  {
    return functionClass != null && functionClass.isInterface();
  }

  /**
   * Compiles the expression if its not already
   *
   * @return
   */
  @SuppressWarnings("unchecked")
  public Expression<D, R, F> getExpression()
  {
    if (expression != null)
    {
      return expression;
    }
    if (expressionString != null)
    {
      expression = Function.parse((Class<D>) domain, (Class<R>) coDomain, (Class<F>) functionClass, expressionString);
    }
    else
    {
      throw new IllegalArgumentException("Unable to inline the function named "
                                         + functionName
                                         + " because its parsed Expression is not available and it cannot be constructed since expressingString is null in its "
                                         + this);
    }

    return expression;
  }

  public String getExpressionString()
  {
    if (expressionString != null)
    {
      return expressionString;
    }
    else
    {
      if (expression != null)
      {
        return expressionString = expression.toString();
      }
    }
    if (instance != null)
    {
      return instance.toString();
    }
    return null;
  }
}
