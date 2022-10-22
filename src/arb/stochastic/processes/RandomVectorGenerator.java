package arb.stochastic.processes;

import arb.RandomState;
import arb.Real;

public interface RandomVectorGenerator extends
                                       AutoCloseable
{


  public RandomState getRandomState();

  public Real nextElement(int prec, Real result);
}
