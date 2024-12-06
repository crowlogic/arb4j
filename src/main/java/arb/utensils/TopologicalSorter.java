package arb.utensils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedTransferQueue;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TopologicalSorter
{

  /**
   * Performs topological sorting on a dependency graph.
   *
   * @param graph A map where each key is a node and its value is a list of nodes
   *              it depends on.
   * @return A list of nodes in topological order.
   * @throws IllegalArgumentException if the graph contains cycles.
   */
  public static List<String> sort(Map<String, List<String>> graph)
  {
    var inDegree    = new HashMap<String, Integer>();
    var queue       = new LinkedTransferQueue<String>();
    var sortedOrder = new ArrayList<String>();

    // Step 1: Compute in-degrees for all nodes
    graph.keySet().forEach(node -> inDegree.put(node, 0));
    graph.values()
         .forEach(dependencies -> dependencies.forEach(dependency -> inDegree.put(dependency,
                                                                                  inDegree.getOrDefault(dependency, 0)
                                                                                                + 1)));

    // Ensure all nodes (keys and dependencies) are accounted for
    graph.values()
         .forEach(dependencies -> dependencies.stream()
                                              .filter(dep -> !inDegree.containsKey(dep))
                                              .forEach(dependency -> inDegree.put(dependency, 0)));

    // Step 2: Add all nodes with in-degree 0 to the queue
    inDegree.entrySet().stream().filter(entry -> entry.getValue() == 0).forEach(entry -> queue.add(entry.getKey()));

    // Step 3: Perform topological sort
    while (!queue.isEmpty())
    {
      var current = queue.poll();
      sortedOrder.add(current);
      reduceDependentNodesInDegree(graph, inDegree, queue, current);
    }

    // Step 4: Check for cycles
    if (sortedOrder.size() != inDegree.size())
    {
      throw new IllegalArgumentException("The graph contains a cycle! Topological sorting is not possible.");
    }

    Collections.reverse(sortedOrder);

    return sortedOrder;
  }

  protected static void reduceDependentNodesInDegree(Map<String, List<String>> graph,
                                                     HashMap<String, Integer> inDegree,
                                                     LinkedTransferQueue<String> queue,
                                                     String current)
  {
    graph.getOrDefault(current, Collections.emptyList()).forEach(node ->
    {
      Integer prev = inDegree.put(node, inDegree.get(node) - 1);
      if (prev != null && prev.intValue() == 1)
      {
        queue.add(node);
      }
    });
  }

}
