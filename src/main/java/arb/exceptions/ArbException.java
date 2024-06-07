package arb.exceptions;

public class ArbException extends
                          RuntimeException
{

  public ArbException()
  {
    super();
  }

  public ArbException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace)
  {
    super(message,
          cause,
          enableSuppression,
          writableStackTrace);
  }

  public ArbException(String message, Throwable cause)
  {
    super(message,
          cause);
  }

  public ArbException(Throwable cause)
  {
    super(cause);
  }

  private static final long serialVersionUID = 1L;

  public ArbException(String msg)
  {
    super(
          msg);
  }

}
