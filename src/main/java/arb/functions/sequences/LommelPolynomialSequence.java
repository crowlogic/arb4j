package arb.functions.sequences;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.rational.RationalFunctionSequence;

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
    Context prototype = new Context(new Real().setName("v"));
    expression = RationalFunctionSequence.compile("n⇒v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)", prototype);
  }

  public static Expression<Integer, RationalFunction, RationalFunctionSequence> expression;

  public RationalFunctionSequence                                               element;

  public final Context                                                          context;

  @SuppressWarnings("resource")
  public Real                                                                   v = new Real().setName("v");

  public LommelPolynomialSequence()
  {
    this(RealConstants.half);
  }

  public LommelPolynomialSequence(Real order)
  {
    element = expression.instantiate();
    context  = new Context(v.set(order));
    context.injectReferences(element);
  }

  @Override
  public RationalFunction evaluate(Integer t, int order, int bits, RationalFunction res)
  {
    return element.evaluate(t, order, bits, res);
  }

}
