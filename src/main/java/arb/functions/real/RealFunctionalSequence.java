package arb.functions.real;

import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;

public class RealFunctionalSequence implements
                                    Function<Integer, RealFunctional>
{
  private Function<Integer, RealFunctional> sequenceInstance;

  public RealFunctionalSequence(Expression<Integer,
                RealFunctional,
                Function<Integer, RealFunctional>> sequenceExpression)
  {
    this.sequenceInstance = sequenceExpression.instantiate();
  }

  @Override
  public RealFunctional evaluate(Integer k, int order, int bits, RealFunctional result)
  {
    return sequenceInstance.evaluate(k, order, bits, result);
  }

  public static RealFunctionalSequence compile(String expression, Context context)
  {
    Expression<Integer,
                  RealFunctional,
                  Function<Integer,
                                RealFunctional>> sequenceExpr =
                                                              Compiler.compile(expression,
                                                                               context,
                                                                               Integer.class,
                                                                               RealFunctional.class,
                                                                               Function.class,
                                                                               null); // Add null
                                                                                      // for the
                                                                                      // functionName
                                                                                      // parameter
    return new RealFunctionalSequence(sequenceExpr);
  }
}