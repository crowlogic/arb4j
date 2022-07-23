package arb.viz;

import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.IOException;

/**
 *
 * 
 * @author crow
 *
 */
public class KeyboardHandler implements
                             KeyListener
{

  private ComplexFunctionRenderer plotter;

  public KeyboardHandler(ComplexFunctionRenderer abstractComplexFunctionPlotter)
  {
    this.plotter = abstractComplexFunctionPlotter;
  }

  @Override
  public void keyTyped(KeyEvent e)
  {

  }

  public void toggleCursorColor()
  {
    plotter.cursorColor = plotter.cursorColor == Color.BLACK ? Color.WHITE : Color.BLACK;
  }

  @Override
  public void keyPressed(KeyEvent e)
  {
    plotter.anythingChanged = true;
    switch (e.getKeyCode())
    {
    case KeyEvent.VK_S:
      try
      {
        plotter.saveToFile();
      }
      catch (IOException e1)
      {
        e1.printStackTrace();
      }
      break;
    case KeyEvent.VK_F1:
      plotter.toggleShowHelp();
      break;
    case KeyEvent.VK_F2:
      toggleCursorColor();
      break;
    case KeyEvent.VK_F3:
      toggleDisplay();
      break;
    case KeyEvent.VK_Z:
      plotter.enterZoomSelectionMode();
      break;
    case KeyEvent.VK_R:
      plotter.switchDisplayModeTo(Part.Real);
      break;
    case KeyEvent.VK_I:
      plotter.switchDisplayModeTo(Part.Imag);
      break;
    case KeyEvent.VK_P:
      plotter.switchDisplayModeTo(Part.Phase);
      break;
    case KeyEvent.VK_B:
      plotter.switchDisplayModeTo(Part.Blend);
      break;
    case KeyEvent.VK_ESCAPE:      
      plotter.hide();      
      plotter.close();

      System.out.println( "Halting in 1 second...");
      System.out.flush();
      try
      {
        Thread.sleep(1000);
      }
      catch (InterruptedException e1)
      {
        // TODO Auto-generated catch block
        e1.printStackTrace();
      }
      System.out.println( "Halting ...");
      System.out.flush();

      Runtime.getRuntime().halt(1);
      System.out.println( "Halted...");
      System.out.flush();
      break;
    default:
      System.out.println(e);
    }
  }

  enum DisplayMode
  {
   Phase,
   Real,
   Imaginary,
   Composite
  };

  DisplayMode displayMode = DisplayMode.Phase;

  public void toggleDisplay()
  {
    switch (displayMode)
    {
    case Phase:
      displayMode = DisplayMode.Real;
      break;
    case Real:
      displayMode = DisplayMode.Imaginary;
      break;
    case Imaginary:
      displayMode = DisplayMode.Composite;
      break;
    case Composite:
      displayMode = DisplayMode.Phase;
      break;
    }

  }

  @Override
  public void keyReleased(KeyEvent e)
  {

  }

}
