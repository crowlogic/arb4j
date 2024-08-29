package arb.expressions;

import java.util.HashMap;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.beans.value.ObservableValueBase;
import javafx.collections.ObservableList;
import javafx.collections.ObservableListBase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class Variables extends ObservableListBase<String> 

{
  @Override
  public String toString()
  {
    return String.format("Variables(#%s)[%s]", System.identityHashCode(this), map);
  }

  public final HashMap<String, Object> map = new HashMap<>();

  @SafeVarargs
  public <A extends Named> Variables(A... variables)
  {
    for (A variable : variables)
    {
      map.put(variable.getName(), variable);
    }
  }

  public Object register(String name, Object field)
  {
    return map.put(name, field);
  }

  @SuppressWarnings("unchecked")
  public <R> R get(String name)
  {
    return (R) map.get(name);
  }

  @SuppressWarnings("unchecked")
  public <R> R put(String name, R variable)
  {
    return (R) map.put(name, variable);
  }

  @Override
  public int size()
  {
   return map.size();
  }

  @Override
  public String get(int index)
  {
    return map.entrySet().toArray()[index].toString();
  }

}
