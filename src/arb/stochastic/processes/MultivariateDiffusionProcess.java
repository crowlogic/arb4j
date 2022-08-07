package arb.stochastic.processes;

public interface MultivariateDiffusionProcess extends
                                              MultivariateStochasticProcess

{

  int dim();

  public DiffusionProcessState get(int i);

}
