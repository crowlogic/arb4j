package arb.viz.rendering;

import java.awt.Dimension;
import java.awt.geom.NoninvertibleTransformException;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import arb.Constants;
import arb.Real;
import arb.functions.complex.YFunction;
import arb.viz.ComplexFunctionRenderer;
import arb.viz.Part;

/**
 * Renders the {@link YFunction} 
 */
public class YRenderer extends
                      ComplexFunctionRenderer<YFunction>
{
  @SuppressWarnings("resource")
  public static void main( String args[] ) throws NoninvertibleTransformException, IOException
  {
     YRenderer renderer = new YRenderer( new Real().set("0.75", 128));
     renderer.render();
  }
  
  public static final int width  = 2500/4 ;
  public static final int height = 1250/4  ;

  public YRenderer(Real vscale) throws NoninvertibleTransformException
  {
    super(new Dimension(width,
                        height),
          new Rectangle2D.Double(-10,
                                 -7.5 * 5,
                                 80,
                                 15 * 5),
          new YFunction(vscale));

    color_mode  = 5;
    displayMode = Part.Blend;

  }

  public YRenderer() throws NoninvertibleTransformException
  {
    this(Constants.ONE);
  }

}