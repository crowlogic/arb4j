package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;

import arb.Field;
import arb.OrthonormalBasis;
import arb.Polynomial;
import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * TODO: abstract this so it can be an orthogonal function sequence, like
 * {@link RealFunction} or {@link RationalFunction} instead of being relagated
 * to orthogonal {@link Polynomial}s
 * 
 * @param <D> the domain of the function being expanded
 * @param <C> the codomain of the function being expande
 * @param <V> the type of the this{@link #basisElements} that comprise the
 *            this{@link #basis}
 * @param <O> the type of {@link OrthogonalPolynomialSequence} that will be used
 *            to
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class OrthogonalPolynomialExpansion<D extends Field<? extends D>, C, V,
              O extends OrthogonalPolynomialSequence<D, C, V>> extends
                                                   OrthogonalExpansion<D, C, V, O> implements
                                                   OrthonormalExpansion<D, C, OrthonormalBasis<D, C>>

{
  public OrthogonalPolynomialExpansion(O basis, D projections)
  {
    super(projections,
          new ArrayList<>(projections.dim()));
    this.basis = basis;
    var basisIterator = basis.iterator();
    for (int i = 0; i < projections.dim(); i++)
    {
      basisElements.add(basisIterator.next());
    }
  }

}
