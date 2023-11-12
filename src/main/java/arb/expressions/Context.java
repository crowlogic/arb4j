package arb.expressions;

import arb.Field;
import arb.Real;
import arb.functions.Function;

/**
 * {@link Context} for the {@link Expression} {@link Compiler} to use for the
 * resolution of variable and function references (beyond those which are
 * member-functions of the {@link Real} type)
 * 
 * @param <X>
 * @param <F>
 */
public class Context<X extends Field<X>, F extends Function<X, X>>
{
  public Context()
  {
    this.variables = new Variables<>();
    this.functions = new Functions<>();
  }

  public Context(Variables<X> variables, Functions<F> functions)
  {
    this.variables = variables;
    this.functions = functions;
  }

  public Context(Variables<X> vars)
  {
    this.variables = vars;
    this.functions = new Functions<>();
  }

  public Variables<X> variables;

  public Functions<F> functions;

  public Context<X, F> registerVariable(X variable)
  {
    variables.put(variable.getName(), variable);
    return this;
  }

  public F register(String functionName, F function)
  {
    functions.put(functionName, function);
    return function;
  }
}
