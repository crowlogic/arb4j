package arb.biology;

import java.util.stream.Stream;

public interface Cell
{
  public Stream<Protein> produce();
}
