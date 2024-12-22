package arb.utensils;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.FunctionMapping;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TopologicalSorter
{
  public static class DependencyInfo
  {
    public final String       variableName;
    public final List<String> dependencies        = new ArrayList<>(); // was constructionDependencies
    public final List<String> reverseDependencies = new ArrayList<>(); // was fieldAssignments

    public DependencyInfo(String name)
    {
      this.variableName = name;
    }

    @Override
    public String toString()
    {
      return String.format("DependencyInfo[variableName=%s, dependencies=%s, reverseDependencies=%s]",
                           variableName,
                           dependencies,
                           reverseDependencies);
    }
  }

  public static List<DependencyInfo>
         findDependencyOrderUsingDepthFirstSearch(Map<String, DependencyInfo> dependencies,
                                                  HashMap<String, FunctionMapping<?, ?, ?>> mappings)
  {
    List<DependencyInfo> initializationOrder = new ArrayList<>();
    Set<String>          processedVariables  = new HashSet<>();

    // Build reverse dependency graph
    dependencies.forEach((name,
                          info) -> info.dependencies.forEach(dep -> dependencies.get(dep).reverseDependencies.add(name)));

    // Do DFS traversal using dependencies
    for (String variable : dependencies.keySet())
    {
      if (!processedVariables.contains(variable))
      {
        depthFirstDependencySearch(variable, dependencies, processedVariables, initializationOrder);
      }
    }
 
    Collections.reverse(initializationOrder); // Now we need the reverse again
   
    return initializationOrder;
  }

  private static void depthFirstDependencySearch(String variable,
                                                 Map<String, DependencyInfo> dependencies,
                                                 Set<String> processedVariables,
                                                 List<DependencyInfo> initializationOrder)
  {

    if (processedVariables.contains(variable))
      return;

    processedVariables.add(variable);
    DependencyInfo info = dependencies.get(variable);
    for (String dep : info.dependencies)
    {
      depthFirstDependencySearch(dep, dependencies, processedVariables, initializationOrder);
    }

    initializationOrder.add(info);
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

  public static String toDotFormatReversedDirect(Map<String, DependencyInfo> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append(" rankdir=LR;\n");
    dot.append(" node [shape=box];\n\n");

    for (Map.Entry<String, DependencyInfo> entry : graph.entrySet())
    {
      String node = entry.getKey();
      for (String dependency : entry.getValue().dependencies)
      {
        dot.append(String.format(" \"%s\" -> \"%s\";\n", dependency, node));
      }
    }

    dot.append("}\n");
    return dot.toString();
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
