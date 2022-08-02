package arb.dynamical.systems;

import arb.*;

public interface DiscreteTimeDynamicalSystem<S extends State> extends
                                            DynamicalSystem
{
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSeq);
}
