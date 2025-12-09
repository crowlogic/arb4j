package arb.expressions.context;

import java.util.HashMap;

import arb.expressions.FunctionMapping;
import arb.functions.Function;


/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class FunctionMappings extends
                              HashMap<String, FunctionMapping<?, ?, ?>>
{
  private static final long serialVersionUID=1L;

  @Override
  public String toString()
  {
    return String.format("FunctionMappings(#%s)[%s] ", System.identityHashCode(this), entrySet());
  }

  @SuppressWarnings("unchecked")
  public <D, R, F extends Function<? extends D, ? extends R>>
         FunctionMapping<D, R, F>
         get(String functionName)
  {
    return (FunctionMapping<D, R, F>) super.get(functionName);
  }

}
