package arb.functions.rational;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomial implements
                              RationalNullaryFunction,
                              AutoCloseable
{

  @Override
  public String toString()
  {
    return String.format("%s with %s", expression, context);
  }

  @Override
  public void close()
  {
    v.close();
    n.close();
  }

  static
  {
    Context prototype = new Context(Real.named("v"),
                                    Integer.named("n"));
    expression =
               RationalNullaryFunction.compile("v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                               prototype);
  }

  public static Expression<Object, RationalFunction, RationalNullaryFunction> expression;

  public RationalNullaryFunction                                              nullaryFunction;

  public Real                                                                 v           =
                                                                                Real.named("v");

  public Integer                                                                 n           =
                                                                                Integer.named("n");

  public final Context                                                        context     =
                                                                                      new Context(v,
                                                                                                  n);

  boolean                                                                     initialized = false;

  @Override
  public RationalFunction evaluate(Object t, int order, int bits, RationalFunction res)
  {
    if (!initialized)
    {
      context.injectReferences(nullaryFunction = expression.instantiate());
      initialized = true;
    }
    return nullaryFunction.evaluate(null, order, bits, res);
  }

  @Override
  public RationalFunction newCoDomainInstance()
  {
    return new RationalFunction();
  }

}
