package arb.geometry.surfaces;

import arb.Complex;
import arb.Real;
import arb.functions.ComplexToRealFunction;
import arb.geometry.Line;
import arb.geometry.curves.PlaneCurve;
import arb.topological.spaces.EuclideanSpace;

/**
 * A surface of revolution is a surface in {@link EuclideanSpace} created by
 * rotating a {@link PlaneCurve} around an axis of rotation specified by a line
 * 
 *
 */
public class SurfaceOfRevolution implements
                                 ParametricSurface
{
  public SurfaceOfRevolution(Line rotationAxis, PlaneCurve curve)
  {
    super();
    this.rotationAxis = rotationAxis;
    this.curve        = curve;
  }

  public final Line       rotationAxis;

  public final PlaneCurve curve;


  @Override
  public Real evaluate(Complex t, int order, int prec, Real res)
  {
    assert false : "rotate the curve";
    return null;
  }
  
}