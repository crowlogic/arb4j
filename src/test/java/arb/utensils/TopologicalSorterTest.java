package arb.utensils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TopologicalSorterTest extends
                                   TestCase
{

  public void testSort()
  {
    // Example dependency graph
    Map<String, List<String>> dependencyGraph = new HashMap<>();
    dependencyGraph.put("C", List.of());
    dependencyGraph.put("A", List.of("C", "F", "G"));
    dependencyGraph.put("F", List.of("C"));
    dependencyGraph.put("B", List.of("C"));
    dependencyGraph.put("E", List.of("C"));
    dependencyGraph.put("P", List.of("A", "B", "C", "E"));

    var sortedOrder = TopologicalSorter.sort(dependencyGraph).toString();
    assertEquals("[C, G, F, E, B, A, P]", sortedOrder);
  }
}
