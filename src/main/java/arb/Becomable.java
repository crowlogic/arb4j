package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Becomable<B extends Becomable<? extends B>>
{
  /**
   * <pre>
   * Calls this{@link #close()} and then replaces this{@link #elements},
   * this{@link #swigCPtr}, this{@link #swigCMemOwn}, and this{@link #dim} with
   * new values. This is different from this{@link #set(Real)} or
   * this{@link #set(Real...)} because those methods do not change the pointers to
   * that of its input but copies by value instead. Also sets
   * that{@link #swigCMemOwn} to false since this {@link Real}s {@link #close()}
   * method now frees the memory instead of the {@link #close()} method of that
   * 
   * The `become` method fuctions metaphorically like the Terminator T-1000 as it
   * took on the form of a person in the classic movie scene. In this case, the
   * `Real` object `this` absorbs all the properties and state of another `Real`
   * object `that`, effectively transforming into it.
   * 
   * Just as the T-1000 assumes the physical appearance and characteristics of its
   * target, the `become` method copies the internal data pointers and state of
   * `that` into `this`. Moreover, by setting `that.swigCMemOwn` to false, it
   * ensures that `that` will no longer assume the responsibility of freeing the
   * memory when its {@link #close()} method is called, much like the target no
   * longer retaining their form once the T-1000 transforms into them.
   * 
   * This approach ensures that the original object (`this`) now fully embodies
   * the other object (`that`).
   * </pre>
   * 
   * @param that
   * @return this after becoming that
   */
  public Becomable<B> become(B that);
}
