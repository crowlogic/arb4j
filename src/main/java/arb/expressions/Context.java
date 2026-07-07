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
    NativeLibraryLoader.load("arblib");
  }

  // Lazy: a generated <init> allocates a Context that its parent's initialize
  // immediately overwrites, so the throwaway shouldn't build a class loader it
  // never uses. Access via getClassLoader().
  public ExpressionClassLoader                classLoader                  = null;

  public Map<String, Dependency>              functionReferenceGraph       = new HashMap<String, Dependency>();

  public final FunctionMappings               functions;

  /**
   * Ownership manifest: every generated function instance constructed within
   * this Context registers itself here (in its own {@code initialize()}, via
   * {@link #own}) — the outer {@code express()} instance and every per-level
   * child/operand a recurrence lazily allocates alike. This Context is the sole
   * entity responsible for freeing them. A reference is not an ownership: an
   * instance owns only its own scratch; the children it references are owned by
   * this Context, not by the referrer. {@link #closeOwnedInstances()} frees each
   * instance's own scratch in one flat pass — never by traversing the reference
   * graph — so closing a cluster costs O(1) Java stack regardless of recurrence
   * depth, of self- vs mutual-recursion, or of cycles. Each instance is freed
   * exactly once (its {@code closed} flag enforces once), which is required
   * because arb {@code close()} is not safe to call twice.
   */
  public final java.util.List<Function<?, ?>> ownedInstances               = new java.util.ArrayList<>();

  private boolean                             closingOwnedInstances;

  public final HashMap<String, AtomicInteger> intermediateVariableCounters = new HashMap<>();

  // Static: a chain of N self-recursive instance Contexts shouldn't do N
  // LoggerFactory lookups at construction.
  private static final Logger                 log                          = LoggerFactory.getLogger(Context.class);

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
    maintainVariableContextMemberships();
  }

  /**
   * Keeps {@link Named#getRegisteredContexts()} in sync with membership in this
   * {@link Context}'s variable map: every variable added to {@link #variables}
   * (through any path — {@link #registerVariable(String, Named)},
   * {@link #mergeFrom(Context, ConflictPolicy)}, {@link #rename(String, String)},
   * constructors, …) records this Context via
   * {@link Named#registerContext(Context)}, and every variable removed forgets
   * it via {@link Named#unregisterContext(Context)} (unless it remains mapped
   * under another name). This is what lets a variable's
   * {@link AutoCloseable#close()} remove it from every Context it belongs to,
   * so that closed variables never remain registered in a Context.
   */
  private void maintainVariableContextMemberships()
  {
    variables.values().forEach(variable -> variable.registerContext(this));
    variables.addListener((javafx.collections.MapChangeListener<String, Named>) change ->
    {
      if (change.wasAdded())
      {
        change.getValueAdded().registerContext(this);
      }
      if (change.wasRemoved())
      {
        Named removed = change.getValueRemoved();
        if (removed != change.getValueAdded() && variables.values().stream().noneMatch(remaining -> remaining == removed))
        {
          removed.unregisterContext(this);
        }
      }
    });
  }

  /**
   * Removes every binding of the given variable (matched by identity, under
   * whatever name(s) it is registered) from this Context's variable map without
   * closing it. Invoked by {@link Named#removeFromRegisteredContexts()} when the
   * variable is closed, so that closed variables never remain registered here.
   * 
   * @param variable the variable to remove
   */
  public void removeVariable(Named variable)
  {
    variables.entrySet().removeIf(entry -> entry.getValue() == variable);
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
    maintainVariableContextMemberships();
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
    maintainVariableContextMemberships();
  }

  public Context(Map<String, Named> vars, FunctionMappings functions)
  {
    this.variables = FXCollections.observableMap(vars);
    this.functions = functions;
    maintainVariableContextMemberships();
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
    // Determine f's name in this context so we can detect mutual recursion.
    String targetFunctionName = null;
    for (var e : functions.entrySet())
    {
      if (e.getValue().instance == f)
      {
        targetFunctionName = e.getKey();
        break;
      }
    }
    final String finalTargetName = targetFunctionName;
    functions.forEach((functionName, functionMapping) ->
    {
      if (functionMapping.instance == null)
      {
        return;
      }
      // Never alias f.<name> = f: a function's own field of its own type is
      // the recursive-call receiver and must be a *different* instance, or
      // the recursion re-enters f and clobbers its scratch fields. Left null
      // here, generateSelfReference's `new <Self>()` fills it at initialize.
      if (functionMapping.instance == f)
      {
        return;
      }
      // Skip peers that participate in a reference cycle with f (any cycle
      // length). Wiring
      // the shared context singleton into f.<peer> would alias f.<peer> to an
      // instance whose `evaluating` flag can be true when f's own evaluate()
      // is running — firing the re-entrancy guard. The generated initialize()
      // method allocates an instance for each such peer, so leaving the
      // field null here is correct.
      if (finalTargetName != null
          && Expression.isTransitivelyReachable(functionMapping, finalTargetName, new java.util.HashSet<>()))
      {
        return;
      }
      // Match by name AND type: a name shared between the variables and
      // functions namespaces yields two same-named public fields (legal —
      // field identity is name+descriptor), so getField(name) is ambiguous.
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

  /**
   * Clear the memoization cache of every instantiated function in this
   * Context; each function's own per-instance reentrancy flag terminates any
   * cycle in the reference graph. The per-index caches are precision-blind, so
   * callers invoke this when a higher working precision is requested.
   */
  public void invalidateAllCaches()
  {
    // Flat, non-propagating pass over every instance this Context owns — each
    // drops only its OWN hoisted state (index cache / value-backing / static
    // precision). Because the manifest already contains every instance (the
    // outer functions AND every per-level child), propagation would be pure
    // redundancy: a propagating invalidateCache() on each registered function
    // re-cleared every shared node once per path to it (profiling a calibration
    // showed ~65% of wall-clock in this cascade, the same reference-graph
    // re-walk that overflowed close()). invalidateLocalCache() does not recurse,
    // so each cache is cleared exactly once and the cost is O(instances), not
    // O(functions × graph). Same teardown discipline as closeOwnedInstances().
    for (Function<?, ?> f : ownedInstances)
    {
      f.invalidateLocalCache();
    }
    // Hand-written functions registered via registerFunction (e.g. the
    // RoughHestonCumulantSequence κ/dκ) are not in the generated manifest; reach
    // them here. invalidateLocalCache() is a no-op for stateless ones and is
    // overridden by those that hold a cache, so this stays non-recursive too.
    functions.values().forEach(mapping ->
    {
      if (mapping.instance != null)
      {
        mapping.instance.invalidateLocalCache();
      }
    });
  }

  protected <D, R, F extends Function<? extends D, ? extends R>> void injectContextReference(F f)
  {
    setFieldValue(f.getClass(), f, "context", this);
  }

  /**
   * Allocates an instance of the function registered under {@code name}.
   * Used by the generated {@code initialize()} bytecode for forward-declared
   * peers — functions that were declared via {@code ctx.declare(...)} but not
   * yet expressed when the calling expression was compiled.
   *
   * <p>
   * Each allocated peer has its own {@code evaluating} flag and shares the
   * context and cache, so each evaluation level in a mutually-recursive cluster
   * uses a distinct instance and the re-entrancy guard cannot fire.
   *
   * @param name the function name registered in this context
   * @return an instance of the named function's concrete class, or
   *         {@code null} if the mapping has no instance yet
   */
  public Function<?, ?> allocatePeer(String name)
  {
    FunctionMapping<?, ?, ?> mapping = functions.get(name);
    if (mapping == null || mapping.instance == null)
    {
      return null;
    }
    try
    {
      Function<?, ?> peer = (Function<?, ?>) mapping.instance.getClass().getDeclaredConstructor().newInstance();
      injectContextReference(peer);
      // Share the canonical instance's IndexCache so this cluster member
      // memoizes into the same table as the context singleton — without this
      // each peer has its own empty cache and q(n) is recomputed
      // exponentially across all evaluation levels.
      for (java.lang.reflect.Field field : mapping.instance.getClass().getFields())
      {
        if (field.getName().equals("cache"))
        {
          field.set(peer, field.get(mapping.instance));
          break;
        }
      }
      return peer;
    }
    catch (ReflectiveOperationException e)
    {
      return null;
    }
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
   * <li>If {@code this} has no binding under that name, the incoming entry is
   *     added.</li>
   * <li>If {@code this} has the same instance bound under that name (reference
   *     equality), nothing happens.</li>
   * <li>Otherwise the policy is applied:
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
   * <p>
   * Successful merges return silently. Anything that needs caller attention —
   * a clash under ERROR, an unrenameable binding under RENAME_INCOMING — is
   * signalled by an exception, not a return value, so failures cannot be
   * silently dropped by ignoring a report object.
   * </p>
   */
  public void mergeFrom(Context context, ConflictPolicy policy)
  {
    if (context == null)
    {
      return;
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
        continue;
      }
      if (existing == incoming)
      {
        continue;
      }
      switch (effectivePolicy)
      {
      case PREFER_THIS:
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
        continue;
      }
      if (existing == incoming)
      {
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
        var refs = functionMapping.expression.getReferencedFunctions().keySet();
        dependencies.addAll(refs.stream().filter(name -> !name.equals(functionName)).toList());
      }

      functionReferenceGraph.put(functionName, dependency);
    }
  }

  public FunctionMapping<?, ?, ?> registerFunction(String string, Function<?, ?> func)
  {
    validateIdentifier(string, "function");
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
    // Hidden classes (Java 15+ lambdas / LambdaMetafactory output) have
    // Class.descriptorString() forms like
    //   Larb/.../MuntzPadeApproximant$$Lambda.0x000000000f19d628;
    // which include a '.' between the host class and the hex suffix. That form
    // is legal in MethodHandle/MethodType descriptors but illegal in a normal
    // class-file constant pool, so emitting it as a field descriptor for the
    // mapping produces a ClassFormatError ("Class name is empty or contains
    // illegal character in descriptor") the next time the enclosing generated
    // class is loaded. Reject the registration up-front with an actionable
    // message rather than producing unloadable bytecode.
    if (functionClass != null && functionClass.isHidden())
    {
      throw new IllegalArgumentException(format("Cannot register function '%s' with hidden class %s as functionClass. "
                                                + "This typically happens when a lambda is passed without an explicit interface — "
                                                + "the lambda's hidden class is captured via function.getClass() and its descriptor "
                                                + "contains characters illegal in a class-file constant pool. "
                                                + "Pass the implemented Function interface explicitly via the 5+ arg "
                                                + "registerFunctionMapping(name, fn, domain, coDomain, functionInterface, ...) overload.",
                                                functionName,
                                                functionClass.getName()));
    }
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
    validateIdentifier(name, "sequence");
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
    validateIdentifier(name, "variable");

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

  /**
   * Reject names that contain superscript or subscript characters. Such
   * characters have parser-level meaning in the expression language (powers,
   * indices) and silently embedding them in an identifier produces names that
   * the tokenizer cannot match as a single token, causing baffling
   * {@code UndefinedReferenceException}s at expression-compile time when the
   * tokenizer takes the prefix and leaves the trailing exponent/subscript
   * unconsumed.
   *
   * @param name what is being registered
   * @param kind "variable" or "function" — used only for the error message
   * @throws IllegalArgumentException if {@code name} contains any superscript
   *         or subscript character
   */
  static void validateIdentifier(String name, String kind)
  {
    if (name == null || name.isEmpty()) return;
    name.codePoints().forEach(cp -> {
      String cpStr = new String(Character.toChars(cp));
      if (arb.expressions.Parser.SUPERSCRIPT_TO_NORMAL.containsKey(cpStr))
      {
        throw new IllegalArgumentException(format(
            "Cannot register %s with name '%s': contains superscript character '%s' (U+%04X). "
          + "Superscripts are parser tokens (exponents) and cannot appear in identifiers.",
            kind, name, cpStr, cp));
      }
      for (Character sub : arb.expressions.Parser.SUBSCRIPT_DIGITS_ARRAY)
      {
        if (sub.charValue() == cp)
        {
          throw new IllegalArgumentException(format(
              "Cannot register %s with name '%s': contains subscript digit '%s' (U+%04X). "
            + "Subscript digits are parser tokens (indices) and cannot appear in identifiers.",
              kind, name, cpStr, cp));
        }
      }
      for (Character sub : arb.expressions.Parser.SUBSCRIPT_CHARACTERS_ARRAY)
      {
        if (sub.charValue() == cp)
        {
          throw new IllegalArgumentException(format(
              "Cannot register %s with name '%s': contains subscript character '%s' (U+%04X). "
            + "Subscript characters are parser tokens (indices) and cannot appear in identifiers.",
              kind, name, cpStr, cp));
        }
      }
    });
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
        // The injected fields (variables, intermediates) are declared on the
        // generated class itself and are usually non-public, so resolve them
        // directly. getField(name) only sees public fields and would throw
        // NoSuchFieldException — filling a stack trace — for every non-public
        // field on this injection path; getDeclaredField sees them without
        // throwing.
        field = compiledClass.getDeclaredField(variableName);
        field.setAccessible(true);
      }
      catch (NoSuchFieldException notDeclaredHere)
      {
        // An inherited public field (rare): resolve it through the hierarchy.
        field = compiledClass.getField(variableName);
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

  /**
   * Register {@code f} as owned by this Context, called once from every generated
   * instance's {@code initialize()}. Returns {@code f} so the call site can be a
   * pass-through. See {@link #ownedInstances}.
   */
  public Function<?, ?> own(Function<?, ?> f)
  {
    ownedInstances.add(f);
    return f;
  }

  /**
   * Free every generated instance this Context owns, in a single flat pass.
   *
   * <p>
   * Each instance's {@code close()} frees only its own scratch and then re-enters
   * this method, which the {@code closingOwnedInstances} flag turns into an
   * immediate no-op. So the sweep visits the manifest once, each instance's
   * {@code closed} flag frees it exactly once, and the Java stack never grows
   * with the reference graph — closing the deepest recursive cluster is O(1)
   * stack. Nothing here inspects references, recursion, or cycles: ownership is
   * by construction site, not by graph shape.
   */
  public void closeOwnedInstances()
  {
    if (closingOwnedInstances)
    {
      return;
    }
    closingOwnedInstances = true;
    for (Function<?, ?> f : ownedInstances)
    {
      if (f instanceof AutoCloseable closeable)
      {
        try
        {
          closeable.close();
        }
        catch (Exception e)
        {
          wrapOrThrow(e);
        }
      }
    }
  }

  @Override
  public void close()
  {
    closeOwnedInstances();
    functions.values().forEach(f ->
    {
      if (f.instance != null)
      {
        f.instance.close();
      }
    });
    // Snapshot: closing a variable removes it from this Context's variable map
    // via Named.removeFromRegisteredContexts(), so iterating the live values()
    // view here would throw ConcurrentModificationException.
    List.copyOf(variables.values()).forEach(v ->
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
