package arb.expressions.context;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import arb.Named;
import javafx.collections.ModifiableObservableListBase;

public final class Variables extends
                             ModifiableObservableListBase<Named>
{

  /**
   * Renames an existing variable.
   *
   * @param oldName current key in the map
   * @param newName desired key
   * @return true if the variable was found and renamed, false otherwise
   * @throws IllegalArgumentException if newName already exists
   */
  public boolean rename(String oldName, String newName)
  {
    Objects.requireNonNull(oldName, "oldName");
    Objects.requireNonNull(newName, "newName");

    if (oldName.equals(newName))
    {
      return contains(oldName); // nothing to do
    }

    Named variable = get(oldName);
    if (variable == null)
    {
      return false; // nothing renamed
    }
    if (contains(newName))
    {
      throw new IllegalArgumentException("Variable '" + newName + "' already exists");
    }

    /* --- do the rename --- */
    int idx = indexOf(oldName); // helper from previous code
    beginChange();
    removeByName(oldName); // fires nextRemove
    variable.setName(newName);
    put(newName, variable); // fires nextAdd (at end)
    endChange();

    return true;
  }

  public final LinkedHashMap<String, Named> map = new LinkedHashMap<>();

  /* ---------- convenience constructors ---------- */

  @SafeVarargs
  public Variables(Named... vars)
  {
    if (vars != null)
    {
      for (Named v : vars)
      {
        if (v != null)
          put(v.getName(), v);
      }
    }
  }

  /* ---------- Map-like API ---------- */
  public Named put(String name, Named var)
  {
    Objects.requireNonNull(name);
    Objects.requireNonNull(var);

    var.setName(name);

    Named existing = map.get(name);
    if (existing == var || (existing != null && existing.equals(var)))
    {
      return existing; // identical → no change, no event ⇒ no loop
    }

    if (existing == null)
    { // genuine add
      add(var); // fires one add-event
      return null;
    }
    else
    { // genuine replace
      int idx = indexOf(name);
      return set(idx, var); // fires one set-event
    }
  }

  @SuppressWarnings("unchecked")
  public <T extends Named> T get(String name)
  {
    return (T) map.get(name);
  }

  public boolean contains(String name)
  {
    return map.containsKey(name);
  }

  public Named removeByName(String name)
  {
    return remove(indexOf(name));
  }

  public Set<String> names()
  {
    return map.keySet();
  }

  public Collection<Named> values()
  {
    return map.values();
  }

  public Set<Map.Entry<String, Named>> entrySet()
  {
    return map.entrySet();
  }

  /* ---------- ObservableList contract ---------- */

  @Override
  public int size()
  {
    return map.size();
  }

  @Override
  public Named get(int index)
  {
    checkRange(index);
    return new ArrayList<>(map.values()).get(index);
  }

  @Override
  protected void doAdd(int index, Named element)
  {
    Objects.requireNonNull(element, "element");
    Objects.requireNonNull(element.getName(), "element.name");

    /* if a variable with the same name already exists, replace it */
    Named existing = map.get(element.getName());
    if (existing != null)
    {
      // find its index in current ordering
      int existingIdx = indexOf(element.getName());
      super.remove(existingIdx); // remove old (fires nextRemove)
      // adjust target index if we removed a preceding element
      if (existingIdx < index)
        index--;
    }

    /* insert at requested position respecting current order */
    rebuildWithInsert(index, element); // helper already in class
  }

  @Override
  protected Named doSet(int index, Named element)
  {
    checkRange(index);
    List<Named> tmp = new ArrayList<>(map.values());
    Named       old = tmp.set(index, element);
    if (!old.getName().equals(element.getName()) && map.containsKey(element.getName()))
      throw new IllegalArgumentException("duplicate name: " + element.getName());
    rebuildFromList(tmp);
    return old;
  }

  @Override
  protected Named doRemove(int index)
  {
    checkRange(index);
    Named removed = get(index);
    map.remove(removed.getName());
    return removed;
  }

  /* ---------- helpers ---------- */

  private int indexOf(String name)
  {
    int i = 0;
    for (String n : map.keySet())
    {
      if (n.equals(name))
        return i;
      i++;
    }
    return -1;
  }

  private void rebuildWithInsert(int index, Named element)
  {
    List<Named> tmp = new ArrayList<>(map.values());
    tmp.add(index, element);
    rebuildFromList(tmp);
  }

  private void rebuildFromList(List<Named> ordered)
  {
    map.clear();
    for (Named n : ordered)
      map.put(n.getName(), n);
  }

  private void checkRange(int idx)
  {
    if (idx < 0 || idx >= size())
      throw new IndexOutOfBoundsException("index " + idx + " size " + size());
  }

  /* ---------- pretty print ---------- */

  @Override
  public String toString()
  {
    return map.entrySet()
              .stream()
              .map(e -> e.getKey() + "=" + e.getValue())
              .collect(Collectors.joining(", ", "Variables[", "]"));
  }
}
