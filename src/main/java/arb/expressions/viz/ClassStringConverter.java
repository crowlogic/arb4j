package arb.expressions.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import javafx.util.StringConverter;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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