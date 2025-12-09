package arb.utensils;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.image.BufferedImage;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * <pre>
 * jshell> showFormula("x^2\\frac{d^2y}{dx^2}+(2x+2)\\frac{dy}{dx}=n(n+1)y");
 * $1 ==> arb.utensils.ImageViewer[frame0,650,444,610x149,layout=java.awt.BorderLayout,title=x^2\frac{d^2y}{dx^2}+(2x+2)\frac{dy}{dx}=n(n+1)y,resizable,normal,defaultCloseOperation=HIDE_ON_CLOSE,rootPane=javax.swing.JRootPane[,5,25,610x112,layout=javax.swing.JRootPane$RootLayout,alignmentX=0.0,alignmentY=0.0,border=,flags=16777675,maximumSize=,minimumSize=,preferredSize=],rootPaneCheckingEnabled=true]
 * jshell>
 * 
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ImageViewer extends
                         JFrame
{

  @Override
  public String toString()
  {
    return String.format("ImageViewer[%s]", getTitle() );
  }

  private static final long serialVersionUID = 1L;

  public ImageViewer(String string,  BufferedImage image)
  {
    setTitle(string);
    setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);

    // Create a JLabel to display the image
    JLabel imageLabel = new JLabel(new ImageIcon(image));

    // Add the image label to the content pane
    add(imageLabel, BorderLayout.CENTER);

    // Set the preferred size based on the image dimensions
    setPreferredSize(new Dimension(image.getWidth() + 20,
                                   image.getHeight() + 40));
    pack();
    setLocationRelativeTo(null); // Center the window on the screen

    // Add a KeyListener to detect Escape key press
    addKeyListener(new KeyListener()
    {
      @Override
      public void keyTyped(KeyEvent e)
      {
      }

      @Override
      public void keyPressed(KeyEvent e)
      {
        if (e.getKeyCode() == KeyEvent.VK_ESCAPE)
        {
          dispose(); // Close only this window when Escape is pressed
        }
      }

      @Override
      public void keyReleased(KeyEvent e)
      {
      }
    });

    // Ensure focus is on the JFrame so it can detect key presses
    setFocusable(true);
    requestFocusInWindow();
  }
}
