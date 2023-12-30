package arb.expressions;

import static java.lang.String.format;
import static java.lang.System.err;

import arb.Real;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * {@link Context} for the {@link Expression} {@link Compiler} to use for the
 * resolution of {@link Variable} and {@link Function} references (in addition
 * to those which are member-functions of the {@link Real} type)
 * 
 * <p>
 * This class functions similarly to a closure in functional programming. It
 * encapsulates an environment of variable, bindings and functions, providing a
 * context in which expressions are evaluated. Unlike a traditional closure, it
 * does not contain the expression itself but rather the environment for such
 * expressions and therefore fulfills its essential function by facilitating the
 * organization and reification of mathematical expressions into cohesive
 * functional units via {@link Compiler} class, {@link Expression} class, and
 * the {@link Node} class along with all of its extensions.
 * </p>
 * 
 * <p>
 * In the context of a reduction system, this class can be thought of as
 * managing the 'environment' part of a closure, where the variables and
 * functions are localized and maintained.
 * </p>
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 * 
 * @author ©2023 Stephen Crowley
 */
public class Context
{
  public Context()
  {
    this.variables = new Variables();
    this.functions = new Functions();
  }

  public Context(Variables variables, Functions functions)
  {
    this.variables = variables;
    this.functions = functions;
  }

  public Context(Variables vars)
  {
    this.variables = vars;
    this.functions = new Functions();
  }

  public Context(Functions funcs)
  {
    this.variables = new Variables();
    this.functions = funcs;
  }

  public Variables variables;

  public Functions functions;

  /**
   * Adds a given variable to {@link #variables}
   * 
   * @param variable
   * @return variable
   * 
   * @throws IllegalArgumentException if a variable of the same name has already
   *                                  been registered
   */
  public <R> R registerVariable(String name, R variable)
  {
    assert name != null : "name cannot be null";
    assert variable != null : "variable cannot be null";
    
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

  public boolean                             verbose     = true;

  public final CompiledExpressionClassLoader classLoader = new CompiledExpressionClassLoader();

  /**
   * 
   * @param functionName
   * @param function
   * @return
   * @throws IllegalArgumentException if a function of the same name already
   *                                  exists in this{@link #functions}
   */
  public Function<?, ?>
         registerFunction(String functionName, Function<?, ?> function, Class<?> domainType, Class<?> rangeType)
  {
//    assert false : format("TODO: add %s and %s methods to Function so type checking can be done on the functions",
//                          domainClass,
//                          rangeClass);
    
    if (verbose)
    {
      err.format("registerFunction( functionName = %s, function = %s, domainType=%s, rangeType=%s )\n",
                 functionName,
                 function,
                 domainType,
                 rangeType);
      err.flush();
    }
    if (functions.map.containsKey(functionName))
    {
      throw new IllegalArgumentException(format("a function named %s of class %s is already registered",
                                                functionName,
                                                function));
    }

    functions.map.put(functionName, function);
    return function;
  }
}
