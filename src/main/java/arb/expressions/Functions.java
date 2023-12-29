package arb.expressions;

import java.util.HashMap;

import arb.functions.Function;

/**
 * TODO: https://github.com/crowlogic/arb4j/issues/296: expression compiler: add
 * type to registerBuiltinFunction and use [functionName,domain] as the key
 * instead of just functionName
 */
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
