package arb.viz;

import static org.lwjgl.glfw.GLFW.GLFW_KEY_LEFT_SHIFT;

import arb.viz.gl.entities.Camera;
import lwjgui.scene.layout.OpenGLPane;

/** A class describing tools that handle input signals */
public class SurfacePlotController
{

  private static Camera camera;

  /**
   * Initialize with certain pane
   * 
   * @param pane the pane in which initialization is required
   */
  public static void initialize(OpenGLPane pane)
  {
    Mouse.initialize(pane);
    Keyboard.initialize(pane);
  }

  /**
   * Set camera to handle
   * 
   * @param newCamera new camera to handle
   */
  public static void setCamera(Camera newCamera)
  {
    camera = newCamera;
  }

  /**
   * Get camera that is handling
   * 
   * @return camera that is handling
   */
  public static Camera getCamera()
  {
    return camera;
  }

  /**
   * Handle recent actions
   */
  public static void update()
  {
    float speed = 1;
    if (Keyboard.isKeyDown(GLFW_KEY_LEFT_SHIFT))
    {
      speed = 1.5f;
    }
    float zoom = (float) Mouse.getDYWheel();
    camera.calcZoom(speed, zoom);
    camera.move();

    if (Mouse.isButtonDown(2))
    {
      camera.resetLookAt();
    }

    Mouse.cleanUp();
  }
}