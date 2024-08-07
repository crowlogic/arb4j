package arb.functions.sequences;

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
public class LommelPolynomials implements RationalFunctionSequence, AutoCloseable
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


  public Context                                                         context = new Context();
  
  public Expression<Integer, RationalFunction, RationalFunctionSequence> expression;

  public RationalFunctionSequence                                        instance;

  public Real                                                            v       = new Real().setName("v");

  public LommelPolynomials(Real order)
  {
    context    = new Context(v);
    expression = RationalFunctionSequence.parse("n⇒v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z²)", context);
    v.set(order);
    instance = expression.instantiate();
    expression.injectReferences(instance);
  }

  @Override
  public RationalFunction evaluate(Integer t, int order, int bits, RationalFunction res)
  {
    return instance.evaluate(t, order, bits, res);
  }

}
