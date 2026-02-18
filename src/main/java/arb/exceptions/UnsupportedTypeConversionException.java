package arb.exceptions;

public final class UnsupportedTypeConversionException extends
                                                      UnsupportedOperationException
{
  private static final long serialVersionUID = 1L;

  public UnsupportedTypeConversionException(String message)
  {
    super(message);
  }

  public UnsupportedTypeConversionException(String message, Throwable cause)
  {
    super(message,
          cause);
  }
}
