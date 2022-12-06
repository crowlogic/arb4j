package arb.viz;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import arb.Complex;
import arb.Real;
import arb.geometry.curves.Lemniscate;
import arb.geometry.curves.PlaneCurve;
import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.embed.swing.SwingFXUtils;
import javafx.geometry.Point2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.WritableImage;
import javafx.scene.layout.Background;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class CurveRenderer extends
                           Application implements
                           AutoCloseable
{

  public CurveRenderer()
  {
    super();
  }

  public CurveRenderer(PlaneCurve curve)
  {
    super();
    this.curve = curve;
  }

  private final class AnimatedCurveRoutine extends
                                           AnimationTimer
  {
    int         tick               = 0;
    int         tock               = 0;
    int         tickR              = 0, tickG = 0, tickB = 0;

    int         inc                = 1;
    private int lineWidthDirection = 1;

    @Override
    public void handle(long now)
    {
      if (!start)
        return;

      for (int i = 0; i < 15; i++)
      {
        t += 0.001;
        draw();
      }
      g.setStroke(Color.rgb(moduloEight(tickR), moduloEight(tickG), moduloEight(tickB)));

      System.out.format("%d,%d,%d,%d\n", tickR, tickG, tickB, lineWidth);
      tock++;
      if ((tickR + tickG + tickB) % 42 == 6)
      {
        tick++;
        inc = (int) (Math.random() * 4);
      }
      if (tock % 75 == 0)
      {
        lineWidth += lineWidthDirection;
        if (lineWidth > 75)
        {
          lineWidthDirection *= -1;
          lineWidth           = 40;
        }
        else if (lineWidth < 1)
        {
          lineWidthDirection *= -1;
          lineWidth           = 1;
        }
        g.setLineWidth(lineWidth);

      }
      switch (tick % 3)
      {
      case 0:
        tickR += inc;
        return;
      case 1:
        tickG += inc;
        return;
      case 2:
        tickB += inc;
        return;
      }
    }
  }

  private static final int prec = 128;
  private static final int W    = 1280;
  private static final int H    = 720;

  public static void main(String[] args)
  {
    launch(args);
  }

  private GraphicsContext g;
  private double          t     = 0.0;

  private double          oldX  = W / 2, oldY = H / 2;

  private boolean         start = true;

  PlaneCurve              curve = new Lemniscate();

  Real                    realt = new Real();

  Complex                 z     = new Complex();

  private AnimationTimer  curveAnimationRoutine;

  @Override
  public void close() throws Exception
  {
    realt.close();
    z.close();
  }

  private static int moduloEight(int tick)
  {
    return tick % 255;
    // return (int) (Math.random() * 255);
  }

  int lineWidth = 20;

  private Parent setTheScene()
  {
    Pane root = new Pane();
    root.setPrefSize(W, H);

    Canvas canvas = new Canvas(W,
                               H);
    g = canvas.getGraphicsContext2D();
    g.setLineWidth(lineWidth);
    root.setBackground(Background.fill(Color.BLACK));

    curveAnimationRoutine = new AnimatedCurveRoutine();
    curveAnimationRoutine.start();

    root.getChildren().add(canvas);
    return root;
  }

  private void draw()
  {
    Point2D p    = evaluateCurvePosition();

    // g.setStroke(Color.BLACK);

    double  newX = W / 2 + p.getX();
    double  newY = H / 2 + p.getY();

    if (oldX != W / 2 && oldY != H / 2)
    {
      g.strokeLine(oldX, oldY, newX, newY);

    }
    //

    oldX = newX;
    oldY = newY;
  }

  private Point2D evaluateCurvePosition()
  {
    curve.evaluate(realt.set(t), 1, prec, z).mul(200, prec);

    return new Point2D(z.getReal().doubleValue(),
                       z.getImag().doubleValue());
  }

  @Override
  public void start(Stage stage) throws Exception
  {
    Scene scene = new Scene(setTheScene());

    stage.setScene(scene);
    stage.show();
  }
}
