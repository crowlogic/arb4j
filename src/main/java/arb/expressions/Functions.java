package arb.expressions;

import java.util.HashMap;

import arb.functions.Function;

public class Functions
{
  public final HashMap<String, Function<?, ?>> map = new HashMap<>();

  @SuppressWarnings("unchecked")
  public <F extends Function<?, ?>> F get(String functionName)
  {
    return (F) map.get(functionName);
  }

  public boolean isEmpty()
  {
    return map.isEmpty();
  }

}
