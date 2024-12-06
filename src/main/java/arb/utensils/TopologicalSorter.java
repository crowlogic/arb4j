package arb.utensils;

import java.util.*;

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
    // Step 1: Compute in-degrees for all nodes
    var inDegree = new HashMap<String, Integer>();
    graph.keySet().forEach(node -> inDegree.put(node, 0));
    graph.values()
         .forEach(dependencies -> dependencies.forEach(dependency -> inDegree.put(dependency,
                                                                                  inDegree.getOrDefault(dependency, 0)
                                                                                                + 1)));

    // Ensure all nodes (keys and dependencies) are accounted for
    for (List<String> dependencies : graph.values())
    {
      for (String dependency : dependencies)
      {
        if (!inDegree.containsKey(dependency))
        {
          inDegree.put(dependency, 0);
        }
      }
    }

    // Step 2: Add all nodes with in-degree 0 to the queue
    var queue = new LinkedList<String>();
    for (var entry : inDegree.entrySet())
    {
      if (entry.getValue() == 0)
      {
        queue.add(entry.getKey());
      }
    }

    // Step 3: Perform topological sort
    var sortedOrder = new ArrayList<String>();
    while (!queue.isEmpty())
    {
      var current = queue.poll();
      sortedOrder.add(current);

      // Reduce the in-degree of dependent nodes
      for (var neighbor : graph.getOrDefault(current, Collections.emptyList()))
      {
        inDegree.put(neighbor, inDegree.get(neighbor) - 1);
        if (inDegree.get(neighbor) == 0)
        {
          queue.add(neighbor);
        }
      }
    }

    // Step 4: Check for cycles
    if (sortedOrder.size() != inDegree.size())
    {
      throw new IllegalArgumentException("The graph contains a cycle! Topological sorting is not possible.");
    }

    Collections.reverse(sortedOrder);

    return sortedOrder;
  }

}
