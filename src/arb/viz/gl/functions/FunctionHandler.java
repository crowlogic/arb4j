package arb.viz.gl.functions;

import java.util.ArrayDeque;
import java.util.ArrayList;

import org.joml.Vector3f;

import arb.viz.SurfacePlotController;
import arb.viz.gl.Loader;
import arb.viz.gl.entities.Curve;
import arb.viz.gl.entities.Vector;
import arb.viz.gl.models.RawModel;
import arb.viz.gl.models.TexturedModel;

/** A class that processes functions */
public class FunctionHandler
{

  /**
   * Get vertices by two argument vector function
   * 
   * @param f     two argument vector function
   * @param gap1  function setting interval by the first argument
   * @param gap2  function setting interval by the second argument
   * @param step1 thickness of grid by the first argument
   * @param step2 thickness of grid by the second argument
   * @return array of vertices to set a surface
   */
  public static float[] getVertices(BivariateVectorFunction f, float[] gap1, float[] gap2, float step1, float step2)
  {
    int     xSteps   = (int) ((gap1[1] - gap1[0]) / step1) + 1;
    int     ySteps   = (int) ((gap2[1] - gap2[0]) / step2) + 1;
    int     points   = xSteps * ySteps;
    float[] vertices = new float[points * 3];
    float   x        = gap1[0];
    float   y        = gap2[0];
    for (int j = 0; j < ySteps; j++)
    {
      for (int i = 0; i < xSteps; i++)
      {
        double[] coords = f.calc(x, y);
        vertices[3 * (j * xSteps + i)]      = (float) coords[0];
        vertices[3 * (j * xSteps + i) + 1]  = (float) coords[1];
        vertices[3 * (j * xSteps + i) + 2]  = (float) coords[2];
        x                                  += step1;
      }
      x  = gap1[0];
      y += step2;
    }
    return vertices;
  }

  /**
   * Generate indices to optimize vertices loading
   * 
   * @param gap1  function setting interval by the first argument
   * @param gap2  function setting interval by the second argument
   * @param step1 thickness of grid by the first argument
   * @param step2 thickness of grid by the second argument
   * @return array of indices
   */
  public static int[] getIndices(float[] gap1, float[] gap2, float step1, float step2)
  {
    int   xSteps  = (int) ((gap1[1] - gap1[0]) / step1) + 1;
    int   ySteps  = (int) ((gap2[1] - gap2[0]) / step2) + 1;
    assert xSteps > 0;
    assert ySteps > 0;    
    int[] indices = new int[(xSteps - 1) * (ySteps - 1) * 6];
    for (int j = 0; j < ySteps - 1; j++)
    {
      for (int i = 0; i < xSteps - 1; i++)
      {
        indices[6 * ((xSteps - 1) * j + i)]     = (j + 1) * xSteps + i;
        indices[6 * ((xSteps - 1) * j + i) + 1] = indices[6 * ((xSteps - 1) * j + i) + 3] = j * xSteps + i;
        indices[6 * ((xSteps - 1) * j + i) + 2] = indices[6 * ((xSteps - 1) * j + i) + 4] = (j + 1) * xSteps + i + 1;
        indices[6 * ((xSteps - 1) * j + i) + 5] = j * xSteps + i + 1;
      }
    }
    return indices;
  }

  /**
   * Get texture coordinates
   * 
   * @param gap1  function setting interval by the first argument
   * @param gap2  function setting interval by the second argument
   * @param step1 thickness of grid by the first argument
   * @param step2 thickness of grid by the second argument
   * @return texture coordinates
   */
  public static float[] getTextureCoords(float[] gap1, float[] gap2, float step1, float step2)
  {
    int     xSteps   = (int) ((gap1[1] - gap1[0]) / step1) + 1;
    int     ySteps   = (int) ((gap2[1] - gap2[0]) / step2) + 1;
    int     points   = xSteps * ySteps;
    float[] textures = new float[points * 2];
    float   x        = gap1[0];
    float   y        = gap2[0];
    for (int j = 0; j < ySteps; j++)
    {
      for (int i = 0; i < xSteps; i++)
      {
        textures[2 * (j * xSteps + i)]      = (x - gap1[0]) / (gap1[1] - gap1[0]);
        textures[2 * (j * xSteps + i) + 1]  = 1 - (y - gap2[0]) / (gap2[1] - gap2[0]);
        x                                  += step1;
      }
      x  = gap1[0];
      y += step2;
    }
    return textures;
  }

  /**
   * Get normals of two argument vector function
   * 
   * @param gap1  function setting interval by the first argument
   * @param gap2  function setting interval by the second argument
   * @param step1 thickness of grid by the first argument
   * @param step2 thickness of grid by the second argument
   * @return array of function normals
   */
  public static float[] getNormals(BivariateVectorFunction f, float[] gap1, float[] gap2, float step1, float step2)
  {
    int                     xSteps  = (int) ((gap1[1] - gap1[0]) / step1) + 1;
    int                     ySteps  = (int) ((gap2[1] - gap2[0]) / step2) + 1;
    int                     points  = xSteps * ySteps;
    float[]                 normals = new float[points * 3];
    float                   x       = gap1[0];
    float                   y       = gap2[0];
    BivariateVectorFunction normal  = f.getNormal();
    for (int j = 0; j < ySteps; j++)
    {
      for (int i = 0; i < xSteps; i++)
      {
        double[] coords = normal.calc(x, y);
        normals[3 * (j * xSteps + i)]      = (float) coords[0];
        normals[3 * (j * xSteps + i) + 1]  = (float) coords[1];
        normals[3 * (j * xSteps + i) + 2]  = (float) coords[2];
        x                                 += step1;
      }
      x  = gap1[0];
      y += step2;
    }
    return normals;
  }

