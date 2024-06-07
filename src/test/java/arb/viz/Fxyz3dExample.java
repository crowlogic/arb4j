package arb.viz;

import java.util.function.BiFunction;
import java.util.function.Function;

import org.fxyz3d.scene.paint.Patterns.CarbonPatterns;
import org.fxyz3d.shapes.primitives.SurfacePlotMesh;
import org.fxyz3d.utils.CameraTransformer;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.geometry.Point2D;
import javafx.scene.Group;
import javafx.scene.PerspectiveCamera;
import javafx.scene.PointLight;
import javafx.scene.Scene;
import javafx.scene.SceneAntialiasing;
import javafx.scene.paint.Color;
import javafx.scene.shape.CullFace;
import javafx.scene.transform.Rotate;
import javafx.stage.Stage;
import javafx.util.Duration;

public class Fxyz3dExample extends
                           Application
{
  private final double a    = 1;
  private final double b    = 2;
  private final double c    = 1;
  private final int    m    = 2;
  private final int    n    = 1;

  private double       time = 0;

  private BiFunction<Double, Double, Double> functionGenerator(double time)
  {
    final double k = Math.PI * Math.sqrt(Math.pow(n / a, 2) + Math.pow(m / b, 2));
    return (pX, pY) ->
    {
      return Math.sin(n * Math.PI * pX / a) * Math.sin(m * Math.PI * pY / b) * Math.cos(c * k * time);
    };
  }

  private Function<Point2D, Number> generateFunction(double time)
  {
    return (Point2D p) ->
    {
      return functionGenerator(time).apply(p.getX(), p.getY());
    };
  }

  @Override
  public void start(Stage primaryStage)
  {
    Group             sceneRoot       = new Group();
    Scene             scene           = new Scene(sceneRoot,
                                                  800,
                                                  800,
                                                  true,
                                                  SceneAntialiasing.BALANCED);
    PerspectiveCamera camera          = new PerspectiveCamera(true);
    // setup camera transform for rotational support
    CameraTransformer cameraTransform = new CameraTransformer();
    cameraTransform.setTranslate(1, 0, -5);
    cameraTransform.getChildren().add(camera);
    // add a Point Light for better viewing of the grid coordinate system
    PointLight light = new PointLight(Color.WHITE);
    cameraTransform.getChildren().add(light);
    light.setTranslateX(camera.getTranslateX());
    light.setTranslateY(camera.getTranslateY());
    light.setTranslateZ(camera.getTranslateZ());
    scene.setCamera(camera);

    Group group = new Group();
    group.getChildren().add(cameraTransform);

    SurfacePlotMesh surface = new SurfacePlotMesh(generateFunction(0),
                                                  a,
                                                  b,
                                                  100,
                                                  100,
                                                  1);
    surface.getTransforms()
           .addAll(new Rotate(200,
                              Rotate.X_AXIS),
                   new Rotate(60,
                              Rotate.Y_AXIS));
    surface.setCullFace(CullFace.NONE);
    surface.setTextureModePattern(CarbonPatterns.LIGHT_CARBON, 1.0d);

    KeyFrame keyFrame = new KeyFrame(Duration.millis(50),
                                     (ActionEvent event) ->
                                     {
                                       surface.setFunction2D(generateFunction(time));
                                       time += 0.005;
                                     });
    Timeline timeLine = new Timeline(keyFrame);
    timeLine.setCycleCount(Timeline.INDEFINITE);
    timeLine.play();
    group.getChildren().addAll(surface);

    sceneRoot.getChildren().addAll(group);

    primaryStage.setTitle("Awesome Visualization");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  /**
   * @param args the command line arguments
   */
  public static void main(String[] args)
  {
    launch(args);
  }

}
