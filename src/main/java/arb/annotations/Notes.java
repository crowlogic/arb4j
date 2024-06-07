package arb.annotations;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Notes
{
  Note[] value();
}
