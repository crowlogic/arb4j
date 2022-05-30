package arb.viz;

import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

/*
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j
 * 
 * Arb4j is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License (LGPL) as published by the
 * Free Software Foundation; either version 2.1 of the License, or (at your
 * option) any later version. See <http://www.gnu.org/licenses/>.
 * 
 * TODO: add keys to increase and decrease the font size
 */
public class KeyboardHandler implements
                             KeyListener
{

  private ComplexFunctionPlotter plotter;

  public KeyboardHandler(ComplexFunctionPlotter abstractComplexFunctionPlotter)
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

    case KeyEvent.VK_ESCAPE:
      System.exit(1);
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
    case Real:
      displayMode = DisplayMode.Imaginary;
    case Imaginary:
      displayMode = DisplayMode.Composite;
    case Composite:
      displayMode = DisplayMode.Phase;
    }

  }

  @Override
  public void keyReleased(KeyEvent e)
  {

  }

}
