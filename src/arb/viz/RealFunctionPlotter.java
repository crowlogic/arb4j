package arb.viz;

import java.awt.*;
import java.awt.geom.*;
import java.util.*;
import java.util.stream.*;

import javax.swing.*;

import arb.*;
import arb.Float;
import arb.functions.*;
import arb.functions.complex.*;
import arb.functions.real.*;
import arb.operators.*;
import hageldave.jplotter.canvas.*;
import hageldave.jplotter.color.*;
import hageldave.jplotter.renderables.*;
import hageldave.jplotter.renderables.Lines.*;
import hageldave.jplotter.renderables.Triangles.*;
import hageldave.jplotter.renderers.*;

public class RealFunctionPlotter extends
                                 BlankCanvas
{
  private static final int prec = 128;

  private static double[] randomData(int n)
  {
    double[] d = new double[n];
    for (int i = 0; i < n; i++)
    {
      d[i] = Math.random() * 2 - 1;
    }
    return d;
  }

  private RealFunction  func;
  private Float         left;
  private Float         right;
  private Float         width;
  private Float         dt;
  private Float         point;
  private FloatInterval domain;
  private int           numPoints;
  private FloatInterval range;
  private Float         top;
  private Float         bottom;
  private Real          realIn  = new Real();
  private Real          realOut = new Real();

  /**
   * TODO: add support for multiple functions
   * 
   * @param function
   * @param domain
   * @param range
   * @param numPoints
   */
  public RealFunctionPlotter(RealFunction function, FloatInterval domain, FloatInterval range, int numPoints)
  {
    assert function != null;
    this.func      = function;
    left           = domain.getA();
    right          = domain.getB();
    top            = range.getA();
    bottom         = range.getB();
    width          = right.sub(left, prec, new Float());
    dt             = width.div(numPoints, new Float(), prec);
    point          = new Float();
    this.domain    = domain;
    this.range     = range;
    this.numPoints = numPoints;
    double[] seriesA_x = discretizeInterval(numPoints);
    double[] seriesA_y = sampleFunction(seriesA_x);
//    double[] seriesB_x = discretizeInterval(numPoints);
//    double[] seriesB_y = randomData(numPoints);
    // Arrays.sort(seriesB_x);
    // create Lines objects, one solid the other dashed
    Lines    lineA     = new Lines();
    Lines    lineB     = new Lines();

    lineB.setStrokePattern(0xb33f);

    // add line segments to A
    for (int i = 0; i < seriesA_y.length - 1; i++)
    {
      addLineSegment(seriesA_x, seriesA_y, lineA, i);
    }
    // add line segments to B (the short way)
//    ArrayList<SegmentDetails> segmentsB = lineB.addLineStrip(seriesB_x, seriesB_y);
//    segmentsB.forEach(seg -> seg.setColor(Color.BLUE));
    // use a coordinate system for display
    CoordSysRenderer coordsys = new CoordSysRenderer(DefaultColorScheme.DARK.get());
    coordsys.setCoordinateView(left.doubleValue(), top.doubleValue(), right.doubleValue(), bottom.doubleValue());
    // set the content renderer of the coordinate system
    // we want to render Lines objects
    LinesRenderer lineContent = new LinesRenderer();
    lineContent.addItemToRender(lineA).addItemToRender(lineB);
    coordsys.setContent(lineContent);

    // display within a JFrame

    setRenderer(coordsys);
    asComponent().setPreferredSize(new Dimension(700,
                                                 400));
    asComponent().setBackground(new Color(DefaultColorScheme.DARK.get().getColorBackground()));

    // (optional) area under curve with transparency
    Triangles areaA = new Triangles();
    areaA.setGlobalAlphaMultiplier(0.2);
    // add area quads under each segment
    for (SegmentDetails segment : lineA.getSegments())
    {
      addAreaQuads(areaA, segment);
    }
    try ( // use a TriangleRenderer for the Triangles
          TrianglesRenderer areaContent = new TrianglesRenderer())
    {
      areaContent.addItemToRender(areaA);
      // append the line renderer to the triangle renderer and use as new content
      coordsys.setContent(areaContent.withAppended(lineContent));
    }
    scheduleRepaint();

  }

  public void addLineSegment(double[] seriesAx, double[] seriesA, Lines lines, int i)
  {
    double         x1      = seriesAx[i], x2 = seriesAx[i + 1];
    double         y1      = seriesA[i], y2 = seriesA[i + 1];
    SegmentDetails segment = lines.addSegment(x1, y1, x2, y2);
    segment.setColor(Color.RED);
  }

  public void addAreaQuads(Triangles quads, SegmentDetails segment)
  {
    Point2D pL = segment.p0, pR = segment.p1;
    if (Math.signum(pL.getY()) == Math.signum(pR.getY()))
    {
      // points are on same side of x-axis
      ArrayList<TriangleDetails> quad = quads.addQuad(pL.getX(), 0, pL.getX(), pL.getY(), pR.getX(), pR.getY(), pR.getX(), 0);
      quad.forEach(tri -> tri.setColor(Color.RED));
    }
    else
    {
      // segment intersects x-axis, need to find intersection
      double x0 = pL.getX(), y0 = pL.getY(), x2 = pR.getX(), y2 = pR.getY();
      double m  = (y2 - y0) / (x2 - x0);
      // solving for x1 in (x1-x0)*m+y0 = 0 --> 1x = x0-y0/m;
      double x1 = x0 - y0 / m;
      quads.addTriangle(x0, y0, x1, 0, x0, 0).setColor(Color.RED);
      quads.addTriangle(x2, y2, x1, 0, x2, 0).setColor(Color.RED);
    }
  }

  public double[] discretizeInterval(int n)
  {
    return IntStream.range(0, n).mapToDouble(i -> left.add(dt.mul(i, point, prec), prec, point).doubleValue()).toArray();
  }

  public double[] sampleFunction(double[] domainPoints)
  {
    // TODO: consider tradeoffs of passing in double[] array vs Float[] array.
    return IntStream.range(0, domainPoints.length).mapToDouble(i -> func.evaluate(realIn.set(domainPoints[i]), 1, prec, realOut).doubleValue()).toArray();
  }

  public static void plotFunction(RealToComplexFunction f)
  {
    RealFunctionPlotter plotter = new RealFunctionPlotter(f.realPart(),
                                                          new FloatInterval(-2,
                                                                            2),
                                                          new FloatInterval(-5,
                                                                            5),
                                                          500);
    JFrame              frame   = new JFrame();
    frame.getContentPane().add(plotter.asComponent());
    frame.setTitle(f.getClass().getSimpleName());
    frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
    plotter.addCleanupOnWindowClosingListener(frame);

    frame.pack();
    frame.setVisible(true);
  }

  public static void plotFunction(RealFunction f)
  {
    try ( var plotter = new RealFunctionPlotter(f,
                                                new FloatInterval(-2,
                                                                  2),
                                                new FloatInterval(-5,
                                                                  5),
                                                500))
    {
      JFrame frame = new JFrame();
      frame.getContentPane().add(plotter.asComponent());
      frame.setTitle(f.getClass().getSimpleName());
      frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
      plotter.addCleanupOnWindowClosingListener(frame);

      frame.pack();
      frame.setVisible(true);
    }
    catch (HeadlessException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  public static void plotFunction(ComplexToRealFunction f)
  {
    try ( RealFunctionPlotter plotter = new RealFunctionPlotter((z, o, p, r) ->
    {
      try ( Complex n = new Complex(); Complex q = new Complex())
      {
        n.getReal().set(z);
        return f.evaluate(n, o, p, r);
      }
    },
                                                                new FloatInterval(-2,
                                                                                  2),
                                                                new FloatInterval(-5,
                                                                                  5),
                                                                500))
    {
      JFrame frame = new JFrame();
      frame.getContentPane().add(plotter.asComponent());
      frame.setTitle(f.getClass().getSimpleName());
      frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
      plotter.addCleanupOnWindowClosingListener(frame);

      frame.pack();
      frame.setVisible(true);
    }
    catch (HeadlessException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  public JFrame plot()
  {
    JFrame frame = new JFrame();
    frame.getContentPane().add(asComponent());
    frame.setTitle(func.getClass().getSimpleName());
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    addCleanupOnWindowClosingListener(frame);

    frame.pack();
    frame.setVisible(true);
    return frame;
  }

}
