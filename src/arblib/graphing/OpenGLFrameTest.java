package arblib.graphing;

import java.awt.BorderLayout;

import javax.swing.JFrame;

import org.lwjgl.opengl.awt.AWTGLCanvas;
import org.lwjgl.opengl.awt.GLData;

public class OpenGLFrameTest
{
  public static void main( String args[] )
  {
    JFrame frame = new JFrame("AWT test");
    frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    frame.setLayout(new BorderLayout());
    GLData data = new GLData();
    data.majorVersion = 3;
    data.minorVersion = 3;
    data.profile = GLData.Profile.CORE;
    data.samples = 4;
    frame.add(new AWTGLCanvas(data) {
      public void initGL() {
      }
      public void paintGL() {
      }
    });
    frame.setVisible(true);
  }
}
