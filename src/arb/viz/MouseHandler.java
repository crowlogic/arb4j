package arb.viz;

import static java.lang.System.out;

import java.awt.event.*;
import java.awt.geom.Point2D.Double;
import java.awt.geom.Rectangle2D;

import arb.Complex;
import arb.utensils.Utilities;

public final class MouseHandler implements
                                MouseListener,
                                MouseMotionListener
{

  /**
   * 
   */
  private final ComplexFunctionRenderer plotter;

  /**
   * @param complexPlot
   */
  MouseHandler(ComplexFunctionRenderer complexPlot)
  {
    plotter = complexPlot;
  }

  @Override
  public void mouseClicked(MouseEvent e)
  {
    Double point = plotter.mapScreenToFunction(e.getPoint());
    try ( Complex clicked = new Complex())
    {
      clicked.set(point.x, point.y);
    }
  }

  @Override
  public void mouseDragged(MouseEvent e)
  {
    Double point = plotter.mapScreenToFunction(e.getPoint());
    if (!plotter.selection)
    {
      startDragging(point);
    }
    // out.println( "Dragged to " + point );
    plotter.anythingChanged = true;

  }

  @Override
  public void mouseEntered(MouseEvent e)
  {
    plotter.anythingChanged = true;

  }

  @Override
  public void mouseExited(MouseEvent e)
  {
    plotter.anythingChanged = true;

    // plotter.cursorInFunctionSpace = null;
  }

  @Override
  public void mouseMoved(MouseEvent e)
  {
    synchronized (plotter)
    {
      try ( Complex t = Complex.newVector(2))
      {
        plotter.cursorInScreenSpace   = plotter.mapFunctionToScreen(e.getPoint());
        plotter.cursorInFunctionSpace = plotter.mapScreenToFunction(e.getPoint());
        t.getReal().set(plotter.cursorInFunctionSpace.x);
        t.getImag().set(plotter.cursorInFunctionSpace.y);
        plotter.mouseMoved(t);
      }
      catch (Exception ex)
      {
        ex.printStackTrace(System.err);
      }
    }
  }

  @Override
  public void mousePressed(MouseEvent e)
  {
    Double point = plotter.mapScreenToFunction(e.getPoint());
    out.println("pressed " + point);
    plotter.anythingChanged = true;

  }

  @Override
  public void mouseReleased(MouseEvent e)
  {
    Double point = plotter.mapScreenToFunction(e.getPoint());
    out.println("released " + point);
    if (plotter.selection)
    {
      stopDragging(point);
    }
    plotter.anythingChanged = true;

  }

  private void startDragging(Double point)
  {
    assert !plotter.selection : "already dragging";
    plotter.selection       = true;
    // out.println("started dragging at " + point );
    plotter.anythingChanged = true;

  }

  private void stopDragging(Double point)
  {
    assert plotter.selection : "not dragging yet therefore cannot stop";
    plotter.selection = false;
    // out.println("stopped dragging at " + point );

  }

}