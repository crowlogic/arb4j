package arb.utensils;

import static arb.arb.*;

import java.awt.Color;
import java.awt.Container;
import java.util.concurrent.TimeUnit;

import javax.swing.*;

import org.junit.runner.JUnitCore;
import org.lwjgl.system.MemoryStack;

import arb.*;

public class Utilities
{

  public static double convertTimeUnits(double from, TimeUnit fromUnit, TimeUnit toUnit)
  {
    double ratio = fromUnit.convert(1L, toUnit);
    if (!Double.isFinite(ratio) || ratio == 0.0)
    {
      ratio = toUnit.convert(1L, fromUnit);
      return from * ratio;
    }
    return from / ratio;
  }

  /**
   * A simplified way to see a JPanel or other Container. Pops up a JFrame with
   * specified Container as the content pane.
   */

  public static JFrame
         openInJFrame(Container content, int width, int height, String title, Color bgColor, int closeOp)
  {
    JFrame frame = new JFrame(title);
    frame.setBackground(bgColor);
    content.setBackground(bgColor);
    frame.setSize(width, height);
    frame.setContentPane(content);
    frame.setVisible(true);
    frame.setDefaultCloseOperation(closeOp);
    return (frame);
  }

  /** Uses Color.white as the background color. */

  public static JFrame openInJFrame(Container content, int width, int height, String title, int closeOp)
  {
    return (openInJFrame(content, width, height, title, Color.white, closeOp));
  }

  /**
   * TODO: replace usage of this function with {@link MemoryStack}
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
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
        as.get(i).swap(as.get(max));
        bs.get(i).swap(bs.get(max));
        vs.get(i).swap(vs.get(max));
        ms.get(i).swap(ms.get(max));
        i = max;
      }
      else
      {
        break;
      }
    }
  }

  /**
   * TODO: replace usage of this function with {@link MemoryStack}
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
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
        as.get(i).swap(as.get(max));
        bs.get(i).swap(bs.get(max));
        vs.get(i).swap(vs.get(max));
        ms.get(i).swap(ms.get(max));
        i = max;
      }
      else
      {
        break;
      }
    }
  }

  /**
   * TODO: replace usage of this function with {@link MemoryStack}
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
  public static void heapDown(Complex as, Complex bs, Complex vs, Magnitude ms, int n)
  {
    int k = n - 1;
    int j = (k - 1) / 2;

    while (k > 0 && ms.get(j).compareTo(ms.get(k)) < 0)
    {
      as.get(j).swap(as.get(k));
      bs.get(j).swap(bs.get(k));
      vs.get(j).swap(vs.get(k));
      ms.get(j).swap(ms.get(k));
      k = j;
      j = (j - 1) / 2;
    }
  }

  /**
   * A version of {@link Real#overlaps(Real)} used by the integration code which
   * is less accurate by design
   * 
   * @param tmp
   * @param a
   * @param b
   * @param prec
   * @return
   */
  public static boolean overlaps(Real tmp, Real a, Real b, int prec)
  {
    arb_sub(tmp, a, b, prec);
    return arb_contains_zero(tmp) != 0;
  }

  /**
   * A version of {@link Complex#overlaps(Complex)} used by the integration code
   * which is less accurate by design
   * 
   * @param tmp
   * @param a
   * @param b
   * @param prec
   * @return
   */
  public static boolean overlaps(Complex tmp, Complex a, Complex b, int prec)
  {
    acb_sub(tmp, a, b, prec);
    return acb_contains_zero(tmp) != 0;
  }

  /**
   * TODO: replace usage of this function with {@link MemoryStack}
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
  public static void heapDown(Real as, Real bs, Complex vs, Magnitude ms, int n)
  {
    int k = n - 1;
    int j = (k - 1) / 2;

    while (k > 0 && ms.get(j).compareTo(ms.get(k)) < 0)
    {
      as.get(j).swap(as.get(k));
      bs.get(j).swap(bs.get(k));
      vs.get(j).swap(vs.get(k));
      ms.get(j).swap(ms.get(k));
      k = j;
      j = (j - 1) / 2;
    }
  }

  public static void println(String s)
  {
    System.out.println(s);
  }

  public static <F> F TODO(String string)
  {
    new Throwable("TODO: " + string).printStackTrace();

    JOptionPane.showConfirmDialog(null, "TODO: " + string + " !!! ");
    return null;
  }

}
