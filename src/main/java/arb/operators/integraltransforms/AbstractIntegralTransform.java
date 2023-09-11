package arb.operators.integraltransforms;

import arb.*;
import arb.functions.Function;

/**
 * Abstract class for implementing different kinds of integral transforms. It
 * provides the structure and the common properties that every integral
 * transform will use.
 * 
 * @param <F> Function type, it should return a Complex number.
 * @param <X> Field type in which the function is defined.
 */
public abstract class AbstractIntegralTransform<F extends Function<X, Complex>, X extends Field<X>>
{

  /**
   * Represents the goal for the relative accuracy in bits.
   */
  protected static final int    relativeAccuracyBitsGoal     = 128;

  /**
   * Represents the tolerance for absolute uncertainty in the computations. It is
   * set to a very small number to minimize errors.
   */
  protected final Magnitude     absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -60));

  /**
   * Domain over which the function will be evaluated.
   */
  protected final FloatInterval domain;

  /**
   * Represents the left endpoint of the domain.
   */
  protected Real                left                         = new Real();

  /**
   * Represents the right endpoint of the domain.
   */
  protected Real                right                        = new Real();

  /**
   * Options for the integration process.
   */
  protected IntegrationOptions  integrationOptions           = new IntegrationOptions();

  /**
   * Function to which the integral transform will be applied.
   */
  protected F                   f;

  /**
   * Precision in bits for computations.
   */
  protected int                 bits                         = 128;

  /**
   * Constructs an AbstractIntegralTransform object with a given function.
   * 
   * @param f Function to which the integral transform will be applied.
   */
  public AbstractIntegralTransform(F f)
  {
    this(f,
         new FloatInterval(-50,
                           50));
  }

  /**
   * Constructs an AbstractIntegralTransform object with a given function and
   * domain.
   *
   * @param f      Function to which the integral transform will be applied.
   * @param domain Domain over which the function will be evaluated.
   */
  public AbstractIntegralTransform(F f, FloatInterval domain)
  {
    this.f      = f;
    this.domain = domain;
    left.set(domain.getA());
    right.set(domain.getB());
  }

  /**
   * Abstract method to evaluate the integral transform at a given field element
   * with specified order and precision.
   *
   * @param x      Field element at which the function will be evaluated.
   * @param order  Order of the transformation.
   * @param prec   Precision in bits for the computation.
   * @param result Complex number to store the result.
   * @return Resulting complex number after evaluating the integral transform.
   */
  public abstract Complex evaluate(X x, int order, int prec, Complex result);

  /**
   * Abstract method to get the kernel function for the integral transform.
   * 
   * @return The kernel function of the integral transform.
   */
  public abstract Function<X, Complex> getKernel();
}
