package arb.utensils;

import static arb.IntegerConstants.FLINT_BITS;
import static arb.arblib.*;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
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

import arb.Complex;
import arb.Float;
import arb.FloatInterval;
import arb.Magnitude;
import arb.Real;
import arb.RealMatrix;
import arb.RealRootInterval.RefinementResult;
import arb.RoundingMode;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Utensils
{

  static
  {
    NewCommandMacro.addNewCommand("re", "\\operatorname{Re} {#1}", 1);
    NewCommandMacro.addNewCommand("im", "\\operatorname{Im} {#1}", 1);
  }

  public static String indent(int n)
  {
    return StringUtils.repeat(' ', n);
  }

  public static String superscriptToRegular(String input)
  {
    return input.replace("⁰", "0")
                .replace("¹", "1")
                .replace("²", "2")
                .replace("³", "3")
                .replace("⁴", "4")
                .replace("⁵", "5")
                .replace("⁶", "6")
                .replace("⁷", "7")
                .replace("⁸", "8")
                .replace("⁹", "9")
                .replace("ᵃ", "a")
                .replace("ᵉ", "e")
                .replace("ᶦ", "i")
                .replace("ʲ", "j")
                .replace("ᵏ", "k")
                .replace("ᶫ", "l")
                .replace("ᵐ", "m")
                .replace("ⁿ", "n")
                .replace("ᵒ", "o")
                .replace("ᵖ", "p")
                .replace("ʳ", "r")
                .replace("ˢ", "s")
                .replace("ᵗ", "t")
                .replace("ᵘ", "u")
                .replace("ᵛ", "v")
                .replace("ˣ", "x");
  }

  public static String subscriptToRegular(String input)
  {
    return input.replace("₀", "0")
                .replace("₁", "1")
                .replace("₂", "2")
                .replace("₃", "3")
                .replace("₄", "4")
                .replace("₅", "5")
                .replace("₆", "6")
                .replace("₇", "7")
                .replace("₈", "8")
                .replace("₉", "9")
                .replace("ₐ", "a")
                .replace("ₑ", "e")
                .replace("ₕ", "h")
                .replace("ᵢ", "i")
                .replace("ⱼ", "j")
                .replace("ₖ", "k")
                .replace("ₗ", "l")
                .replace("ₘ", "m")
                .replace("ₙ", "n")
                .replace("ₒ", "o")
                .replace("ₚ", "p")
                .replace("ᵣ", "r")
                .replace("ₛ", "s")
                .replace("ₜ", "t")
                .replace("ᵤ", "u")
                .replace("ᵥ", "v")
                .replace("ₓ", "x");
  }

  public static String toSuperscript(int number)
  {
    StringBuilder result    = new StringBuilder();
    String        numberStr = Integer.toString(number);

    for (int i = 0; i < numberStr.length(); i++)
    {
      result.append(digitToSuperscript(numberStr.charAt(i)));
    }

    return result.toString();
  }

  public static char digitToSuperscript(char digit)
  {
    switch (digit)
    {
    case '0':
      return '⁰';
    case '1':
      return '¹';
    case '2':
      return '²';
    case '3':
      return '³';
    case '4':
      return '⁴';
    case '5':
      return '⁵';
    case '6':
      return '⁶';
    case '7':
      return '⁷';
    case '8':
      return '⁸';
    case '9':
      return '⁹';
    default:
      throw new IllegalArgumentException("Not a digit: " + digit);
    }
  }

  public static void main(String[] args)
  {
    int number = 1234567890;
    System.out.println("Superscript: " + toSuperscript(number));
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

  public static RefinementResult refineRootViaNewtonsMethod(RealFunction f,
                                                            Real root,
                                                            Real convergenceRegion,
                                                            Float convergenceFactor,
                                                            int extraPrec,
                                                            int prec)
  {
    int precs[] = new int[FLINT_BITS];
    int iters, startPrec = root.relAccuracyBits();

    if ((iters = determineNewtonStepScalingPrecisions(convergenceFactor, prec, precs, startPrec))
                  == -1)
    {
      return RefinementResult.ImpreciseInput;
    }

    return calculateNewtonSteps(f,
                                root,
                                convergenceRegion,
                                convergenceFactor,
                                extraPrec,
                                precs,
                                iters);
  }

  public static RefinementResult calculateNewtonSteps(RealFunction f,
                                                      Real root,
                                                      Real convergenceRegion,
                                                      Float convergenceFactor,
                                                      int extraPrec,
                                                      int[] precs,
                                                      int iters)
  {
    int i;
    int workingPrecision;
    for (i = iters - 1; i >= 0; i--)
    {
      workingPrecision = precs[i] + extraPrec;

      if (!f.calculateNewtonStep(root,
                                 convergenceRegion,
                                 convergenceFactor,
                                 workingPrecision,
                                 root))
      {
        return RefinementResult.NoConvergence;
      }
    }

    return RefinementResult.Success;

  }

  public static int determineNewtonStepScalingPrecisions(Float convergenceFactor,
                                                         int prec,
                                                         int[] precs,
                                                         int startPrec)
  {
    int iters;
    int padding =
                Math.max(0, Math.min(arblib.arf_abs_bound_lt_2exp_si(convergenceFactor), prec) + 5);
    precs[0] = prec + padding;
    iters    = 1;
    while ((iters < FLINT_BITS) && (precs[iters - 1] + padding > 2 * startPrec))
    {
      precs[iters] = (precs[iters - 1] / 2) + padding;
      iters++;

      if (iters == FLINT_BITS)
      {
        return -1;
      }
    }
    return iters;
  }

  public static boolean computeNewtonStep(RealFunction f,
                                          Real point,
                                          Real convergenceRegion,
                                          Float convergenceFactor,
                                          int prec,
                                          Real nextPoint)
  {
    try ( Magnitude err = new Magnitude(); Magnitude v = new Magnitude(); Real t = new Real();
          Real u = Real.newVector(2))
    {
      Magnitude xRadius = point.getRad();
      xRadius.pow(2, err);
      convergenceFactor.getMagnitude(v).mul(err, err);

      t.setMid(point.getMid());
      t.getRad().zero();

      f.evaluate(t.get(0), 2, prec, u);
      u.get(0).div(u.get(1), prec);
      t.get(0).sub(u.get(0), prec, u.get(0));
      Magnitude uRadius = u.getRad();
      uRadius.add(err, uRadius);

      if (convergenceRegion.contains(u) && uRadius.compareTo(xRadius) < 0)
      {
        nextPoint.get(0).swap(u);
        return true;
      }
      else
      {
        nextPoint.get(0).set(point);
        return false;
      }
    }
  }

  public static Complex
         calculateSimpleQuadrature(ComplexFunction f, Complex a, Complex b, int prec, Complex res)
  {
    try ( Complex midpoint = new Complex(); Complex δ = new Complex();
          Complex widePoint = new Complex();)
    {
      /* δ = (b-a)/2 */
      b.sub(a, prec, δ).mul2e(-1);

      /* mid = (a+b)/2 */
      a.add(b, prec, midpoint).mul2e(-1);

      /* wide = mid +- [δ] */
      widePoint.set(midpoint).addUncertainty(δ);

      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      Complex result = f.evaluate(widePoint, 0, prec, res).mul(δ, prec, res).mul2e(-1);
      assert result.isFinite() : String.format("f(%s)=%s\n", widePoint, result);
      return result;
    }
  }

  public static void resizeVectors(int allocation, Complex as, Complex bs, Complex vs, Magnitude ms)
  {
    int k;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (k = allocation; k < allocation; k++)
    {
      as.get(k).init();
      bs.get(k).init();
      vs.get(k).init();
      ms.get(k).init();
    }
  }

  public static final int glSteps[]   =
  { 1,
    2,
    4,
    6,
    8,
    12,
    16,
    22,
    32,
    46,
    64,
    90,
    128,
    182,
    256,
    362,
    512,
    724,
    1024,
    1448,
    2048,
    2896,
    4096,
    5792,
    8192,
    11586,
    16384,
    23170,
    32768,
    46340,
    65536,
    92682,
    131072,
    185364,
    262144,
    370728,
    524288,
    741456 };

  public static final int glStepCount = glSteps.length;

  public static void evaluateBestGaussLegendreQuadratureRule(ComplexFunction f,
                                                             int bits,
                                                             AtomicLong evalCount,
                                                             Complex res,
                                                             boolean converged,
                                                             Complex mid,
                                                             Complex δ,
                                                             Complex widePoint,
                                                             Complex s,
                                                             Complex v,
                                                             Magnitude err,
                                                             int best_n)
  {
    int k;
    int i;
    if (converged)
    {
      try ( Real x = Real.newVector(2))
      {
        Real w = x.get(1);
        assert best_n != -1;

        for (i = 0; i < glStepCount; i++)
          if (glSteps[i] == best_n)
            break;

        s.zero();

        for (k = 0; k < best_n; k++)
        {
          acb_calc_gl_node(x, w, i, k, bits);
          δ.mul(x, bits, widePoint).add(mid, bits);
          f.evaluate(widePoint, 0, bits, v);
          v.addmul(x.get(1), bits, s);
        }

        evalCount.getAndAdd(best_n);

        acb_add_error_mag(s.mul(δ, bits, res), err);

      }
    }
    else
    {
      res.setIndeterminate();
    }
  }

  public static void swapElements(Complex as, Complex bs, Complex vs, Magnitude ms, int depth)
  {
    as.swap(as.get(depth));
    bs.swap(bs.get(depth));
    vs.swap(vs.get(depth));
    ms.swap(ms.get(depth));
  }

  public static void swapElements(Real as, Real bs, Complex vs, Magnitude ms, int depth)
  {
    as.swap(as.get(depth));
    bs.swap(bs.get(depth));
    vs.swap(vs.get(depth));
    ms.swap(ms.get(depth));
  }

  public static void resizeRegisters(int allocation, Real as, Real bs, Complex vs, Magnitude ms)
  {
    int k = allocation;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (; k < allocation; k++)
    {
      arb_init(as.get(k));
      arb_init(bs.get(k));
      acb_init(vs.get(k));
      mag_init(ms.get(k));
    }
  }

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
    g2d.setColor(Color.white);
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

  public static void heapUp(Real as, Real bs, Complex vs, Magnitude ms, int n)
  {
    int i, max, l, r;
    i = 0;
    for (;;)
    {
      max = i;
      l   = 2 * i + 1;
      r   = 2 * i + 2;
      if (l < n && ms.get(l).compareTo(ms.get(max)) > 0)
        max = l;
      if (r < n && ms.get(r).compareTo(ms.get(max)) > 0)
        max = r;
      if (max != i)
      {
        as.swap(i, max);
        bs.swap(i, max);
        vs.swap(i, max);
        ms.swap(i, max);

        i = max;
      }
      else
      {
        break;
      }
    }
  }

  public static void heapUp(Complex as, Complex bs, Complex vs, Magnitude ms, int n)
  {
    int i, max, l, r;
    i = 0;
    for (;;)
    {
      max = i;
      l   = 2 * i + 1;
      r   = 2 * i + 2;
      if (l < n && ms.get(l).compareTo(ms.get(max)) > 0)
        max = l;
      if (r < n && ms.get(r).compareTo(ms.get(max)) > 0)
        max = r;
      if (max != i)
      {
        as.swap(i, max);
        bs.swap(i, max);
        vs.swap(i, max);
        ms.swap(i, max);
        i = max;
      }
      else
      {
        break;
      }
    }
  }

  public static void heapDown(Complex as, Complex bs, Complex vs, Magnitude ms, int n)
  {
    int k = n - 1;
    int j = (k - 1) / 2;

    while (k > 0 && ms.get(j).compareTo(ms.get(k)) < 0)
    {
      as.swap(j, k);
      bs.swap(j, k);
      vs.swap(j, k);
      ms.swap(j, k);
      k = j;
      j = (j - 1) / 2;
    }
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

  /**
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  public static void heapDown(Real as, Real bs, Complex vs, Magnitude ms, int n)
  {
    int k = n - 1;
    int j = (k - 1) / 2;

    while (k > 0 && ms.get(j).compareTo(ms.get(k)) < 0)
    {
      as.swap(j, k);
      bs.swap(j, k);
      vs.swap(j, k);
      ms.swap(j, k);
      k = j;
      j = (j - 1) / 2;
    }
  }

  public static void println(Object s)
  {
    System.out.println(s);
  }

  public static int calculatePartition(RealFunction realFunction,
                                       FloatInterval left,
                                       FloatInterval right,
                                       FloatInterval block,
                                       int prec)
  {
    try ( Real t = new Real(); Real m = new Real();)
    {
      Float u = m.getMid();

      /* Compute the midpoint */
      block.getA().add(block.getB(), prec, RoundingMode.Down, u).half(u);

      /* Evaluate the function at the midpoint so the sign can be returned */
      int sign = realFunction.evaluate(m, 1, prec, t).sign();

      /* split the interval at the midpoint */
      left.setA(block.getA());
      left.setB(u);
      right.setA(u);
      right.setB(block.getB());

      return sign;
    }
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

}
