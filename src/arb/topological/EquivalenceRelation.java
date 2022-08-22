package arb.topological;

public interface EquivalenceRelation<A, B> extends
                                    BinaryRelation<A, B>
{
  public boolean equivalent(A a, B b);
}
