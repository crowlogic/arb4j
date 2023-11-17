package arb.expressions;

public class ExpressionCompilerException extends
                                         RuntimeException
{

  public ExpressionCompilerException()
  {
    super();
  }

  public ExpressionCompilerException(String message,
                                     Throwable cause,
                                     boolean enableSuppression,
                                     boolean writableStackTrace)
  {
    super(message,
          cause,
          enableSuppression,
          writableStackTrace);
  }

  public ExpressionCompilerException(String message, Throwable cause)
  {
    super(message,
          cause);
  }

  public ExpressionCompilerException(String message)
  {
    super(message);
  }

  public ExpressionCompilerException(Throwable cause)
  {
    super(cause);
  }

  private static final long serialVersionUID = 1L;

}
