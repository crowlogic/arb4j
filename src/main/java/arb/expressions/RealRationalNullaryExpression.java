package arb.expressions;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealRationalNullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRationalNullaryExpression
                                           extends
                                           Expression<Object, RationalFunction, RealRationalNullaryFunction>
{

  public RealRationalNullaryExpression(String className,
                                       Class<? extends Object> class1,
                                       Class<? extends RationalFunction> class2,
                                       Class<? extends RealRationalNullaryFunction> class3,
                                       String expression,
                                       Context context,
                                       String functionName,
                                       Expression<?, ?, ?> parentExpression)
  {
    super(className,
          class1,
          class2,
          class3,
          expression,
          context,
          functionName,
          parentExpression);
  }

  public RealRationalNullaryExpression(String className,
                                       Class<? extends Object> domainClass,
                                       Class<? extends RationalFunction> coDomainClass,
                                       Class<? extends RealRationalNullaryFunction> functionClass,
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
