package arb.expressions;

import java.util.HashMap;
import java.util.Objects;

import arb.functions.Function;

/**
 * TODO: https://github.com/crowlogic/arb4j/issues/296: expression compiler: add
 * type to registerBuiltinFunction and use [functionName,domain] as the key
 * instead of just functionName
 */
public class Functions
{
  public static final class Mapping<D,R>
  {
    @Override
    public int hashCode()
    {
      return Objects.hash(domain, name, range);
    }

    @Override
    public boolean equals(Object obj)
    {
      if (this == obj)
        return true;
      if (obj == null)
        return false;
      if (getClass() != obj.getClass())
        return false;
      Mapping<?, ?> other = (Mapping<?, ?>) obj;
      return Objects.equals(domain, other.domain) && Objects.equals(name, other.name)
                    && Objects.equals(range, other.range);
    }

    public String name;
    
    public Function<?, ?> func;

    public Class<?>     domain;

    public Class<?>     range;

   
  }

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
