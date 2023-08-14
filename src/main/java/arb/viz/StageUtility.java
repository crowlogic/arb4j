package arb.viz;

import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

public class StageUtility
{
  private static Stage primaryStage;

  public static void createStage()
  {
    Platform.setImplicitExit(false);
    Platform.runLater(() ->
    {
      primaryStage = new Stage();
      primaryStage.setOnCloseRequest(event ->
      {
        // Perform any cleanup or custom logic before closing the stage
        // ...
      });
    });
  }

  public static void setScene(Pane root, double width, double height)
  {
    Platform.runLater(() ->
    {
      Scene scene = new Scene(root,
                              width,
                              height);
      primaryStage.setScene(scene);
      primaryStage.show();
    });
  }

  public static void closeStage()
  {
    Platform.runLater(() ->
    {
      primaryStage.fireEvent(new WindowEvent(primaryStage,
                                             WindowEvent.WINDOW_CLOSE_REQUEST));
    });
  }
}
