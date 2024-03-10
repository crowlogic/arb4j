package arb.expressions;

import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public final class FunctionMapping<D, R>
{
  public Class<?> functionInterface;

  @Override
  public String toString()
  {
    return String.format("%s[name=%s, instance=%s, domain=%s, range=%s, functionInterface=%s]",
                         getClass().getSimpleName(),
                         name,
                         instance,
                         domain != null ? domain.getName() : null,
                         range != null ? range.getName() : null,
                         functionInterface);
  }

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
    FunctionMapping<?, ?> other = (FunctionMapping<?, ?>) obj;
    return Objects.equals(domain, other.domain) && Objects.equals(name, other.name)
                  && Objects.equals(range, other.range);
  }

  public String         name;

  public Function<?, ?> instance;

  public Class<?>       domain;

  public Class<?>       range;

  public Class<?> type()
  {
    return instance == null ? functionInterface : instance.getClass();
  }

  public String functionFieldDescriptor()
  {
    return instance != null ? instance.getClass().descriptorString() : String.format("L%s;", name);
  }

}