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

  public String domain;
  
  public String coDomain;
  
  public String function;

  @Override
  public String toString()
  {
    return String.format("SerializedExpression[expression=%s, domain=%s, coDomain=%s, function=%s, context=%s]",
                         expression,
                         domain,
                         coDomain,
                         function,
                         context);
  }
    
}
