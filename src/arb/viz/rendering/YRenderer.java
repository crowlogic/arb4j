package arb.viz.rendering;

import java.awt.*;
import java.awt.geom.*;
import java.io.*;

import arb.*;
import arb.functions.complex.*;
import arb.functions.complex.dynamics.*;
import arb.viz.*;

/**
 * Renders the {@link YFunction} 
 */
public class YRenderer extends
                      ComplexFunctionRenderer<NewtonFlow<YFunction>>
{
  @SuppressWarnings("resource")
  public static void main( String args[] ) throws NoninvertibleTransformException, IOException
  {
     YRenderer renderer = new YRenderer( );
     renderer.render();
  }
  
  public static final int width  = 1900 /2 ;
  public static final int height = 950 /2 ;

  public YRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -22,
                                 45,
                                 44),
          new NewtonFlow<YFunction>(new YFunction(vscale)));

    colorMode  = 5;
    displayMode = Part.Real;

  }

  public YRenderer() throws NoninvertibleTransformException
  {
    this(new Real("3",128));
  }

}