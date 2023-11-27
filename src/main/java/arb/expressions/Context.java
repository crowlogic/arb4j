package arb.expressions;

import static java.lang.System.out;

import arb.Field;
import arb.Real;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * {@link Context} for the {@link Expression} {@link Compiler} to use for the
 * resolution of {@link Variable} and {@link Function} references (beyond those
 * which are member-functions of the {@link Real} type)
 * 
 * @param <D>
 * @param <F>
 */
public class Context<D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
{
  public Context()
  {
    this.variables = new Variables<>();
    this.functions = new Functions<>();
  }

  public Context(Variables<R> variables, Functions<F> functions)
  {
    this.variables = variables;
    this.functions = functions;
  }

  public Context(Variables<R> vars)
  {
    this.variables = vars;
    this.functions = new Functions<>();
  }

  public Variables<R> variables;

  public Functions<F> functions;

  public R registerVariable(R variable)
  {
    variables.put(variable.getName(), variable);
    return variable;
  }

  public boolean verbose = true;

  public F registerFunction(String functionName, F function)
  {
    if (verbose)
    {
      out.format("registerFunction( functionName = %s, function = %s )\n", functionName, function);
    }
    functions.put(functionName, function);
    return function;
  }
}
