package arb.viz.gl;

import static org.lwjgl.opengl.GL11.GL_TEXTURE_2D;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.joml.Matrix4f;
import org.joml.Vector3f;
import org.lwjgl.opengl.GL11;
import org.lwjgl.opengl.GL13;
import org.lwjgl.opengl.GL20;
import org.lwjgl.opengl.GL30;

import arb.utensils.Transformations;
import arb.viz.Controller;
import arb.viz.gl.entities.Curve;
import arb.viz.gl.entities.Entity;
import arb.viz.gl.entities.Light;
import arb.viz.gl.entities.Surface;
import arb.viz.gl.entities.Vector;
import arb.viz.gl.functions.FunctionHandler;
import arb.viz.gl.models.ModelTexture;
import arb.viz.gl.models.RawModel;
import arb.viz.gl.models.TexturedModel;
import arb.viz.gl.shaders.StaticShader;
import lwjgui.scene.Context;

/** A class describing smart renderer */
@SuppressWarnings("serial")
public class Renderer implements
                      lwjgui.gl.Renderer
{

  private StaticShader        shader;
  private static Loader       loader   = new Loader();
  private static final Vector zAxis    = FunctionHandler.createVector(new Vector3f(0,
                                                                                   0,
                                                                                   0),
                                                                      new Vector3f(0,
                                                                                   0,
                                                                                   1),
                                                                      new Vector3f(1,
                                                                                   1,
                                                                                   1),
                                                                      loader);
  private static final Vector yAxis    = FunctionHandler.createVector(new Vector3f(0,
                                                                                   0,
                                                                                   0),
                                                                      new Vector3f(0,
                                                                                   1,
                                                                                   0),
                                                                      new Vector3f(1,
                                                                                   1,
                                                                                   1),
                                                                      loader);
  private static final Vector xAxis    = FunctionHandler.createVector(new Vector3f(0,
                                                                                   0,
                                                                                   0),
                                                                      new Vector3f(1,
                                                                                   0,
                                                                                   0),
                                                                      new Vector3f(1,
                                                                                   1,
                                                                                   1),
                                                                      loader);

  private ArrayList<Surface>  surfaces = new ArrayList<>();
  private ArrayList<Curve>    curves   = new ArrayList<>();
  private ArrayList<Vector>   vectors  = new ArrayList<>();
  private ArrayList<Vector>   axis     = new ArrayList<Vector>()
                                       {
                                         {
                                           add(xAxis);
                                           add(yAxis);
                                           add(zAxis);
                                         }
                                       };
  private List<Light>         lights   = new ArrayList<>();
  static final float          FOV      = 70;

  /**
   * Get loader
   * 
   * @return loader
   */
  public static Loader getLoader()
  {
    return loader;
  }

  /**
   * Put surfaces to render
   * 
   * @param surfaces surfaces to render
   */
  public void putSurfaces(ArrayList<Surface> surfaces)
  {
    this.surfaces = surfaces;
  }

  /**
   * Put curves to render
   * 
   * @param curves curves to render
   */
  public void putCurves(ArrayList<Curve> curves)
  {
    this.curves = curves;
  }

  /**
   * Put vectors to render
   * 
   * @param vectors vectors to render
   */
  public void putVectors(ArrayList<Vector> vectors)
  {
    this.vectors = vectors;
  }

  /**
   * Put lights to render
   * 
   * @param lights lights to render
   */
  public void putLights(List<Light> lights)
  {
    this.lights = lights;
  }

  /**
   * Add a surface to render
   * 
   * @param surface surface to render
   */
  public void add(Surface surface)
  {
    surfaces.add(surface);
  }

  /**
   * Add a curve to render
   * 
   * @param curve curve to render
   */
  public void add(Curve curve)
  {
    curves.add(curve);
  }

  /**
   * Add a vector to render
   * 
   * @param vector vector to render
   */
  public void add(Vector vector)
  {
    vectors.add(vector);
  }

  /**
   * Add a light to render
   * 
   * @param light light to render
   */
  public void add(Light light)
  {
    lights.add(light);
  }

  /**
   * Add surfaces to render
   * 
   * @param surfaces surfaces to render
   */
  public void addSurfaces(ArrayList<Surface> surfaces)
  {
    this.surfaces.addAll(surfaces);
  }

  /**
   * Add curves to render
   * 
   * @param curves curves to render
   */
  public void addCurves(ArrayList<Curve> curves)
  {
    this.curves.addAll(curves);
  }

  /**
   * Add vectors to render
   * 
   * @param vectors vectors to render
   */
  public void addVectors(ArrayList<Vector> vectors)
  {
    this.vectors.addAll(vectors);
  }

  /**
   * Add lights to render
   * 
   * @param lights lights to render
   */
  public void addLights(List<Light> lights)
  {
    this.lights.addAll(lights);
  }

  /**
   * Remove surface from rendering
   * 
   * @param surface surface to remove
   */
  public void remove(Surface surface)
  {
    surfaces.remove(surface);
  }

  /**
   * Remove curve from rendering
   * 
   * @param curve curve to remove
   */
  public void remove(Curve curve)
  {
    curves.remove(curve);
  }

  /**
   * Remove vector from rendering
   * 
   * @param vector vector to remove
   */
  public void remove(Vector vector)
  {
    vectors.remove(vector);
  }

  /**
   * Remove light from rendering
   * 
   * @param light light to remove
   */
  public void remove(Light light)
  {
    lights.remove(light);
  }

  /**
   * Remove surfaces from rendering
   * 
   * @param surfaces surfaces to remove
   */
  public void removeSurfaces(ArrayList<Surface> surfaces)
  {
    this.surfaces.removeAll(surfaces);
  }

  /**
   * Remove curves from rendering
   * 
   * @param curves curves to remove
   */
  public void removeCurves(ArrayList<Curve> curves)
  {
    this.curves.removeAll(curves);
  }

  /**
   * Remove vectors from rendering
   * 
   * @param vectors vectors to remove
   */
  public void removeVectors(ArrayList<Vector> vectors)
  {
    this.vectors.removeAll(vectors);
  }

  /**
   * Remove lights from rendering
   * 
   * @param lights lights to remove
   */
  public void removeLights(ArrayList<Light> lights)
  {
    this.lights.removeAll(lights);
  }

  /** Finish working */
  public void finish()
  {
    loader.cleanUp();
    shader.cleanUp();
  }

  /** Remove all from rendering */
  public void cleanUp()
  {
    surfaces = new ArrayList<>();
    curves   = new ArrayList<>();
    vectors  = new ArrayList<>();
  }

  private ArrayList<Vector> updateVectors(ArrayList<Vector> vectors)
  {
    ArrayList<Vector> result = new ArrayList<>();
    for (Vector vector : vectors)
    {
      result.add(FunctionHandler.createVector(vector.getPosition(),
                                              vector.getDirection(),
                                              vector.getColour(),
                                              loader));
    }
    return result;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public void render(Context context)
  {
    vectors = updateVectors(vectors);
    axis    = updateVectors(axis);

    prepare();
    shader.start();
    shader.loadLights(lights);
    shader.loadViewMatrix(Controller.getCamera());
    renderSurfaces(surfaces, shader);
    renderCurves(curves, shader);
    renderVectors(vectors, shader);
    renderVectors(axis, shader);
    shader.stop();
  }

  private static final float NEAR_PLANE = 0.1f;
  private static final float FAR_PLANE  = 1000;

  private Matrix4f           projectionMatrix;

  public Renderer( Display display ) throws IOException
  {
    shader = new StaticShader();
    createProjectionMatrix( display );
    shader.start();
    shader.loadProjectionMatrix(projectionMatrix);
    shader.stop();
  }

  /** Prepare to rendering */
  public void prepare()
  {
    GL11.glEnable(GL_TEXTURE_2D);
    GL11.glEnable(GL11.GL_DEPTH_TEST);
    GL11.glClearColor(0.0f, 0.0f, 0.0f, 1);
    GL11.glClear(GL11.GL_COLOR_BUFFER_BIT | GL11.GL_DEPTH_BUFFER_BIT);
  }

  /**
   * Render surfaces with shader
   * 
   * @param surfaces surfaces to render
   * @param shader   shader to render with
   */
  public void renderSurfaces(List<Surface> surfaces, StaticShader shader)
  {
    for (Surface surface : surfaces)
    {
      render(surface, shader);
    }
  }

  /**
   * Render curves with shader
   * 
   * @param curves curves to render
   * @param shader shader to render with
   */
  public void renderCurves(List<Curve> curves, StaticShader shader)
  {
    for (Curve curve : curves)
    {
      render(curve, shader);
    }
  }

  /**
   * Render vectors with shader
   * 
   * @param vectors vectors to render
   * @param shader  shader to render with
   */
  public void renderVectors(List<Vector> vectors, StaticShader shader)
  {
    for (Vector vector : vectors)
    {
      render(vector, shader);
    }
  }

  /**
   * Render a vector with shader
   * 
   * @param vector vector to render
   * @param shader shader to render with
   */
  public void render(Vector vector, StaticShader shader)
  {
    TexturedModel model    = vector.getModel();
    RawModel      rawModel = model.getRawModel();
    GL30.glBindVertexArray(rawModel.getVaoID());
    GL20.glEnableVertexAttribArray(0);
    // GL20.glEnableVertexAttribArray(1);
    // GL20.glEnableVertexAttribArray(2);
    Matrix4f transformationMatrix = Transformations.createTransformationMatrix(vector.getPosition(),
                                                                     vector.getRotX(),
                                                                     vector.getRotY(),
                                                                     vector.getRotZ(),
                                                                     vector.getScale());
    shader.loadTransformationMatrix(transformationMatrix);
    shader.loadColour(vector.getColour());
    // ModelTexture texture = model.getTexture();
    // shader.loadShineVariables(texture.getShineDamper(),
    // texture.getReflectivity());
    // GL13.glActiveTexture(GL13.GL_TEXTURE0);
    // GL11.glBindTexture(GL11.GL_TEXTURE_2D, model.getTexture().getID());
    // GL11.glTexParameteri(GL11.GL_TEXTURE_2D, GL11.GL_TEXTURE_MAG_FILTER,
    // GL11.GL_NEAREST);
    GL11.glDrawArrays(GL11.GL_LINES, 0, rawModel.getVertexCount());
    GL20.glDisableVertexAttribArray(0);
    // GL20.glDisableVertexAttribArray(1);
    // GL20.glDisableVertexAttribArray(2);
    GL30.glBindVertexArray(0);
  }

  /**
   * Render a curve with shader
   * 
   * @param curve  curve to render
   * @param shader shader to render with
   */
  public void render(Curve curve, StaticShader shader)
  {
    TexturedModel model    = curve.getModel();
    RawModel      rawModel = model.getRawModel();
    GL30.glBindVertexArray(rawModel.getVaoID());
    GL20.glEnableVertexAttribArray(0);
    // GL20.glEnableVertexAttribArray(1);
    // GL20.glEnableVertexAttribArray(2);
    Matrix4f transformationMatrix = Transformations.createTransformationMatrix(curve.getPosition(),
                                                                     curve.getRotX(),
                                                                     curve.getRotY(),
                                                                     curve.getRotZ(),
                                                                     curve.getScale());
    shader.loadTransformationMatrix(transformationMatrix);
    shader.loadColour(curve.getColour());
    // ModelTexture texture = model.getTexture();
    // shader.loadShineVariables(texture.getShineDamper(),
    // texture.getReflectivity());
    // GL13.glActiveTexture(GL13.GL_TEXTURE0);
    // GL11.glBindTexture(GL11.GL_TEXTURE_2D, model.getTexture().getID());
    // GL11.glTexParameteri(GL11.GL_TEXTURE_2D, GL11.GL_TEXTURE_MAG_FILTER,
    // GL11.GL_NEAREST);
    // GL11.glLineWidth(5);
    GL11.glDrawArrays(GL11.GL_LINE_STRIP, 0, rawModel.getVertexCount());
    GL20.glDisableVertexAttribArray(0);
    // GL20.glDisableVertexAttribArray(1);
    // GL20.glDisableVertexAttribArray(2);
    GL30.glBindVertexArray(0);
  }

  /**
   * Render an entity with shader
   * 
   * @param entity entity to render
   * @param shader shader to render with
   */
  public void render(Entity entity, StaticShader shader)
  {
    TexturedModel model    = entity.getModel();
    RawModel      rawModel = model.getRawModel();
    GL30.glBindVertexArray(rawModel.getVaoID());
    GL20.glEnableVertexAttribArray(0);
    GL20.glEnableVertexAttribArray(1);
    GL20.glEnableVertexAttribArray(2);
    Matrix4f transformationMatrix = Transformations.createTransformationMatrix(entity.getPosition(),
                                                                     entity.getRotX(),
                                                                     entity.getRotY(),
                                                                     entity.getRotZ(),
                                                                     entity.getScale());
    shader.loadTransformationMatrix(transformationMatrix);
    shader.loadColour(entity.getColour());
    ModelTexture texture = model.getTexture();
    shader.loadShineVariables(texture.getShineDamper(), texture.getReflectivity());
    GL13.glActiveTexture(GL13.GL_TEXTURE0);
    GL11.glBindTexture(GL_TEXTURE_2D, model.getTexture().getID());
    GL11.glTexParameteri(GL_TEXTURE_2D, GL11.GL_TEXTURE_MAG_FILTER, GL11.GL_NEAREST);
    GL11.glDrawElements(GL11.GL_TRIANGLES, rawModel.getVertexCount(), GL11.GL_UNSIGNED_INT, 0);
    GL20.glDisableVertexAttribArray(0);
    GL20.glDisableVertexAttribArray(1);
    GL20.glDisableVertexAttribArray(2);
    GL30.glBindVertexArray(0);
  }

  private void createProjectionMatrix( Display display )
  {
    float aspectRatio    = display.getWidth() * (float) display.getRenderPart() / display.getHeight();
    float y_scale        = (float) ((1f / Math.tan(Math.toRadians(Renderer.FOV / 2f))) * aspectRatio);
    float x_scale        = y_scale / aspectRatio;
    float frustum_length = FAR_PLANE - NEAR_PLANE;

    projectionMatrix = new Matrix4f();
    projectionMatrix.set(0, 0, x_scale);
    projectionMatrix.set(1, 1, y_scale);
    projectionMatrix.set(2, 2, -((FAR_PLANE + NEAR_PLANE) / frustum_length));
    projectionMatrix.set(2, 3, -1);
    projectionMatrix.set(3, 2, -((2 * NEAR_PLANE * FAR_PLANE) / frustum_length));
    projectionMatrix.set(3, 3, 0);
  }

}
