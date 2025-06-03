package arb.expressions.context;

import java.util.HashMap;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.FunctionMapping;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class FunctionMappings
{
  @Override
  public String toString()
  {
    return String.format("FunctionMappings(#%s)[%s] ", System.identityHashCode(this), map.entrySet());
  }

  public final HashMap<String, FunctionMapping<?, ?, ?>> map = new HashMap<>();

  @SuppressWarnings("unchecked")
  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         get(String functionName)
  {
    return (FunctionMapping<D, R, F>) map.get(functionName);
  }

  public boolean isEmpty()
  {
    return map.isEmpty();
  }

}
