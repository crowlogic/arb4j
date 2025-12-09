package arb.expressions.viz;

import arb.functions.Function;
import javafx.util.StringConverter;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public final class ClassStringConverter<D, C, F extends Function<D, C>> extends
                                       StringConverter<Class<?>>
{

  @Override
  public String toString(Class<?> object)
  {
    if (Object.class.equals(object))
    {
      return "∅ (NULL)";
    }
    else
    {
      return object.getSimpleName();
    }
  }

  @Override
  public Class<?> fromString(String string)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }
}