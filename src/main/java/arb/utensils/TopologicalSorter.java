package arb.utensils;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TopologicalSorter
{
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

  public static List<DependencyInfo> findDependencyOrderUsingDepthFirstSearch(Map<String, DependencyInfo> dependencies)
  {
    List<DependencyInfo>      initializationOrder = new ArrayList<>();
    Set<String>               processedVariables  = new HashSet<>();

    Map<String, List<String>> constructionGraph   = new HashMap<>();
    dependencies.forEach((name, info) -> constructionGraph.put(name, info.constructionDependencies));

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

  private static void depthFirstDependencySearch(String variable,
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

  public static String toDotFormat(Map<String, List<String>> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append(" rankdir=LR;\n");
    dot.append(" node [shape=box];\n\n");

    for (Map.Entry<String, List<String>> entry : graph.entrySet())
    {
      String node = entry.getKey();
      for (String dependency : entry.getValue())
      {
        dot.append(String.format(" \"%s\" -> \"%s\";\n", node, dependency));
      }
    }

    dot.append("}\n");
    return dot.toString();
  }

  public static String toDotFormatReversedDirect(Map<String, DependencyInfo> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append(" rankdir=LR;\n");
    dot.append(" node [shape=box];\n\n");

    for (Map.Entry<String, DependencyInfo> entry : graph.entrySet())
    {
      String node = entry.getKey();
      for (String dependency : entry.getValue().constructionDependencies)
      {
        dot.append(String.format(" \"%s\" -> \"%s\";\n", dependency, node));
      }
    }

    dot.append("}\n");
    return dot.toString();
  }

  public static String toDotFormatReversed(Map<String, List<String>> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append(" rankdir=LR;\n");
    dot.append(" node [shape=box];\n\n");

    for (Map.Entry<String, List<String>> entry : graph.entrySet())
    {
      String node = entry.getKey();
      for (String dependency : entry.getValue())
      {
        dot.append(String.format(" \"%s\" -> \"%s\";\n", dependency, node));
      }
    }

    dot.append("}\n");
    return dot.toString();
  }

  public static void addTransitiveDependencies(Map<String, List<String>> graph)
  {
    for (String node : new ArrayList<>(graph.keySet()))
    {
      List<String> dependencies = graph.computeIfAbsent(node, k -> new ArrayList<>());

      for (String dep : new ArrayList<>(dependencies))
      {
        List<String> transitive = graph.getOrDefault(dep, Collections.emptyList());

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
}