  /**
   * Get vertices by vector function
   * 
   * @param f    vector function
   * @param gap  function setting interval
   * @param step thickness of fragmentation
   * @return array of vertices to set a curve
   */
  public static float[] getVertices(VectorFunction f, float[] gap, float step)
  {
    int     points   = (int) ((gap[1] - gap[0]) / step) + 1;
    float[] vertices = new float[points * 3];
    float   x        = gap[0];
    for (int i = 0; i < points; i++)
    {
      double[] coords = f.calc(x);
      vertices[3 * i]      = (float) coords[0];
      vertices[3 * i + 1]  = (float) coords[1];
      vertices[3 * i + 2]  = (float) coords[2];
      x                   += step;
    }
    return vertices;
  }

  /**
   * Get curve by function
   * 
   * @param f      function
   * @param gap    function setting interval
   * @param step   thickness of fragmentation
   * @param colour colour of the curve
   * @param loader loader to load model
   * @return created curve
   */
  public static Curve createCurve(Function f, float[] gap, float step, Vector3f colour, Loader loader)
  {
    ArrayDeque<String> x = new ArrayDeque<>();
    x.add("x");
    ArrayDeque<String> z = new ArrayDeque<>();
    z.add("0");
    ArrayList<ArrayDeque<String>> postfixes = new ArrayList<>();
    postfixes.add(x);
    postfixes.add(f.getPostfix());
    postfixes.add(z);
    VectorFunction newF = new VectorFunction(postfixes,
                                             "x");
    return createCurve(newF, gap, step, colour, loader);
  }

  /**
   * Get curve by vector function
   * 
   * @param f      vector function
   * @param gap    function setting interval
   * @param step   thickness of fragmentation
   * @param colour colour of the curve
   * @param loader loader to load model
   * @return created curve
   */
  public static Curve createCurve(VectorFunction f, float[] gap, float step, Vector3f colour, Loader loader)
  {
    RawModel      model         = loader.loadToVAO(getVertices(f, gap, step));
    TexturedModel texturedModel = new TexturedModel(model,
                                                    null);
    return new Curve(texturedModel,
                     new Vector3f(0,
                                  0,
                                  0),
                     0,
                     0,
                     0,
                     1,
                     colour,
                     f);
  }

  public static ArrayList<Curve> getGrid(BivariateVectorFunction f,
                                          float[] gap1,
                                          float[] gap2,
                                          float step1,
                                          float step2,
                                          Vector3f colour,
                                          Loader loader)
  {
    int              xSteps     = (int) ((gap1[1] - gap1[0]) / step1) + 1;
    int              ySteps     = (int) ((gap2[1] - gap2[0]) / step2) + 1;
    ArrayList<Curve> directions = new ArrayList<>();
    float            x          = gap1[0];
    for (int i = 0; i < xSteps; i++)
    {
      VectorFunction curveF = f.calcByFst(x);
      directions.add(FunctionHandler.createCurve(curveF, gap2, step2, colour, loader));
      x += step1;
    }
    float y = gap2[0];
    for (int i = 0; i < ySteps; i++)
    {
      VectorFunction curveF = f.calcBySnd(y);
      directions.add(FunctionHandler.createCurve(curveF, gap1, step1, colour, loader));
      y += step2;
    }
    return directions;
  }

  /**
   * Get vector by position and direction
   * 
   * @param position  position of the vector
   * @param direction direction of the vector
   * @param colour    colour of the vector
   * @param loader    loader to load model
   * @return created vector
   */
  public static Vector createVector(Vector3f position, Vector3f direction, Vector3f colour, Loader loader)
  {
    if (direction.x != 0 || direction.y != 0 || direction.z != 0)
    {
      direction.normalize();
    }
    Vector3f cameraPos = SurfacePlotController.getCamera().getPosition();
    Vector3f distance  = new Vector3f(cameraPos.x,
                                      cameraPos.y,
                                      cameraPos.z);
    distance.x -= position.x;
    distance.y -= position.y;
    distance.z -= position.z;
    float coef = distance.length() / 3;
    direction.x *= coef;
    direction.y *= coef;
    direction.z *= coef;
    RawModel      model         = loader.loadToVAO(new float[]
    { 0, 0, 0, direction.x, direction.y, direction.z });
    TexturedModel texturedModel = new TexturedModel(model,
                                                    null);
    return new Vector(texturedModel,
                      position,
                      0,
                      0,
                      0,
                      1,
                      direction,
                      colour);
  }
}