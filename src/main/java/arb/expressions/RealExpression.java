package arb.expressions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealExpression extends
                            Expression<Real, Real, RealFunction>
{

  public RealExpression(String className,
                        Class<? extends Real> domainClass,
                        Class<? extends Real> coDomainClass,
                        Class<? extends RealFunction> functionClass,
                        String expression,
                        Context context,
                        String functionName,
                        Expression<?, ?, ?> parentExpression)
  {
    super(className,
          domainClass,
          coDomainClass,
          functionClass,
          expression,
          context,
          functionName,
          parentExpression);
  }

  public RealExpression(String className,
                        Class<? extends Real> domainClass,
                        Class<? extends Real> coDomainClass,
                        Class<? extends RealFunction> functionClass,
                        String expressionString,
                        Context context)
  {
    super(className,
          domainClass,
          coDomainClass,
          functionClass,
          expressionString,
          context);
  }

}
