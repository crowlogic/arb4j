package arb.viz;

import org.fxyz3d.shapes.primitives.SurfacePlotMesh;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.application.Application;
import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.scene.Group;
import javafx.scene.PerspectiveCamera;
import javafx.scene.Scene;
import javafx.scene.input.ScrollEvent;
import javafx.scene.shape.CullFace;
import javafx.scene.shape.DrawMode;
import javafx.scene.transform.Rotate;
import javafx.stage.Stage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SurfacePlotExample extends
                                Application
{

  private double               anchorX, anchorY;
  private double               anchorAngleX = 0;
  private double               anchorAngleY = 0;
  private final DoubleProperty angleX       = new SimpleDoubleProperty(0);
  private final DoubleProperty angleY       = new SimpleDoubleProperty(0);

  @Override
  public void start(Stage primaryStage)
  {
    SurfacePlotMesh mesh = new SurfacePlotMesh();
    mesh.setFunction2D(p -> Math.tanh(Math.log(1 + Math.abs(p.getX()) * Math.abs(p.getY()))));
    mesh.setDrawMode(DrawMode.FILL);
    mesh.setCullFace(CullFace.NONE);
    mesh.setTextureModeVertices3D(1530, p -> p.f);
    mesh.setRangeX(10);
    mesh.setRangeY(10);

    Group             group  = new Group(mesh);
    Scene             scene  = new Scene(group,
                                         500,
                                         500);

    PerspectiveCamera camera = new PerspectiveCamera(true);
    camera.setTranslateZ(-30);

    scene.setCamera(camera);

    setUpMouseControl(group, scene, primaryStage);

    primaryStage.setTitle("Surface Plot Example");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  private void setUpMouseControl(Group group, Scene scene, Stage stage)
  {
    Rotate xRotate = new Rotate(0,
                                Rotate.X_AXIS);
    Rotate yRotate = new Rotate(0,
                                Rotate.Y_AXIS);
    group.getTransforms().addAll(xRotate, yRotate);

    xRotate.angleProperty().bind(angleX);
    yRotate.angleProperty().bind(angleY);

    scene.setOnMousePressed(event ->
    {
      anchorX      = event.getSceneX();
      anchorY      = event.getSceneY();
      anchorAngleX = angleX.get();
      anchorAngleY = angleY.get();
    });

    scene.setOnMouseDragged(event ->
    {
      angleX.set(anchorAngleX - (anchorY - event.getSceneY()));
      angleY.set(anchorAngleY + anchorX - event.getSceneX());
    });

    scene.addEventHandler(ScrollEvent.SCROLL, event ->
    {
      double delta = event.getDeltaY() * 0.1;
      group.translateZProperty().set(group.getTranslateZ() + delta);
    });
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
