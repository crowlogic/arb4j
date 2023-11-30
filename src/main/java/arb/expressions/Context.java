package arb.expressions;

import static java.lang.String.format;
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
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @param <D>
 * @param <F>
 */
public class Context<D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
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
    assert !functions.containsKey(functionName) : format("a function named %s of class %s is already registered",
                                                         functionName,
                                                         function);

    functions.put(functionName, function);
    return function;
  }
}
