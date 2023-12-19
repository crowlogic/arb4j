package arb.expressions;

import static java.lang.String.format;
import static java.lang.System.out;

import arb.Real;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * {@link Context} for the {@link Expression} {@link Compiler} to use for the
 * resolution of {@link Variable} and {@link Function} references (beyond those
 * which are member-functions of the {@link Real} type)
 * 
 * <p>
 * This class functions similarly to a closure in functional programming. It
 * encapsulates an environment of variable bindings and functions, providing a
 * context in which expressions are evaluated. Unlike a traditional closure, it
 * does not contain the expression itself but rather the environment for such
 * expressions. This context is essential for managing the scope and lifetime of
 * variables and functions during expression evaluation.
 * </p>
 * 
 * <p>
 * In the context of a reduction system, this class can be thought of as
 * managing the 'environment' part of a closure, where the variables and
 * functions are bound and maintained.
 * </p>

 * @author ©2023 Stephen Crowley
 * @param <D>
 * @param <F>
 */
public class Context<D, R, F extends Function<? extends D, ? extends R>>
{
  public Context()
  {
    this.variables = new Variables<>();
    this.functions = new Functions<D, R, F>();
  }

  public Context(Variables<R> variables, Functions<D, R, F> functions)
  {
    this.variables = variables;
    this.functions = functions;
  }

  public Context(Variables<R> vars)
  {
    this.variables = vars;
    this.functions = new Functions<>();
  }

  public Variables<R>       variables;

  public Functions<D, R, F> functions;

  /**
   * Adds a given variable to {@link #variables}
   * 
   * @param variable
   * @return variable
   * 
   * @throws IllegalArgumentException if a variable of the same name has already
   *                                  been registered
   */
  public R registerVariable(String name, R variable)
  {
    R existing = null;
    if ((existing = variables.get(name)) != null)
    {
      boolean same = existing == variable;
      throw new IllegalArgumentException(format("A variable named %s of type %s is already registered and it %s equal to the same object passed to registerVariable\n",
                                                name,
                                                variable.getClass(),
                                                same ? "IS" : "IS NOT"));
    }
    variables.put(name, variable);
    return variable;
  }

  public boolean                             verbose     = false;

  public final CompiledExpressionClassLoader classLoader = new CompiledExpressionClassLoader();

  /**
   * 
   * @param functionName
   * @param function
   * @return
   * @throws IllegalArgumentException if a function of the same name already
   *                                  exists in this{@link #functions}
   */
  public F registerFunction(String functionName, F function)
  {
    if (verbose)
    {
      out.format("registerFunction( functionName = %s, function = %s )\n", functionName, function);
    }
    if (functions.containsKey(functionName))
    {
      throw new IllegalArgumentException(format("a function named %s of class %s is already registered",
                                                functionName,
                                                function));
    }

    functions.put(functionName, function);
    return function;
  }
}
