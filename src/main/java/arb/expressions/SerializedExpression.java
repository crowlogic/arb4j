package arb.expressions;

import java.util.Map;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SerializedExpression
{
  public String                                 expression;

  public Map<String, SerializedContextVariable> context;

  @Override
  public String toString()
  {
    return String.format("SerializedExpression [expression=%s, context=%s]", expression, context);
  }
}
