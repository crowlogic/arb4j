package arb.expressions;

import java.util.HashMap;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class FunctionMappings 
{
  public final HashMap<String, FunctionMapping<?,?>> map = new HashMap<>();

  @SuppressWarnings("unchecked")
  public <D,R> FunctionMapping<D, R> get(String functionName)
  {
    return (FunctionMapping<D, R>) map.get(functionName);
  }

  public boolean isEmpty()
  {
    return map.isEmpty();
  }

}
