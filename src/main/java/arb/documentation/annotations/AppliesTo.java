package arb.documentation.annotations;

import java.lang.annotation.Repeatable;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Repeatable(Correspondence.class)
public @interface AppliesTo
{
  Class<? extends Concept> value();
}
