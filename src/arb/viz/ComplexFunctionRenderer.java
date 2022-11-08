package arb.viz;

import static java.lang.System.out;
import static java.util.stream.IntStream.range;

import java.awt.AlphaComposite;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Composite;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.HeadlessException;
import java.awt.Point;
import java.awt.RenderingHints;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
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

import arb.Complex;
import arb.ComplexConstants;
import arb.Float;
import arb.Real;
import arb.RoundingMode;
import arb.ThreadLocalComplex;
import arb.ThreadLocalReal;
import arb.arb;
import arb.functions.complex.HolomorphicFunction;
import arb.utensils.Utilities;

/**
 * creates a rendering of a patch of a complex valued function of a complex
 * argument using the method of domain coloring which is also called the color
 * wheel method
 * 
 * @param <F> the class of {@link HolomorphicFunction} to be rendered
 */
public class ComplexFunctionRenderer<F extends HolomorphicFunction> extends
                                    JComponent implements
                                    AutoCloseable
{

  static class Pixel
  {
    double[] R = new double[1];
    double[] G = new double[1];
    double[] B = new double[1];
  }

  /**
   * do not set to greater than 128, see {@link PointValueCache} for the
   * explanation
   */
  protected static final int precisionBits = 128;

  public static void drawLine(Graphics2D g, Point2D.Double A, Point2D.Double B)
  {

    Line2D.Double line = new Line2D.Double(A,
                                           B);
    g.draw(line);
  }

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

  public static Complex toComplex(Complex res, Double cursorInFunctionSpace2)
  {
    res.getReal().set(cursorInFunctionSpace2.x);
    res.getImag().set(cursorInFunctionSpace2.y);
    return res;
  }

  protected Complex                   w;

  protected Complex                   N                               = Complex.newVector(2);               // Newton
                                                                                                            // step.
                                                                                                            // w/dw

  transient ThreadLocalComplex        _z                              = new ThreadLocalComplex(2);

  transient ThreadLocal<Pixel>        pixel                           = ThreadLocal.withInitial(Pixel::new);

  transient ThreadLocal<Pixel>        pixel2                          = ThreadLocal.withInitial(Pixel::new);

  public int                          colorMode                       = 0;

  int                                 windowWidth;

  int                                 windowHeight;

  public transient Float              ax                              = new Float();

  public transient Float              bx                              = new Float();

  public transient Float              ay                              = new Float();

  public transient Float              by                              = new Float();

  transient BufferedImage             functionImage;

  transient BufferedImage             staticOverlayImage;

  transient BufferedImage             dynamicOverlayImage;

  private transient Timer             repaintTimer;

  private transient Graphics2D        functionImageGraphics;

  boolean                             headless                        = false;

  protected Dimension                 resolution;

  protected Rectangle2D.Double        domain;

  AffineTransform                     screenToFunctionMapping;

  AffineTransform                     functionToScreenMapping;

  boolean                             selection                       = false;

  public Double                       cursorInFunctionSpace;

  Complex                             tangent;
  private double                      xtick                           = 1;

  private double                      ytick                           = 1;

  private transient AlphaComposite    alphaComposite;

  private transient Graphics2D        staticOverlayGraphics;

  private transient Graphics2D        dynamicOverlayGraphics;

  public transient JFrame             frame;

  private transient Font              newFont;

  public transient BufferedImage      outputImage;

  private transient Graphics2D        outputGraphics;

  private transient AffineTransform   originalTransform;

  volatile boolean                    anythingChanged                 = false;

  transient ThreadLocalReal           r                               = new ThreadLocalReal();

  public Part                         displayMode                     = Part.Imaginary;

  transient ThreadLocal<Complex[][]>  cells                           = newCell();

  transient ThreadLocal<Complex[][]>  zcells                          = newCell();

  transient ThreadLocal<Complex[][]>  wcells                          = newCell();

  protected transient PointValueCache image;

  boolean                             singleThreading                 = false;

  private long                        startTime;

  Color                               clear                           = new Color(0,
                                                                                  0,
                                                                                  0,
                                                                                  255);

  private RenderingHints              renderingHints;

  public Point2D.Double               cursorInScreenSpace;
  Color                               cursorColor                     = Color.BLACK;

  /**
   * cursor is analogous to coordinate
   */

  Double                              tangentRayEndpointInScreenSpace = new Point2D.Double();

  transient protected F               function;

  boolean                             disableNewton                   = true;

  Real                                phase;

  Complex                             damping                         = new Complex().set(0.1, 0);

  boolean                             debug                           = false;

  public Complex                      trajectory;

  private boolean                     showHelp                        = false;

  private Float                       dx                              = new Float();

  private Float                       dy                              = new Float();

  Mode                                mode                            = Mode.Translate;

  public boolean                      keepRunning                     = false;

  public ComplexFunctionRenderer()
  {

  }

  public ComplexFunctionRenderer(Dimension resolution, Rectangle2D.Double domain, F function)
  {
    this.resolution = resolution;
    this.domain     = domain;
    this.function   = function;
    initCache();
    init();
  }

  transient MouseHandler    mouseHandler    = new MouseHandler(this);

  transient KeyboardHandler keyboardHandler = new KeyboardHandler(this);

  protected boolean assignKeyBoardAndMouseHandler()
  {

    setFocusable(true);
    addMouseListener(mouseHandler);
    addMouseMotionListener(mouseHandler);
    addKeyListener(keyboardHandler);
    return true;
  }

  protected void unassignInputHandlers()
  {
    removeMouseListener(mouseHandler);
    removeMouseMotionListener(mouseHandler);
    removeKeyListener(keyboardHandler);
  }

  private void blendLayers(Graphics g, boolean dynamic)
  {
    Graphics2D g2d               = (Graphics2D) g;
    Composite  originalComposite = g2d.getComposite();
    super.paintComponent(g);
    if (dynamic)
    {

      if (anythingChanged)
      {
        drawDynamicMarkups();
        anythingChanged = false;
      }
    }

    g2d.drawImage(functionImage, null, 0, 0);
    g2d.setComposite(alphaComposite);
    g2d.drawImage(staticOverlayImage, null, 0, 0);
    g2d.drawImage(dynamicOverlayImage, null, 0, 0);
    g2d.setComposite(originalComposite);
  }

  /**
   * Set N=w/w' and phase=arg(N)
   */
  private void calculateNewtonStepAndPhase()
  {
    assert N != null;

    N.arg(precisionBits, phase);

  }

  public synchronized Complex calculateNewtonTrajectory(Complex t, int n)
  {

    return ComplexConstants.ZERO;

  }

  @Override
  public void hide()
  {
    if (frame != null && frame.isVisible())
    {
      frame.setVisible(false);
      frame.dispose();
    }
  }

  boolean closing = false;

  @Override
  public void close()
  {
    if (repaintTimer != null)
    {
      repaintTimer.stop();
    }

    System.out.println("Renderer closing. complete=" + image.complete);
    System.out.println("Disengaged input handlers...");
    if (!image.complete && !closing)
    {
      closing = true;
      System.out.println("Dispatching WINDOW_CLOSING event to frame..");
      frame.dispatchEvent(new WindowEvent(frame,
                                          WindowEvent.WINDOW_CLOSING));
      System.out.println("Dispatched WINDOW_CLOSING event to frame..");
    }

  }

  private Pixel colorizePixel(Complex w)
  {
    Pixel pixel = this.pixel.get();
    try ( Complex w2 = new Complex())
    {

      switch (displayMode)
      {
      case Phase:
        arb.color_function(pixel.R, pixel.G, pixel.B, w, colorMode);
        break;
      case Real:
        w2.getReal().set(w.getReal());
        arb.color_function(pixel.R, pixel.G, pixel.B, w2, colorMode);
        break;
      case Imaginary:
        w2.getImag().set(w.getImag());
        arb.color_function(pixel.R, pixel.G, pixel.B, w2, colorMode);
        break;
      case Blend:
        // TODO: make another mode that averages the rgb values and only calls
        // color_function once
        w2.getImag().set(w.getImag());
        arb.color_function(pixel.R, pixel.G, pixel.B, w2, colorMode);
        Pixel pixel2 = this.pixel2.get();
        w2.getImag().zero();
        w2.getReal().set(w.getReal());
        arb.color_function(pixel2.R, pixel2.G, pixel2.B, w2, colorMode);
        pixel.R[0] = (pixel.R[0] + pixel2.R[0] / 2.0);
        pixel.G[0] = (pixel.G[0] + pixel2.G[0] / 2.0);
        pixel.B[0] = (pixel.B[0] + pixel2.B[0] / 2.0);
      }
    }
    return pixel;
  }

  private void colorizePixel(int x, int y, Complex w)
  {
    Pixel dot   = colorizePixel(w);
    int   red   = (int) Math.min(255, Math.floor(dot.R[0] * 255));
    int   green = (int) Math.min(255, Math.floor(dot.G[0] * 255));
    int   blue  = (int) Math.min(255, Math.floor(dot.B[0] * 255));
    functionImage.setRGB(x, y, red | green << 8 | blue << 16);

  }

  private void drawCursor()
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

  private void drawDynamicMarkups()
  {
    newDynamicOverlay();

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
    drawTextInScreenCoordinates(true, """
                  Press
                  F1     Toggle program help screen display (what you're looking at)
                  F2     Toggle overlay color between black and white
                  F3     Cycle display modes thru Real, Imaginary, Blend, and Phase
                  1-7    Set color mode
                  P      Show Phase (Argument)
                  B      Show Blend of Both Real and Imaginary Parts
                  R      Show Real part only
                  I      Show Imaginary part only
                  S      Save image
                  ESC    Exit program""", 20, 20);

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

    Double[] points = new Double[trajectory.dim];
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

  private void drawStaticMarkups()
  {
    setStaticOverlayGraphicsFontSizeToHalfItsCurrentSize();

    renderCoordinateSystemAxes();
  }

  void drawString(Graphics g, String text, int x, int y)
  {
    for (String line : text.split("\n"))
      g.drawString(line, x, y += g.getFontMetrics().getHeight());
  }

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
      N.arg(precisionBits, phase);

      double phaseAngle = phase.doubleValue();

      tangentRayEndpointInScreenSpace.x = cursorInScreenSpace.x + 50 * Math.cos(phaseAngle);
      tangentRayEndpointInScreenSpace.y = cursorInScreenSpace.y + 50 * Math.sin(phaseAngle);

      drawLine(dynamicOverlayGraphics, cursorInScreenSpace, tangentRayEndpointInScreenSpace);
    }
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

  void enterZoomSelectionMode()
  {
    System.out.println("Entering zoom selection mode from " + mode + " mode");
    mode = Mode.Scale;
  }

  // w=f(z)
  public void evalFunction(Complex z, Complex w)
  {
    function.evaluate(z, 2, precisionBits, w);

  }

  public Complex evaluateFunction(int x, int y)
  {
    Complex z  = _z.get();
    Complex w  = image.pointAt(0, x, y);
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

  @SuppressWarnings("resource")
  public void evaluateFunctionOnGrid()
  {
    AtomicInteger counter     = new AtomicInteger(windowWidth * windowHeight);

    IntStream     pixelStream = image.complete ? linearEvaluationOrder() : shuffledEvaluationOrder();
    if (!singleThreading)
    {
      pixelStream = pixelStream.parallel();
    }

    /**
     * TODO: consider another way to do this that doesn't leave some processors idle
     * if they have finished their calculations before the others
     */
    pixelStream.forEach(pixel ->
    {
      int y = pixel / windowWidth;
      int x = pixel % windowWidth;
      try ( Complex z = image.pointAt(0, x, y))
      {
        if (!image.complete)
        {
          evaluateFunction(x, y);
        }
        colorizePixel(x, y, z);
      }
    });

    image.complete = true;
  }

  public String getColorPlateName()
  {
    return String.format("%s-%d-%d-%.3f-%.3f-%.3f-%.3f",
                         this.function,
                         this.resolution.width,
                         this.resolution.height,
                         this.domain.x,
                         this.domain.y,
                         this.domain.width,
                         this.domain.height);
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
                           w.arg(precisionBits, warg).doubleValue(),
                           w1stDeriv.getReal().doubleValue(),
                           w1stDeriv.getImag().doubleValue(),
                           w1stDeriv.arg(precisionBits, w1stDerivarg).doubleValue(),
                           N.getReal().doubleValue(),
                           N.getImag().doubleValue(),
                           N.norm(precisionBits, warg).doubleValue(),
                           phase.doubleValue());
    }
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

  public AffineTransform getScreenToFunctionDomainMapping()
  {
    if (screenToFunctionMapping == null)
    {
      screenToFunctionMapping = new AffineTransform();
      double xRatio = domain.getWidth() / resolution.getWidth();
      double yRatio = domain.getHeight() / resolution.getHeight();
      screenToFunctionMapping.translate(domain.getX(), domain.getY());
      screenToFunctionMapping.scale(xRatio, yRatio);
    }
    return screenToFunctionMapping;
  }

  public void init()
  {
    setPreferredSize(this.resolution);
    setSize(this.resolution);
    renderingHints     = new RenderingHints(RenderingHints.KEY_TEXT_ANTIALIASING,
                                            RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
    windowWidth        = resolution.width;
    windowHeight       = resolution.height;
    phase              = new Real();
    w                  = Complex.newVector(2);
    functionImage      = new BufferedImage(windowWidth,
                                           windowHeight,
                                           BufferedImage.TYPE_INT_RGB);
    staticOverlayImage = new BufferedImage(windowWidth,
                                           windowHeight,
                                           BufferedImage.TYPE_INT_ARGB);
    outputImage        = new BufferedImage(windowWidth,
                                           windowHeight,
                                           BufferedImage.TYPE_INT_ARGB);
    newDynamicOverlay();

    functionImageGraphics = functionImage.createGraphics();
    staticOverlayGraphics = staticOverlayImage.createGraphics();
    outputGraphics        = outputImage.createGraphics();

    Font currentFont = new Font("Monospaced",
                                Font.BOLD,
                                8);
    newFont        = currentFont.deriveFont(currentFont.getSize() * 2F);
    alphaComposite = makeComposite(0.69f);

    colorMode      = 0;
    N              = new Complex();
    tangent        = new Complex();
    ax.init();
    bx.init();
    ay.init();
    by.init();
    ax.assign(this.domain.getMinX());
    ay.assign(this.domain.getMinY());
    bx.assign(this.domain.getMaxX());
    by.assign(this.domain.getMaxY());
    bx.sub(ax, precisionBits, RoundingMode.Down, dx).div(windowWidth * 2, precisionBits, dx);
    by.sub(ay, precisionBits, RoundingMode.Down, dy).div(windowHeight * 2, precisionBits, dy);

    assignKeyBoardAndMouseHandler();
  }

  public void initCache()
  {
    if (image != null)
    {
      image.close();
      image = null;
    }
    this.image = new PointValueCache(getColorPlateName(),
                                     this.resolution.width,
                                     this.resolution.height);
  }

  private void initializeCoordinateSystem()
  {
    setFunctionCoordinateSpaceGraphicsProperties(functionImageGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(staticOverlayGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(dynamicOverlayGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(outputGraphics);
  }

  private IntStream linearEvaluationOrder()
  {
    List<Integer> integers = range(0, windowWidth * windowHeight).boxed().collect(Collectors.toList());
    return integers.stream().mapToInt(x -> x);
  }

  private AlphaComposite makeComposite(float alpha)
  {
    return AlphaComposite.SrcOver.derive(alpha);
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

  public Double mapScreenToFunction(Point point)
  {
    Double dest = new Point2D.Double();
    getScreenToFunctionDomainMapping().transform(point, dest);
    return dest;
  }

  private void markAxes()
  {
    drawLine(staticOverlayGraphics,
             new Double(-resolution.getWidth(),
                        0),
             new Double(resolution.getWidth(),
                        0));
    drawLine(staticOverlayGraphics,
             new Double(0,
                        -resolution.getHeight()),
             new Double(0,
                        resolution.getHeight()));
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
    while (x < resolution.getWidth())
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
    while (y < resolution.getHeight())
    {
      y += ytick;
      markVerticalTick(y);
    }
  }

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

  private synchronized void newDynamicOverlay()
  {
    dynamicOverlayImage    = new BufferedImage(windowWidth,
                                               windowHeight,
                                               BufferedImage.TYPE_INT_ARGB);
    dynamicOverlayGraphics = dynamicOverlayImage.createGraphics();
    setScreenCoordinateSpaceGraphicsProperties(dynamicOverlayGraphics);
  }

  @Override
  public synchronized void paintComponent(Graphics g)
  {
    blendLayers(g, true);

  }

  public void refineFunctionEvaluation(int x, int y, Complex z, Complex w, Float zr, Float zi, int prec)
  {

    // zi = ( (by - ay) * y ) / ( ynum - 1 )
    by.sub(ay, prec, zi);
    zi.mul(y, prec, zi);
    zi.div(windowHeight - 1, prec, zi);
    zi.add(ay, prec, zi);

    // zr = ( (bx - ax) * x ) / ( xnum - 1 )
    bx.sub(ax, prec, zr);
    zr.mul(x, prec, zr);
    zr.div(windowWidth - 1, prec, zr);
    zr.add(ax, prec, zr);

    evalFunction(z, w);
  }

  public BufferedImage render() throws IOException
  {

    if (!headless && frame == null)
    {
      showFrame();
    }
    if (!headless && frame != null)
    {
      frame.setTitle(getColorPlateName());
    }
    startTime = System.currentTimeMillis();
    startRepaintTimer();

    initializeCoordinateSystem();

    drawStaticMarkups();

    System.out.println("complete = " + image.complete + " .... evaluating");

    evaluateFunctionOnGrid();

    System.out.println("complete = " + image.complete);

    reportRenderingRate();

    saveToFile();

    return functionImage;
  }

  void renderCoordinateSystemAxes()
  {
    markAxes();
    markHorizontalTicks();
    markVerticalTicks();
  }

  private void reportRenderingRate()
  {
    long   stopTime = System.currentTimeMillis();
    double seconds  = Utilities.convertTimeUnits((double) stopTime - startTime,
                                                 TimeUnit.MILLISECONDS,
                                                 TimeUnit.SECONDS);
    double rate     = (windowWidth * windowHeight) / seconds;
    System.out.format("Rendered in " + seconds + " seconds at a rate of %.0f pixels/sec\n", rate);
  }

  public void saveToFile() throws IOException
  {
    String cpn = getColorPlateName();
    frame.setName(cpn);
    saveToFile(cpn + ".png");
  }

  public void saveToFile(String filename) throws IOException
  {
    File f = new File(filename);
    System.out.println("Saving image to " + f);

    ImageIO.write(functionImage, "PNG", f);
    System.out.println("Saved " + f);
  }

  private void setFunctionCoordinateSpaceGraphicsProperties(Graphics2D g)
  {
    g.setColor(Color.BLACK);
    g.setStroke(new BasicStroke(0.008f));
    g.setFont(newFont);
    g.setTransform(getFunctionSpaceCoordinates());
    g.setRenderingHints(renderingHints);

  }

  private void setScreenCoordinateSpaceGraphicsProperties(Graphics2D g)
  {
    g.setColor(Color.WHITE);
    g.setStroke(new BasicStroke(2f));
    g.setFont(newFont);
    originalTransform = g.getTransform();
    g.setRenderingHints(renderingHints);

  }

  private void setStaticOverlayGraphicsFontSizeToHalfItsCurrentSize()
  {
    Font currentFont = staticOverlayGraphics.getFont();
    Font newFont     = currentFont.deriveFont(currentFont.getSize() * 0.5F);
    staticOverlayGraphics.setFont(newFont);
  }

  public void showFrame()
  {
    frame = Utilities.openInJFrame(this,
                                   resolution.width,
                                   resolution.height,
                                   function.toString(),
                                   keepRunning ? WindowConstants.HIDE_ON_CLOSE : WindowConstants.EXIT_ON_CLOSE);
    frame.addWindowListener(new WindowAdapter()
    {
      @Override
      public void windowClosing(WindowEvent e)
      {
        System.out.println("windowClosing...");
        close();
      }
    });
  }

  private IntStream shuffledEvaluationOrder()
  {
    List<Integer> integers = range(0, windowWidth * windowHeight).boxed().collect(Collectors.toList());
    Collections.shuffle(integers);
    return integers.stream().mapToInt(x -> x);
  }

  private void startRepaintTimer()
  {
    try
    {
      repaintTimer = new Timer(34,
                               e ->
                               {
                                 repaint();
                               });
      repaintTimer.start();

    }
    catch (HeadlessException e)
    {
      headless = true;
    }
  }

  public void switchToColorMode(int i)
  {
    System.out.println("setting colorMode to " + colorMode + " and re-rendering");
    this.colorMode = i;
    reevaluateFunctionOnGrid();

  }

  public void switchToDisplayMode(Part real)
  {
    System.out.println("setting displayMode to " + displayMode + " and re-rendering");
    this.displayMode = real;
    reevaluateFunctionOnGrid();

  }

  protected void reevaluateFunctionOnGrid()
  {
    new Thread(() ->
    {
      System.out.println("re-rendering function");
      evaluateFunctionOnGrid();
      System.out.println("Finished re-rendering function");
    }).start();

  }

  public void toggleShowHelp()
  {
    showHelp = !showHelp;
  }

  protected void zoomTo(Double upperLeft, Double lowerRight)
  {
    out.format("zoomTo(%s, %s )\n", upperLeft, lowerRight);

  }

  protected void zoomTo(java.awt.geom.Rectangle2D.Double domain2)
  {
    System.out.println("zoom to " + domain2);
  }

}
