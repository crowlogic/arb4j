package arb.expressions;

import static arb.utensils.Utensils.throwOrWrap;
import static guru.nidi.graphviz.model.Factory.mutGraph;
import static guru.nidi.graphviz.model.Factory.mutNode;
import static guru.nidi.graphviz.model.Factory.to;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.utensils.Dependency;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.image.WritableImage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TopologicalSorter
{

//Convert AWT BufferedImage to JavaFX Image
  public static Image awtToFX(java.awt.image.BufferedImage awtImage)
  {
    WritableImage fxImage = null;
    if (awtImage != null)
    {
      fxImage = new WritableImage(awtImage.getWidth(),
                                  awtImage.getHeight());
      SwingFXUtils.toFXImage(awtImage, fxImage);
    }
    return fxImage;
  }

  public static ImageView createGraphView(Map<String, Dependency> dependencies)
  {
    MutableGraph g = mutGraph("DependencyGraph").setDirected(true);

    dependencies.forEach((name, dep) ->
    {
      MutableNode node = mutNode(name);
      dep.dependencies.forEach(d -> node.addLink(to(mutNode(d))));
      g.add(node);
    });

    try
    {
      BufferedImage image = Graphviz.fromGraph(g).render(Format.PNG).toImage();
      return new ImageView(awtToFX(image));
    }
    catch (Exception e)
    {
      throwOrWrap(e);
      return null;
    }
  }

  public static List<Dependency>
         findDependencyOrderUsingDepthFirstSearch(Map<String, Dependency> dependencies,
                                                  HashMap<String, FunctionMapping<?, ?, ?>> mappings)
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

  public static String toDotFormatReversedDirect(Map<String, Dependency> graph)
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
