package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;

public class RealExpression extends
                            Expression<Real, Real, RealFunction>
{

  public RealExpression(Class<? extends Real> domain,
                        Class<? extends Real> codomain,
                        Class<? extends RealFunction> function)
  {
    super(domain,
          codomain,
          function);
    // TODO Auto-generated constructor stub
  }

  public RealExpression(String className,
                        Class<? extends Real> domain,
                        Class<? extends Real> codomain,
                        Class<? extends RealFunction> function,
                        String expression,
                        Context context,
                        String functionName,
                        Expression<?, ?, ?> parentExpression)
  {
    super(className,
          domain,
          codomain,
          function,
          expression,
          context,
          functionName,
          parentExpression);
    // TODO Auto-generated constructor stub
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
    // TODO Auto-generated constructor stub
  }

}
