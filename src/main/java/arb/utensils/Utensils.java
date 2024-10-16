package arb.utensils;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.JLabel;

import org.apache.commons.lang3.StringUtils;
import org.objectweb.asm.Type;
import org.scilab.forge.jlatexmath.NewCommandMacro;
import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;
import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.LoaderOptions;
import org.yaml.snakeyaml.TypeDescription;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;
import org.yaml.snakeyaml.inspector.TagInspector;
import org.yaml.snakeyaml.nodes.Tag;

import arb.Complex;
import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.ArbTypeRepresenter;
import arb.expressions.SerializedExpression;
import arb.expressions.viz.ExpressionTree;
import arb.viz.WindowManager;
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
    yamlConfig.setDefaultFlowStyle(DumperOptions.FlowStyle.BLOCK);
    yamlConfig.setPrettyFlow(true);
    NewCommandMacro.addNewCommand("Γ", "\\Gamma", 0);
    NewCommandMacro.addNewCommand("re", "\\operatorname{Re} {#1}", 1);
    NewCommandMacro.addNewCommand("im", "\\operatorname{Im} {#1}", 1);
  }

  public static String indent(int n)
  {
    return StringUtils.repeat(' ', n);
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

  public static final int glStepCount = IntegrationTools.glSteps.length;

  public static File save(BufferedImage image, String file)
  {

    // Create the output file
    File outputFile = new File(file);

    // Write the image to the output file
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

  public static BufferedImage image(Icon icon)
  {
    BufferedImage image = new BufferedImage(icon.getIconWidth(),
                                            icon.getIconHeight(),
                                            BufferedImage.TYPE_INT_ARGB);
    Graphics2D    g2d   = image.createGraphics();
    icon.paintIcon(null, g2d, 0, 0);
    g2d.dispose();
    return image;
  }

  public static ImageViewer showFormula(String formula)
  {
    // Create and show the Image Viewer window
    // SwingUtilities.invokeLater(() ->
    {
      ImageViewer imageViewer = new ImageViewer(formula,
                                                renderFormula(formula));
      imageViewer.setVisible(true);
      return imageViewer;
    }

  }

  public static void saveFormula(String formula, String path) throws IOException
  {
    BufferedImage bimg = renderFormula(formula);

    File          out  = new File(path);
    ImageIO.write(bimg, "png", out);
  }

  public static BufferedImage renderFormula(String formula)
  {
    return renderFormula(formula, 20);
  }

  public static BufferedImage renderFormula(String formula, int size)
  {
    TeXFormula    tf   = new TeXFormula(formula);
    TeXIcon       ti   = tf.createTeXIcon(TeXConstants.STYLE_DISPLAY, size);
    BufferedImage bimg = new BufferedImage(ti.getIconWidth(),
                                           ti.getIconHeight(),
                                           BufferedImage.TYPE_4BYTE_ABGR);

    Graphics2D    g2d  = bimg.createGraphics();
    g2d.setColor(new Color(112,
                           128,
                           144,
                           0));
    g2d.fillRect(0, 0, ti.getIconWidth(), ti.getIconHeight());

    JLabel jl = new JLabel();
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

  public static boolean overlaps(Real tmp, Real a, Real b, int fidelity)
  {
    return a.sub(b, fidelity, tmp).containsZero();
  }

  /**
   * A version of {@link Complex#overlaps(Complex)} used by the integration code
   * which is less accurate by design in that it determines the regions to overlay
   * they do so within a specified precision
   * 
   * @param tmp
   * @param a
   * @param b
   * @param prec
   * @return (a-b).containsZero()
   */
  public static boolean overlaps(Complex tmp, Complex a, Complex b, int prec)
  {
    return a.sub(b, prec, tmp).containsZero();
  }

  public static void println(Object s)
  {
    System.out.println(s);
  }

  public static RealMatrix newBivariateCorrelationMatrix(Real ρ)
  {
    var correlation = RealMatrix.newMatrix(2, 2);
    correlation.get(0, 0).set(correlation.get(1, 1).identity());
    correlation.get(1, 0).set(correlation.get(0, 1).set(ρ));
    return correlation;
  }

  public static String normalizeSubscriptedDigits(String subscript)
  {
    return subscript.replace("₀", "0")
                    .replace("₁", "1")
                    .replace("₂", "2")
                    .replace("₃", "3")
                    .replace("₄", "4")
                    .replace("₅", "5")
                    .replace("₆", "6")
                    .replace("₇", "7")
                    .replace("₈", "8")
                    .replace("₉", "9");
  }

  public static List<Type> classTypes(Class<?>... args)
  {
    return Stream.of(args).map(Type::getType).collect(Collectors.toList());
  }

  public static void throwOrWrap(Throwable e)
  {
    if (e instanceof RuntimeException)
    {
      throw (RuntimeException) e;
    }
    else
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
  }

  public static void wrapOrThrow(Throwable e)
  {
    if (e instanceof RuntimeException)
    {
      throw (RuntimeException) e;
    }
    else
    {
      throw new RuntimeException(e);
    }
  }

  public static void wrapOrThrow(String msg, Throwable e)
  {
    if (e instanceof RuntimeException)
    {
      e.addSuppressed(new Throwable(msg));
      throw (RuntimeException) e;
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

  /**
   * 
   * @param a
   * @return true if it was an AutoCloseable, false if not
   */
  public static boolean closeIfAutoCloseable(Object a)
  {
    if (a instanceof AutoCloseable)
    {
      try
      {
        ((AutoCloseable) a).close();
      }
      catch (Exception e)
      {
        throwOrWrap(e);
      }
      return true;
    }
    return false;
  }

  public static void loadFromYamlFormat(File file) throws FileNotFoundException
  {
    Yaml   yaml   = newYaml();

    Object loaded = yaml.loadAs(new FileReader(file), SerializedExpression.class);

    System.out.println("Loaded " + loaded);

  }

  public static void saveToYamlFormat(String yamlFile, Object... information)
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
        WindowManager.showAlert("Exception throw", yamlFile, e);
      });
      throwOrWrap(e);
    }
  }

  public static Yaml newYaml()
  {
    LoaderOptions loadingConfig = new LoaderOptions();
    loadingConfig.setTagInspector(tag -> true);
    Yaml yaml = new Yaml(new Constructor(SerializedExpression.class,
                                         loadingConfig),
                         new ArbTypeRepresenter(yamlConfig),
                         yamlConfig);

    return yaml;
  }

  public static Comparator<? super Class<?>> classNameComparator = (a, b) ->
  {
    Class<?> classA = (Class<?>) a;
    Class<?> classB = (Class<?>) b;
    return classA.getSimpleName().compareTo(classB.getSimpleName());
  };

}
