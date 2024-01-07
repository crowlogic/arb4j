package arb.expressions;

import java.util.HashMap;

public class FunctionMappings
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
