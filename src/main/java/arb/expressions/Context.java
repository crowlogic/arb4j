package arb.expressions;

import static java.lang.String.format;
import static java.lang.System.err;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

import arb.HasName;
import arb.OrderedPair;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Context
{
  public final FunctionMappings functions;

  public Context()
  {
    this.variables = new Variables();
    this.functions = new FunctionMappings();
  }

  public HashMap<String, AtomicInteger> intermediateVariableCounters = new HashMap<>();

  public Context(Variables variables, FunctionMappings functions)
  {
    this.variables = variables;
    this.functions = functions;
  }

  public Context(Variables vars)
  {
    this.variables = vars;
    this.functions = new FunctionMappings();
  }

  public Context(FunctionMappings funcs)
  {
    this.variables = new Variables();
    this.functions = funcs;
  }

  public Context(HasName... vars)
  {
    this(new Variables(vars));
  }

  public Variables variables;

  public <R> R getVariable(String name)
  {
    return variables.get(name);
  }

  /**
   * public FunctionMappings functions; Adds a given variable to
   * {@link #variables}
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
      boolean same = existing.getClass().equals(variable.getClass());
      if (!same)
      {
        throw new IllegalArgumentException(format("A variable named %s of type %s having value %s is already registered and it %s equal to the same object passed to registerVariable\n",
                                                  name,
                                                  variable.getClass(),
                                                  variable,
                                                  same ? "IS" : "IS NOT"));
      }
    }
    variables.put(name, variable);
    return variable;
  }

  public boolean                             verbose     = false;

  public final CompiledExpressionClassLoader classLoader = new CompiledExpressionClassLoader();

  public boolean                             saveClasses = false;

  /**
   * 
   * @param functionName
   * @param function
   * @param functionClass
   * @return
   * @throws IllegalArgumentException if a function of the same name already
   *                                  exists in this{@link #functions}
   */
  public <D, R> FunctionMapping<D, R> registerFunctionMapping(String functionName,
                                                              Function<?, ?> function,
                                                              Class<?> domainType,
                                                              Class<?> rangeType,
                                                              Class<?> functionClass)
  {

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

    FunctionMapping<D, R> mapping = new FunctionMapping<D, R>();
    mapping.name              = functionName;
    mapping.domain            = domainType;
    mapping.range             = rangeType;
    mapping.instance          = function;
    mapping.functionInterface = functionClass;
    functions.map.put(functionName, mapping);
    return mapping;
  }

  public Collection<Entry<String, Object>> variableEntries()
  {
    return variables.map.entrySet();
  }

  public Stream<Entry<String, Object>> variableEntryStream()
  {
    return variableEntries().stream();
  }

  public Stream<OrderedPair<String, Class<?>>> variableTypeStream()
  {
    return variableEntryStream().map(entry -> new OrderedPair<String, Class<?>>(entry.getKey(),
                                                                                entry.getValue().getClass()));
  }

  public FunctionMapping<Object, Object> registerFunctionMapping(String functionName,
                                                                 Function<?, ?> function,
                                                                 Class<?> domainType,
                                                                 Class<?> rangeType)
  {
    return registerFunctionMapping(functionName, function, domainType, rangeType, function.getClass());
  }

  public Real registerVariable(Real var)
  {
    return registerVariable(var.getName(), var);
  }
}
