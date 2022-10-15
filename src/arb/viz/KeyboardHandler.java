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
      cycleDisplayMode();
      break;
    case KeyEvent.VK_Z:
      plotter.enterZoomSelectionMode();
      break;
    case KeyEvent.VK_R:
      plotter.switchToDisplayMode(Part.Real);
      break;
    case KeyEvent.VK_I:
      plotter.switchToDisplayMode(Part.Imaginary);
      break;
    case KeyEvent.VK_P:
      plotter.switchToDisplayMode(Part.Phase);
      break;
    case KeyEvent.VK_B:
      plotter.switchToDisplayMode(Part.Blend);
      break;
    case KeyEvent.VK_1:
      plotter.switchToColorMode(0);
      break;
    case KeyEvent.VK_2:
      plotter.switchToColorMode(1);
      break;
    case KeyEvent.VK_3:
      plotter.switchToColorMode(2);
      break;
    case KeyEvent.VK_4:
      plotter.switchToColorMode(3);
      break;
    case KeyEvent.VK_5:
      plotter.switchToColorMode(4);
      break;
    case KeyEvent.VK_6:
      plotter.switchToColorMode(5);
      break;
    case KeyEvent.VK_7:
      plotter.switchToColorMode(6);
      break;

    case KeyEvent.VK_ESCAPE:
      plotter.hide();
      plotter.close();

      System.out.println("Halting in 1 second...");
      System.out.flush();
      try
      {
        Thread.sleep(1000);
      }
      catch (InterruptedException e1)
      {
        e1.printStackTrace();
      }
      System.out.println("Halting ...");
      System.out.flush();

      Runtime.getRuntime().halt(1);
      System.out.println("Halted...");
      System.out.flush();
      break;
    default:
      System.out.println(e);
    }
  }

  public void cycleDisplayMode()
  {
    switch (plotter.displayMode)
    {
    case Phase:
      plotter.switchToDisplayMode(Part.Real);
      break;
    case Real:
      plotter.switchToDisplayMode(Part.Imaginary);
      break;
    case Imaginary:
      plotter.switchToDisplayMode(Part.Blend);
      break;
    case Blend:
      plotter.switchToDisplayMode(Part.Phase);
      break;
    }
  }

  @Override
  public void keyReleased(KeyEvent e)
  {

  }

}
