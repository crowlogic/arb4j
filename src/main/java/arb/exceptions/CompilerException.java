package arb.exceptions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
*
* @see BusinessSourceLicenseVersionOnePointOne © terms of the
*      {@link TheArb4jLibrary}
*/
public class CompilerException extends
                                       ArbException
{

  public CompilerException()
  {
    super();
  }

  public CompilerException(String message,
                                   Throwable cause,
                                   boolean enableSuppression,
                                   boolean writableStackTrace)
  {
    super(message,
          cause,
          enableSuppression,
          writableStackTrace);
  }

  public CompilerException(String message, Throwable cause)
  {
    super(message,
          cause);
  }

  public CompilerException(String message)
  {
    super(message);
  }

  public CompilerException(Throwable cause)
  {
    super(cause);
  }

  private static final long serialVersionUID = 1L;

}
