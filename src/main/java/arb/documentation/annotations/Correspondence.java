package arb.documentation.annotations;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * <pre>
 *   
 * 2: compatibility of observations; "there was no agreement
 *      between theory and measurement"; "the results of two tests
 *      were in correspondence" [syn: {agreement}, {correspondence}]
 *   3: the relation of corresponding in degree or size or amount
 *      [syn: {commensurateness}, {correspondence},
 *      {proportionateness}]
 *   4: (mathematics) an attribute of a shape or relation; exact
 *      reflection of form on opposite sides of a dividing line or
 *      plane [syn: {symmetry}, {symmetricalness}, {correspondence},
 *      {balance}] [ant: {asymmetry}, {dissymmetry}, {imbalance}]
 *   5: similarity by virtue of corresponding [syn: {parallelism},
 *      {correspondence}]
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Retention(RUNTIME)
public @interface Correspondence
{
  AppliesTo[] value();
}
