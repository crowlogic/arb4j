package arb.viz;

import static java.lang.System.*;
import static java.util.stream.IntStream.*;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;
import java.awt.geom.Point2D.Double;
import java.awt.image.*;
import java.io.*;
import java.util.*;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.util.stream.*;

import javax.imageio.*;
import javax.swing.*;
import javax.swing.Timer;

import arb.*;
import arb.Float;
import arb.functions.complex.*;
import arb.functions.complex.numbertheoretic.ZFunction;
import arb.utensils.*;

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
    double R[] = new double[1];
    double G[] = new double[1];
    double B[] = new double[1];
  }

  /**
   * do not set to greater than 128, see {@link PointValueCache} for the
   * explanation
   */
  protected final static int precisionBits = 128;

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

  protected Complex            w;

  protected Complex            N                               = Complex.newVector(2);                      // Newton
                                                                                                            // step.
                                                                                                            // w/dw

  ThreadLocalComplex           _z                              = new ThreadLocalComplex(2);

  ThreadLocal<Pixel>           pixel                           = ThreadLocal.withInitial(() -> new Pixel());

  ThreadLocal<Pixel>           pixel2                          = ThreadLocal.withInitial(() -> new Pixel());

  public int                   colorMode                       = 0;

  int                          width;

  int                          height;

  public Float                 ax                              = new Float();

  public Float                 bx                              = new Float();

  public Float                 ay                              = new Float();

  public Float                 by                              = new Float();

  BufferedImage                functionImage;

  BufferedImage                staticOverlayImage;

  BufferedImage                dynamicOverlayImage;

  private Timer                repaintTimer;

  private Graphics2D           functionImageGraphics;

  boolean                      headless                        = false;

  protected Dimension          resolution;

  protected Rectangle2D.Double domain;

  AffineTransform              screenToFunctionMapping;

  AffineTransform              functionToScreenMapping;

  boolean                      selection                       = false;

  public Double                cursorInFunctionSpace;

  Complex                      tangent;
  private double               xtick                           = 1;

  private double               ytick                           = 1;

  private AlphaComposite       alphaComposite;

  private AlphaComposite       brightAlphaComposite;
  private Graphics2D           staticOverlayGraphics;

  private Graphics2D           dynamicOverlayGraphics;

  public JFrame                frame;

  private Font                 newFont;

  public BufferedImage         outputImage;

  private Graphics2D           outputGraphics;

  private Composite            originalComposite;

  private AffineTransform      originalTransform;

  volatile boolean             anythingChanged                 = false;

  ThreadLocalReal              r                               = new ThreadLocalReal();

  public Part                  displayMode                     = Part.Imag;

  ThreadLocal<Complex[][]>     cells                           = newCell();

  ThreadLocal<Complex[][]>     zcells                          = newCell();

  ThreadLocal<Complex[][]>     wcells                          = newCell();
  protected PointValueCache    image;

  boolean                      singleThreading                 = false;

  private long                 startTime;

  public boolean               labelHardyZRoots                = true;

  public boolean               showHardyZRootLocations         = false;

  Color                        clear                           = new Color(0,
                                                                           0,
                                                                           0,
                                                                           255);

  private RenderingHints       renderingHints;

  public Point2D.Double        cursorInScreenSpace;
  Color                        cursorColor                     = Color.BLACK;

  /**
   * cursor is analogous to coordinate
   */

  Double                       tangentRayEndpointInScreenSpace = new Point2D.Double();

  protected F                  function;

  boolean                      disableNewton                   = true;

  Real                         phase;

  Complex                      damping                         = new Complex().set(0.1, 0);

  boolean                      debug                           = false;

  public Complex               trajectory;

  private boolean              showHelp                        = false;

  private Float                dx                              = new Float();

  private Float                dy                              = new Float();

  Mode                         mode                            = Mode.Translate;

  public boolean               keepRunning                     = false;

  public ComplexFunctionRenderer()
  {

  }

  public ComplexFunctionRenderer(Dimension resolution,
                                 Rectangle2D.Double domain,
                                 F function) throws NoninvertibleTransformException
  {
    this.resolution = resolution;
    this.domain     = domain;
    this.function   = function;
    initCache();
    init();
  }

  MouseHandler    mouseHandler    = new MouseHandler(this);

  KeyboardHandler keyboardHandler = new KeyboardHandler(this);

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

  /**
   * Set N=w/w' and phase=arg(N)
   */
  private void calculateNewtonStepAndPhase()
  {
    assert N != null;

    Complex unnormalizedN = w.div(w.get(1), precisionBits, N).neg(N);
    // Complex dt = unnormalizedN.normalize(N).neg(N);

    // acb_div(N, w, w.get(1), prec);

    // the orthogonal complement of the newton derivative should be the normal
    // vector, i think
    // acb_mul_onei(N, N);
    // acb_neg(N, N);
    N.arg(precisionBits, phase);

  }

  public synchronized Complex calculateNewtonTrajectory(Complex t, int n)
  {

    return ComplexConstants.ZERO;

  }

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
    System.out.println("Renderer closing. complete=" + image.complete);
    // unassignInputHandlers();
    System.out.println("Disengaged input handlers...");
    if (!image.complete && !closing)
    {
      closing = true;
      System.out.println("Dispatching WINDOW_CLOSING event to frame..");
      // hide();
      frame.dispatchEvent(new WindowEvent(frame,
                                          WindowEvent.WINDOW_CLOSING));
      System.out.println("Dispatched WINDOW_CLOSING event to frame..");
    }
