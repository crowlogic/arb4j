package arb.expressions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;
import java.util.stream.Stream;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.collections.ModifiableObservableListBase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 *
 * @author ©2024 Stephen Crowley
 */
public class Variables extends
                       ModifiableObservableListBase<Named>
{

  public final HashMap<String, Named> map  = new HashMap<>();
  public final List<Named>            list = new ArrayList<>();

  @Override
  public String toString()
  {
    return String.format("Variables(#%s)[%s]",
                         System.identityHashCode(this),
                         map.entrySet()
                            .stream()
                            .filter(entry -> entry != null && entry.getValue() != null)
                            .map(entry -> String.format("%s:%s=%s",
                                                        entry.getValue().getClass().getName(),
                                                        entry.getKey(),
                                                        entry.getValue().toStringWithoutName()))
                            .toList());
  }

  @SafeVarargs
  public Variables(Named... variables)
  {
    TreeMap<String, Named> uniqueVars = new TreeMap<>();
    Stream.of(variables).forEach(named ->
    {
      if (!uniqueVars.containsKey(named.getName()))
      {
        uniqueVars.put(named.getName(), named);
      }
      else
      {
        System.err.format("Ignored duplicate variable " + named);
      }
    });
    for (Named variable : uniqueVars.values())
    {
      add(variable);
    }
  }

  public Named register(String name, Named field)
  {
    return put(name, field);
  }

  @SuppressWarnings("unchecked")
  public <R extends Named> R get(String name)
  {
    return (R) map.get(name);
  }

  public <R extends Named> R put(String name, R variable)
  {
    Named oldValue = map.put(name, variable);
    if (oldValue != null)
    {
      int index = list.indexOf(oldValue);
      if (index != -1)
      {
        list.set(index, variable);
      }
    }
    else
    {
      list.add(variable);
    }
    return variable;
  }

  @Override
  public int size()
  {
    return list.size();
  }

  @Override
  public Named get(int index)
  {
    return list.get(index);
  }

  @Override
  protected void doAdd(int index, Named element)
  {
    list.add(index, element);
    map.put(element.getName(), element);
  }

  @Override
  protected Named doSet(int index, Named element)
  {
    Named oldElement = list.set(index, element);
    if (oldElement != null)
    {
      map.remove(oldElement.getName());
    }
    if (element != null)
    {
      map.put(element.getName(), element);
    }
    return oldElement;
  }

  @Override
  protected Named doRemove(int index)
  {
    Named removed = list.remove(index);
    if (removed != null)
    {
      map.remove(removed.getName());
    }
    return removed;
  }

  public void rename(String oldName, String newName)
  {
    Named variable = map.get(oldName);
    if (variable != null)
    {
      map.remove(oldName);
      variable.setName(newName);
      map.put(newName, variable);
      int index = list.indexOf(variable);
      if (index != -1)
      {
        fireChange(new ContextVariableChange(this,
                                             this,
                                             index));
      }
    }
  }

}
