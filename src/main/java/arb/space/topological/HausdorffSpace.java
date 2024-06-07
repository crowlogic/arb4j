package arb.space.topological;

public interface HausdorffSpace<X> extends
                           TopologicalSpace<X>
{
  boolean isSeparable(int bits, X x, X y);
}
