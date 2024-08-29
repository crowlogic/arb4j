package arb.expressions;

import java.util.HashMap;

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
  @Override
  public String toString()
  {
    return String.format("Variables(#%s)[%s]", System.identityHashCode(this), map);
  }

  public final HashMap<String, Named> map = new HashMap<>();

  @SafeVarargs
  public <A extends Named> Variables(A... variables)
  {
    for (A variable : variables)
    {
      map.put(variable.getName(), variable);
    }
  }

  public Object register(String name, Named field)
  {
    return map.put(name, field);
  }

  @SuppressWarnings("unchecked")
  public <R> R get(String name)
  {
    return (R) map.get(name);
  }

  @SuppressWarnings("unchecked")
  public <R extends Named> R put(String name, R variable)
  {
    return (R) map.put(name, variable);
  }

  @Override
  public int size()
  {
    return map.size();
  }

  @Override
  public Named get(int index)
  {
    return map.values().stream().toList().get(index);
  }

  @Override
  protected void doAdd(int index, Named element)
  {
    System.err.format("doAdd(index=%s, element=%s", index,element);
    map.put(element.getName(), element);
  }

  @Override
  protected Named doSet(int index, Named element)
  {
    System.err.format("doSet(index=%s, element=%s)", index,element);

    if ( element == null )
    {
      return null;
    }
    Named put = map.put(element.getName(), element);
    System.err.println("after set " + this );
    return put;
  }

  @Override
  protected Named doRemove(int index)
  {
    System.err.format("doRemove(index=%s)", index);

    return map.remove(map.keySet().stream().toList().get(index));
  }

}
