package arb.viz;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import arb.Complex;
import arb.Real;
import arb.geometry.curves.Lemniscate;
import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.embed.swing.SwingFXUtils;
import javafx.geometry.Point2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.image.WritableImage;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class CurveRenderer extends
                           Application implements
                           AutoCloseable
{

  private static final int prec = 128;
  private static final int W     = 1280;
  private static final int H     = 720;

  private GraphicsContext  g;

  private double           t     = 0.0;
  private double           oldX  = W / 2, oldY = H / 2;

  private boolean          start = true;

  private Parent createContent()
  {
    Pane root = new Pane();
    root.setPrefSize(W, H);

    Canvas canvas = new Canvas(W,
                               H);
    g = canvas.getGraphicsContext2D();
    g.setLineWidth(3);
    
    AnimationTimer timer = new AnimationTimer()
    {
      @Override
      public void handle(long now)
      {
        if (!start)
          return;

        for (int i = 0; i < 80; i++)
        {
          t += 0.01;
          draw();
        }
      }
    };
    timer.start();

    root.getChildren().add(canvas);
    return root;
  }

  private void draw()
  {
    Point2D p = curveFunction();

    g.setStroke(Color.BLACK);

    double newX = W / 2 + p.getX();
    double newY = H / 2 + p.getY();

    if (oldX != W / 2 && oldY != H / 2)
    {
      g.strokeLine(oldX, oldY, newX, newY);
      // g.strokeOval(newX, newY, 1, 1);
    }
    //

    oldX = newX;
    oldY = newY;
  }

  Lemniscate lemniscate = new Lemniscate();

  Real       realt      = new Real();

  Complex    z          = new Complex();

  private Point2D curveFunction()
  {
    lemniscate.evaluate(realt.set(t), 1, prec, z).mul(200, prec);

    return new Point2D(z.getReal().doubleValue(),
                       z.getImag().doubleValue());
  }

  private void saveScreenshot(Scene scene) throws IOException
  {
    WritableImage fxImage  = scene.snapshot(null);

    BufferedImage awtImage = SwingFXUtils.fromFXImage(fxImage, null);

    ImageIO.write(awtImage, "png", new File("screenshot.png"));

  }

  @Override
  public void start(Stage stage) throws Exception
  {
    Scene scene = new Scene(createContent());

    stage.setScene(scene);
    stage.show();
  }

  public static void main(String[] args)
  {
    launch(args);
  }

  @Override
  public void close() throws Exception
  {
    realt.close();
    z.close();
  }
}
