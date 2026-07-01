package arb.functions.rational;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.integer.RealFunctionSequence;

/**
 * 
 * FIXME: redo this to use a {@link RealFunctionSequence} and get rid of the
 * {@link Context}
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
    lastN.close();
  }

  static
  {
    Context prototype = new Context(Real.named("v"),
                                    Integer.named("n"));
    expression = RationalNullaryFunction.parse("v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)", prototype);
  }

  public static Expression<Object, RationalFunction, RationalNullaryFunction> expression;

  public RationalNullaryFunction                                              nullaryFunction;

  public Real                                                                 v           = Real.named("v");

  public Integer                                                              n           = Integer.named("n");

  public final Context                                                        context     = new Context(v,
                                                                                                        n);

  boolean                                                                     initialized = false;

  private final Integer                                                       lastN       = new Integer();

  @Override
  public RationalFunction evaluate(Object t, int order, int bits, RationalFunction res)
  {
    // The generated nullary hoists every n-dependent subexpression (the pFq
    // series in particular) into its initialize(), so an instance is only
    // valid for the value of n it was initialized at. When the caller mutates
    // n (the R(n,v;z) sequence sets it before each call), instantiate afresh
    // so the hoisted state is rebuilt for the new index instead of serving
    // the stale series of the previous one.
    if (!initialized || !n.equals(lastN))
    {
      context.injectReferences(nullaryFunction = expression.instantiate());
      initialized = true;
      lastN.set(n);
    }
    return nullaryFunction.evaluate(null, order, bits, res);
  }

  @Override
  public RationalFunction newCoDomainInstance()
  {
    return new RationalFunction();
  }

}
