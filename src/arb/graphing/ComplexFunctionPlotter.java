package arb.graphing;

import static java.lang.Math.*;
import static java.lang.System.out;
import static java.util.stream.IntStream.*;

import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Point2D;
import java.awt.geom.Point2D.Double;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.imageio.ImageIO;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.Timer;
import javax.swing.WindowConstants;

import org.apache.commons.lang.time.StopWatch;

import arb.Complex;
import arb.Constants;
import arb.Float;
import arb.Real;
import arb.ThreadLocalComplex;
import arb.arb;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ZFunction;
import arb.util.TimeUtils;

/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See *
 * <http://www.gnu.org/licenses/>.
 */
public class ComplexFunctionPlotter extends
                                    JComponent implements
                                    AutoCloseable
{

  static class Pixel
  {
    double R[] = new double[1];
    double G[] = new double[1];
    double B[] = new double[1];
  }

  static
  {
    System.loadLibrary("arblib");
  }

  protected Complex      w;

  protected Complex      N          = Complex.newVector(2);                      // Newton step. w/dw

  ThreadLocalComplex     _z         = new ThreadLocalComplex(2);

  ThreadLocalComplex     _w         = new ThreadLocalComplex(2);

  ThreadLocal<Pixel>     pixel      = ThreadLocal.withInitial(() -> new Pixel());
  ThreadLocal<Pixel>     pixel2     = ThreadLocal.withInitial(() -> new Pixel());

  public int             color_mode = 0;

  protected static int   prec       = 256;

  int                    xnum;

  int                    ynum;

  public Float           ax         = new Float();

  public Float           bx         = new Float();

  public Float           ay         = new Float();

  public Float           by         = new Float();

  BufferedImage          functionImage;

  BufferedImage          staticOverlayImage;

  BufferedImage          dynamicOverlayImage;

  private Timer          repaintTimer;

  private Graphics2D     functionImageGraphics;

  boolean                headless   = false;

  protected Dimension    screen;

  protected Rectangle2D  domain;

  AffineTransform        screenToFunctionMapping;

  AffineTransform        functionToScreenMapping;

  boolean                selection  = false;

  Double                 selectionStartPoint;

  Double                 selectionStopPoint;

  public Double          cursorInFunctionSpace;

  Complex                tangent;

  private double         xtick      = 1;

  private double         ytick      = 1;

  private AlphaComposite alphaComposite;
  private AlphaComposite brightAlphaComposite;

  private Graphics2D     staticOverlayGraphics;

  private Graphics2D     dynamicOverlayGraphics;

  public JFrame          frame;
  private Font           newFont;

  public BufferedImage   outputImage;

  private Graphics2D     outputGraphics;

  public ComplexFunctionPlotter(Dimension screen,
                                Rectangle2D.Double domain,
                                ComplexFunction function) throws NoninvertibleTransformException
  {
    this.screen = screen;
    this.domain = domain;
    this.function  = function;
    init();
  }

  public ComplexFunctionPlotter()
  {
    
  }
  
  public void init() throws NoninvertibleTransformException
  {
    setPreferredSize(this.screen);
    setSize(this.screen);
    renderingHints = new RenderingHints(RenderingHints.KEY_TEXT_ANTIALIASING,
                                        RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
    // setBorder(BorderFactory.createTitledBorder("Node"));
    out.format("screen=%s\ndomain=%s\n", this.screen, this.domain);
    this.xnum          = this.screen.width;
    this.ynum          = this.screen.height;
    phase              = new Real();
    w                  = Complex.newVector(2);
    functionImage      = new BufferedImage(xnum,
                                           ynum,
                                           BufferedImage.TYPE_INT_RGB);
    staticOverlayImage = new BufferedImage(xnum,
                                           ynum,
                                           BufferedImage.TYPE_INT_ARGB);
    outputImage        = new BufferedImage(xnum,
                                           ynum,
                                           BufferedImage.TYPE_INT_ARGB);
    newDynamicOverlay();

    functionImageGraphics = functionImage.createGraphics();
    staticOverlayGraphics = staticOverlayImage.createGraphics();
    outputGraphics        = outputImage.createGraphics();

    Font currentFont = new Font("Monospaced",
                                Font.BOLD,
                                6);
    newFont              = currentFont.deriveFont(currentFont.getSize() * 2F);
    alphaComposite       = makeComposite(0.69f);
    brightAlphaComposite = makeComposite(0.95f);

    color_mode           = 0;
    N                    = new Complex();
    tangent              = new Complex();
    ax.init();
    bx.init();
    ay.init();
    by.init();
    ax.assign(this.domain.getMinX());
    ay.assign(this.domain.getMinY());
    bx.assign(this.domain.getMaxX());
    by.assign(this.domain.getMaxY());
    bx.sub(ax, dx, prec, Constants.ARF_RND_DOWN).div(xnum * 2, dx, prec);
    by.sub(ay, dy, prec, Constants.ARF_RND_DOWN).div(ynum * 2, dy, prec);

    // System.out.format("dx=%s\n dy=%s\n", dx, dy);

    assignKeyBoardAndMouseHandler();
  }

  private synchronized void newDynamicOverlay() throws NoninvertibleTransformException
  {
    dynamicOverlayImage    = new BufferedImage(xnum,
                                               ynum,
                                               BufferedImage.TYPE_INT_ARGB);
    dynamicOverlayGraphics = dynamicOverlayImage.createGraphics();
    setScreenCoordinateSpaceGraphicsProperties(dynamicOverlayGraphics);
  }

  private AlphaComposite makeComposite(float alpha)
  {
    return AlphaComposite.SrcOver.derive(alpha);
  }

  private Composite       originalComposite;

  private AffineTransform originalTransform;

  volatile boolean        anythingChanged = false;

  @Override
  public synchronized void paintComponent(Graphics g)
  {
    // System.out.println( "Painting");
    blendLayers(g, true);

  }

  private void blendLayers(Graphics g, boolean dynamic)
  {
    Graphics2D g2d = (Graphics2D) g;

    originalComposite = g2d.getComposite();
    super.paintComponent(g);
    if (dynamic)
    {
      try
      {
        if (anythingChanged)
        {
          drawDynamicMarkups();
          anythingChanged = false;
        }

      }
      catch (NoninvertibleTransformException e)
      {
        e.printStackTrace();
      }
    }

    g2d.drawImage(functionImage, null, 0, 0);
    g2d.setComposite(alphaComposite);
    g2d.drawImage(staticOverlayImage, null, 0, 0);
    g2d.drawImage(dynamicOverlayImage, null, 0, 0);
    g2d.setComposite(originalComposite);
  }

  private void colorizeAndRecordImagePixel(int x, int y, Complex w)
  {
    Pixel pixel = colorizePixel(w);

    int   red   = (int) min(255, floor(pixel.R[0] * 255));
    int   green = (int) min(255, floor(pixel.G[0] * 255));
    int   blue  = (int) min(255, floor(pixel.B[0] * 255));
    functionImage.setRGB(x, y, (red << 16) | (green << 8) | blue);
  }

  public Part displayMode = Part.Imag;

  private Pixel colorizePixel(Complex w)
  {
    Pixel pixel = this.pixel.get();
    try ( Complex w2 = new Complex())
    {

      switch (displayMode)
      {
      case Phase:
        arb.color_function(pixel.R, pixel.G, pixel.B, w, color_mode);
        break;
      case Real:
        w2.getReal().set(w.getReal());
        arb.color_function(pixel.R, pixel.G, pixel.B, w2, color_mode);
        break;
      case Imag:
        w2.getImag().set(w.getImag());
        arb.color_function(pixel.R, pixel.G, pixel.B, w2, color_mode);
        break;
      case Blend:
        // TODO: make another mode that averages the rgb values and only calls
        // color_function once
        w2.getImag().set(w.getImag());
        arb.color_function(pixel.R, pixel.G, pixel.B, w2, color_mode);
        Pixel pixel2 = this.pixel2.get();
        w2.getImag().zero();
        w2.getReal().set(w.getReal());
        arb.color_function(pixel2.R, pixel2.G, pixel2.B, w2, color_mode);
        pixel.R[0] = (pixel.R[0] + pixel2.R[0] / 2.0);
        pixel.G[0] = (pixel.G[0] + pixel2.G[0] / 2.0);
        pixel.B[0] = (pixel.B[0] + pixel2.B[0] / 2.0);
      }
    }
    return pixel;
  }

  public static void drawLine(Graphics2D g, Point2D.Double A, Point2D.Double B)
  {

    Line2D.Double line = new Line2D.Double(A,
                                           B);
    g.draw(line);
  }

  ThreadLocal<Complex[][]> cells  = newCell();

  ThreadLocal<Complex[][]> zcells = newCell();
  ThreadLocal<Complex[][]> wcells = newCell();

  public static ThreadLocal<Complex[][]> newCell()
  {
    return ThreadLocal.withInitial(() ->
    {
      Complex[][] basis = new Complex[2][2];
      for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++)
          basis[i][j] = Complex.newVector(2);
      return basis;
    });
  }

  /**
   * TODO: this needs improvement.. its not very effective at blending regions
   * where the hue changes sharply
   * 
   * @param x
   * @param y
   * @return
   */
  public Complex evaluateFunctionWithBilinearInterpolation(int x, int y)
  {
    Complex[][] basis  = cells.get();

    Complex[][] zbasis = zcells.get();
    Complex[][] wbasis = wcells.get();

    for (int i = 0; i < 2; i++)
    {

      for (int j = 0; j < 2; j++)
      {
        Complex z  = zbasis[i][j];
        Complex w  = wbasis[i][j];

        Float   zr = z.getReal().getMid();
        Float   zi = z.getImag().getMid();
        for (int thisprec = 30; thisprec < 500; thisprec *= 2)
        {
          // zi = ( (by - ay) * y ) / ( ynum - 1 ) +/- dx
          // zr = ( (bx - ax) * x ) / ( xnum - 1 ) +/- dy
          by.sub(ay, zi, thisprec).mul(y, zi, thisprec).div(ynum - 1, zi, thisprec).add(ay, zi, thisprec);
          bx.sub(ax, zr, thisprec).mul(x, zr, thisprec).div(xnum - 1, zr, thisprec).add(ax, zr, thisprec);
          if (i == 0)
          {
            zr.sub(dx, zr, thisprec, Constants.ARF_RND_UP);
          }
          else
          {
            zr.add(dx, zr, thisprec, Constants.ARF_RND_DOWN);
          }
          if (j == 0)
          {
            zi.sub(dy, zi, thisprec, Constants.ARF_RND_UP);
          }
          else
          {
            zi.add(dy, zi, thisprec, Constants.ARF_RND_DOWN);
          }
          function.evaluate(z, 2, prec, w);
          // System.out.format("(%s,%s)=%s\n", zr, zi, w );

          if (w.relAccuracyBits() > 4)
            break;

        }
      }
    }
    Complex w = _w.get();
    return wbasis[0][0].add(wbasis[0][1], prec, w).add(wbasis[1][0], prec, w).add(wbasis[1][1], prec, w).div(4, w);
  }

  public Complex evaluateFunctionNoInterpolation(int x, int y)
  {
    Complex z  = _z.get();
    Complex w  = _w.get();
    Float   zr = z.getReal().getMid();
    Float   zi = z.getImag().getMid();

    for (int thisprec = 64; thisprec < 500; thisprec *= 2)
    {
      refineFunctionEvaluation(x, y, z, w, zr, zi, thisprec);

      if (w.relAccuracyBits() > 4)
        break;

    }

    return w;
  }

  public void refineFunctionEvaluation(int x, int y, Complex z, Complex w, Float zr, Float zi, int prec)
  {

    // zi = ( (by - ay) * y ) / ( ynum - 1 )
    by.sub(ay, zi, prec);
    zi.mul(y, zi, prec);
    zi.div(ynum - 1, zi, prec);
    zi.add(ay, zi, prec);

    // zr = ( (bx - ax) * x ) / ( xnum - 1 )
    bx.sub(ax, zr, prec);
    zr.mul(x, zr, prec);
    zr.div(xnum - 1, zr, prec);
    zr.add(ax, zr, prec);

    evalFunction(z, w);
  }

  public boolean bilinearSmoothing = true;

  boolean singleThreading = true;
  
  public void evaluateFunctionOnGrid()
  {
    AtomicInteger counter = new AtomicInteger(xnum * ynum);

    IntStream pixelStream = shuffledEvaluationOrder();
    if (!singleThreading )
    {
      pixelStream = pixelStream.parallel();
    }
    if (bilinearSmoothing)
    {     
      pixelStream.forEach(pixel ->
      {
        int y = pixel / xnum;
        int x = pixel % xnum;
        colorizeAndRecordImagePixel(x, y, evaluateFunctionWithBilinearInterpolation(x, y));
      });
    }
    else
    {
      pixelStream.forEach(pixel ->
      {
        int y = pixel / xnum;
        int x = pixel % xnum;
        colorizeAndRecordImagePixel(x, y, evaluateFunctionNoInterpolation(x, y));
      });
    }

  }

  public AffineTransform getScreenToFunctionDomainMapping()
  {
    if (screenToFunctionMapping == null)
    {
      screenToFunctionMapping = new AffineTransform();
      double xRatio = domain.getWidth() / screen.getWidth();
      double yRatio = domain.getHeight() / screen.getHeight();
      screenToFunctionMapping.translate(domain.getX(), domain.getY());
      screenToFunctionMapping.scale(xRatio, yRatio);
    }
    return screenToFunctionMapping;
  }

  protected boolean assignKeyBoardAndMouseHandler()
  {

    setFocusable(true);
    MouseHandler mouseHandler = new MouseHandler(this);
    addMouseListener(mouseHandler);
    addMouseMotionListener(mouseHandler);
    addKeyListener(new KeyboardHandler(this));
    return true;
  }

  private void markAxes()
  {
    drawLine(staticOverlayGraphics,
             new Double(-screen.getWidth(),
                        0),
             new Double(screen.getWidth(),
                        0));
    drawLine(staticOverlayGraphics,
             new Double(0,
                        -screen.getHeight()),
             new Double(0,
                        screen.getHeight()));
  }

  private void markHorizontalTick(double x)
  {
    drawLine(staticOverlayGraphics,
             new Double(x,
                        -0.1),
             new Double(x,
                        0.1));
    drawLine(staticOverlayGraphics,
             new Double(-x,
                        -0.1),
             new Double(-x,
                        0.1));
  }

  private void markHorizontalTicks()
  {
    double x     = 0;
    int    count = 0;
    while (x < screen.getWidth())
    {
      x += xtick;
      markHorizontalTick(x);
    }
  }

  private void markVerticalTick(double y)
  {
    drawLine(staticOverlayGraphics,
             new Double(-0.1,
                        y),
             new Double(0.1,
                        y));
    drawLine(staticOverlayGraphics,
             new Double(-0.1,
                        -y),
             new Double(0.1,
                        -y));
  }

  private void markVerticalTicks()
  {
    double y = 0;
    while (y < screen.getHeight())
    {
      y += ytick;
      markVerticalTick(y);
    }
  }

  boolean rendering = true;

  public BufferedImage plot() throws IOException, NoninvertibleTransformException
  {
    if (!headless)
    {
      showFrame();
    }

    StopWatch stopWatch = new StopWatch();
    stopWatch.start();
    startRepaintTimer();

    initializeCoordinateSystem();

    drawStaticMarkups();

    evaluateFunctionOnGrid();

    rendering = false;

    reportRenderingRate(stopWatch);

    return functionImage;
  }

  public void showFrame()
  {
    frame = Utils.openInJFrame(this,
                               screen.width,
                               screen.height,
                               getClass().getSimpleName(),
                               keepRunning ? WindowConstants.HIDE_ON_CLOSE : WindowConstants.EXIT_ON_CLOSE);
  }

  private void reportRenderingRate(StopWatch stopWatch)
  {
    stopWatch.stop();
    double seconds = TimeUtils.convertTimeUnits(stopWatch.getTime(), TimeUnit.MILLISECONDS, TimeUnit.SECONDS);
    double rate    = (xnum * ynum) / seconds;
    System.out.format("Rendered in " + seconds + " seconds at a rate of %.0f pixels/sec\n", rate);
  }

  private void initializeCoordinateSystem() throws NoninvertibleTransformException
  {
    setFunctionCoordinateSpaceGraphicsProperties(functionImageGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(staticOverlayGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(dynamicOverlayGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(outputGraphics);
  }

  private void setFunctionCoordinateSpaceGraphicsProperties(Graphics2D g) throws NoninvertibleTransformException
  {
    g.setColor(Color.BLACK);
    g.setStroke(new BasicStroke(0.008f));
    g.setFont(newFont);
    g.setTransform(getFunctionSpaceCoordinates());
    g.setRenderingHints(renderingHints);

  }

  private void setScreenCoordinateSpaceGraphicsProperties(Graphics2D g) throws NoninvertibleTransformException
  {
    g.setColor(Color.WHITE);
    g.setStroke(new BasicStroke(2f));
    g.setFont(newFont);
    originalTransform = g.getTransform();
    g.setRenderingHints(renderingHints);

  }

  private AffineTransform getFunctionSpaceCoordinates()
  {
    if (functionToScreenMapping != null)
    {
      return functionToScreenMapping;
    }
    try
    {
      return functionToScreenMapping = getScreenToFunctionDomainMapping().createInverse();
    }
    catch (NoninvertibleTransformException e)
    {
      throw new RuntimeException(e.getMessage(),
                                 e);
    }
  }

  private void startRepaintTimer()
  {
    try
    {
      repaintTimer = new Timer(34,
                               e ->
                               {
                                 repaint();
                                 // renderMarkups();
                               });
      repaintTimer.start();

    }
    catch (HeadlessException e)
    {
      headless = true;
    }
  }

  void renderCoordinateSystemAxes()
  {
    markAxes();
    markHorizontalTicks();
    markVerticalTicks();
  }

  public boolean labelHardyZRoots = true;

  private void renderHardyZRootLocations()
  {
    // TODO: use estimated root number based on range
    // TODO: draw text labelling the region so it matches with the notation in the
    // paper
    // TODO: button to toggle root labelling on or off
    rangeClosed(1, 20).forEach(i ->
    {
      double rootp = ZFunction.roots.getOrCreate(i).doubleValue();

      if (labelHardyZRoots)
      {
        drawTextInFunctionCoordinates(false, String.format("%2.3f", rootp), rootp, 0.1);
      }
      staticOverlayGraphics.draw(new Star(rootp,
                                          0,
                                          0.25,
                                          0.5,
                                          5));
      staticOverlayGraphics.draw(new Star(-rootp,
                                          0,
                                          0.25,
                                          0.5,
                                          5));
    });
  }

  public boolean showHardyZRootLocations = false;

  private void drawStaticMarkups()
  {
    setStaticOverlayGraphicsFontSizeToHalfItsCurrentSize();

    renderCoordinateSystemAxes();
    if (showHardyZRootLocations)
    {
      renderHardyZRootLocations();
    }

  }

  private void setStaticOverlayGraphicsFontSizeToHalfItsCurrentSize()
  {
    Font currentFont = staticOverlayGraphics.getFont();
    Font newFont     = currentFont.deriveFont(currentFont.getSize() * 0.5F);
    staticOverlayGraphics.setFont(newFont);
  }

  private void drawDynamicMarkups() throws NoninvertibleTransformException
  {
    newDynamicOverlay();

    // TODO: fix zoom selection
    renderSelectionBoundary();
    drawCursor();
    if (showHelp)
    {
      drawHelp();
    }
    drawTangentLine();
    drawNewtonTrajectory();
  }

  private void drawHelp()
  {
    drawTextInScreenCoordinates(true,
                                "Press\n" + "F1     Toggle program help screen (what you're looking at)\n"
                                              + "F2     Toggle overlay color between black and white\n"
                                              + "F3     Toggle between Both/Real part only/Imaginary only\n"
                                              + "B      Show Both Real and Imaginary Parts\n"
                                              + "R      Show Real part only\n" + "I      Show Imaginary part only\n"
                                              + "Z      Select a rectangle to be magnified\n"
                                              + "ESC    Exit progam\n",
                                20,
                                20);

  }

  Color                  clear                           = new Color(0,
                                                                     0,
                                                                     0,
                                                                     255);

  private RenderingHints renderingHints;

  public Point2D.Double  cursorInScreenSpace;

  Color                  cursorColor                     = Color.BLACK;

  /**
   * cursor is analogous to coordinate
   */

  Double                 tangentRayEndpointInScreenSpace = new Point2D.Double();

  /**
   * draw a tangent line thru the cursor position
   */
  protected void drawTangentLine()
  {
    if (cursorInFunctionSpace == null)
    {
      return;
    }
    // upon entry:
    // t=cursor position in function space coordinates
    // w=f(t)
    // w'=f'(t)
    try ( Real phase = new Real())
    {
      N.arg(prec, phase);

      double phaseAngle = phase.doubleValue();

      tangentRayEndpointInScreenSpace.x = cursorInScreenSpace.x + 50 * Math.cos(phaseAngle);
      tangentRayEndpointInScreenSpace.y = cursorInScreenSpace.y + 50 * Math.sin(phaseAngle);

      drawLine(dynamicOverlayGraphics, cursorInScreenSpace, tangentRayEndpointInScreenSpace);
    }
  }

  /**
   * draw a tangent line thru the cursor position
   */
  protected synchronized void drawNewtonTrajectory()
  {
    if (trajectory == null)
    {
      return;
    }

    Double points[] = new Double[trajectory.dim];
    for (int i = 0; i < trajectory.dim; i++)
    {
      Complex x = trajectory.get(i);
      points[i] = mapFunctionToScreen(x);

    }
    for (int i = 0; i < trajectory.dim - 1; i++)
    {

      drawLine(dynamicOverlayGraphics, points[i], points[i + 1]);

    }

  }

  public static Complex toComplex(Complex res, Double cursorInFunctionSpace2)
  {
    res.getReal().assign(cursorInFunctionSpace2.x);
    res.getImag().assign(cursorInFunctionSpace2.y);
    return res;
  }

  private void drawCursor() throws NoninvertibleTransformException
  {
    if (cursorInFunctionSpace == null)
    {
      return;
    }
    String text   = getCursorText();
    int    xpixel = (int) cursorInScreenSpace.x;
    int    ypixel = (int) cursorInScreenSpace.y;

    drawTextInScreenCoordinates(true, text, xpixel, ypixel);

  }

  private void drawTextInFunctionCoordinates(boolean dynamic, String text, double x, double y)
  {
    Point2D.Double screenCoords = new Point2D.Double();
    getFunctionSpaceCoordinates().transform(new Point2D.Double(x,
                                                               y),
                                            screenCoords);
    drawTextInScreenCoordinates(dynamic, text, (int) screenCoords.x, (int) screenCoords.y);
  }

  private void drawTextInScreenCoordinates(boolean dynamic, String text, int xpixel, int ypixel)
  {
    Graphics2D graphics = dynamic ? dynamicOverlayGraphics : staticOverlayGraphics;
    synchronized (graphics)
    {
      graphics.setColor(dynamic ? cursorColor : Color.WHITE);
      AffineTransform currentTransform = graphics.getTransform();
      graphics.setTransform(originalTransform);
      drawString(graphics, text, xpixel, ypixel);
      graphics.setTransform(currentTransform);
    }
  }

  /**
   * Return the text to be drawn at the position where the mouse cursor is
   * 
   * @return something like "f(cursor)=valueAtCursor"
   */
  public String getCursorText()
  {
    Complex w1stDeriv = w.get(1);
    try ( Real warg = new Real(); Real w1stDerivarg = new Real())
    {
      return String.format("    t=%+.05f%+.05fi\n" + " f(t)=%+.05f%+.05fi arg=%+.06f\n"
                    + "f'(t)=%+.05f%+.05fi arg=%+.06f\n N(t)=%+.05f%+.05fi mag=%.06f arg=%+.06f\n",
                           cursorInFunctionSpace.x,
                           cursorInFunctionSpace.y,
                           w.getReal().doubleValue(),
                           w.getImag().doubleValue(),
                           w.arg(prec, warg).doubleValue(),
                           w1stDeriv.getReal().doubleValue(),
                           w1stDeriv.getImag().doubleValue(),
                           w1stDeriv.arg(prec, w1stDerivarg).doubleValue(),
                           N.getReal().doubleValue(),
                           N.getImag().doubleValue(),
                           N.norm(),
                           phase.doubleValue());
    }
  }

  void drawString(Graphics g, String text, int x, int y)
  {
    for (String line : text.split("\n"))
      g.drawString(line, x, y += g.getFontMetrics().getHeight());
  }

  void renderSelectionBoundary()
  {
    if (selectionStartPoint != null && selectionStopPoint != null)
    {
      Rectangle2D.Double boundingRect = new Rectangle2D.Double(min(selectionStopPoint.x, selectionStartPoint.x),
                                                               min(selectionStartPoint.y, selectionStopPoint.y),
                                                               abs(selectionStopPoint.x - selectionStartPoint.x),
                                                               abs(selectionStopPoint.y - selectionStartPoint.y));
      staticOverlayGraphics.draw(boundingRect);
    }
    // if mouse is being dragged draw a rectangle between
    // this.
  }

  private IntStream orderedEvaluationOrder()
  {
    List<Integer> integers = range(0, xnum * ynum).boxed().collect(Collectors.toList());
    return integers.stream().mapToInt(x -> x);
  }

  private IntStream shuffledEvaluationOrder()
  {
    List<Integer> integers = range(0, xnum * ynum).boxed().collect(Collectors.toList());
    Collections.shuffle(integers);
    return integers.stream().mapToInt(x -> x);
  }

  public void saveToFile() throws IOException
  {
    File f = new File("out.png");
    System.out.println("Saving image to " + f);

    ImageIO.write(functionImage, "PNG", f);
    System.out.println("Saved " + f);
  }

  protected void zoomTo(Double upperLeft, Double lowerRight)
  {
    out.format("zoomTo(%s, %s )\n", upperLeft, lowerRight);

    // screenToFunctionCoordinateMapping = null;

//    ax.assign(upperLeft.x);
//    ay.assign(upperLeft.y);
//    bx.assign(lowerRight.x);
//    bx.assign(lowerRight.y);
//    out.format("ZOOMING TO ax=%s bx=%s ay=%s by=%s\n", ax, bx, ay, by);
//
//    SwingUtilities.invokeLater(() ->
//    {
//      try
//      {
//        plot();
//      }
//      catch (IOException | NoninvertibleTransformException e)
//      {
//        e.printStackTrace();
//      }
//    });
  }

  protected void zoomTo(java.awt.geom.Rectangle2D.Double domain2)
  {
    System.out.println("zoom to " + domain2);
  }

  protected ComplexFunction function;

  boolean disableNewton = true;
                
  // w=f(z)
  public void evalFunction(Complex z, Complex w)
  {
    function.evaluate(z, 2, prec, w);

  }

  Real phase;

  protected synchronized void mouseMoved(Complex t)
  {
    evalFunction(t, w);
    calculateNewtonStepAndPhase();

    cursorInScreenSpace = this.mapFunctionToScreen(cursorInFunctionSpace);

    if (debug)
    {
      out.format("Cursor moved to t=%s where f(t)=%s\nfuncCoords=%s\nscreenCoords=%s\nNewtonDeriv=%s\nphase=%s\n",
                 t,
                 w,
                 cursorInFunctionSpace,
                 cursorInScreenSpace,
                 N,
                 phase);
    }
    anythingChanged = true;

  }

  Complex damping = new Complex().set(0.1, 0);

  public synchronized Complex calculateNewtonTrajectory(Complex t, int n)
  {

    return Constants.ZERO;

  }

  /**
   * Set N=w/w' and phase=arg(N)
   */
  private void calculateNewtonStepAndPhase()
  {
    assert N != null;

    Complex unnormalizedN = w.div(w.get(1), N).neg(N);
    // Complex dt = unnormalizedN.normalize(N).neg(N);

    // acb_div(N, w, w.get(1), prec);

    // the orthogonal complement of the newton derivative should be the normal
    // vector, i think
    // acb_mul_onei(N, N);
    // acb_neg(N, N);
    N.arg(prec, phase);

  }

  boolean         debug       = false;

  public Complex  trajectory;

  private boolean showHelp    = false;

  private Float   dx          = new Float();

  private Float   dy          = new Float();

  Mode            mode        = Mode.Default;

  public boolean  keepRunning = false;

  public Double mapScreenToFunction(Point point)
  {
    Double dest = new Point2D.Double();
    getScreenToFunctionDomainMapping().transform(point, dest);
    return dest;
  }

  public Double mapFunctionToScreen(Complex a)
  {
    Double src  = new Point2D.Double(a.getReal().doubleValue(),
                                     a.getImag().doubleValue());
    Double dest = new Point2D.Double();
    getFunctionSpaceCoordinates().transform(src, dest);
    return dest;
  }

  public Double mapFunctionToScreen(Double cursor2)
  {
    assert cursor2 != null;
    Double dest = new Point2D.Double();
    getFunctionSpaceCoordinates().transform(cursor2, dest);
    return dest;
  }

  public Double mapFunctionToScreen(Point point)
  {
    Double dest = new Point2D.Double();
    getFunctionSpaceCoordinates().transform(point, dest);
    return dest;
  }

  public void toggleShowHelp()
  {
    showHelp = !showHelp;
  }

  void enterZoomSelectionMode()
  {
    System.out.println("Entering zoom selection mode from " + mode + " mode");
    mode = Mode.Zoom;
  }

  public Complex evaluateFunction(int i, int j)
  {
    if (bilinearSmoothing)
    {
      return evaluateFunctionWithBilinearInterpolation(i, j);
    }
    else
    {
      return evaluateFunctionNoInterpolation(i, j);

    }

  }

  @Override
  public void close()
  {
    if ( frame != null && frame.isVisible() )
    {
      frame.setVisible(false);
      frame.dispose();
    }
    this._w.remove();
    this._z.remove();
    pixel.remove();
    pixel2.remove();
  }

}
