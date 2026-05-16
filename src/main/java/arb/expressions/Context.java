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
  public Context let(String name, Class<?> type)
  {
    assert false : "enable     case \"R\":\n"
                   + "      return new LommelPolynomialNode<>(this);\n"
                   + " with some new let functionality so the namespace doesnt get too cluttered up.. the aforemented case should be handled in Expression#resolveFunction for instance";
    return this;
  }

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

  public boolean disableLommelPolynomials;

  /**
   * Optional package identity for this Context. When non-null, every generated
   * class produced by an {@link Expression} bound to this Context is emitted
   * under this dotted package, giving it a bytecode-level identity distinct
   * from classes in other Contexts. This is the prerequisite for the {@code
   * mergeFrom} feature described in #1024 — contexts with different package
   * names can never have a genuine class-identity clash, because
   * {@code arb.jacobi.P} and {@code arb.riccati.P} are different JVM classes.
   *
   * <p>Callers that represent named mathematical objects pass the package at
   * construction time, e.g. {@code new Context("arb.jacobi")}. Contexts
   * constructed via the no-arg ctor keep the legacy unpackaged identity for
   * backwards compatibility.
   */
  public String packageName = null;

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

  /**
   * Construct a Context with a dotted package identity. Every generated class
   * produced under this Context will be emitted into {@code packageName} at
   * the bytecode level. See {@link #packageName} for rationale.
   *
   * @param packageName dotted package (e.g. {@code "arb.jacobi"}), or null
   *                    for the legacy unpackaged behaviour
   */
  public Context(String packageName)
  {
    this();
    this.packageName = packageName;
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

  /**
   * Phase-two wiring helper invoked from generated {@code initialize()} bytecode:
   * returns the canonical {@link FunctionMapping#instance} for
   * {@code functionName}, or {@code null} when the registry has no entry or the
   * entry has not yet been instantiated. The generated code uses a {@code null}
   * return as a fallback signal to allocate a fresh operand.
   */
  public Function<?, ?> lookupFunctionInstance(String functionName)
  {
    FunctionMapping<?, ?, ?> mapping = functions.get(functionName);
    return mapping == null ? null : mapping.instance;
  }

  @SuppressWarnings("unchecked")
  public <R extends Named> R getVariable(String name)
  {
    return (R) variables.get(name);
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectFunctionReferences(F f)
  {
    Class<?> functionClass = f.getClass();
    functions.forEach((functionName, functionMapping) ->
    {
      if (functionMapping.instance == null)
      {
        return;
      }
      // Look up the field by name AND type-compatibility. A name shared
      // between the {@code variables} and {@code functions} namespaces
      // (e.g. a Real {@code r} variable and a {@code r} ComplexFunction)
      // can produce TWO public fields with the same name in one compiled
      // class — Java permits this at the bytecode level since field
      // identity is name+descriptor. {@link Class#getField(String)} would
      // return an arbitrary one of them. Enumerate all public fields and
      // pick the one whose declared type accepts this function instance;
      // the variable-side injector handles the other.
      java.lang.reflect.Field field = findAssignableField(functionClass, functionName, functionMapping.instance.getClass());
      if (field == null)
      {
        return; // expression body never references this function in its function-namespace role
      }
      try
      {
        field.set(f, functionMapping.instance);
      }
      catch (IllegalAccessException iae)
      {
        Utensils.wrapOrThrow("failed to set function field " + functionName + " on " + functionClass.getName(), iae);
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

  /**
   * Find the public field of {@code clazz} whose name is {@code name} and whose
   * declared type accepts {@code valueClass}. Returns {@code null} if none
   * exists.
   *
   * <p>
   * Used by all three reference injectors. The compiler may emit two public
   * fields with the same name when an identifier is bound on both the
   * {@code variables} and {@code functions} sides of a Context: Java field
   * identity at the bytecode level is name+descriptor, so two fields named
   * {@code r} of types {@code Real} and {@code RealFunction} coexist.
   * {@link Class#getField(String)} returns an arbitrary one; this helper filters
   * by type so the right side gets injected.
   */
  protected static java.lang.reflect.Field findAssignableField(Class<?> clazz, String name, Class<?> valueClass)
  {
    return findAssignableField(clazz.getFields(), name, valueClass);
  }

  /**
   * Variant of {@link #findAssignableField(Class, String, Class)} that takes a
   * pre-fetched array of fields, so the caller can amortize the
   * {@link Class#getFields()} call across many variable lookups for the
   * same class.
   */
  protected static java.lang.reflect.Field findAssignableField(java.lang.reflect.Field[] fields, String name, Class<?> valueClass)
  {
    for (java.lang.reflect.Field field : fields)
    {
      if (field.getName().equals(name) && field.getType().isAssignableFrom(valueClass))
      {
        return field;
      }
    }
    return null;
  }

  public <D, R, F extends Function<? extends D, ? extends R>> void injectVariableReferences(F f)
  {
    assert f != null : "f is null";
    if (Expression.trace)
    {
      log.debug(String.format("Context(#%s).injectVariableReferences(f=%s) variables={}", System.identityHashCode(this), f.getClass().getName(), variables));
    }
    Class<?> compiledClass = f.getClass();
    // Locate the owning FunctionMapping to use its cached getFields()
    // array. injectVariableReferences runs during instantiate(), BEFORE
    // express() assigns the new instance to mapping.instance, so identity
    // lookup by {@code mapping.instance == f} may miss; fall back to
    // class-identity match in that case (the just-instantiated f is the
    // first instance of that compiled class).
    java.lang.reflect.Field[] resolvedFields = null;
    for (FunctionMapping<?, ?, ?> mapping : functions.values())
    {
      if (mapping.instance == f || (mapping.instance != null && mapping.instance.getClass() == compiledClass))
      {
        // Prime the cache via the mapping if we can; the cache is keyed
        // on the mapping's eventual instance class, which is what we just
        // matched on.
        try
        {
          resolvedFields = mapping.instance == null ? compiledClass.getFields() : mapping.getInstanceFields();
        }
        catch (Throwable t)
        {
          resolvedFields = compiledClass.getFields();
        }
        break;
      }
    }
    if (resolvedFields == null)
    {
      resolvedFields = compiledClass.getFields();
    }
    final java.lang.reflect.Field[] fields = resolvedFields;

    variableMap().entrySet().forEach(entry ->
    {
      var   variableName = entry.getKey();
      Named value        = variables.get(variableName);
      if (value == null)
      {
        return;
      }
      // Look up the field by name AND type-compatibility. Two Context
      // entries can legitimately share a name when one is a Variable
      // (registered in {@code variables}) and the other is a Function
      // (registered in {@code functions}); the compiler may emit TWO
      // public fields with that name (different types) in one compiled
      // class. {@link Class#getField} returns an arbitrary one — instead
      // enumerate all public fields and pick the one whose declared
      // type accepts this variable's runtime value.
      java.lang.reflect.Field field = findAssignableField(fields, variableName, value.getClass());
      if (field == null)
      {
        return; // expression body never references this variable in its variable-namespace role
      }
      try
      {
        field.set(f, value);
      }
      catch (IllegalAccessException iae)
      {
        Utensils.wrapOrThrow("failed to set variable field " + variableName + " on " + compiledClass.getName(), iae);
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

  /**
   * Conflict-resolution policy for {@link #mergeFrom(Context, ConflictPolicy)}.
   *
   * <ul>
   * <li>{@link #PREFER_THIS}    — keep the existing binding in {@code this};
   *                                drop the incoming one silently.</li>
   * <li>{@link #PREFER_OTHER}   — overwrite the existing binding in {@code this}
   *                                with the incoming one.</li>
   * <li>{@link #RENAME_INCOMING}— rename the incoming binding (variable or
   *                                function) and the references to it inside the
   *                                incoming Context, then add the renamed entry.
   *                                Full AST-and-source rewrite of the incoming
   *                                Expressions is not yet implemented — see
   *                                #1024 follow-up. Today the policy throws
   *                                {@link UnsupportedOperationException} so
   *                                callers can detect that they need to land on
   *                                a non-clashing name before merging.</li>
   * <li>{@link #ERROR}          — throw a {@link CompilerException} on any
   *                                conflict (legacy behavior).</li>
   * </ul>
   */
  public enum ConflictPolicy
  {
    PREFER_THIS, PREFER_OTHER, RENAME_INCOMING, ERROR
  }

  /**
   * A single rename, recorded in {@link MergeReport#renamed()}.
   */
  public record Renamed(String oldName, String newName)
  {
  }

  /**
   * A single failure, recorded in {@link MergeReport#failures()} when the policy
   * is {@link ConflictPolicy#ERROR} or a rename is impossible.
   */
  public record MergeFailure(String name, String reason)
  {
  }

  /**
   * Outcome of a {@link #mergeFrom(Context, ConflictPolicy)} call.
   *
   * @param coalesced names whose binding matched identically and was reused
   * @param renamed   names that were renamed-on-import
   * @param imported  names new to {@code this}
   * @param failures  non-empty only with {@link ConflictPolicy#ERROR} or an
   *                  unrenameable clash
   */
  public record MergeReport(java.util.Set<String> coalesced,
                            java.util.List<Renamed> renamed,
                            java.util.Set<String> imported,
                            java.util.List<MergeFailure> failures)
  {
  }

  /**
   * Merge another Context's variables and function mappings into this one.
   *
   * <p>
   * Identical bindings — same name bound to the very same instance — are
   * coalesced silently (idempotent merge). Different bindings — same name bound
   * to a different instance — throw a {@link CompilerException} with the names,
   * types, and identities of both sides so callers can disambiguate.
   * </p>
   *
   * <p>
   * Equivalent to {@code mergeFrom(context, ConflictPolicy.ERROR)} (the legacy
   * behavior). A null argument is a no-op.
   * </p>
   */
  public void mergeFrom(Context context)
  {
    mergeFrom(context, ConflictPolicy.ERROR);
  }

  /**
   * Merge another Context's variables and function mappings into this one,
   * resolving conflicts according to {@code policy}.
   *
   * <p>
   * Iterates the incoming Context's variables map, then its functions map.
   * For each entry:
   * </p>
   * <ul>
   * <li>If {@code this} has no binding under that name, add the incoming entry
   *     directly (imported).</li>
   * <li>If {@code this} has the same instance bound under that name (reference
   *     equality), do nothing (coalesced).</li>
   * <li>Otherwise apply {@code policy}:
   *     {@link ConflictPolicy#PREFER_THIS} drops the incoming entry;
   *     {@link ConflictPolicy#PREFER_OTHER} overwrites the existing one;
   *     {@link ConflictPolicy#RENAME_INCOMING} is not yet implemented and
   *     throws {@link UnsupportedOperationException} (see #1024 follow-up);
   *     {@link ConflictPolicy#ERROR} throws {@link CompilerException}.</li>
   * </ul>
   *
   * <p>
   * A null {@code context} is a no-op. A null {@code policy} defaults to
   * {@link ConflictPolicy#ERROR}.
   * </p>
   *
   * @return a {@link MergeReport} describing what happened
   */
  public MergeReport mergeFrom(Context context, ConflictPolicy policy)
  {
    java.util.Set<String> coalesced = new java.util.LinkedHashSet<>();
    java.util.List<Renamed> renamed = new java.util.ArrayList<>();
    java.util.Set<String> imported = new java.util.LinkedHashSet<>();
    java.util.List<MergeFailure> failures = new java.util.ArrayList<>();

    if (context == null)
    {
      return new MergeReport(coalesced, renamed, imported, failures);
    }
    ConflictPolicy effectivePolicy = policy == null ? ConflictPolicy.ERROR : policy;

    // Variables
    for (var entry : context.variables.entrySet())
    {
      String name     = entry.getKey();
      Named  incoming = entry.getValue();
      Named  existing = variables.get(name);
      if (existing == null)
      {
        variables.put(name, incoming);
        imported.add(name);
        continue;
      }
      if (existing == incoming)
      {
        coalesced.add(name);
        continue;
      }
      switch (effectivePolicy)
      {
      case PREFER_THIS:
        // drop incoming silently
        break;
      case PREFER_OTHER:
        variables.put(name, incoming);
        break;
      case RENAME_INCOMING:
        throw new UnsupportedOperationException(format("RENAME_INCOMING is not yet implemented for variable '%s'. "
                                                       + "Full AST/source rewrite of the incoming Expressions is a follow-up to #1024. "
                                                       + "Use PREFER_THIS or PREFER_OTHER, or rename on the call site before merging.",
                                                       name));
      case ERROR:
      default:
        throw new CompilerException(format("Cannot merge: variable '%s' is already bound in this Context to a different instance.\n"
                                           + "  existing: %s @%d (type %s)\n"
                                           + "  incoming: %s @%d (type %s)\n",
                                           name,
                                           existing,
                                           System.identityHashCode(existing),
                                           existing.getClass().getName(),
                                           incoming,
                                           System.identityHashCode(incoming),
                                           incoming.getClass().getName()));
      }
    }

    // Functions
    for (var entry : context.functions.entrySet())
    {
      String                   name     = entry.getKey();
      FunctionMapping<?, ?, ?> incoming = entry.getValue();
      FunctionMapping<?, ?, ?> existing = functions.get(name);
      if (existing == null)
      {
        functions.put(name, incoming);
        imported.add(name);
        continue;
      }
      if (existing == incoming)
      {
        coalesced.add(name);
        continue;
      }
      switch (effectivePolicy)
      {
      case PREFER_THIS:
        break;
      case PREFER_OTHER:
        functions.put(name, incoming);
        break;
      case RENAME_INCOMING:
        throw new UnsupportedOperationException(format("RENAME_INCOMING is not yet implemented for function '%s'. "
                                                       + "Full AST/source rewrite of the incoming Expressions is a follow-up to #1024. "
                                                       + "Use PREFER_THIS or PREFER_OTHER, or rename on the call site before merging.",
                                                       name));
      case ERROR:
      default:
        throw new CompilerException(format("Cannot merge: function '%s' is already bound in this Context to a different mapping.\n"
                                           + "  existing: %s @%d\n"
                                           + "  incoming: %s @%d\n",
                                           name,
                                           existing,
                                           System.identityHashCode(existing),
                                           incoming,
                                           System.identityHashCode(incoming)));
      }
    }

    return new MergeReport(coalesced, renamed, imported, failures);
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
         declare(String functionName, Class<? extends D> domainType, Class<? extends R> coDomainType, Class<? extends F> functionClass)
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

  public <R extends Named> Context registerVariables(R... vars)
  {
    for ( R rvar : vars )
    {
      registerVariable(rvar);
    }
    return this;
  }
  
  public <R extends Named> R registerVariable(R var)
  {
    if (Expression.trace)
    {
      log.debug("#{}: registerVariable({}={})", System.identityHashCode(this),var.getName(), var);
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
      try
      {
        field = compiledClass.getField(variableName);
      }
      catch (NoSuchFieldException nsfe)
      {
        field = compiledClass.getDeclaredField(variableName);
        field.setAccessible(true);
      }
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
                  + Stream.of(compiledClass.getDeclaredFields()).map(hmm -> hmm.getName()).toList(),
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

  public Context disableLommelPolynomials()
  {
    disableLommelPolynomials = true;
    return this;
  }

 

}
