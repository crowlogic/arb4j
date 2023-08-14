package arb.dynamical.systems;

public interface ContinuousTimeDynamicalSystem<S extends State> extends
                                              DynamicalSystem
{
  public default S getState()
  {
    assert false : "todo";
    return null;
  }
}
