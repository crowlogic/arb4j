package arb.expressions;

import java.util.HashMap;

/**
 * TODO: https://github.com/crowlogic/arb4j/issues/296: expression compiler: add
 * type to registerBuiltinFunction and use [functionName,domain] as the key
 * instead of just functionName
 */
public class Functions
{
  public final HashMap<String, Mapping<?,?>> map = new HashMap<>();

  @SuppressWarnings("unchecked")
  public <D,R> Mapping<D, R> get(String functionName)
  {
    return (Mapping<D, R>) map.get(functionName);
  }

  public boolean isEmpty()
  {
    return map.isEmpty();
  }

}
