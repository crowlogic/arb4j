package arb.annotations;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Denotes that a number or property is transcendental. Transcendental numbers
 * and properties are those that are not algebraic, meaning they are not the
 * root of any non-zero polynomial equation with rational coefficients.
 * Transcendence goes beyond irrationality, encompassing numbers that do not
 * satisfy any algebraic equation of finite degree. Several notable methods and
 * theorems have been developed to prove the transcendence of numbers:
 * 
 * <ul>
 * <li>Liouville's Theorem (1844): One of the earliest tools for proving
 * transcendence, demonstrating that numbers with sufficiently fast
 * approximation by rationals are transcendental.</li>
 * <li>Hermite-Lindemann Theorem (1882): Proved that e and π are transcendental
 * by showing that if α is a non-zero algebraic number, then e^α is
 * transcendental.</li>
 * <li>Gelfond-Schneider Theorem (1930s): Resolved Hilbert's Seventh Problem by
 * proving that a^b is transcendental for algebraic a ≠ 0, 1 and irrational
 * algebraic b.</li>
 * <li>Baker's Theorem (1966): Extended the realm of transcendence through
 * linear forms in logarithms, showing that certain linear combinations of
 * logarithms of algebraic numbers are transcendental.</li>
 * </ul>
 * 
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Transcendental
{
}
