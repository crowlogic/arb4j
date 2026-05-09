package arb.functions.complex;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.ComplexFunctional;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * Adaptive Müntz–Padé functional.
 *
 * <p>
 * This class no longer attempts to globally choose a Padé order M from an
 * arbitrary representative point. That strategy is mathematically incorrect,
 * because convergence depends on the actual evaluation point:
 *
 * <pre>
 * z = t ^ μ
 * </pre>
 *
 * relative to the singularity structure of the meromorphic continuation.
 *
 * <p>
 * Instead, this functional merely curries the external parameter v and returns
 * an adaptive {@link MuntzPadeApproximant} which incrementally grows the Padé
 * hierarchy:
 *
 * <pre>
 *     R₁, R₂, R₃, ...
 * </pre>
 *
 * on demand during evaluation at the actual requested point t.
 *
 * <p>
 * The approximant internally caches:
 *
 * <ul>
 * <li>the incremental Hankel inverse hierarchy, and</li>
 * <li>every previously constructed diagonal Padé pair.</li>
 * </ul>
 *
 * so repeated evaluations amortize naturally.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MuntzPadeFunctional implements
                                 ComplexFunctional,
                                 AutoCloseable
{

  MuntzPadeFunctional()
  {
    
  }
  
  private static final Logger    log = LoggerFactory.getLogger(MuntzPadeFunctional.class);

  /**
   * Fractional exponent μ ∈ (0,1).
   */
  public Real                    α;

  /**
   * Müntz coefficients:
   *
   * <pre>
   *     k ↦ v ↦ a_k(v)
   * </pre>
   */
  public ComplexPolynomialSequence a;

  protected String               name;


  public MuntzPadeFunctional(Real α, ComplexPolynomialSequence a)
  {
    this.α = α;
    this.a = a;
  }

  public MuntzPadeFunctional(String name, Real α, ComplexPolynomialSequence a)
  {
    this(α,
         a);
    this.name = name;
  }

  @Override
  public ComplexFunction evaluate(Complex v, int order, int bits, ComplexFunction result)
  {

    /**
     * No global Padé-order selection occurs here anymore.
     *
     * The returned approximant adaptively determines the required order during
     * evaluation at the actual requested point t.
     */
    return new MuntzPadeApproximant(α,
                                    a,
                                    v,
                                    bits);
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    // no owned native resources
  }
}