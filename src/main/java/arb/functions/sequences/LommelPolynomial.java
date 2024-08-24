package arb.functions.sequences;

import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.rational.RationalNullaryFunction;

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
    return String.format("%s where %s\n", expression, v);
  }

  @Override
  public void close()
  {
    v.close();
  }

  static
  {
    @SuppressWarnings("resource")
    Context prototype = new Context(Real.named("v"),
                                    Real.named("n"));
    expression =
               RationalNullaryFunction.compile("v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                               prototype);
  }

  public static Expression<Object, RationalFunction, RationalNullaryFunction> expression;

  public RationalNullaryFunction                                              nullaryFunction;

  @SuppressWarnings("resource")
  public Real                                                                 v           =
                                                                                new Real().setName("v");

  @SuppressWarnings("resource")
  public Real                                                                 n           =
                                                                                new Real().setName("n");

  public final Context                                                        context     =
                                                                                      new Context(v,
                                                                                                  n);

  public RationalFunction                                                     value       =
                                                                                    new RationalFunction();

  boolean                                                                     initialized = false;

  @Override
  public RationalFunction evaluate(Object t, int order, int bits, RationalFunction res)
  {
    if (!initialized)
    {
      context.injectReferences(nullaryFunction = expression.instantiate());
      initialized = true;
    }
    return nullaryFunction.evaluate(t, order, bits, res);
  }

  @Override
  public RationalFunction newCoDomainInstance()
  {
   return new RationalFunction();
  }

}
