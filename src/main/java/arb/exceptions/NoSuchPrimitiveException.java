package arb.exceptions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Thrown at compilation time when the primitive (antiderivative) of an
 * integrand is <b>proven</b> not to exist within the function field known to
 * the compiler. This exception asserts non-existence, not ignorance: when the
 * compiler merely lacks an integration rule and cannot prove non-existence, it
 * throws {@link UnsupportedOperationException} ("not implemented") instead —
 * the truthful statement. Differentiation of the integral remains exact in
 * either case, via the Leibniz rule on the symbolic integral node.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NoSuchPrimitiveException extends
                                      CompilerException
{
  private static final long serialVersionUID = 1L;

  public NoSuchPrimitiveException(String message)
  {
    super(message);
  }
}
