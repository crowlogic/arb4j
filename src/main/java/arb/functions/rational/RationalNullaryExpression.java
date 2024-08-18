package arb.functions.rational;

import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalNullaryExpression
                                       extends
                                       Expression<Object, RationalFunction, RationalNullaryFunction>
{

  public RationalNullaryExpression(String className,
                                   Class<? extends Object> class1,
                                   Class<? extends RationalFunction> class2,
                                   Class<? extends RationalNullaryFunction> class3,
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

  public RationalNullaryExpression(String className,
                                   Class<? extends Object> domainClass,
                                   Class<? extends RationalFunction> coDomainClass,
                                   Class<? extends RationalNullaryFunction> functionClass,
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
