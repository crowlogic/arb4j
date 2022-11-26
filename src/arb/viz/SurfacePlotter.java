package arb.viz;

import static org.lwjgl.glfw.Callbacks.glfwFreeCallbacks;
import static org.lwjgl.glfw.GLFW.GLFW_FALSE;
import static org.lwjgl.glfw.GLFW.GLFW_RESIZABLE;
import static org.lwjgl.glfw.GLFW.GLFW_TRUE;
import static org.lwjgl.glfw.GLFW.GLFW_VISIBLE;
import static org.lwjgl.glfw.GLFW.glfwDefaultWindowHints;
import static org.lwjgl.glfw.GLFW.glfwDestroyWindow;
import static org.lwjgl.glfw.GLFW.glfwInit;
import static org.lwjgl.glfw.GLFW.glfwPollEvents;
import static org.lwjgl.glfw.GLFW.glfwSetErrorCallback;
import static org.lwjgl.glfw.GLFW.glfwShowWindow;
import static org.lwjgl.glfw.GLFW.glfwSwapInterval;
import static org.lwjgl.glfw.GLFW.glfwTerminate;
import static org.lwjgl.glfw.GLFW.glfwWindowHint;
import static org.lwjgl.glfw.GLFW.glfwWindowShouldClose;
import static org.lwjgl.system.MemoryUtil.NULL;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.joml.Vector3f;
import org.lwjgl.glfw.GLFWErrorCallback;
import org.lwjgl.opengl.GL;

import arb.geometry.surfaces.ParametricSurface;
import arb.geometry.surfaces.Surface;
import arb.viz.gl.Display;
import arb.viz.gl.GuiController;
import arb.viz.gl.Renderer;
import arb.viz.gl.entities.Camera;
import arb.viz.gl.entities.Light;
import lwjgui.LWJGUI;
import lwjgui.LWJGUIUtil;
import lwjgui.scene.Window;
import lwjgui.scene.layout.StackPane;

/**
 * TODO: adapt this to render {@link Surface}s , {@link ParametricSurface}s etc
 * 
 * @author crow
 *
 */
public class SurfacePlotter
{

  private long          window;
  private Window        lwjguiWindow;

  private final Display display = new Display();

  public void run() throws IOException
  {
    init();
    loop();

    glfwFreeCallbacks(window);
    glfwDestroyWindow(window);

    glfwTerminate();
    glfwSetErrorCallback(null).free();
  }

  private void init()
  {
    GLFWErrorCallback.createPrint(System.err).set();

    if (!glfwInit())
      throw new IllegalStateException("Unable to initialize GLFW");

    glfwDefaultWindowHints();
    glfwWindowHint(GLFW_VISIBLE, GLFW_FALSE);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE);

    window = LWJGUIUtil.createOpenGLCoreWindow("Harry Plotter",
                                               display.getWidth(),
                                               display.getHeight(),
                                               false,
                                               false);
    if (window == NULL)
      throw new RuntimeException("Failed to create the GLFW window");

    lwjguiWindow = LWJGUI.initialize(window);

    glfwSwapInterval(1);
    glfwShowWindow(window);
  }

  private void loop() throws IOException
  {
    GL.createCapabilities();

    Controller.setCamera(new Camera());
    Renderer    renderer = new Renderer(display);

    List<Light> lights   = new ArrayList<>();
    lights.add(new Light(new Vector3f(0,
                                      -1,
                                      0),
                         new Vector3f(0.1f,
                                      0.1f,
                                      0.1f)));
    lights.add(new Light(new Vector3f(0.3f,
                                      0.5f,
                                      -1),
                         new Vector3f(0.4f,
                                      0.4f,
                                      0.4f)));
    lights.add(new Light(new Vector3f(-2.5f,
                                      1,
                                      1),
                         new Vector3f(0.7f,
                                      0.7f,
                                      0.7f)));
    lights.add(new Light(new Vector3f(1.5f,
                                      1,
                                      1),
                         new Vector3f(0.2f,
                                      0.2f,
                                      0.2f)));
    renderer.addLights(lights);

    GuiController.setWindowAndDisplay(lwjguiWindow, display);
    GuiController.setRenderer(renderer);

    StackPane root = new StackPane();
    root.getChildren().add(GuiController.createContent(display));
    lwjguiWindow.getScene().setRoot(root);
    lwjguiWindow.show();

    while (!glfwWindowShouldClose(window))
    {
      GuiController.update();
      Controller.update();

      glfwPollEvents();
      LWJGUI.render();
    }

    renderer.finish();
  }

  public static void main(String[] args) throws IOException
  {
    new SurfacePlotter().run();
  }

}
