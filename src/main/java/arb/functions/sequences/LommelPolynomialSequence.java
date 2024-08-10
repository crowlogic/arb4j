package arb.functions.sequences;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomialSequence implements RationalFunctionSequence, AutoCloseable
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
    Real    v         = new Real().setName("v");
    Context prototype = new Context();
    prototype  = new Context(v);
    expression = RationalFunctionSequence.compile("n⇒v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)", prototype);
  }

  public static Expression<Integer, RationalFunction, RationalFunctionSequence> expression;

  public RationalFunctionSequence                                               instance;

  public final Context                                                          context;

  @SuppressWarnings("resource")
  public Real                                                                   v = new Real().setName("v");

  public LommelPolynomialSequence()
  {
    this(RealConstants.half);
  }

  public LommelPolynomialSequence(Real order)
  {
    instance = expression.instantiate();
    context  = new Context(v.set(order));
    context.injectReferences(instance);
  }

  @Override
  public RationalFunction evaluate(Integer t, int order, int bits, RationalFunction res)
  {
    return instance.evaluate(t, order, bits, res);
  }

}
