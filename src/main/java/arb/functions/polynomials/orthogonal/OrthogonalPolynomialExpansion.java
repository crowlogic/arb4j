package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;

import arb.Field;
import arb.Polynomial;
import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 * TODO: abstract this so it can be an orthogonal function sequence, like
 * {@link RealFunction} or {@link RationalFunction} instead of being relagated
 * to orthogonal {@link Polynomial}s
 * 
 * @param <D> the domain of the function being expanded
 * @param <C> the codomain of the function being expande
 * @param <F> the type of the this{@link #basisElements} that comprise the
 *            this{@link #basis}
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
  public final D            projections;
  public final ArrayList<C> basisElements;

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
