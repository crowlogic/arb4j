package arb.documentation;

import arb.language.Terms;

/**
 * A {@link License} is a {@link Legal} {@link Document} that specifies the
 * {@link Terms} under which a {@link LicensedWork} is made available
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface License extends
                         Document
{
  String getText();
}