package arb.viz.gl.shaders;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.joml.Matrix4f;
import org.joml.Vector3f;
import org.lwjgl.opengl.GL11;
import org.lwjgl.opengl.GL20;

public abstract class ShaderProgram
{

  private int programID;
  private int vertexShaderID;
  private int fragmentShaderID;

  protected ShaderProgram(String vertexFile, String fragmentFile) throws IOException
  {
    vertexShaderID   = loadShader(vertexFile, GL20.GL_VERTEX_SHADER);
    fragmentShaderID = loadShader(fragmentFile, GL20.GL_FRAGMENT_SHADER);
    programID        = GL20.glCreateProgram();
    GL20.glAttachShader(programID, vertexShaderID);
    GL20.glAttachShader(programID, fragmentShaderID);
    bindAttributes();
    GL20.glLinkProgram(programID);
    GL20.glValidateProgram(programID);
    getAllUniformLocations();
  }

  protected abstract void getAllUniformLocations();

  protected int getUniformLocation(String uniformName)
  {
    return GL20.glGetUniformLocation(programID, uniformName);
  }

  /** Start working */
  public void start()
  {
    GL20.glUseProgram(programID);
  }

  /** Stop working */
  public void stop()
  {
    GL20.glUseProgram(0);
  }

  /** Remove data from memory */
  public void cleanUp()
  {
    stop();
    GL20.glDetachShader(programID, vertexShaderID);
    GL20.glDetachShader(programID, fragmentShaderID);
    GL20.glDeleteShader(vertexShaderID);
    GL20.glDeleteShader(fragmentShaderID);
    GL20.glDeleteProgram(programID);
  }

  protected abstract void bindAttributes();

  protected void bindAttribute(int attribute, String variableName)
  {
    GL20.glBindAttribLocation(programID, attribute, variableName);
  }

  protected void loadFloat(int location, float value)
  {
    GL20.glUniform1f(location, value);
  }

  protected void loadVector(int location, Vector3f vector)
  {
    GL20.glUniform3f(location, vector.x, vector.y, vector.z);
  }

  protected void loadBoolean(int location, boolean value)
  {
    float toLoad = 0;
    if (value)
    {
      toLoad = 1;
    }
    GL20.glUniform1f(location, toLoad);
  }

  protected void loadMatrix(int location, Matrix4f matrix)
  {
    float[] mb = new float[16];
    matrix.get(mb);
    GL20.glUniformMatrix4fv(location, false, mb);

//		matrix.get(matrixBuffer);
//		matrixBuffer.flip();
//		GL20.glUniformMatrix4fv(location, false, matrixBuffer);

    // GLES20.glUniformMatrix4fv(location, false, matrixBuffer);

//		matrix.store(matrixBuffer);
//		matrixBuffer.flip();
//		GL20.glUniformMatrix4(location, false, matrixBuffer);
  }

  private static int loadShader(String file, int type) throws IOException
  {
    StringBuilder shaderSource = new StringBuilder();
    try ( BufferedReader reader = new BufferedReader(new FileReader(file)))
    {
      String line;
      while ((line = reader.readLine()) != null)
      {
        shaderSource.append(line).append("//\n");
      }
    }
   
    int shaderID = GL20.glCreateShader(type);

    GL20.glShaderSource(shaderID, shaderSource);
    GL20.glCompileShader(shaderID);
    if (GL20.glGetShaderi(shaderID, GL20.GL_COMPILE_STATUS) == GL11.GL_FALSE)
    {
      System.out.println(GL20.glGetShaderInfoLog(shaderID, 500));
      System.err.println("Could not compile shader " + file);
      System.exit(-1);
    }

//		int[] compiled = new int[1];
//		GLES20.glGetShaderiv(shaderID, GLES20.GL_COMPILE_STATUS, compiled);
//
//		if (compiled[0] == 0) {
//			System.out.println("Could not compile shader " + type + ":");
//			System.out.println(GLES20.glGetShaderInfoLog(shaderID));
//			GLES20.glDeleteShader(shaderID);
//			shaderID = 0;
//		}

//		if(GL20.glGetShader(shaderID, GL20.GL_COMPILE_STATUS) == GL11.GL_FALSE){
//			System.out.println(GL20.glGetShaderInfoLog(shaderID, 500));
//			System.err.println("Could not compile shader!");
//			System.exit(-1);
//		}

    return shaderID;
  }

}