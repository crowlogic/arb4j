package arb;

/**
 * /**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public interface AutoCloseableAssignable<T> extends
                                        AutoCloseable,
                                        Assignable<T>,
                                        Named
{

  @Override
  void close();

}
