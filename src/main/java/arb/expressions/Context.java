package arb.expressions;

import static arb.utensils.Utensils.wrapOrThrow;
import static java.lang.String.format;

import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Integer;
import arb.Named;
import arb.OrderedPair;
import arb.exceptions.CompilerException;
import arb.expressions.context.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;
import javafx.collections.FXCollections;
import javafx.collections.ObservableMap;

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
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Context
{
  public ExpressionClassLoader                classLoader                  =
                                                          new ExpressionClassLoader(this);

  public Map<String, Dependency>              functionReferenceGraph       = new HashMap<String,
                Dependency>();

  public final FunctionMappings               functions;

  public final HashMap<String, AtomicInteger> intermediateVariableCounters = new HashMap<>();

  private final Logger                        log                          =
                                                  LoggerFactory.getLogger(Context.class);

  public boolean                              saveClasses                  = false;

  public final ObservableMap<String, Named>   variables;

  public Context()
  {
    this.variables = FXCollections.observableHashMap();
    this.functions = new FunctionMappings();
  }

  public Context(FunctionMappings funcs)
  {
    this.variables = FXCollections.observableHashMap();
    this.functions = funcs;
  }

  public Context(Named... vars)
  {
    this();
    for (Named v : vars)
    {
      variables.put(v.getName(), v);
    }
  }

  public Context(Map<String, Named> vars)
  {
    this.variables = FXCollections.observableMap(vars);
    this.functions = new FunctionMappings();
  }

  public Context(Map<String, Named> vars, FunctionMappings functions)
  {
    this.variables = FXCollections.observableMap(vars);
    this.functions = functions;
  }

  public Stream<Entry<String, FunctionMapping<?, ?, ?>>> functionEntryStream()
  {
    return functions.entrySet().stream();
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         getFunctionMapping(String functionName)
  {
    return functions.get(functionName);
  }

  public <R extends Named> R getVariable(String name)
  {
    return (R) variables.get(name);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectFunctionReferences(F f)
  {
    try
    {
      for (var field : f.getClass().getFields())
      {
        var functionName    = field.getName();

        var functionMapping = functions.get(functionName);
        if (functionMapping != null)
        {
          setFieldValue(f.getClass(), f, functionName, functionMapping.instance, false);
        }
      }
    }
    catch (Throwable t)
    {
      if (log.isWarnEnabled())
      {
        log.warn(t.getMessage(), t);
      }
    }
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectReferences(F f)
  {
    injectVariableReferences(f);
    injectFunctionReferences(f);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectVariableReferences(F f)
  {
    assert f != null : "f is null";
    if (Expression.trace)
    {
      log.debug(String.format("Context(#%s).injectVariableReferences(f=%s)",
                              System.identityHashCode(this),
                              f.getClass().getName()));
    }
    variableMap().entrySet().forEach(entry ->
    {
      var variableName = entry.getKey();

      try
      {
        Named value = variables.get(variableName);
        if (value != null)
        {
          setFieldValue(f.getClass(), f, variableName, value, false);
        }
      }
      catch (Exception e)
      {
        wrapOrThrow(String.format("variable=%s", variableName), e);
      }
    });
  }

  public void mergeFrom(Context context)
  {
    if (context == null)
    {
      return;
    }
    variables.putAll(context.variables);
    functions.putAll(context.functions);
  }

  public void populateFunctionReferenceGraph()
  {
    for (var entry : functions.entrySet())
    {
      var          functionName    = entry.getKey();
      var          functionMapping = entry.getValue();

      Dependency   dependency      = new Dependency(functionMapping);

      List<String> dependencies    = dependency.dependencies;
      if (functionMapping.expression != null
                    && functionMapping.expression.referencedFunctions != null)
      {
        dependencies.addAll(functionMapping.expression.referencedFunctions.keySet()
                                                                          .stream()
                                                                          .filter(name -> !name.equals(functionName))
                                                                          .toList());
      }

      functionReferenceGraph.put(functionName, dependency);
    }
  }

  public FunctionMapping<?, ?, ?> registerFunction(String string, Function<?, ?> func)
  {
    return registerFunctionMapping(string, func, func.domainType(), func.coDomainType());
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         registerFunctionMapping(String functionName,
                                 F function,
                                 Class<?> domainType,
                                 Class<?> coDomainType)
  {
    assert function != null : "function cannot be null";
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
    // assert function != null : "function cannot be null";

    if (!replace && functions.containsKey(functionName))
    {
      throw new IllegalArgumentException(format("a function named %s of class %s is already registered",
                                                functionName,
                                                function));
    }

    var mapping = new FunctionMapping<D, R, F>();
    mapping.expression       = expression;
    mapping.expressionString = expressionString;
    mapping.functionName     = functionName;
    mapping.domain           = domainType;
    mapping.coDomain         = coDomainType;
    mapping.instance         = function;
    mapping.functionClass    = functionClass;
    functions.put(functionName, mapping);

    if (Expression.trace)
    {
      log.debug(String.format("\n\nid=%s: registerFunctionMapping( functionName = %s, function = %s, domainType=%s, coDomainType=%s, functionClass=%s, expression=%s, expressionString=%s )\nmapping={}\n",
                              System.identityHashCode(this),
                              functionName,
                              function,
                              domainType,
                              coDomainType,
                              functionClass,
                              expression,
                              expressionString,
                              mapping));
    }

    return mapping;
  }

  public <R> FunctionMapping<Integer, R, Sequence<R>> registerSequence(String name, Sequence<R> seq)
  {
    return registerFunctionMapping(name, seq, seq.domainType(), seq.coDomainType());
  }

  public <R extends Named> R registerVariable(R var)
  {
    return registerVariable(var.getName(), var);
  }

  public <R extends Named> R registerVariable(String name, R variable)
  {
    assert name != null : "name cannot be null";
    assert variable != null : "variable cannot be null";

    Named existing = null;
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
    variableMap().put(name, variable);
    return variable;
  }

  public Context resetClassLoader()
  {
    classLoader = new ExpressionClassLoader(this);
    return this;
  }

  public String saveDependencyGraph(List<Dependency> sortedFunctions)
  {
    String                      filename  = null;
    HashMap<String, Dependency> sortedMap = new HashMap<>();
    for (var dependency : sortedFunctions)
    {
      sortedMap.put(dependency.variableName,
                    functionReferenceGraph.getOrDefault(dependency.variableName,
                                                        new Dependency(dependency)));
    }
    if (sortedMap.values().stream().mapToInt(f -> f.dependencies.size()).sum() > 0)
    {
      filename = sortedMap.keySet().stream().collect(Collectors.joining()) + ".dot";
      TopologicalSorter.saveToDotFile(TopologicalSorter.toDotFormatReversed(sortedMap), filename);
    }
    return filename;
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         void
         setFieldValue(Class<?> compiledClass,
                       F f,
                       String variableName,
                       Object value,
                       boolean overwrite)
  {
    Class<?> functionClass = f.getClass();
    assert functionClass.equals(compiledClass) : String.format("functionClass = %s != compiledClass = %s\n",
                                                               functionClass,
                                                               compiledClass);

    if (Expression.trace)
    {
      log.debug(String.format("#%s.setFieldValue(compiledClass=%s,\n this=#%s\n variableName=%s,\n value=%s,\n overwrite=%s)\n",
                              System.identityHashCode(this),
                              compiledClass,
                              System.identityHashCode(f),
                              variableName,
                              value,
                              overwrite));
    }
    java.lang.reflect.Field field;
    try
    {
      field = compiledClass.getField(variableName);
      field.set(f, value);
    }
    catch (Throwable e)
    {
      wrapOrThrow("threw "
                  + e.toString()
                  + " setting field '"
                  + variableName
                  + "' in "
                  + compiledClass,
                  e);
    }
  }

  @Override
  public String toString()
  {
    return String.format("Context(#%s)[functions=%s,variables=%s]",
                         System.identityHashCode(this),
                         functions.keySet(),
                         variableMap().keySet());
  }

  public Stream<OrderedPair<String, Class<?>>> variableClassStream()
  {
    return variableEntryStream().filter(entry -> entry.getValue() != null)
                                .map(entry -> new OrderedPair<>(entry.getKey(),
                                                                entry.getValue().getClass()));
  }

  public Collection<Entry<String, Named>> variableEntries()
  {
    return variableMap().entrySet();
  }

  public Map<String, Named> variableMap()
  {
    return variables;
  }

  public Stream<Entry<String, Named>> variableEntryStream()
  {
    return variableEntries().stream();
  }

  public void rename(String oldName, String newName)
  {
    if (oldName == null || newName == null)
    {
      throw new IllegalArgumentException("Old name and new name cannot be null");
    }

    if (oldName.equals(newName))
    {
      return; // Nothing to do
    }

    // Check if old variable exists
    Named variable = variables.get(oldName);
    if (variable == null)
    {
      throw new IllegalArgumentException(format("Variable '%s' does not exist in context",
                                                oldName));
    }

    // Check if new name conflicts with existing variable
    if (variables.containsKey(newName))
    {
      throw new IllegalArgumentException(format("Cannot rename '%s' to '%s': a variable with that name already exists",
                                                oldName,
                                                newName));
    }

    // Remove old entry
    variables.remove(oldName);

    // Update the Named object's name
    variable.setName(newName);

    // Add with new name
    variables.put(newName, variable);

    if (Expression.trace)
    {
      log.debug(String.format("Context(#%s).rename(oldName=%s, newName=%s) completed successfully",
                              System.identityHashCode(this),
                              oldName,
                              newName));
    }
  }

}
