package arb.functions.sequences;

import static java.lang.System.out;

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
public class LommelPolynomials implements RationalFunctionSequence, AutoCloseable
{

  @Override
  public void close()
  {
    v.close();
  }

  public static void main(String arg[])
  {

    LommelPolynomials x    = new LommelPolynomials(RealConstants.half);
    RationalFunction  func = x.evaluate(3, 128);
    System.out.println("L3=" + func);
    Real l3x = func.evaluate(Real.valueOf(2.3), 0, 128, new Real());
    out.println("l3x=" + l3x);

  }

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  public Context                                                         context = new Context();
  public Expression<Integer, RationalFunction, RationalFunctionSequence> expression;

  public RationalFunctionSequence                                        instance;

  public Real                                                            v       = new Real().setName("v");

  public LommelPolynomials(Real order)
  {
    context    = new Context(v);
    expression = RationalFunctionSequence.parse("n->v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z^2)", context);
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
