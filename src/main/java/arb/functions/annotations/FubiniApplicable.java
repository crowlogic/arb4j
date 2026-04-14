package arb.functions.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Annotation indicating the user asserts that Fubini's theorem (or Tonelli's
 * theorem, or the Dominated Convergence Theorem for mixed sum-integral cases)
 * conditions are satisfied for exchanging the order of integration/summation
 * at the annotated expression.
 *
 * <p>When the automated integrability heuristics in
 * {@link arb.expressions.nodes.IntegralNode#isAnalyticallyValidToExchangeWith}
 * cannot determine validity, this annotation serves as a user-provided
 * assertion that the exchange is mathematically justified.</p>
 *
 * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface FubiniApplicable
{
  /**
   * Optional justification string documenting why Fubini/Tonelli conditions
   * are met.
   */
  String justification() default "";
}
