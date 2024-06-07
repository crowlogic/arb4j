package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;

/**
 * <pre>
 * Lipschitz and Hankel's infinite integrals for the type I Bessel functions are
 * integral representations associated with Bessel functions of the first kind,
 * denoted as J_ν(x), where ν is the order of the Bessel function and x is the
 * argument. These representations are crucial in the analysis of various
 * physical and engineering problems, especially those involving cylindrical or
 * spherical symmetry.
 * 
 * The integral representations you're asking about can be attributed to
 * mathematical methods developed by Rudolf Lipschitz and Hermann Hankel, both
 * of whom made significant contributions to the theory of Bessel functions. The
 * type I Bessel function, J_ν(x), for real or complex values of ν and x, can be
 * defined through the following integral, known as Hankel's integral:
 * 
 * J_ν(x) = (1/(2π)) ∫ from -π to π of e^(-i(ντ - xsinτ)) dτ, for -π < Re(ν) < π
 * 
 * This representation is particularly useful because it directly relates the
 * Bessel function of the first kind to trigonometric functions, thereby
 * facilitating their computation and analysis. The integral demonstrates the
 * oscillatory nature of Bessel functions, which are fundamentally connected to
 * solutions of differential equations with cylindrical symmetry.
 * 
 * Another important representation, related to the work of both Lipschitz and
 * Hankel, involves the expression of J_ν(x) through an infinite series or
 * through integrals that are more complex, suitable for different contexts of
 * application, especially in solving differential equations.
 * 
 * Lipschitz's and Hankel's contributions to the theory of Bessel functions,
 * including these integral representations, have profound implications in
 * physics and engineering, such as in wave propagation, heat conduction in
 * cylindrical objects, and vibrations of circular membranes.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class InfiniteIntegralsForBesselFunctionOfTheFirstKind implements
                                                              Concept
{
  public Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.besselFunctionTreatise.referToChapters("13.20",
                                                                         "13.21",
                                                                         "13.22",
                                                                         "13.23"),
                     Bibliography.specialFunctionsOfMathematicalPhysics.referToChapters("3.8.3"));
  }
}