//    this._z.remove();
//    pixel.remove();
//    pixel2.remove();
    if (image.buffer != null)
    {
      image.close();
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
      case Imag:
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
    Pixel pixel = colorizePixel(w);
//
    int   red   = (int) Math.min(255, Math.floor(pixel.R[0] * 255));
    int   green = (int) Math.min(255, Math.floor(pixel.G[0] * 255));
    int   blue  = (int) Math.min(255, Math.floor(pixel.B[0] * 255));
    functionImage.setRGB(x, y, red | green << 8 | blue << 16);

    // double v =
    // tanh(sqrt(pow(w.getImag().doubleValue(),2)+pow(w.getReal().doubleValue(),2)));
    // double v = tanh(w.getImag().doubleValue()+w.getReal().doubleValue()/2);
    // double v = w.arg(128, r.get()).doubleValue()/Math.PI;
//    switch (displayMode)
//    {
//    case Real:
//      double v = tanh(w.getReal().doubleValue());
//      if (!java.lang.Double.isFinite(v))
//      {
//        v = 0;
//      }
//      functionImage.setRGB(x, y, v < 0 ? colorMapB.interpolate(-v) : colorMap.interpolate(v));
//      break;
//    case Imag:
//      v = tanh(w.getImag().doubleValue());
//      if (!java.lang.Double.isFinite(v))
//      {
//        v = 0;
//      }
//      functionImage.setRGB(x, y, v < 0 ? colorMapB.interpolate(-v) : colorMap.interpolate(v));
//      break;
//    case Phase:
//      Real r = this.r.get();
//      v = w.arg(128, r).div(RealConstants.??, 128, r).doubleValue();
//      if (!java.lang.Double.isFinite(v))
//      {
//        v = 0;
//      }
//      functionImage.setRGB(x, y, v < 0 ? colorMapB.interpolate(-v) : colorMap.interpolate(v));
//      break;
//    case Blend:

    // }
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

  private void drawDynamicMarkups() throws NoninvertibleTransformException
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
    drawTextInScreenCoordinates(true,
                                "Press\n" + "F1     Toggle program help screen (what you're looking at)\n"
                                              + "F2     Toggle overlay color between black and white\n"
                                              + "F3     Toggle between Both/Real part only/Imaginary only\n"
                                              + "P      Show Phase (Argument)"
                                              + "B      Show Blend of Both Real and Imaginary Parts\n"
                                              + "R      Show Real part only\n" + "I      Show Imaginary part only\n"
                                              + "Z      Select a rectangle to be magnified\n" + "S      Save image"
                                              + "ESC    Exit progam\n",
                                20,
                                20);

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

  private void drawStaticMarkups()
  {
    setStaticOverlayGraphicsFontSizeToHalfItsCurrentSize();

    renderCoordinateSystemAxes();
    if (showHardyZRootLocations)
    {
      renderHardyZRootLocations();
    }

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
    AtomicInteger counter     = new AtomicInteger(width * height);

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
      int y = pixel / width;
      int x = pixel % width;
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

  public void init() throws NoninvertibleTransformException
  {
    setPreferredSize(this.resolution);
    setSize(this.resolution);
    renderingHints = new RenderingHints(RenderingHints.KEY_TEXT_ANTIALIASING,
                                        RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
    // setBorder(BorderFactory.createTitledBorder("Node"));
    out.format("screen=%s\ndomain=%s\n", this.resolution, this.domain);
    this.width         = this.resolution.width;
    this.height        = this.resolution.height;
    phase              = new Real();
    w                  = Complex.newVector(2);
    functionImage      = new BufferedImage(width,
                                           height,
                                           BufferedImage.TYPE_INT_RGB);
    staticOverlayImage = new BufferedImage(width,
                                           height,
                                           BufferedImage.TYPE_INT_ARGB);
    outputImage        = new BufferedImage(width,
                                           height,
                                           BufferedImage.TYPE_INT_ARGB);
    newDynamicOverlay();

    functionImageGraphics = functionImage.createGraphics();
    staticOverlayGraphics = staticOverlayImage.createGraphics();
    outputGraphics        = outputImage.createGraphics();

    Font currentFont = new Font("Monospaced",
                                Font.BOLD,
                                8);
    newFont              = currentFont.deriveFont(currentFont.getSize() * 2F);
    alphaComposite       = makeComposite(0.69f);
    brightAlphaComposite = makeComposite(0.95f);

    colorMode            = 0;
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
    bx.sub(ax, precisionBits, RoundingMode.Down, dx).div(width * 2, precisionBits, dx);
    by.sub(ay, precisionBits, RoundingMode.Down, dy).div(height * 2, precisionBits, dy);

    // System.out.format("dx=%s\n dy=%s\n", dx, dy);

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

  private void initializeCoordinateSystem() throws NoninvertibleTransformException
  {
    setFunctionCoordinateSpaceGraphicsProperties(functionImageGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(staticOverlayGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(dynamicOverlayGraphics);
    setFunctionCoordinateSpaceGraphicsProperties(outputGraphics);
  }

  private IntStream linearEvaluationOrder()
  {
    List<Integer> integers = range(0, width * height).boxed().collect(Collectors.toList());
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

  private synchronized void newDynamicOverlay() throws NoninvertibleTransformException
  {
    dynamicOverlayImage    = new BufferedImage(width,
                                               height,
                                               BufferedImage.TYPE_INT_ARGB);
    dynamicOverlayGraphics = dynamicOverlayImage.createGraphics();
    setScreenCoordinateSpaceGraphicsProperties(dynamicOverlayGraphics);
  }

  private IntStream orderedEvaluationOrder()
  {
    List<Integer> integers = range(0, width * height).boxed().collect(Collectors.toList());
    return integers.stream().mapToInt(x -> x);
  }

  @Override
  public synchronized void paintComponent(Graphics g)
  {
    // System.out.println( "Painting");
    blendLayers(g, true);

  }

  public void refineFunctionEvaluation(int x, int y, Complex z, Complex w, Float zr, Float zi, int prec)
  {

    // zi = ( (by - ay) * y ) / ( ynum - 1 )
    by.sub(ay, prec, zi);
    zi.mul(y, prec, zi);
    zi.div(height - 1, prec, zi);
    zi.add(ay, prec, zi);

    // zr = ( (bx - ax) * x ) / ( xnum - 1 )
    bx.sub(ax, prec, zr);
    zr.mul(x, prec, zr);
    zr.div(width - 1, prec, zr);
    zr.add(ax, prec, zr);

    evalFunction(z, w);
  }

  public BufferedImage render() throws IOException, NoninvertibleTransformException
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

  private void reportRenderingRate()
  {
    long   stopTime = System.currentTimeMillis();
    double seconds  = Utilities.convertTimeUnits(stopTime - startTime, TimeUnit.MILLISECONDS, TimeUnit.SECONDS);
    double rate     = (width * height) / seconds;
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
    List<Integer> integers = range(0, width * height).boxed().collect(Collectors.toList());
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
                                 // renderMarkups();
                               });
      repaintTimer.start();

    }
    catch (HeadlessException e)
    {
      headless = true;
    }
  }

  public void switchDisplayModeTo(Part real)
  {
    System.out.println("setting displayMode to " + displayMode + " and re-rendering");
    this.displayMode = real;
    new Thread(() ->
    {
      evaluateFunctionOnGrid();
      System.out.println("Finished re-rendering function after setting displayMode to " + displayMode);
    }).start();
    ;

  }

  public void toggleShowHelp()
  {
    showHelp = !showHelp;
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

}
