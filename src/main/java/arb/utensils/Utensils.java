package arb.utensils;

import static guru.nidi.graphviz.model.Factory.*;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.JLabel;

import org.objectweb.asm.Type;
import org.scilab.forge.jlatexmath.*;
import org.yaml.snakeyaml.*;
import org.yaml.snakeyaml.DumperOptions.NonPrintableStyle;
import org.yaml.snakeyaml.constructor.Constructor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.FunctionMapping;
import arb.expressions.SerializedExpression;
import arb.expressions.context.Dependency;
import arb.viz.WindowManager;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;
import javafx.application.Platform;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Utensils
{
  public final static DumperOptions yamlConfig = new DumperOptions();

  static
  {
    yamlConfig.setAllowUnicode(true);
    yamlConfig.setExplicitStart(true);
    yamlConfig.setExplicitEnd(true);
    yamlConfig.setDefaultFlowStyle(DumperOptions.FlowStyle.BLOCK);
    yamlConfig.setPrettyFlow(true);
    yamlConfig.setSplitLines(false);
    yamlConfig.setNonPrintableStyle(NonPrintableStyle.ESCAPE);
    NewCommandMacro.addNewCommand("Z", "\\operatorname{Z} {#1}", 1);
    NewCommandMacro.addNewCommand("W", "\\operatorname{W}_{#1}", 1);
    NewCommandMacro.addNewCommand("re", "\\operatorname{Re} {#1}", 1);
    NewCommandMacro.addNewCommand("im", "\\operatorname{Im} {#1}", 1);
    NewCommandMacro.addNewCommand("mathd", "\\mathrm{d}", 0);
  }

  public static String repeat(final char ch, final int repeat)
  {
    if (repeat <= 0)
    {
      return "";
    }
    final char[] buf = new char[repeat];
    Arrays.fill(buf, ch);
    return new String(buf);
  }

  public static String indent(int n)
  {
    return repeat(' ', n);
  }

  /**
   * 
   * @param input a string
   * @return a string with the trailing zeros trimmed
   */
  public static String removeTrailingZeros(String input)
  {
    int pm = input.indexOf("+/-");
    if (input == null || input.length() == 0)
    {
      return input;
    }

    int decimalIndex = input.indexOf('.');
    if (decimalIndex == -1)
    {
      return input;
    }

    int lastIndex = input.length() - 1;
    while (lastIndex > decimalIndex && lastIndex > pm && input.charAt(lastIndex) == '0')
    {
      lastIndex--;
    }

    if (input.charAt(lastIndex) == '.')
    {
      lastIndex--;
    }

    return input.substring(0, lastIndex + 1);
  }

  public static File saveBufferedImageToPNGFile(BufferedImage image, String file)
  {
    var outputFile = new File(file);

    try
    {
      ImageIO.write(image, "png", outputFile);
    }
    catch (IOException e)
    {
      throwOrWrap(e);
    }

    return outputFile;
  }

  public static BufferedImage convertIconToBufferedImage(Icon icon)
  {
    var image = new BufferedImage(icon.getIconWidth(),
                                  icon.getIconHeight(),
                                  BufferedImage.TYPE_INT_ARGB);
    var g2d   = image.createGraphics();
    icon.paintIcon(null, g2d, 0, 0);
    g2d.dispose();
    return image;
  }

  public static void saveLatexFormulaToPNGFile(String formula, String path, int size) throws IOException
  {
    var bimg = renderLatexFormulaAsBufferedImage(formula, size);
    var out  = new File(path);
    ImageIO.write(bimg, "png", out);
  }

  public static BufferedImage renderLatexFormulaAsBufferedImage(String formula, int size)
  {
    var tf   = new TeXFormula(formula);
    var ti   = tf.createTeXIcon(TeXConstants.STYLE_DISPLAY, size);
    var bimg = new BufferedImage(ti.getIconWidth(),
                                 ti.getIconHeight(),
                                 BufferedImage.TYPE_4BYTE_ABGR);

    var g2d  = bimg.createGraphics();
    g2d.setColor(new Color(112,
                           128,
                           144,
                           0));
    g2d.fillRect(0, 0, ti.getIconWidth(), ti.getIconHeight());

    var jl = new JLabel();
    jl.setForeground(new Color(0,
                               0,
                               0));
    ti.paintIcon(jl, g2d, 0, 0);
    return bimg;
  }

  public static TeXIcon renderFormulaAsIcon(String latex, int size)
  {
    var formula = new TeXFormula(latex);
    var icon    = formula.createTeXIcon(TeXConstants.STYLE_TEXT, size, true);
    return icon;
  }

  public static void println(Object s)
  {
    System.out.println(s);
  }

  public static List<Type> classTypes(Class<?>... args)
  {
    return Stream.of(args).map(Type::getType).collect(Collectors.toList());
  }

  public static void throwOrWrap(Throwable e)
  {
    wrapOrThrow(e);
  }

  public static void wrapOrThrow(Throwable e)
  {

    if (e instanceof RuntimeException q)
    {
      throw q;
    }
    else if (e instanceof VerifyError q)
    {
      throw q;
    }
    else
    {
      throw new RuntimeException(e);
    }
  }

  public static void wrapOrThrow(String msg, Throwable e)
  {
    if (e instanceof RuntimeException q)
    {
      throw q;
    }
    else
    {
      throw new RuntimeException(msg,
                                 e);
    }
  }

  public static String stackTraceToString(Throwable first)
  {
    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    first.printStackTrace(new PrintWriter(outputStream,
                                          true));
    try
    {
      outputStream.flush();
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
    return outputStream.toString();
  }

  public static <T> T loadFromYamlFormat(File file) throws FileNotFoundException
  {
    Yaml yaml   = newYaml();

    T    loaded = yaml.load(new FileReader(file));

    return loaded;
  }

  public static String yamlString(Object... information)
  {

    Yaml                  yaml       = newYaml();
    ByteArrayOutputStream baos       = new ByteArrayOutputStream();
    PrintWriter           fileWriter = new PrintWriter(baos);
    for (Object obj : information)
    {
      yaml.dump(obj, fileWriter);
    }
    fileWriter.close();
    return baos.toString();

  }

  public static File saveToYamlFormat(File yamlFile, Object... information)
  {
    try
    {
      Yaml       yaml       = newYaml();
      FileWriter fileWriter = new FileWriter(yamlFile);
      for (Object obj : information)
      {
        yaml.dump(obj, fileWriter);
      }
      fileWriter.close();
    }
    catch (IOException e)
    {
      Platform.runLater(() ->
      {
        WindowManager.showAlert("Exception throw", yamlFile.toString(), e);
      });
      throwOrWrap(e);
    }
    return yamlFile;
  }

  public static Yaml newYaml()
  {
    LoaderOptions loadingConfig = new LoaderOptions();
    loadingConfig.setTagInspector(tag -> true);
    loadingConfig.setAllowRecursiveKeys(true);
    Yaml yaml = new Yaml(new Constructor(SerializedExpression.class,
                                         loadingConfig),
                         new TypeRepresenter(yamlConfig),
                         yamlConfig);

    return yaml;
  }

  public static Comparator<? super Class<?>> classNameComparator = (a, b) ->
  {
    Class<?> classA = (Class<?>) a;
    Class<?> classB = (Class<?>) b;
    return classA.getSimpleName().compareTo(classB.getSimpleName());
  };

  public static <T extends AutoCloseable> T close(T closeable)
  {
    if (closeable != null)
    {
      try
      {
        closeable.close();
      }
      catch (Exception e)
      {
        throwOrWrap(e);
      }
    }
    return null;
  }

  public static BufferedImage createDependencyGraphBufferedImage(Map<String, Dependency> dependencies)
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

  public static List<Dependency>
         sortDependencies(Map<String, Dependency> dependencies,
                          HashMap<String, FunctionMapping<?, ?, ?>> mappings)
  {
    var initializationOrder = new ArrayList<Dependency>();
    var processedVariables  = new HashSet<String>();

    dependencies.forEach((name,
                          info) -> info.dependencies.forEach(dep -> dependencies.get(dep).provisions.add(name)));

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
    var info = dependencies.get(variable);
    for (var dep : info.dependencies)
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

    for (var entry : graph.entrySet())
    {
      String node = entry.getKey();
      for (var dependency : entry.getValue().dependencies)
      {
        dot.append(String.format(" \"%s\" -> \"%s\";\n", dependency, node));
      }
    }

    dot.append("}\n");
    return dot.toString();
  }

  public static void saveStringToFile(String dotContent, String filePath)
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
