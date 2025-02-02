package arb.functions.polynomials.orthogonal;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
import java.util.ArrayList;

import arb.Field;
import arb.functions.Basis;
import arb.functions.Expansion;
import arb.functions.Function;

public class OrthogonalExpansion<D extends Field<? extends D>, C, V, O extends OrthogonalPolynomialSequence<D, C, V>>
{

  public final D projections;
  public final ArrayList<V> basisElements;
  public O basis;

  public OrthogonalExpansion(D projections, ArrayList<V> basisElements)
  {
    super();
    this.projections   = projections;
    this.basisElements = basisElements;
  }

}