package arb.viz.gl;

import static org.lwjgl.opengl.GL11.*;

import lwjgui.LWJGUIApplication;
import lwjgui.paint.Color;
import lwjgui.scene.Scene;
import lwjgui.scene.Window;
import lwjgui.scene.control.Label;
import lwjgui.scene.control.Menu;
import lwjgui.scene.control.MenuBar;
import lwjgui.scene.control.MenuItem;
import lwjgui.scene.layout.BorderPane;

public class GearsDemo extends
                       LWJGUIApplication
{
  public static final int WIDTH  = 320;
  public static final int HEIGHT = 240;

  public static void main(String[] args)
  {

    ModernOpenGL = false;
    /* Flag to make the internal window to use deprecated openGL */
    /* We're using deprecated openGL in this example to keep it short. */
    /* This is needed for Mac users. Not needed for windows/Linux users. */
    /* Mac doesn't let you mix old/new openGL code together */

    launch(args);
  }

  @Override
  public void start(String[] args, Window window)
  {
    // Create a simple pane
    BorderPane root = new BorderPane();
    root.setBackgroundLegacy(null);

    // Top part of borderpane
    {
      // Create Menu Bar
      MenuBar bar = new MenuBar();
      root.setTop(bar);

      // Create File Menu
      Menu file = new Menu("File");
      file.getItems().add(new MenuItem("New"));
      file.getItems().add(new MenuItem("Open"));
      file.getItems().add(new MenuItem("Save"));
      bar.getItems().add(file);

      // Create Edit Menu
      Menu edit = new Menu("Edit");
      edit.getItems().add(new MenuItem("Undo"));
      edit.getItems().add(new MenuItem("Redo"));
      bar.getItems().add(edit);
    }

    // Add some text
    Label label = new Label("Hello World!");
    label.setTextFill(Color.WHITE);
    root.setCenter(label);

    // Set the scene
    window.setScene(new Scene(root,
                              WIDTH,
                              HEIGHT));
    window.show();

    // Start the gears application
    window.setRenderingCallback(new GearsRenderer(null));
  }
}