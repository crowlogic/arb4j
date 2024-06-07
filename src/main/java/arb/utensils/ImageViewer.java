package arb.utensils;

import java.awt.BorderLayout;
import java.awt.Dimension;
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

  private static final long serialVersionUID = 1L;

  public ImageViewer(String formula, BufferedImage image)
  {
    setTitle(formula);
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

  }

}