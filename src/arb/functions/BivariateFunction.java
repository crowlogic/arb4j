package arb.functions;

import arb.OrderedPair;

public interface BivariateFunction<Ω, X> extends
                                  MultivariateFunction<OrderedPair<Ω,Ω>, X>
{

  @Override
  default int argDim()
  {
    return 2;
  }

}
