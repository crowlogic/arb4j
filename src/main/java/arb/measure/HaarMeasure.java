package arb.measure;

import java.util.Set;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.groups.Group;
import arb.space.topological.LocallyCompactHausdorffSpace;

/**
 * Represents a Haar Measure on a locally compact topological group, designed to
 * be invariant under group translations, either left or right. This interface
 * is essential for performing integrals and analyzing functions over the group,
 * supporting operations like translation and convolution, which are fundamental
 *
 * @param <X> the type of elements in the Topological {@link Group}
 * @param <Σ> the type of {@link σField}, representing the measurable subsets of
 *            X.
 *
 * @see BusinessSourceLicenseVersionOnePointOne for terms of the
 *      {@link TheArb4jLibrary}.
 */
public interface HaarMeasure<X extends LocallyCompactHausdorffSpace<?>, Σ extends σField<? extends X>>
                            extends
                            RadonMeasure<X, Σ>
{

  public enum Direction
  {
   LEFT,
   RIGHT
  }

  Direction getTranslationInvarianceDirection();

  /**
   * Applies the translation operator to a function with respect to a group
   * element.
   *
   * @param f the function to be translated.
   * @param g the group element by which the function is to be translated.
   * @return the translated function.
   */
  Function<X, Real> translate(Function<X, Real> f, X g);

  /**
   * Performs the convolution of two functions.
   *
   * @param f the first function to be convoluted.
   * @param h the second function to be convoluted.
   * @return the result of the convolution.
   */
  Function<X, Real> convolve(Function<X, Real> f, Function<X, Real> h);

  /**
   * Determines the support of the measure, which is the smallest closed set such
   * that the measure of its complement is zero.
   *
   * @return the support of the measure.
   */
  Set<X> getSupport();
}
