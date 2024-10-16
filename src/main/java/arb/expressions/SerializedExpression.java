package arb.expressions;

import java.util.HashMap;

import arb.Named;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SerializedExpression
{
  public String             expression;

  public HashMap<String, ?> context;

  @Override
  public String toString()
  {
    return String.format("SerializedExpression [expression=%s, context=%s]", expression, context);
  }
}
