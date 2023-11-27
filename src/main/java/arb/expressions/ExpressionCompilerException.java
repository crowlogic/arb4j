package arb.expressions;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
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
