package arb.expressions.context;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import arb.Named;
import javafx.collections.ModifiableObservableListBase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Variables extends
                       ModifiableObservableListBase<Named>
{
  public final Map<String, Named> map              = new LinkedHashMap<>();
  private final List<Named>       orderedVariables = new ArrayList<>();

  /**
   * Creates Variables instance with initial set of named variables
   * 
   * @param variables Initial variables to add
   */
  @SafeVarargs
  public Variables(Named... variables)
  {
    if (variables != null)
    {
      Arrays.stream(variables).filter(Objects::nonNull).forEach(this::addVariable);
    }
  }

  /**
   * Adds a variable ensuring no duplicates by name
   */
  private void addVariable(Named variable)
  {
    if (!map.containsKey(variable.getName()))
    {
      doAdd(size(), variable);
    }
    else
    {
      System.err.printf("Ignored duplicate variable: %s%n", variable);
    }
  }

  /**
   * Registers a new variable with given name
   */
  public Named register(String name, Named variable)
  {
    Objects.requireNonNull(name, "Name cannot be null");
    Objects.requireNonNull(variable, "Variable cannot be null");

    variable.setName(name);
    doAdd(size(), variable);
    return variable;
  }

  /**
   * Gets a variable by name with type safety
   */
  @SuppressWarnings("unchecked")
  public <T extends Named> T get(String name)
  {
    return (T) map.get(name);
  }

  /**
   * Renames an existing variable
   */
  public void rename(String oldName, String newName)
  {
    Objects.requireNonNull(oldName, "Old name cannot be null");
    Objects.requireNonNull(newName, "New name cannot be null");

    Named variable = map.remove(oldName);
    if (variable != null)
    {
      variable.setName(newName);
      map.put(newName, variable);
      int index = orderedVariables.indexOf(variable);
      if (index != -1)
      {
        fireChange(new ContextVariableChange(this,
                                             this,
                                             index));
      }
    }
  }

  @Override
  public String toString()
  {
    return map.entrySet()
              .stream()
              .map(entry -> String.format("%s:%s=%s",
                                          entry.getValue().getClass().getSimpleName(),
                                          entry.getKey(),
                                          entry.getValue().toStringWithoutName()))
              .collect(Collectors.joining(", ", "Variables[", "]"));
  }

  // ModifiableObservableListBase implementation
  @Override
  public int size()
  {
    return orderedVariables.size();
  }

  @Override
  public Named get(int index)
  {
    return orderedVariables.get(index);
  }

  @Override
  protected void doAdd(int index, Named element)
  {
    orderedVariables.add(index, element);
    map.put(element.getName(), element);
  }

  @Override
  protected Named doSet(int index, Named element)
  {
    Named old = orderedVariables.set(index, element);
    if (old != null)
    {
      map.remove(old.getName());
    }
    map.put(element.getName(), element);
    return old;
  }

  @Override
  protected Named doRemove(int index)
  {
    Named removed = orderedVariables.remove(index);
    if (removed != null)
    {
      map.remove(removed.getName());
    }
    return removed;
  }
}
