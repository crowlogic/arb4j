package arb.functions;

public interface BivariateFunction<Ω, X> extends
                                  MultivariateFunction<Ω, X>
{

  @Override
  default int argDim()
  {
    return 2;
  }

}
