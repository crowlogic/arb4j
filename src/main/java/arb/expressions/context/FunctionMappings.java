package arb.expressions.context;

import java.util.HashMap;

import arb.expressions.FunctionMapping;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class FunctionMappings
{
  @Override
  public String toString()
  {
    return String.format("FunctionMappings(#%s)[%s] ",
                         System.identityHashCode(this),
                         map.entrySet());
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
