package arb.viz;

import java.util.Random;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

public abstract class ChartFXApplication extends
                                          Application
{
  protected static final Random RANDOM               = new Random(System.currentTimeMillis());
  protected static final double DEFAULT_SCENE_WIDTH  = 800;
  protected static final double DEFAULT_SCENE_HEIGTH = 800;
  protected double              sceneWidth;
  protected double              sceneHeight;

  public ChartFXApplication()
  {
    this(DEFAULT_SCENE_WIDTH,
         DEFAULT_SCENE_HEIGTH);
  }

  public ChartFXApplication(double sceneWidth, double sceneHeight)
  {
    this.sceneWidth  = sceneWidth;
    this.sceneHeight = sceneHeight;
  }

  abstract public Node getContent();

  @Override
  public void start(final Stage primaryStage)
  {
    final BorderPane root  = new BorderPane();
    final Scene      scene = new Scene(root,
                                       sceneWidth,
                                       sceneHeight);
    scene.getStylesheets().add("dark-theme.css");

    root.setCenter(getContent());
    primaryStage.setTitle(this.getClass().getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.setOnCloseRequest(evt -> Platform.exit());
    primaryStage.show();
  }

  /**
   * @param args the command line arguments
   */
  public static void main(final String[] args)
  {
    Application.launch(args);
  }
}
