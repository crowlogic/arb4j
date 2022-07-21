package arb.viz.gl;

import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.geom.Point2D;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.function.DoubleBinaryOperator;
import java.util.stream.IntStream;

import javax.swing.JFrame;
import javax.swing.SwingUtilities;

import org.w3c.dom.Document;

import arb.*;
import arb.functions.complex.SFunction;
import hageldave.jplotter.canvas.*;
import hageldave.jplotter.color.*;
import hageldave.jplotter.interaction.CoordSysPanning;
import hageldave.jplotter.interaction.CoordSysScrollZoom;
import hageldave.jplotter.misc.Contours;
import hageldave.jplotter.renderables.*;
import hageldave.jplotter.renderables.Lines.SegmentDetails;
import hageldave.jplotter.renderables.Triangles.TriangleDetails;
import hageldave.jplotter.renderers.CompleteRenderer;
import hageldave.jplotter.renderers.CoordSysRenderer;
import hageldave.jplotter.svg.SVGUtils;

public class IsolinesViz
{

  static JPlotterCanvas mkCanvas(boolean fallback)
  {
    return fallback ? new BlankCanvasFallback() : new BlankCanvas();
  }

  static boolean useFallback(String[] args)
  {
    return Arrays.stream(args).filter("jplotter_fallback=true"::equals).findAny().isPresent();
  }

  @SuppressWarnings("resource")
  public static void main(String[] args)
  {
    JFrame frame = new JFrame("Iso Lines");
    frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    frame.getContentPane().setLayout(new BorderLayout());
    frame.getContentPane()
         .setPreferredSize(new Dimension(1500,
                                         1000));
    JPlotterCanvas   canvas   = mkCanvas(useFallback(args));
    CoordSysRenderer coordsys = new CoordSysRenderer(DefaultColorScheme.DARK.get());
    Color            bgColor  = new Color(DefaultColorScheme.DARK.get().getColorBackground());
    frame.getContentPane().setBackground(bgColor);

    canvas.setRenderer(coordsys);
    CompleteRenderer content = new CompleteRenderer();
    coordsys.setContent(content);
    Legend legend = new Legend();
    coordsys.setLegendRight(legend);
    coordsys.setLegendRightWidth(50);
    canvas.asComponent().setBackground(bgColor);

    SFunction            sfunc      = new SFunction(new Real().set("4", 128));

    // setup content
    ThreadLocalComplex   p          = new ThreadLocalComplex(1);
    ThreadLocalComplex   q          = new ThreadLocalComplex(1);
    ThreadLocalReal      s          = new ThreadLocalReal();
    int                  prec       = 128;
    DoubleBinaryOperator f          = (x, y) -> sfunc.evaluate(p.get().set(21 + x, y), 1, prec, q.get())
                                                     .arg(prec, s.get())
                                                     .doubleValue();
    // DoubleBinaryOperator f = (x, y) -> sfunc.evaluate(p.get().set(21+x, y), 1,
    // prec, q.get()).getReal().doubleValue();
    final int            resolution = 500;
    double[][]           X          = new double[resolution][resolution];
    double[][]           Y          = new double[resolution][resolution];
    double[][]           Z          = new double[resolution][resolution];
    for (int j = 0; j < X.length; j++)
    {
      final int k = j;
      IntStream.range(0, X[0].length).parallel().forEach(i ->

      {
        double x = i * 8.0 / (resolution - 1) - 4.0;
        double y = k * 8.0 / (resolution - 1) - 4.0;
        double z = f.applyAsDouble(x, y);
        X[k][i] = x;
        Y[k][i] = y;
        Z[k][i] = z;
      });
    }
    // make contour plot
    Lines     contourlines = new Lines();
    Triangles contourbands = new Triangles();
    double[]  isoValues    = new double[]
    { -2, -1, -.5, 0, .5, 1, 2, };
    ColorMap  isoColors    = DefaultColorMap.S_VIRIDIS;
    for (int i = isoValues.length - 1; i >= 0; i--)
    {
      List<SegmentDetails> contours = Contours.computeContourLines(X, Y, Z, isoValues[i], isoColors.getColor(i));
      contourlines.getSegments().addAll(contours);
      legend.addLineLabel(1, isoColors.getColor(i), isoValues[i] < 0 ? "" + isoValues[i] : " " + isoValues[i]);
    }
    for (int i = 0; i < isoValues.length - 1; i++)
    {
      List<TriangleDetails> contours = Contours.computeContourBands(X,
                                                                    Y,
                                                                    Z,
                                                                    isoValues[i],
                                                                    isoValues[i + 1],
                                                                    isoColors.getColor(i),
                                                                    isoColors.getColor(i + 1));
      contourbands.getTriangleDetails().addAll(contours);
    }
    content.addItemToRender(contourlines).addItemToRender(contourbands);
    contourlines.setGlobalThicknessMultiplier(1);
    contourbands.setGlobalAlphaMultiplier(0.3);
    new CoordSysScrollZoom(canvas,
                           coordsys).register();
    new CoordSysPanning(canvas,
                        coordsys).register();
    coordsys.setCoordinateView(-3, -3, 6, 6);

    Lines userContour  = new Lines();
    Text  userIsoLabel = new Text("",
                                  10,
                                  Font.ITALIC);
    content.addItemToRender(userContour);
    content.addItemToRender(userIsoLabel);
    MouseAdapter contourPlacer = new MouseAdapter()
    {
      public void mousePressed(MouseEvent e)
      {
        if (e.getModifiersEx() == MouseEvent.BUTTON1_DOWN_MASK)
          calcContour(e.getPoint());
      };

      public void mouseDragged(MouseEvent e)
      {
        if (e.getModifiersEx() == MouseEvent.BUTTON1_DOWN_MASK)
          calcContour(e.getPoint());
      };

      void calcContour(Point mp)
      {
        Point2D p        = coordsys.transformAWT2CoordSys(mp, canvas.asComponent().getHeight());
        double  isoValue = f.applyAsDouble(p.getX(), p.getY());
        userIsoLabel.setTextString(String.format("%.3f", isoValue))
                    .setColor(0xff8844bb)
                    .setOrigin(p)
                    .setBackground(0xaaffffff);
        List<SegmentDetails> contourSegments = Contours.computeContourLines(X, Y, Z, isoValue, 0xff8844bb);
        userContour.removeAllSegments().getSegments().addAll(contourSegments);
        canvas.scheduleRepaint();
      }
    };
    canvas.asComponent().addMouseListener(contourPlacer);
    canvas.asComponent().addMouseMotionListener(contourPlacer);

    canvas.asComponent().addMouseListener(new MouseAdapter()
    {
      @Override
      public void mouseClicked(MouseEvent e)
      {
        if (SwingUtilities.isRightMouseButton(e))
        {
          Document doc = canvas.paintSVG();
          SVGUtils.documentToXMLFile(doc, new File("svgtest.svg"));
          System.out.println("svg exported.");
        }
      }
    });

    frame.getContentPane().add(canvas.asComponent(), BorderLayout.CENTER);
    canvas.addCleanupOnWindowClosingListener(frame);
    SwingUtilities.invokeLater(() ->
    {
      frame.pack();
      frame.setVisible(true);
      frame.transferFocus();
    });
  }

}
