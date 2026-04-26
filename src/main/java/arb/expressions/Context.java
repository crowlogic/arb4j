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

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.context.Dependency;
import arb.expressions.context.FunctionMappings;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.integer.Sequence;
import arb.utensils.Utensils;
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
public class Context implements
                     AutoCloseable
{
  @SuppressWarnings("unchecked")
  protected <D, C, F extends Function<? extends D, ? extends C>> Expression<D, C, F> getFunctionExpression(String functionName)
  {
    FunctionMapping<D, C, F> mapping = getFunctionMapping(functionName);

    if (mapping == null)
    {
      throw new UndefinedReferenceException(functionName + " not found in " + this);
    }

    return mapping.getExpression();
  }

  /**
   * Set bounds on a named variable. Dispatches to the appropriate type's
   * setBounds method. Returns this for chaining.
   *
   * @param varName        the name of the variable already registered in this
   *                       context
   * @param lower          lower bound (int, converted to the variable's type)
   * @param lowerInclusive whether the lower bound is closed
   * @param upper          upper bound (int, converted to the variable's type)
   * @param upperInclusive whether the upper bound is closed
   * @return this
   */
  public Context setBounds(String varName, int lower, boolean lowerInclusive, int upper, boolean upperInclusive)
  {
    Named var = variables.get(varName);
    assert var != null : "no variable named '" + varName + "' in context";
    if (var instanceof Real r)
    {
      r.setBounds(lower, lowerInclusive, upper, upperInclusive);
    }
    else if (var instanceof arb.Integer i)
    {
      i.setBounds(lower, lowerInclusive, upper, upperInclusive);
    }
    else
    {
      throw new UnsupportedOperationException("setBounds not supported for " + var.getClass().getSimpleName());
    }
    return this;
  }

  /**
   * Set arbitrary-precision bounds on a named Real variable. Returns this for
   * chaining.
   *
   * @param varName        the name of the variable already registered in this
   *                       context
   * @param lower          lower bound as a {@link Real}
   * @param lowerInclusive whether the lower bound is closed
   * @param upper          upper bound as a {@link Real}
   * @param upperInclusive whether the upper bound is closed
   * @return this
   */
  public Context setBounds(String varName, Real lower, boolean lowerInclusive, Real upper, boolean upperInclusive)
  {
    Named variable = variables.get(varName);
    assert variable != null : "no variable named '" + varName + "' in context";
    if (variable instanceof Real realVariable)
    {
      realVariable.setBounds(lower, lowerInclusive, upper, upperInclusive);
    }
    else
    {
      throw new UnsupportedOperationException(varName + " is " + variable.getClass().getSimpleName() + ", not Real");

    }
    return this;
  }

  static
  {
    System.loadLibrary("arblib");
  }

  public ExpressionClassLoader                classLoader                  = new ExpressionClassLoader(this);

  public Map<String, Dependency>              functionReferenceGraph       = new HashMap<String, Dependency>();

  public final FunctionMappings               functions;

  public final HashMap<String, AtomicInteger> intermediateVariableCounters = new HashMap<>();

  private final Logger                        log                          = LoggerFactory.getLogger(Context.class);

  public boolean                              saveClasses                  = false;

  public final ObservableMap<String, Named>   variables;

  public ExpressionClassLoader getClassLoader()
  {
    if (classLoader == null)
    {
      classLoader = new ExpressionClassLoader(this);
    }

    return classLoader;
  }

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

  public <D, R, F extends Function<? extends D, ? extends R>> FunctionMapping<D, R, F> getFunctionMapping(String functionName)
  {
    FunctionMapping<D, R, F> functionMapping = functions.get(functionName);
    return functionMapping;
  }

  @SuppressWarnings("unchecked")
  public <R extends Named> R getVariable(String name)
  {
    return (R) variables.get(name);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectFunctionReferences(F f)
  {
    var      fields        = getFields(f);

    Class<?> functionClass = f.getClass();
    functions.forEach((functionName, functionMapping) ->
    {
      if (functionMapping.instance != null && fields.contains(functionName))
      {
        setFieldValue(functionClass, f, functionName, functionMapping.instance);
      }
    });

  }

  /**
   * Invoked from generated bytecode at the end of an enclosing class's
   * {@code initialize()} body, immediately after a nested
   * {@link arb.expressions.nodes.nary.NAryOperationNode} operand instance has
   * been allocated and had its Context-registered variables propagated. Walks
   * the {@code contextInstance.functions} registry and, for every entry whose
   * {@link FunctionMapping#instance} is non-null and whose name matches a
   * public field on {@code operandInstance}, reflectively assigns the
   * registry's instance into that field.
   *
   * <p>Without this call the operand's own {@code initialize()} executes a
   * {@code if (this.<g> == null) this.<g> = new <g>()} guard that allocates a
   * fresh, un-injected, empty-cache copy of every Context-registered function
   * the operand body references. For mutually-recursive sequences such as
   * {@code a ↔ S} in the rough-Heston Müntz recurrence, the freshly
   * allocated copy then allocates fresh copies of <em>its</em> dependencies in
   * a chain that descends without bound, exhausting the heap before any
   * memoization cache can short-circuit the recursion. Pre-injecting from the
   * Context registry breaks the chain by reusing the single live instance for
   * each named function, restoring sharing of the memoization cache that the
   * compiled {@code evaluate()} body relies on.
   *
   * <p>Static and accepting {@link Object} so the bytecode emitter does not
   * need to know the operand's compile-time type — ASM
   * {@code INVOKESTATIC} with descriptor
   * {@code (Ljava/lang/Object;Larb/expressions/Context;)V} is sufficient.
   *
   * @param operandInstance an operand class instance whose function fields
   *                        need to be wired from the context
   * @param contextInstance the live Context whose functions registry holds
   *                        the already-instantiated dependents; may be
   *                        {@code null}, in which case the call is a no-op
   */
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public static void injectFunctionReferencesIntoOperand(Object operandInstance, Context contextInstance)
  {
    if (operandInstance == null || contextInstance == null)
    {
      return;
    }
    Class<?>      operandClass = operandInstance.getClass();
    java.util.HashSet<String> fields;
    try
    {
      fields = new java.util.HashSet<>(java.util.stream.Stream.of(operandClass.getFields())
                                                              .map(field -> field.getName())
                                                              .toList());
    }
    catch (NoClassDefFoundError ncdfe)
    {
      Utensils.wrapOrThrow("classLoader=" + operandClass.getClassLoader(), ncdfe);
      return;
    }
    contextInstance.functions.forEach((functionName, functionMapping) ->
    {
      if (functionMapping.instance != null && fields.contains(functionName))
      {
        try
        {
          java.lang.reflect.Field field = operandClass.getField(functionName);
          if (field.get(operandInstance) == null)
          {
            field.set(operandInstance, functionMapping.instance);
          }
        }
        catch (NoSuchFieldException nsfe)
        {
          // operand has no such public field — nothing to wire
        }
        catch (IllegalAccessException iae)
        {
          Utensils.wrapOrThrow("failed to set operand field " + functionName + " on " + operandClass.getName(), iae);
        }
      }
    });
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectReferences(F f)
  {
    injectVariableReferences(f);
    injectFunctionReferences(f);
    injectContextReference(f);
  }

  protected <D, R, F extends Function<? extends D, ? extends R>> void injectContextReference(F f)
  {
    setFieldValue(f.getClass(), f, "context", this);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectVariableReferences(F f)
  {
    assert f != null : "f is null";
    if (Expression.trace)
    {
      log.debug(String.format("Context(#%s).injectVariableReferences(f=%s) variables={}", System.identityHashCode(this), f.getClass().getName(), variables));
    }
    var fields = getFields(f);

    variableMap().entrySet().forEach(entry ->
    {
      var   variableName = entry.getKey();
      Named value        = variables.get(variableName);
      if (value != null && fields.contains(variableName))
      {
        setFieldValue(f.getClass(), f, variableName, value);
      }
    });
  }

  protected <D, R, F extends Function<? extends D, ? extends R>> HashSet<String> getFields(F f)
  {
    try
    {
      var fields = new HashSet<>(Stream.of(f.getClass().getFields()).map(field -> field.getName()).toList());
      return fields;
    }
    catch (NoClassDefFoundError noClassDefinitionFoundError)
    {
      var classLoader = f.getClass().getClassLoader();
      Utensils.wrapOrThrow("classLoader=" + classLoader, noClassDefinitionFoundError);
      return null;
    }
  }

  public void mergeFrom(Context context)
  {
    if (context == null)
    {
      return;
    }
    for (String variable : context.variables.keySet())
    {
      if (variables.containsKey(variable))
      {
        throw new CompilerException("TODO: handle merging of contexts with conflicting variable names by renaming inserted variables because "
                                    + variable
                                    + " already exists in "
                                    + this);
      }
    }
    for (String variable : context.functions.keySet())
    {
      if (functions.containsKey(variable))
      {
        throw new CompilerException("TODO: handle merging of contexts with conflicting function names by renaming inserted functions because "
                                    + variable
                                    + " already exists in "
                                    + this);
      }
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

      List<String> dependencies    = dependency.dependsOn;
      if (functionMapping.expression != null && functionMapping.expression.getReferencedFunctions() != null)
      {
        dependencies.addAll(functionMapping.expression.getReferencedFunctions().keySet().stream().filter(name -> !name.equals(functionName)).toList());
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
         registerFunctionMapping(String functionName, Class<? extends D> domainType, Class<? extends R> coDomainType, Class<? extends F> functionClass)
  {
    return registerFunctionMapping(functionName, null, domainType, coDomainType, functionClass, true, null, null);
  }

  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         registerFunctionMapping(String functionName, F function, Class<?> domainType, Class<?> coDomainType)
  {
    return registerFunctionMapping(functionName, function, domainType, coDomainType, function.getClass(), true, null, null);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> FunctionMapping<D, R, F> registerFunctionMapping(String functionName,
                                                                                                               F function,
                                                                                                               Class<?> domainType,
                                                                                                               Class<?> coDomainType,
                                                                                                               Class<?> functionClass,
                                                                                                               boolean replace,
                                                                                                               Expression<D, R, F> expression,
                                                                                                               String expressionString)
  {
    FunctionMapping<D, R, F> alreadyMappedFunctionMapping = functions.get(functionName);
    FunctionMapping<D, R, F> mapping;
    if (alreadyMappedFunctionMapping != null)
    {
      if (!replace)
      {
        throw new IllegalArgumentException(format("a function named %s of class %s is already registered", functionName, function));
      }
      // replace=true: actually overwrite the mapping's content. Keep the
      // existing FunctionMapping identity (callers may hold references) but
      // refresh expression/instance/functionClass/domain/coDomain with the
      // freshly-provided values. Previously this branch silently kept the
      // stale data and only updated expressionString below, which left
      // mapping.instance pointing to a class defined by a discarded
      // ExpressionClassLoader. After a subsequent Context.resetClassLoader()
      // and recompile, the outer class's field for this operand was typed by
      // the NEW loader while mapping.instance was still the OLD class, so
      // injectFunctionReferences' Field.set threw IllegalArgumentException
      // ("Can not set X field ... to X") because the two Class<?> objects
      // had the same FQN but different defining ClassLoaders.
      mapping = alreadyMappedFunctionMapping;
      if (expression != null)
      {
        mapping.expression = expression;
      }
      if (function != null)
      {
        mapping.instance = function;
      }
      if (functionClass != null)
      {
        mapping.functionClass = functionClass;
      }
      if (domainType != null)
      {
        mapping.domain = domainType;
      }
      if (coDomainType != null)
      {
        mapping.coDomain = coDomainType;
      }
      // The cached field descriptor derives from functionClass; invalidate it
      // so the next functionFieldDescriptor() call recomputes from the fresh
      // class rather than returning the stale descriptor string.
      mapping.invalidateDescriptorCache();
    }
    else
    {
      mapping               = new FunctionMapping<D, R, F>();
      mapping.expression    = expression;
      mapping.functionName  = functionName;
      mapping.domain        = domainType;
      mapping.coDomain      = coDomainType;
      mapping.instance      = function;
      mapping.functionClass = functionClass;
      functions.put(functionName, mapping);
      // Do NOT pre-populate compiledClasses with the interface here. The concrete
      // compiled class will be registered by ExpressionClassLoader.findClass once
      // the operand expression bytecode is actually compiled and defined.
    }
    int colonIndex = -1;
    if (expressionString != null && (colonIndex = expressionString.indexOf(':')) != -1)
    {
      expressionString = expressionString.substring(colonIndex + 1);
    }
    mapping.expressionString = expressionString;

    if (Expression.trace)
    {
      log.debug(String.format("id=%s: registerFunctionMapping( functionName = %s, function = %s, domainType=%s, coDomainType=%s, functionClass=%s, expression=%s, expressionString=%s )\nmapping={}\n",
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
    if (Expression.trace)
    {
      log.debug("#{}: registerVariable(var={})", System.identityHashCode(this), var);
    }
    return registerVariable(var.getName(), var);
  }

  public <R extends Named> R registerVariable(String name, R variable)
  {
    assert name != null : "name cannot be null";
    assert variable != null : "variable cannot be null";

    if (variables.get(name) != null)
    {
      throw new CompilerException(format("A variable named %s of type %s having value %s is already registered in %s\n",
                                         name,
                                         variable.getClass(),
                                         variable,
                                         this));

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
      sortedMap.put(dependency.variableName, functionReferenceGraph.getOrDefault(dependency.variableName, new Dependency(dependency)));
    }
    if (sortedMap.values().stream().mapToInt(f -> f.dependsOn.size()).sum() > 0)
    {
      filename = sortedMap.keySet().stream().collect(Collectors.joining()) + ".dot";
      Utensils.saveStringToFile(Utensils.toDotFormatReversed(sortedMap), filename);
    }
    return filename;
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void setFieldValue(Class<?> compiledClass, F f, String variableName, Object value)
  {
    Class<?> functionClass = f.getClass();
    assert functionClass.equals(compiledClass) : String.format("functionClass = %s != compiledClass = %s\n", functionClass, compiledClass);

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
                  + compiledClass
                  + " which has fields "
                  + Stream.of(compiledClass.getFields()).map(hmm -> hmm.getName()).toList(),
                  e);
    }
  }

  @Override
  public String toString()
  {
    return String.format("Context(#%s)[functions=%s,variables=%s]", System.identityHashCode(this), functions.keySet(), variableMap().keySet());
  }

  public Stream<OrderedPair<String, Class<?>>> variableClassStream()
  {
    return variableEntryStream().filter(entry -> entry.getValue() != null)
                                .map(entry -> new OrderedPair<>(entry.getKey(),
                                                                entry.getValue().getClass()));
  }

  public Collection<Entry<String, Named>> variableEntries()
  {
    return Collections.unmodifiableCollection(variables.entrySet());
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
      return;
    }

    Named variable = variables.get(oldName);
    if (variable == null)
    {
      throw new IllegalArgumentException(format("Variable '%s' does not exist in context", oldName));
    }

    if (variables.containsKey(newName))
    {
      throw new IllegalArgumentException(format("Cannot rename '%s' to '%s': a variable with that name already exists", oldName, newName));
    }

    variables.remove(oldName);
    variable.setName(newName);
    variables.put(newName, variable);

    if (Expression.trace)
    {
      log.debug(String.format("Context(#%s).rename(oldName=%s, newName=%s) completed successfully", System.identityHashCode(this), oldName, newName));
    }
  }

  @Override
  public void close()
  {
    functions.values().forEach(f ->
    {
      if (f.instance != null)
      {
        f.instance.close();
      }
    });
    variables.values().forEach(v ->
    {
      if (v instanceof AutoCloseable autoCloseable)
      {
        try
        {
          autoCloseable.close();
        }
        catch (Exception e)
        {
          Utensils.wrapOrThrow(e);
        }
      }
    });
  }

  public String toStringExtended()
  {
    return toString()
                  + functionEntryStream().map(entry -> "\n" + entry.getKey() + "=" + entry.getValue().getExpressionString()).collect(Collectors.joining(","));
  }

}
