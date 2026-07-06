package arb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Named
{

  /**
   * Registry mapping each {@link Named} variable (by identity, since the
   * arithmetic types have value-based {@link Object#equals(Object)}) to the
   * {@link Context}s it is registered in. Maintained automatically by
   * {@link Context} whenever a variable enters or leaves its variable map, and
   * consulted by {@link #removeFromRegisteredContexts()} when the variable is
   * closed so that closed variables never remain registered in any
   * {@link Context}.
   */
  static final Map<Named, List<Context>> contextMemberships = Collections.synchronizedMap(new IdentityHashMap<>());

  /**
   * Records that this variable is a member of the given {@link Context}. Called
   * automatically by {@link Context} when this variable is added to its
   * variable map.
   * 
   * @param context the {@link Context} this variable was added to
   * @return this
   */
  public default Named registerContext(Context context)
  {
    List<Context> memberships = contextMemberships.computeIfAbsent(this, key -> new ArrayList<>());
    synchronized (memberships)
    {
      if (memberships.stream().noneMatch(existing -> existing == context))
      {
        memberships.add(context);
      }
    }
    return this;
  }

  /**
   * Records that this variable is no longer a member of the given
   * {@link Context}. Called automatically by {@link Context} when this variable
   * is removed from its variable map.
   * 
   * @param context the {@link Context} this variable was removed from
   */
  public default void unregisterContext(Context context)
  {
    List<Context> memberships = contextMemberships.get(this);
    if (memberships != null)
    {
      synchronized (memberships)
      {
        memberships.removeIf(existing -> existing == context);
        if (memberships.isEmpty())
        {
          contextMemberships.remove(this);
        }
      }
    }
  }

  /**
   * @return an unmodifiable snapshot of the {@link Context}s this variable is
   *         currently registered in
   */
  public default List<Context> getRegisteredContexts()
  {
    List<Context> memberships = contextMemberships.get(this);
    if (memberships == null)
    {
      return List.of();
    }
    synchronized (memberships)
    {
      return List.copyOf(memberships);
    }
  }

  /**
   * Removes this variable from every {@link Context} it is registered in.
   * Called from {@link AutoCloseable#close()} of each implementor so that a
   * closed variable never remains registered in any {@link Context}.
   */
  public default void removeFromRegisteredContexts()
  {
    List<Context> memberships = contextMemberships.remove(this);
    if (memberships != null)
    {
      List<Context> snapshot;
      synchronized (memberships)
      {
        snapshot = List.copyOf(memberships);
      }
      for (Context context : snapshot)
      {
        context.removeVariable(this);
      }
    }
  }

  public default boolean isRenameable()
  {
    return false;
  }

  public default <N extends Named> N setName(String name)
  {
    assert isRenameable() : this + " of class " + getClass().getSimpleName() + " is not renamable";
    assert false : "TODO: " + getClass().getSimpleName() + " needs to implement setName(String) since apparently " + this + " is renamable";
    return null;
  }

  public String getName();

}
