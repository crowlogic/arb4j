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
public class LommelPolynomialSequence implements
                                      RationalFunctionSequence
{

  @Override
  public String toString()
  {
    return String.format("%s with %s", expression, context);
  }

  public static final Expression<Integer, RationalFunction, RationalFunctionSequence> expression;

  static
  {
    Context prototype = new Context(Real.named("v"));
    expression =
               RationalFunctionSequence.compile("n⇒v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                                prototype);
  }

  public final RationalFunctionSequence sequence;

  public final Context                  context;

  public LommelPolynomialSequence()
  {
    this(RealConstants.half);
  }

  /**
   * NOTE: this constructor sets the order variable's name to "v", so if you don't
   * want that to happen, send a clone whose swigCPtr pointer points to
   * the same location but whose swigCMemOwn bit is set to false
   * 
   * @param order
   */
  public LommelPolynomialSequence(Real order)
  {
    sequence = expression.instantiate();
    context  = new Context(order.setName("v"));
    context.injectReferences(sequence);
  }

  @Override
  public RationalFunction evaluate(Integer t, int order, int bits, RationalFunction res)
  {
    return sequence.evaluate(t, order, bits, res);
  }

}
