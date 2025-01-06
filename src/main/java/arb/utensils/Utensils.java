package arb.utensils;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.JLabel;

import org.objectweb.asm.Type;
import org.scilab.forge.jlatexmath.NewCommandMacro;
import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;
import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.DumperOptions.NonPrintableStyle;
import org.yaml.snakeyaml.LoaderOptions;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;

import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.TypeRepresenter;
import arb.expressions.SerializedExpression;
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
    yamlConfig.setAllowUnicode(true);
    yamlConfig.setExplicitStart(true);
    yamlConfig.setExplicitEnd(true);
    yamlConfig.setDefaultFlowStyle(DumperOptions.FlowStyle.BLOCK);
    yamlConfig.setPrettyFlow(true);
    yamlConfig.setSplitLines(false);
    yamlConfig.setNonPrintableStyle(NonPrintableStyle.ESCAPE);
    NewCommandMacro.addNewCommand("Z", "\\operatorname{Z} {#1}", 1);
    NewCommandMacro.addNewCommand("Γ", "\\Gamma", 0);
    NewCommandMacro.addNewCommand("re", "\\operatorname{Re} {#1}", 1);
    NewCommandMacro.addNewCommand("im", "\\operatorname{Im} {#1}", 1);
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

  public static File save(BufferedImage image, String file)
  {

    // Create the output file
    var outputFile = new File(file);

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
    var image = new BufferedImage(icon.getIconWidth(),
                                  icon.getIconHeight(),
                                  BufferedImage.TYPE_INT_ARGB);
    var g2d   = image.createGraphics();
    icon.paintIcon(null, g2d, 0, 0);
    g2d.dispose();
    return image;
  }

  public static ImageViewer showFormula(Typesettable formula)
  {

    var imageViewer = new ImageViewer(formula.toString(),
                                      renderFormula(formula.typeset()));
    imageViewer.setVisible(true);
    return imageViewer;

  }

  public static void saveFormula(String formula, String path) throws IOException
  {
    var bimg = renderFormula(formula);
    var out  = new File(path);
    ImageIO.write(bimg, "png", out);
  }

  public static BufferedImage renderFormula(String formula)
  {
    return renderFormula(formula, 20);
  }

  public static BufferedImage renderFormula(String formula, int size)
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
    if (e instanceof RuntimeException q)
    {
      throw q;
    }
    else
    {
      throw new RuntimeException(e instanceof VerifyError ? e.getClass().getName() : e.getMessage(),
                                 e);
    }
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

  public static SerializedExpression loadFromYamlFormat(File file) throws FileNotFoundException
  {
    Yaml                 yaml   = newYaml();

    SerializedExpression loaded = yaml.load(new FileReader(file));

    System.out.println("Loaded " + loaded);
    return loaded;
  }

  public static void saveToYamlFormat(File yamlFile, Object... information)
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


}
