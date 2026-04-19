package arb.applications;
// LemniscateLab.java

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

// Single-file JavaFX application. Compile/run with a JDK that bundles JavaFX,
// or with: javac --module-path <javafx-lib> --add-modules javafx.controls LemniscateLab.java
//          java  --module-path <javafx-lib> --add-modules javafx.controls LemniscateLab

import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.value.ChangeListener;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.*;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.*;
import javafx.scene.input.MouseButton;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.scene.paint.PhongMaterial;
import javafx.scene.shape.*;
import javafx.scene.text.Font;
import javafx.scene.transform.Rotate;
import javafx.scene.transform.Translate;
import javafx.stage.Stage;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LemniscateLab extends
                           Application
{

  // ---- shared parameters -------------------------------------------------
  private final DoubleProperty R       = new SimpleDoubleProperty(1.0); // torus major radius
  private final DoubleProperty rTube   = new SimpleDoubleProperty(1.0); // torus minor radius (=R => horn torus => lemniscate slice)
  private final DoubleProperty planeY  = new SimpleDoubleProperty(1.0); // cutting plane offset (|y|=r gives the lemniscate)
  private final DoubleProperty cFocus  = new SimpleDoubleProperty(1.0); // Cassini focus parameter c
  private final DoubleProperty levelB  = new SimpleDoubleProperty(1.0); // Cassini level |z^2 - c^2| = B (B = c^2 gives lemniscate)
  private final DoubleProperty order   = new SimpleDoubleProperty(1.0); // order rho for indicator function
  private final DoubleProperty theta0  = new SimpleDoubleProperty(0.0); // ray angle for indicator readout

  private final int            TORUS_U = 96, TORUS_V = 48;

  @Override
  public void start(Stage stage)
  {
    TabPane tabs = new TabPane();
    tabs.getTabs()
        .addAll(new Tab("Torus ↔ Cassini",
                        build3DTab()),
                new Tab("Level Curves",
                        buildLevelTab()),
                new Tab("tanh(ln(1+|z|²))",
                        buildSubharmonicTab()),
                new Tab("Indicator hf(θ)",
                        buildIndicatorTab()),
                new Tab("Newton Tracer",
                        buildTracerTab()));
    tabs.getTabs().forEach(t -> t.setClosable(false));

    Scene scene = new Scene(tabs,
                            1180,
                            820,
                            true,
                            SceneAntialiasing.BALANCED);
    stage.setTitle("Lemniscate Lab — spiric sections, Cassini ovals, indicator functions, subharmonicity");
    stage.setScene(scene);
    stage.show();
  }

  // =======================================================================
  // Tab 1: 3D torus with a movable cutting plane; section drawn on 2D overlay
  // =======================================================================
  private BorderPane build3DTab()
  {
    Group         world  = new Group();
    Group         root3D = new Group(world);

    MeshView      torus  = new MeshView(buildTorusMesh(R.get(), rTube.get(), TORUS_U, TORUS_V));
    PhongMaterial tmat   = new PhongMaterial(Color.color(0.35, 0.55, 0.95, 1.0));
    tmat.setSpecularColor(Color.LIGHTBLUE);
    torus.setMaterial(tmat);
    torus.setCullFace(CullFace.NONE);
    torus.setDrawMode(DrawMode.FILL);

    Box           plane = new Box(3.8,
                                  0.005,
                                  3.8);
    PhongMaterial pmat  = new PhongMaterial(Color.color(1.0, 0.65, 0.25, 0.35));
    plane.setMaterial(pmat);
    plane.setCullFace(CullFace.NONE);

    world.getChildren().addAll(torus, plane);

    // camera + rotation
    PerspectiveCamera cam = new PerspectiveCamera(true);
    cam.setNearClip(0.01);
    cam.setFarClip(100);
    cam.getTransforms()
       .add(new Translate(0,
                          0,
                          -6));
    Rotate rx = new Rotate(-25,
                           Rotate.X_AXIS);
    Rotate ry = new Rotate(30,
                           Rotate.Y_AXIS);
    world.getTransforms().addAll(rx, ry);

    SubScene sub = new SubScene(root3D,
                                780,
                                780,
                                true,
                                SceneAntialiasing.BALANCED);
    sub.setFill(Color.rgb(18, 18, 28));
    sub.setCamera(cam);

    // mouse drag to orbit
    final double[] last = new double[2];
    sub.setOnMousePressed(e ->
    {
      last[0] = e.getSceneX();
      last[1] = e.getSceneY();
    });
    sub.setOnMouseDragged(e ->
    {
      double dx = e.getSceneX() - last[0];
      double dy = e.getSceneY() - last[1];
      if (e.getButton() == MouseButton.PRIMARY)
      {
        ry.setAngle(ry.getAngle() + dx * 0.4);
        rx.setAngle(rx.getAngle() - dy * 0.4);
      }
      else if (e.getButton() == MouseButton.SECONDARY)
      {
        planeY.set(clamp(planeY.get() + dy * 0.005, -2.5, 2.5));
      }
      last[0] = e.getSceneX();
      last[1] = e.getSceneY();
    });
    sub.setOnScroll(e -> cam.getTransforms()
                            .add(new Translate(0,
                                               0,
                                               e.getDeltaY() * 0.01)));

    // 2D overlay canvas for the spiric section
    Canvas sectionCanvas = new Canvas(360,
                                      360);
    Label  sectionLabel  = new Label("Planar section (x, z) at y = plane offset");
    sectionLabel.setFont(Font.font(13));

    Runnable               rebuild = () ->
                                   {
                                     torus.setMesh(buildTorusMesh(R.get(), rTube.get(), TORUS_U, TORUS_V));
                                     plane.setTranslateY(planeY.get());
                                     drawSpiricSection(sectionCanvas, R.get(), rTube.get(), planeY.get());
                                   };
    ChangeListener<Number> rl      = (o, a, b) -> rebuild.run();
    R.addListener(rl);
    rTube.addListener(rl);
    planeY.addListener(rl);
    rebuild.run();

    // controls
    VBox ctrl = new VBox(8,
                         section("Torus major radius R", slider(0.3, 2.5, R)),
                         section("Torus tube radius r", slider(0.05, 2.5, rTube)),
                         section("Cutting plane y", slider(-2.5, 2.5, planeY)),
                         new Label("r = R and |y| = r  ⇒  section is the lemniscate of Bernoulli.\n"
                                   + "|y| between r and R  ⇒  two disjoint Cassini ovals.\n"
                                   + "|y| < r  ⇒  one peanut/convex oval.\n"
                                   + "LMB drag: orbit.  RMB drag: move plane.  Wheel: zoom."),
                         sectionLabel,
                         sectionCanvas);
    ctrl.setPadding(new Insets(12));
    ctrl.setPrefWidth(380);

    BorderPane bp = new BorderPane();
    bp.setCenter(sub);
    bp.setRight(ctrl);
    return bp;
  }

  private TriangleMesh buildTorusMesh(double R, double r, int nu, int nv)
  {
    TriangleMesh m = new TriangleMesh();
    for (int i = 0; i <= nu; i++)
    {
      double u = 2 * Math.PI * i / nu;
      for (int j = 0; j <= nv; j++)
      {
        double v = 2 * Math.PI * j / nv;
        float  x = (float) ((R + r * Math.cos(v)) * Math.cos(u));
        float  z = (float) ((R + r * Math.cos(v)) * Math.sin(u));
        float  y = (float) (r * Math.sin(v));
        m.getPoints().addAll(x, y, z);
        m.getTexCoords().addAll((float) i / nu, (float) j / nv);
      }
    }
    int stride = nv + 1;
    for (int i = 0; i < nu; i++)
    {
      for (int j = 0; j < nv; j++)
      {
        int p00 = i * stride + j;
        int p01 = i * stride + j + 1;
        int p10 = (i + 1) * stride + j;
        int p11 = (i + 1) * stride + j + 1;
        m.getFaces().addAll(p00, p00, p10, p10, p11, p11);
        m.getFaces().addAll(p00, p00, p11, p11, p01, p01);
      }
    }
    return m;
  }

  private void drawSpiricSection(Canvas c, double R, double r, double y)
  {
    GraphicsContext g = c.getGraphicsContext2D();
    double          W = c.getWidth(), H = c.getHeight();
    g.setFill(Color.rgb(22, 22, 30));
    g.fillRect(0, 0, W, H);
    g.setStroke(Color.DARKGRAY);
    g.strokeLine(0, H / 2, W, H / 2);
    g.strokeLine(W / 2, 0, W / 2, H);
    double scale = Math.min(W, H) / (2.2 * (R + r));
    g.setStroke(Color.ORANGE);
    g.setLineWidth(1.8);
    int    N     = 2000;
    double prevX = Double.NaN, prevZ = Double.NaN;
    for (int k = 0; k < N; k++)
    {
      double x   = -1.2 * (R + r) + 2.4 * (R + r) * k / (N - 1);
      // (sqrt(x^2+y^2) - R)^2 + z^2 = r^2 => z = ±sqrt(r^2 - (sqrt(x^2+y^2)-R)^2)
      double q   = Math.sqrt(x * x + y * y) - R;
      double rhs = r * r - q * q;
      if (rhs < 0)
      {
        prevX = Double.NaN;
        continue;
      }
      double z  = Math.sqrt(rhs);
      double sx = W / 2 + x * scale, sy1 = H / 2 - z * scale, sy2 = H / 2 + z * scale;
      if (!Double.isNaN(prevX))
      {
        g.strokeLine(W / 2 + prevX * scale, H / 2 - prevZ * scale, sx, sy1);
        g.strokeLine(W / 2 + prevX * scale, H / 2 + prevZ * scale, sx, sy2);
      }
      prevX = x;
      prevZ = z;
    }
  }

  // =======================================================================
  // Tab 2: Cassini ovals |z^2 - c^2| = B, contour plot, B varies => lemniscate at
  // B=c^2
  // =======================================================================
  private BorderPane buildLevelTab()
  {
    Canvas                 canvas = new Canvas(820,
                                               780);
    Runnable               draw   = () -> drawCassini(canvas, cFocus.get(), levelB.get());
    ChangeListener<Number> rl     = (o, a, b) -> draw.run();
    cFocus.addListener(rl);
    levelB.addListener(rl);
    draw.run();

    VBox ctrl = new VBox(8,
                         section("Focal parameter c", slider(0.2, 2.0, cFocus)),
                         section("Level B for |z² − c²| = B", slider(0.01, 6.0, levelB)),
                         new Label("Critical level: B = c² (figure-eight lemniscate).\n"
                                   + "B < c²: two disjoint ovals (one per focus).\n"
                                   + "B > c²: one closed curve — peanut, then convex.\n"
                                   + "The heat-map is log|z²−c²|; the bold curve is the current level B."));
    ctrl.setPadding(new Insets(12));
    ctrl.setPrefWidth(340);

    BorderPane bp = new BorderPane();
    bp.setCenter(canvas);
    bp.setRight(ctrl);
    return bp;
  }

  private void drawCassini(Canvas c, double cf, double B)
  {
    GraphicsContext                  g    = c.getGraphicsContext2D();
    int                              W    = (int) c.getWidth(), H = (int) c.getHeight();
    double                           span = 3.0;
    javafx.scene.image.WritableImage img  = new javafx.scene.image.WritableImage(W,
                                                                                 H);
    for (int py = 0; py < H; py++)
    {
      double y = -span + 2 * span * py / (H - 1);
      for (int px = 0; px < W; px++)
      {
        double x = -span + 2 * span * px / (W - 1);
        double a = x * x - y * y - cf * cf;
        double b = 2 * x * y;
        double m = Math.sqrt(a * a + b * b);           // |z^2 - c^2|
        double t = Math.log(1 + m) / Math.log(1 + 6.0);
        img.getPixelWriter().setColor(px, py, heat(t));
      }
    }
    g.drawImage(img, 0, 0);
    // contour for level B by marching squares
    g.setStroke(Color.WHITE);
    g.setLineWidth(2.0);
    double[][] F = new double[H][W];
    for (int py = 0; py < H; py++)
    {
      double y = -span + 2 * span * py / (H - 1);
      for (int px = 0; px < W; px++)
      {
        double x = -span + 2 * span * px / (W - 1);
        double a = x * x - y * y - cf * cf, bb = 2 * x * y;
        F[py][px] = Math.sqrt(a * a + bb * bb) - B;
      }
    }
    marchingSquares(g, F, W, H);
    // foci markers
    g.setFill(Color.YELLOW);
    double sx = W / 2.0 / span, sy = H / 2.0 / span;
    g.fillOval(W / 2.0 + cf * sx - 4, H / 2.0 - 4, 8, 8);
    g.fillOval(W / 2.0 - cf * sx - 4, H / 2.0 - 4, 8, 8);
  }

  private void marchingSquares(GraphicsContext g, double[][] F, int W, int H)
  {
    for (int j = 0; j < H - 1; j++)
    {
      for (int i = 0; i < W - 1; i++)
      {
        double a    = F[j][i], b = F[j][i + 1], cc = F[j + 1][i + 1], d = F[j + 1][i];
        int    code = (a > 0 ? 1 : 0) | (b > 0 ? 2 : 0) | (cc > 0 ? 4 : 0) | (d > 0 ? 8 : 0);
        if (code == 0 || code == 15)
          continue;
        double tAB = a / (a - b), tBC = b / (b - cc), tCD = d / (d - cc), tDA = a / (a - d);
        double xAB = i + tAB, yAB = j;
        double xBC = i + 1, yBC = j + tBC;
        double xCD = i + tCD, yCD = j + 1;
        double xDA = i, yDA = j + tDA;
        switch (code)
        {
        case 1:
        case 14:
          g.strokeLine(xDA, yDA, xAB, yAB);
          break;
        case 2:
        case 13:
          g.strokeLine(xAB, yAB, xBC, yBC);
          break;
        case 4:
        case 11:
          g.strokeLine(xBC, yBC, xCD, yCD);
          break;
        case 8:
        case 7:
          g.strokeLine(xCD, yCD, xDA, yDA);
          break;
        case 3:
        case 12:
          g.strokeLine(xDA, yDA, xBC, yBC);
          break;
        case 6:
        case 9:
          g.strokeLine(xAB, yAB, xCD, yCD);
          break;
        case 5:
          g.strokeLine(xDA, yDA, xAB, yAB);
          g.strokeLine(xBC, yBC, xCD, yCD);
          break;
        case 10:
          g.strokeLine(xAB, yAB, xBC, yBC);
          g.strokeLine(xCD, yCD, xDA, yDA);
          break;
        }
      }
    }
  }

  // =======================================================================
  // Tab 3: heat-map of u = tanh(ln(1 + |z|^2)) and its Laplacian, with sign mask
  // =======================================================================
  private BorderPane buildSubharmonicTab()
  {
    Canvas   canvas  = new Canvas(820,
                                  780);
    CheckBox showLap = new CheckBox("Color by Δu");
    showLap.setSelected(true);
    CheckBox showSign = new CheckBox("Highlight subharmonic region Δu ≥ 0");
    showSign.setSelected(true);
    Runnable draw = () -> drawSubharmonic(canvas, showLap.isSelected(), showSign.isSelected());
    showLap.selectedProperty().addListener((o, a, b) -> draw.run());
    showSign.selectedProperty().addListener((o, a, b) -> draw.run());
    draw.run();

    double rStar = Math.sqrt(subharmonicCriticalT());
    VBox   ctrl  = new VBox(10,
                            showLap,
                            showSign,
                            new Label(String.format("u(z) = tanh(ln(1 + |z|²))%n"
                                                    + "Δu = 16(−2r⁶ − 3r⁴ + 2r² + 2) / (r⁴ + 2r² + 2)³%n"
                                                    + "Subharmonic iff r < r* ≈ %.5f%n"
                                                    + "(root of 2t³ + 3t² − 2t − 2 = 0, t = r²)",
                                                    rStar)));
    ctrl.setPadding(new Insets(12));
    ctrl.setPrefWidth(340);

    BorderPane bp = new BorderPane();
    bp.setCenter(canvas);
    bp.setRight(ctrl);
    return bp;
  }

  private double subharmonicCriticalT()
  {
    double lo = 0, hi = 2;
    for (int i = 0; i < 80; i++)
    {
      double m = 0.5 * (lo + hi);
      double v = 2 * m * m * m + 3 * m * m - 2 * m - 2;
      if (v > 0)
        hi = m;
      else
        lo = m;
    }
    return 0.5 * (lo + hi);
  }

  private void drawSubharmonic(Canvas c, boolean lap, boolean sign)
  {
    GraphicsContext                  g     = c.getGraphicsContext2D();
    int                              W     = (int) c.getWidth(), H = (int) c.getHeight();
    double                           span  = 2.5;
    javafx.scene.image.WritableImage img   = new javafx.scene.image.WritableImage(W,
                                                                                  H);
    double                           rStar = Math.sqrt(subharmonicCriticalT());
    for (int py = 0; py < H; py++)
    {
      double y = -span + 2 * span * py / (H - 1);
      for (int px = 0; px < W; px++)
      {
        double x   = -span + 2 * span * px / (W - 1);
        double r2  = x * x + y * y;
        double num = 16 * (-2 * Math.pow(r2, 3) - 3 * r2 * r2 + 2 * r2 + 2);
        double den = Math.pow(r2 * r2 + 2 * r2 + 2, 3);
        double v   = lap ? num / den : Math.tanh(Math.log(1 + r2));
        double t   = lap ? 0.5 + 0.5 * Math.tanh(v * 0.8) : v;
        Color  col = lap ? divergent(t) : heat(t);
        if (sign && Math.sqrt(r2) <= rStar)
          col = col.interpolate(Color.LIME, 0.35);
        img.getPixelWriter().setColor(px, py, col);
      }
    }
    g.drawImage(img, 0, 0);
    // draw r* circle
    g.setStroke(Color.LIME);
    g.setLineWidth(2);
    double s = W / (2.0 * span);
    g.strokeOval(W / 2.0 - rStar * s, H / 2.0 - rStar * s, 2 * rStar * s, 2 * rStar * s);
  }

  // =======================================================================
  // Tab 4: indicator function hf(theta) for a user-selected entire function
  // =======================================================================
  private BorderPane buildIndicatorTab()
  {
    Canvas                                canvas = new Canvas(820,
                                                              780);
    String[]                              names  =
    { "exp(z)", "sin(z)", "cos(z)", "exp(z²)", "exp(i z)" };
    javafx.scene.control.ComboBox<String> choice = new javafx.scene.control.ComboBox<>();
    choice.getItems().addAll(names);
    choice.getSelectionModel().select(0);

    Runnable draw = () -> drawIndicator(canvas, choice.getValue(), order.get(), theta0.get());
    choice.valueProperty().addListener((o, a, b) -> draw.run());
    order.addListener((o, a, b) -> draw.run());
    theta0.addListener((o, a, b) -> draw.run());
    draw.run();

    VBox ctrl = new VBox(8,
                         new Label("Entire function f(z):"),
                         choice,
                         section("Order ρ (scaling)", slider(0.1, 3.0, order)),
                         section("Ray angle θ", slider(-Math.PI, Math.PI, theta0)),
                         new Label("hf(θ) = limsup r→∞  r^(−ρ) log|f(r e^{iθ})|.\n"
                                   + "Plot: polar graph of hf(θ) for large r (sampled).\n"
                                   + "Red ray: current θ; readout log|f|/r^ρ shown on canvas."));
    ctrl.setPadding(new Insets(12));
    ctrl.setPrefWidth(340);

    BorderPane bp = new BorderPane();
    bp.setCenter(canvas);
    bp.setRight(ctrl);
    return bp;
  }

  private double logAbsF(String name, double x, double y)
  {
    switch (name)
    {
    case "exp(z)":
      return x;
    case "sin(z)":
      return Math.log(0.5 * Math.abs(Math.exp(y) - Math.exp(-y)))
                    == Double.NEGATIVE_INFINITY ? -50 : Math.log(Math.hypot(Math.sin(x) * Math.cosh(y), Math.cos(x) * Math.sinh(y)) + 1e-300);
    case "cos(z)":
      return Math.log(Math.hypot(Math.cos(x) * Math.cosh(y), Math.sin(x) * Math.sinh(y)) + 1e-300);
    case "exp(z²)":
      return x * x - y * y;
    case "exp(i z)":
      return -y;
    }
    return 0;
  }

  private void drawIndicator(Canvas c, String name, double rho, double th)
  {
    GraphicsContext g = c.getGraphicsContext2D();
    double          W = c.getWidth(), H = c.getHeight();
    g.setFill(Color.rgb(18, 18, 28));
    g.fillRect(0, 0, W, H);
    double   cx      = W / 2, cy = H / 2;
    double   Rsample = 12.0;
    int      N       = 720;
    double[] h       = new double[N];
    double   maxAbs  = 1e-9;
    for (int k = 0; k < N; k++)
    {
      double a = -Math.PI + 2 * Math.PI * k / N;
      double x = Rsample * Math.cos(a), y = Rsample * Math.sin(a);
      h[k] = logAbsF(name, x, y) / Math.pow(Rsample, rho);
      if (Math.abs(h[k]) > maxAbs)
        maxAbs = Math.abs(h[k]);
    }
    double scale = Math.min(W, H) * 0.38 / maxAbs;
    // axes
    g.setStroke(Color.DARKGRAY);
    g.strokeLine(0, cy, W, cy);
    g.strokeLine(cx, 0, cx, H);
    // polar curve of h (positive outward, negative inward)
    g.setStroke(Color.CYAN);
    g.setLineWidth(2);
    double px0 = 0, py0 = 0;
    for (int k = 0; k <= N; k++)
    {
      double a      = -Math.PI + 2 * Math.PI * k / N;
      double radius = h[k % N] * scale;
      double x      = cx + radius * Math.cos(a);
      double y      = cy - radius * Math.sin(a);
      if (k > 0)
        g.strokeLine(px0, py0, x, y);
      px0 = x;
      py0 = y;
    }
    // current ray
    double val = logAbsF(name, Rsample * Math.cos(th), Rsample * Math.sin(th)) / Math.pow(Rsample, rho);
    g.setStroke(Color.ORANGERED);
    g.setLineWidth(2.5);
    g.strokeLine(cx, cy, cx + 220 * Math.cos(th), cy - 220 * Math.sin(th));
    g.setFill(Color.WHITE);
    g.setFont(Font.font(14));
    g.fillText(String.format("%s   ρ=%.2f   θ=%.3f   hf(θ)≈%.4f", name, rho, th, val), 16, 24);
  }

  // =======================================================================
  // Tab 5: circle-probe level-curve tracer (continuous Newton-like walk)
  // =======================================================================
  private BorderPane buildTracerTab()
  {
    Canvas                                canvas  = new Canvas(820,
                                                               780);
    double[]                              pos     =
    { 0.8, 0.3 };
    final boolean[]                       running =
    { false };
    final String[]                        mode    =
    { "level |z²−c²| (flattest)" };

    javafx.scene.control.ComboBox<String> modeBox = new javafx.scene.control.ComboBox<>();
    modeBox.getItems().addAll("level |z²−c²| (flattest)", "steepest ascent of log|f|", "phase contour arg f");
    modeBox.getSelectionModel().select(0);
    modeBox.valueProperty().addListener((o, a, b) -> mode[0] = b);

    canvas.setOnMousePressed(e ->
    {
      double span = 3.0, W = canvas.getWidth(), H = canvas.getHeight();
      pos[0] = (e.getX() - W / 2) / (W / (2 * span));
      pos[1] = -(e.getY() - H / 2) / (H / (2 * span));
    });

    drawTracerBackground(canvas, cFocus.get());
    AnimationTimer timer = new AnimationTimer()
    {
      long last = 0;

      @Override
      public void handle(long now)
      {
        if (!running[0])
          return;
        if (now - last < 16_000_000)
          return;
        last = now;
        stepTracer(canvas, pos, mode[0], cFocus.get(), levelB.get());
      }
    };
    timer.start();

    javafx.scene.control.Button toggle = new javafx.scene.control.Button("Start / Stop");
    toggle.setOnAction(e -> running[0] = !running[0]);
    javafx.scene.control.Button clear = new javafx.scene.control.Button("Clear");
    clear.setOnAction(e -> drawTracerBackground(canvas, cFocus.get()));

    cFocus.addListener((o, a, b) -> drawTracerBackground(canvas, cFocus.get()));

    VBox ctrl = new VBox(8,
                         new Label("Click canvas to place walker."),
                         modeBox,
                         new HBox(8,
                                  toggle,
                                  clear),
                         section("c (Cassini focus)", slider(0.2, 2.0, cFocus)),
                         section("target level B", slider(0.01, 6.0, levelB)),
                         new Label("Algorithm: at each step sample f on a small circle of radius ε\n"
                                   + "around the walker, pick the angle that best matches the mode\n"
                                   + "(flat = tangent to |f|-level, steepest = gradient, phase = arg f),\n"
                                   + "and advance. This is the finite-r cousin of the indicator function."));
    ctrl.setPadding(new Insets(12));
    ctrl.setPrefWidth(340);
    BorderPane bp = new BorderPane();
    bp.setCenter(canvas);
    bp.setRight(ctrl);
    return bp;
  }

  private void drawTracerBackground(Canvas c, double cf)
  {
    GraphicsContext                  g    = c.getGraphicsContext2D();
    int                              W    = (int) c.getWidth(), H = (int) c.getHeight();
    double                           span = 3.0;
    javafx.scene.image.WritableImage img  = new javafx.scene.image.WritableImage(W,
                                                                                 H);
    for (int py = 0; py < H; py++)
    {
      double y = -span + 2 * span * py / (H - 1);
      for (int px = 0; px < W; px++)
      {
        double x = -span + 2 * span * px / (W - 1);
        double a = x * x - y * y - cf * cf, b = 2 * x * y;
        double m = Math.sqrt(a * a + b * b);
        double t = Math.log(1 + m) / Math.log(1 + 6.0);
        img.getPixelWriter().setColor(px, py, heat(t));
      }
    }
    g.drawImage(img, 0, 0);
  }

  private void stepTracer(Canvas c, double[] pos, String mode, double cf, double B)
  {
    GraphicsContext g     = c.getGraphicsContext2D();
    double          W     = c.getWidth(), H = c.getHeight(), span = 3.0;
    double          eps   = 0.02;
    int             K     = 64;
    double          bestA = 0, bestScore = Double.POSITIVE_INFINITY;
    for (int k = 0; k < K; k++)
    {
      double a  = 2 * Math.PI * k / K;
      double x  = pos[0] + eps * Math.cos(a), y = pos[1] + eps * Math.sin(a);
      double ar = x * x - y * y - cf * cf, ai = 2 * x * y;
      double m  = Math.sqrt(ar * ar + ai * ai);
      double score;
      switch (mode)
      {
      case "steepest ascent of log|f|":
        score = -Math.log(m + 1e-12);
        break;
      case "phase contour arg f":
        score = Math.abs(Math.atan2(ai, ar));
        break;
      default:
        score = Math.abs(m - B);
      }
      if (score < bestScore)
      {
        bestScore = score;
        bestA     = a;
      }
    }
    double nx  = pos[0] + eps * Math.cos(bestA), ny = pos[1] + eps * Math.sin(bestA);
    double sx  = W / 2 + pos[0] * (W / (2 * span));
    double sy  = H / 2 - pos[1] * (H / (2 * span));
    double sx2 = W / 2 + nx * (W / (2 * span));
    double sy2 = H / 2 - ny * (H / (2 * span));
    g.setStroke(Color.WHITE);
    g.setLineWidth(1.6);
    g.strokeLine(sx, sy, sx2, sy2);
    pos[0] = nx;
    pos[1] = ny;
  }

  // ---- UI helpers --------------------------------------------------------
  private VBox section(String title, Slider s)
  {
    Label l = new Label(title);
    Label v = new Label(String.format("%.3f", s.getValue()));
    s.valueProperty().addListener((o, a, b) -> v.setText(String.format("%.3f", b.doubleValue())));
    HBox row = new HBox(8,
                        l,
                        v);
    row.setAlignment(Pos.CENTER_LEFT);
    HBox.setHgrow(l, Priority.ALWAYS);
    VBox box = new VBox(2,
                        row,
                        s);
    return box;
  }

  private Slider slider(double lo, double hi, DoubleProperty p)
  {
    Slider s = new Slider(lo,
                          hi,
                          p.get());
    s.valueProperty().bindBidirectional(p);
    s.setShowTickMarks(true);
    return s;
  }

  private static double clamp(double v, double lo, double hi)
  {
    return Math.max(lo, Math.min(hi, v));
  }

  private static Color heat(double t)
  {
    t = clamp(t, 0, 1);
    double r = clamp(1.5 * t, 0, 1);
    double g = clamp(1.5 * t - 0.5, 0, 1);
    double b = clamp(1.5 * t - 1.0, 0, 1);
    return Color.color(r, g, b);
  }

  private static Color divergent(double t)
  {
    t = clamp(t, 0, 1);
    if (t < 0.5)
    {
      double u = t / 0.5;
      return Color.color(u, u, 1.0);
    }
    else
    {
      double u = (t - 0.5) / 0.5;
      return Color.color(1.0, 1.0 - u, 1.0 - u);
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}