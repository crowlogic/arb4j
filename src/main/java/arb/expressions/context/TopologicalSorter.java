package arb.expressions.context;

import static arb.utensils.Utensils.throwOrWrap;
import static guru.nidi.graphviz.model.Factory.mutGraph;
import static guru.nidi.graphviz.model.Factory.mutNode;
import static guru.nidi.graphviz.model.Factory.to;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.FunctionMapping;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TopologicalSorter
{

  public static BufferedImage createDependencyGraphImage(Map<String, Dependency> dependencies)
  {
    MutableGraph g = mutGraph("DependencyGraph").setDirected(true);

    dependencies.forEach((name, dep) ->
    {
      MutableNode node = mutNode(name);
      dep.dependencies.forEach(d -> node.addLink(to(mutNode(d))));
      g.add(node);
    });
    BufferedImage image;
    try
    {
      image = Graphviz.fromGraph(g).render(Format.PNG).toImage();
    }
    catch (Exception e)
    {
      throwOrWrap(e);
      return null;
    }
    return image;
  }

  public static List<Dependency> determineDependencyOrderUsingDepthFirstSearch(Map<String,
                Dependency> dependencies, HashMap<String, FunctionMapping<?, ?, ?>> mappings)
  {
    List<Dependency> initializationOrder = new ArrayList<>();
    Set<String>      processedVariables  = new HashSet<>();

    // Build reverse dependency graph
    dependencies.forEach((name,
                          info) -> info.dependencies.forEach(dep -> dependencies.get(dep).reverseDependencies.add(name)));

    // Do DFS traversal using dependencies
    dependencies.keySet()
                .stream()
                .filter(variable -> !processedVariables.contains(variable))
                .forEach(variable -> depthFirstDependencySearch(variable,
                                                                dependencies,
                                                                processedVariables,
                                                                initializationOrder));

    Collections.reverse(initializationOrder);

    return initializationOrder;
  }

  private static void depthFirstDependencySearch(String variable,
                                                 Map<String, Dependency> dependencies,
                                                 Set<String> processedVariables,
                                                 List<Dependency> initializationOrder)
  {

    if (processedVariables.contains(variable))
      return;

    processedVariables.add(variable);
    Dependency info = dependencies.get(variable);
    for (String dep : info.dependencies)
    {
      depthFirstDependencySearch(dep, dependencies, processedVariables, initializationOrder);
    }

    initializationOrder.add(info);
  }

  public static String toDotFormatReversed(Map<String, Dependency> graph)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph DependencyGraph {\n");
    dot.append(" rankdir=LR;\n");
    dot.append(" node [shape=box];\n\n");

    for (Map.Entry<String, Dependency> entry : graph.entrySet())
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
