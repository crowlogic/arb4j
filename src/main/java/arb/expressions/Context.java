package arb.expressions;

import static arb.utensils.Utensils.wrapOrThrow;
import static java.lang.String.format;
import static java.lang.System.err;

import java.lang.reflect.Field;
import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import arb.Integer;
import arb.Named;
import arb.OrderedPair;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;
import arb.utensils.TopologicalSorter;

/**
 * The {@link Context} class is an integral part of the {@link Expression}
 * {@link Compiler} which facilitates the resolution of {@link VariableNode} and
 * {@link Function} references (in addition to those which are member-functions
 * of the types)
 * 
 * <p>
 * This class functions similarly to a closure in functional programming. It
 * encapsulates an environment of {@link Variables}, and
 * {@link FunctionMappings}, providing a {@link Context} in which
 * {@link Expression}s are synthesized into {@link Function} implementations
 * which can then be {@link Function#evaluate(Object, int)}d. Unlike a
 * traditional closure, it does not contain the expression itself but rather the
 * environment for such expressions and therefore fulfills its essential
 * function by facilitating the organization and reification of mathematical
 * expressions into cohesive functional units via the {@link Compiler} class,
 * the {@link Expression} class, the {@link Node} class, and all of its
 * extensions.
 * </p>
 * 
 * <p>
 * When considering this class as a reduction system, it can be thought of as
 * managing the 'environment' part of a closure, where the variables and
 * functions are localized and maintained.
 * </p>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Context
{
  CompiledExpressionClassLoader         classLoader                  = new CompiledExpressionClassLoader(this);

  public final FunctionMappings         functions;

  public HashMap<String, AtomicInteger> intermediateVariableCounters = new HashMap<>();

  public boolean                        saveClasses                  = false;

  public Variables                      variables;

  public Context resetClassLoader()
  {
    classLoader = new CompiledExpressionClassLoader(this);
    return this;
  }

  public String saveDependencyGraph(List<String> sortedFunctions)
  {
    String filename = null;
    HashMap<String, List<String>> sortedMap = new HashMap<>();
    for (String function : sortedFunctions)
    {
      sortedMap.put(function, functionReferenceGraph.getOrDefault(function, Collections.emptyList()));
    }
    if (sortedMap.values().stream().mapToInt(List::size).sum() > 0)
    {
      // TopologicalSorter.addTransitiveDependencies(sortedMap);
      filename = sortedMap.keySet().stream().collect(Collectors.joining()) + ".dot";
      TopologicalSorter.saveToDotFile(TopologicalSorter.toDotFormatReversedDirect(sortedMap),
                                      filename);
    }
    return filename;
  }

  public void populateFunctionReferenceGraph()
  {
    // Build dependency graph directly from referencedFunctions
    for (Map.Entry<String, FunctionMapping<?, ?, ?>> entry : functions.map.entrySet())
    {
      String                   functionName = entry.getKey();
      FunctionMapping<?, ?, ?> function     = entry.getValue();

      // Get referenced functions from the function mapping
      List<String>             dependencies = new ArrayList<>();
      if (function.expression.referencedFunctions != null)
      {
        dependencies.addAll(function.expression.referencedFunctions.keySet()
                                                                   .stream()
                                                                   .filter(name -> !name.equals(functionName))
                                                                   .toList());
      }

      functionReferenceGraph.put(functionName, dependencies);
    }
  }

  public Map<String, List<String>> functionReferenceGraph = new HashMap<String, List<String>>();

  public Context()
  {
    this.variables = new Variables();
    this.functions = new FunctionMappings();
  }

  public Context(FunctionMappings funcs)
  {
    this.variables = new Variables();
    this.functions = funcs;
  }

  public Context(Named... vars)
  {
    this(new Variables(vars));
  }

  public Context(Variables vars)
  {
    this.variables = vars;
    this.functions = new FunctionMappings();
  }

  public Context(Variables variables, FunctionMappings functions)
  {
    this.variables = variables;
    this.functions = functions;
  }

  public <R> R getVariable(String name)
  {
    return variables.get(name);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectFunctionReferences(F f)
  {
    for (Field field : f.getClass().getFields())
    {
      var functionName = field.getName();

      try
      {
        var functionMapping = functions.get(functionName);
        if (functionMapping != null)
        {
          setFieldValue(f.getClass(), f, functionName, functionMapping.instance, false);
        }
      }
      catch (Exception e)
      {
        wrapOrThrow(String.format("function=%s", functionName), e);
      }
    }
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectVariableReferences(F f)
  {
    assert f != null : "f is null";
    if (Expression.trace)
    {
      System.err.format("Context(#%s).injectVariableReferences(f=%s)\n\n",
                        System.identityHashCode(this),
                        f.getClass().getName());
    }
    variables.map.entrySet().forEach(entry ->
    {
      var variableName = entry.getKey();

      try
      {
        R value = variables.get(variableName);
        if (value != null)
        {
          setFieldValue(f.getClass(), f, variableName, value, false);
        }
      }
      catch (Exception e)
      {
        if (!variableName.equals("input"))
        {
          // e.printStackTrace(System.err);
          wrapOrThrow(String.format("variable=%s", variableName), e);
        }
      }
    });
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         registerFunctionMapping(String functionName, F function, Class<?> domainType, Class<?> coDomainType)
  {
    return registerFunctionMapping(functionName,
                                   function,
                                   domainType,
                                   coDomainType,
                                   function.getClass(),
                                   false,
                                   null,
                                   null);
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         registerFunctionMapping(String functionName,
                                 F function,
                                 Class<?> domainType,
                                 Class<?> coDomainType,
                                 Class<?> functionClass,
                                 boolean replace,
                                 Expression<D, R, F> expression,
                                 String expressionString)
  {

    if (Expression.trace)
    {
      err.format("Context(#%s).registerFunctionMapping( functionName = %s, function = %s, domainType=%s, coDomainType=%s, functionClass=%s, expression=%s, expressionString=%s )\n",
                 System.identityHashCode(this),
                 functionName,
                 function,
                 domainType,
                 coDomainType,
                 functionClass,
                 expression,
                 expressionString);
      err.flush();
    }
    if (!replace && functions.map.containsKey(functionName))
    {
      throw new IllegalArgumentException(format("a function named %s of class %s is already registered",
                                                functionName,
                                                function));
    }

    FunctionMapping<D, R, F> mapping = new FunctionMapping<D, R, F>();
    mapping.expression       = expression;
    mapping.expressionString = expressionString;
    mapping.functionName     = functionName;
    mapping.domain           = domainType;
    mapping.coDomain         = coDomainType;
    mapping.instance         = function;
    mapping.functionClass    = functionClass;
    functions.map.put(functionName, mapping);
    return mapping;
  }

  public <R> FunctionMapping<Integer, R, Sequence<R>> registerSequence(String name, Sequence<R> seq)
  {
    return registerFunctionMapping(name, seq, seq.domainType(), seq.coDomainType());
  }

  public Real registerVariable(Real var)
  {
    return registerVariable(var.getName(), var);
  }

  public <R extends Named> R registerVariable(String name, R variable)
  {
    assert name != null : "name cannot be null";
    assert variable != null : "variable cannot be null";

    R existing = null;
    if ((existing = variables.get(name)) != null)
    {
      boolean same = existing.getClass().equals(variable.getClass());
      if (!same)
      {
        throw new CompilerException(format("A variable named %s of type %s having value %s is already registered and it %s equal to the same object passed to registerVariable\n",
                                           name,
                                           variable.getClass(),
                                           variable,
                                           same ? "IS" : "IS NOT"));
      }
    }
    variables.put(name, variable);
    return variable;
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         void
         setFieldValue(Class<?> compiledClass, F f, String variableName, Object value, boolean overwrite)
  {

    java.lang.reflect.Field field;
    try
    {
      field = compiledClass.getField(variableName);
      field.set(f, value);
    }
    catch (Throwable e)
    {
      wrapOrThrow("threw " + e.toString() + " setting field '" + variableName + "' in " + compiledClass, e);
    }
  }

  @Override
  public String toString()
  {
    return String.format("Context(#%s)[functions=%s,variables=%s]",
                         System.identityHashCode(this),
                         functions.map.keySet(),
                         variables);
  }

  public Collection<Entry<String, Named>> variableEntries()
  {
    return variables.map.entrySet();
  }

  public Stream<Entry<String, Named>> variableEntryStream()
  {
    return variableEntries().stream();
  }

  public Stream<OrderedPair<String, Class<?>>> variableClassStream()
  {
    return variableEntryStream().filter(entry -> entry.getValue() != null)
                                .map(entry -> new OrderedPair<String, Class<?>>(entry.getKey(),
                                                                                entry.getValue().getClass()));
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectReferences(F f)
  {
    injectVariableReferences(f);
    injectFunctionReferences(f);
  }

  public void mergeFrom(Context context)
  {
    variables.addAll(context.variables);
  }

}
