package arb.exceptions;

public class SyntaxError extends
                         CompilerException
{

  public SyntaxError()
  {
    super();
  }

  public SyntaxError(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace)
  {
    super(message,
          cause,
          enableSuppression,
          writableStackTrace);
  }

  public SyntaxError(String message, Throwable cause)
  {
    super(message,
          cause);
  }

  public SyntaxError(String message)
  {
    super(message);
  }

  public SyntaxError(Throwable cause)
  {
    super(cause);
  }

  private static final long serialVersionUID = 1L;

}
