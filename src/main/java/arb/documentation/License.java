package arb.documentation;

import arb.documentation.annotations.Legal;

/**
 * A {@link License} is a {@link Legal} {@link Document} that specifies the
 * {@link Terms} under which a {@link LicensedWork} is made available
 */
public interface License extends
                         Document
{
  @Legal
  String getText();
}