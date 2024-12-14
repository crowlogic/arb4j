package arb.utensils;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.*;
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

  public static void reduceDependentNodesInDegree(Map<String, List<String>> graph,
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

  public static String toDotFormat(Map<String, List<String>> graph)
  {
    StringBuilder dot = new StringBuilder();

    // Start the digraph
    dot.append("digraph DependencyGraph {\n");
    dot.append("    rankdir=LR;\n"); // Left to right direction
    dot.append("    node [shape=box];\n\n");

    // Add all edges
    for (Map.Entry<String, List<String>> entry : graph.entrySet())
    {
      String       node         = entry.getKey();
      List<String> dependencies = entry.getValue();

      // Add edges for each dependency
      for (String dependency : dependencies)
      {
        dot.append(String.format("    \"%s\" -> \"%s\";\n", node, dependency));
      }
    }

    // Close the digraph
    dot.append("}\n");

    return dot.toString();
  }

  public static String toDotFormatReversedDirect(Map<String, List<String>> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append("    rankdir=LR;\n");
    dot.append("    node [shape=box];\n\n");

    // Only add direct edges, but in reverse direction
    for (Map.Entry<String, List<String>> entry : graph.entrySet())
    {
      String node = entry.getKey();
      for (String dependency : entry.getValue())
      {
        // Reverse: dependency points TO node instead of node pointing TO dependency
        dot.append(String.format("    \"%s\" -> \"%s\";\n", dependency, node));
      }
    }

    dot.append("}\n");
    return dot.toString();
  }

  public static String toDotFormatReversed(Map<String, List<String>> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append("    rankdir=LR;\n");
    dot.append("    node [shape=box];\n\n");

    // Add edges in reverse direction
    for (Map.Entry<String, List<String>> entry : graph.entrySet())
    {
      String       node         = entry.getKey();
      List<String> dependencies = entry.getValue();

      // Reverse the direction: instead of node -> dependency
      // we do dependency -> node
      for (String dependency : dependencies)
      {
        dot.append(String.format("    \"%s\" -> \"%s\";\n", dependency, node)); // Note the swap here
      }
    }

    dot.append("}\n");
    return dot.toString();
  }

  public static void addTransitiveDependencies(Map<String, List<String>> graph)
  {
    // For each node in the graph
    for (String node : new ArrayList<>(graph.keySet()))
    {
      // Get or create its dependency list
      List<String> dependencies = graph.computeIfAbsent(node, k -> new ArrayList<>());

      // For each direct dependency
      for (String dep : new ArrayList<>(dependencies))
      {
        // Get that dependency's dependencies
        List<String> transitive = graph.getOrDefault(dep, Collections.emptyList());

        // Add all transitive dependencies if they're not already present
        for (String trans : transitive)
        {
          if (!dependencies.contains(trans))
          {
            dependencies.add(trans);
          }
        }
      }
    }
  }

// Utility method to save the DOT content to a file
  public static void saveToDotFile(String dotContent, String filePath)
  {
    try ( PrintWriter out = new PrintWriter(filePath))
    {
      out.println(dotContent);
    }
    catch (FileNotFoundException e)
    {
      e.printStackTrace();
    }
  }

// Example usage
  public static void main(String[] args)
  {
    // Example graph
    Map<String, List<String>> graph = new HashMap<>();
    graph.put("A", Arrays.asList("B", "C"));
    graph.put("B", Arrays.asList("D"));
    graph.put("C", Arrays.asList("D"));
    graph.put("D", new ArrayList<>());

    String dotContent = toDotFormat(graph);
    saveToDotFile(dotContent, "dependency_graph.dot");

    // Print the DOT content
    System.out.println(dotContent);
  }
}
