package arb.space.topological;

public interface HausdorffSpace<X> extends
                           TopologicalSpace<X>
{
  boolean isSeparable(X x, X y);
}
