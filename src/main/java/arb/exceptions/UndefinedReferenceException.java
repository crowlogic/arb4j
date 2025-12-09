package arb.exceptions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UndefinedReferenceException extends
                                         CompilerException
{

  public UndefinedReferenceException()
  {
    super();
    // TODO Auto-generated constructor stub
  }

  public UndefinedReferenceException(String message,
                                     Throwable cause,
                                     boolean enableSuppression,
                                     boolean writableStackTrace)
  {
    super(message,
          cause,
          enableSuppression,
          writableStackTrace);
    // TODO Auto-generated constructor stub
  }

  public UndefinedReferenceException(String message, Throwable cause)
  {
    super(message,
          cause);
    // TODO Auto-generated constructor stub
  }

  public UndefinedReferenceException(String message)
  {
    super(message);
    // TODO Auto-generated constructor stub
  }

  public UndefinedReferenceException(Throwable cause)
  {
    super(cause);
    // TODO Auto-generated constructor stub
  }

  private static final long serialVersionUID = 1L;

}
