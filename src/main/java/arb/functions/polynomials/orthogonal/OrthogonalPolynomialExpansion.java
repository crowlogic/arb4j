package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * @param <O> the type of {@link OrthogonalPolynomialSequence} that will be used
 *            to
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class OrthogonalPolynomialExpansion<D extends Field<?>, V, C,
              O extends OrthogonalPolynomialSequence<? extends D, ? extends V, ? extends C>> implements
                                                   Function<D, V>
{
  public D projections;
  public ArrayList<C> basisElements;

  public OrthogonalPolynomialExpansion(O basis, D projections)
  {
    this.basis         = basis;
    this.projections   = projections;
    this.basisElements = new ArrayList<>(projections.dim());
    var basisIterator = basis.iterator();
    for (int i = 0; i < projections.dim(); i++)
    {
      basisElements.add(basisIterator.next());
    }
  }

  public O basis;

}
