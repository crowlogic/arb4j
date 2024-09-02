package arb.expressions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.collections.ListChangeListener.Change;
import javafx.collections.ModifiableObservableListBase;
import javafx.collections.ObservableList;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 *
 * @author ©2024 Stephen Crowley
 */
public class Variables extends
                       ModifiableObservableListBase<Named>
{

  public final class ContextVariableChange extends
                                           Change<Named>
  {
    private final int index;
    private boolean   invalid = true;

    public ContextVariableChange(ObservableList<Named> list, int index)
    {
      super(list);
      this.index = index;
    }

    @Override
    public boolean next()
    {
      if (invalid)
      {
        invalid = false;
        return true;
      }
      return false;
    }

    @Override
    public void reset()
    {
      invalid = true;
    }

    @Override
    public boolean wasReplaced()
    {
      return true;
    }

    @Override
    public boolean wasRemoved()
    {
      return false;
    }

    @Override
    public boolean wasAdded()
    {
      return false;
    }

    @Override
    public int getRemovedSize()
    {
      return 0;
    }

    @Override
    public List<Named> getRemoved()
    {
      return null;
    }

    @Override
    public int getTo()
    {
      return index + 1;
    }

    @Override
    public int getFrom()
    {
      return index;
    }

    @Override
    protected int[] getPermutation()
    {
      return new int[0];
    }
  }

  public final HashMap<String, Named> map  = new HashMap<>();
  private final List<Named>           list = new ArrayList<>();

  @Override
  public String toString()
  {
    return String.format("Variables(#%s)[%s]", System.identityHashCode(this), map);
  }

  @SafeVarargs
  public Variables(Named... variables)
  {
    for (Named variable : variables)
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
    map.put(element.getName(), element);
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
                                             index));
      }
    }
  }

}
