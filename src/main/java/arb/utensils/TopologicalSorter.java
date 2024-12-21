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
   * Represents a field assignment in a variable's initialization
   */
  public static class FieldAssignment
  {
    public final String targetObject; // Object being assigned to
    public final String targetField;  // Field being assigned
    public final String sourceObject; // Object being assigned from
    public final String sourceField;  // Field being assigned from

    public FieldAssignment(String targetObj, String targetField, String sourceObj, String sourceField)
    {
      this.targetObject = targetObj;
      this.targetField  = targetField;
      this.sourceObject = sourceObj;
      this.sourceField  = sourceField;
    }
  }

  /**
   * Tracks all dependency information for a variable
   */
  public static class DependencyInfo
  {
    public final String                variableName;
    public final List<String>          constructionDependencies = new ArrayList<>();
    public final List<FieldAssignment> fieldAssignments         = new ArrayList<>();

    public DependencyInfo(String name)
    {
      this.variableName = name;
    }
  }

  /**
   * Determines initialization order and field assignments for variables with
   * dependencies
   * 
   * @param dependencies Map where key is variable name and value contains all
   *                     dependency info
   * @return Ordered list of dependency info with optimal initialization sequence
   */
  public static List<DependencyInfo> findDependencyOrderUsingDepthFirstSearch(Map<String, DependencyInfo> dependencies)
  {
    List<DependencyInfo>      initializationOrder = new ArrayList<>();
    Set<String>               processedVariables  = new HashSet<>();

    // Build graph of construction dependencies
    Map<String, List<String>> constructionGraph   = new HashMap<>();
    dependencies.forEach((name, info) -> constructionGraph.put(name, info.constructionDependencies));

    // Do DFS traversal for construction order
    for (String variable : constructionGraph.keySet())
    {
      if (!processedVariables.contains(variable))
      {
        depthFirstDependencySearch(variable, constructionGraph, processedVariables, initializationOrder, dependencies);
      }
    }

    Collections.reverse(initializationOrder);
    return initializationOrder;
  }

  public static void depthFirstDependencySearch(String variable,
                                                Map<String, List<String>> constructionGraph,
                                                Set<String> processedVariables,
                                                List<DependencyInfo> initializationOrder,
                                                Map<String, DependencyInfo> dependencies)
  {

    if (processedVariables.contains(variable))
      return;

    processedVariables.add(variable);
    for (String dependency : constructionGraph.getOrDefault(variable, Collections.emptyList()))
    {
      depthFirstDependencySearch(dependency, constructionGraph, processedVariables, initializationOrder, dependencies);
    }

    initializationOrder.add(dependencies.get(variable));
  }

  /**
   * Performs depth-first search traversal of dependency graph.
   * 
   * @param variable            Current variable being processed
   * @param dependencies        Map of all variable dependencies
   * @param processedVariables  Set of variables already processed
   * @param initializationOrder Result list containing variables in initialization
   *                            order
   */
  public static void depthFirstDependencySearch(String variable,
                                                Map<String, List<String>> dependencies,
                                                Set<String> processedVariables,
                                                List<String> initializationOrder)
  {

    if (processedVariables.contains(variable))
      return;

    processedVariables.add(variable);
    for (String dependency : dependencies.getOrDefault(variable, Collections.emptyList()))
    {
      depthFirstDependencySearch(dependency, dependencies, processedVariables, initializationOrder);
    }
    initializationOrder.add(variable);
  }

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

  public static String toDotFormatReversedDirect(HashMap<String, DependencyInfo> sortedMap)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append("    rankdir=LR;\n");
    dot.append("    node [shape=box];\n\n");

    // Only add direct edges, but in reverse direction
    for (Map.Entry<String,DependencyInfo> entry : sortedMap.entrySet())
    {
      String node = entry.getKey();
      for (String dependency : entry.getValue().constructionDependencies )
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
