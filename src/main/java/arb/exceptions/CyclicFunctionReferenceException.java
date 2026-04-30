package arb.exceptions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Thrown by {@code Expression.instantiate()} when the runtime field-graph
 * verifier detects that two distinct instances of the same
 * {@code FunctionMapping} are reachable from the freshly constructed root.
 *
 * <p>
 * This is the on-construction failure for the broken initialization pattern
 * named in arb4j issue #1000 point #3 — {@code if (peer == null) peer = new
 * Peer()} inside {@code initialize()} when the reference graph contains a
 * cycle. The verifier is a postcondition check on
 * {@code allocate-all-then-wire-all}; this exception fires immediately after
 * the wire-all phase rather than waiting for {@code evaluate(...)} to
 * stack-overflow.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CyclicFunctionReferenceException extends
                                              CompilerException
{

  private static final long serialVersionUID = 1L;

  public CyclicFunctionReferenceException(String message)
  {
    super(message);
  }

  public CyclicFunctionReferenceException(String message, Throwable cause)
  {
    super(message,
          cause);
  }

}
