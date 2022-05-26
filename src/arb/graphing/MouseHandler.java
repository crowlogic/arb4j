package arb.graphing;

import static java.lang.System.out;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.Point2D.Double;
import java.awt.geom.Rectangle2D;

import arb.Complex;

public final class MouseHandler implements
                                MouseListener,
                                MouseMotionListener
{
  Complex                              t;

  Complex                              Z;

  Complex                              Y;

  /**
   * 
   */
  private final ComplexFunctionPlotter plotter;

  /**
   * @param complexPlot
   */
  MouseHandler(ComplexFunctionPlotter complexPlot)
  {
    plotter = complexPlot;
    Z       = Complex.newVector(2);
    Y       = Complex.newVector(2);
    t       = Complex.newVector(1);
  }

  public java.awt.geom.Rectangle2D.Double getSelectedRectangle()
  {
    return new Rectangle2D.Double(plotter.selectionStartPoint.x,
                                  plotter.selectionStartPoint.y,
                                  plotter.selectionStopPoint.x - plotter.selectionStartPoint.x,
                                  plotter.selectionStopPoint.y - plotter.selectionStartPoint.y);
  }

  @Override
  public void mouseClicked(MouseEvent e)
  {
    Double point = plotter.mapScreenToFunction(e.getPoint());
    try ( Complex clicked = new Complex())
    {
      clicked.set(point.x, point.y);
      if (plotter.mode == Mode.Default)
      {
        plotter.trajectory      = plotter.calculateNewtonTrajectory(clicked, 25);
        plotter.anythingChanged = true;
      }
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
    plotter.selectionStopPoint = point;
    // out.println( "Dragged to " + point );
    plotter.anythingChanged    = true;

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
      try
      {
        plotter.cursorInScreenSpace   = plotter.mapFunctionToScreen(e.getPoint());
        plotter.cursorInFunctionSpace = plotter.mapScreenToFunction(e.getPoint());
        t.getReal().assign(plotter.cursorInFunctionSpace.x);
        t.getImag().assign(plotter.cursorInFunctionSpace.y);
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
    plotter.selection           = true;
    plotter.selectionStartPoint = point;
    // out.println("started dragging at " + point );
    plotter.anythingChanged     = true;

  }

  private void stopDragging(Double point)
  {
    assert plotter.selection : "not dragging yet therefore cannot stop";
    plotter.selection          = false;
    plotter.selectionStopPoint = point;
    // out.println("stopped dragging at " + point );
    Rectangle2D.Double domain = getSelectedRectangle();
    plotter.zoomTo(domain);
    plotter.anythingChanged = true;

  }

}