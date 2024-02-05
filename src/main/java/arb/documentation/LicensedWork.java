package arb.documentation;

import arb.documentation.annotations.Legal;

/**
 * LicensedWork is {@link Work} whose terms of distribution are specified by a
 * {@link Legal} {@link Document} known as a {@link License}
 */
@Legal
public interface LicensedWork extends
                              Work,
                              Term
{

}
