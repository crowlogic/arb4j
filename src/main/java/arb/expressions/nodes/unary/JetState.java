package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Parser;

/**
 * Shared coordination record for {@link JetNode} instances that represent
 * derivative orders of the same special function at the same argument. Holds
 * field names for the generated class and tracks the compile-time maximum
 * coefficient index across all nodes sharing this state.
 * 
 * <p>
 * Not a node — this is a plain record shared by reference across multiple
 * {@link JetNode} instances in the same expression tree.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JetState
{
  public final String jetFieldName;
  public final String argFieldName;
  public final String stampFieldName;
  public final String structuralKey;

  private int         maxCoefficientNeeded;

  public JetState(String functionName, String argFingerprint, boolean isComplex)
  {
    String sanitized = Parser.sanitizeFieldName(functionName + "_" + argFingerprint + "_" + (isComplex ? "C" : "R"));
    this.jetFieldName         = "jetPoly_" + sanitized;
    this.argFieldName         = "argPoly_" + sanitized;
    this.stampFieldName       = "jetStamp_" + sanitized;
    this.structuralKey        = functionName + "_" + argFingerprint + "_" + (isComplex ? "C" : "R");
    this.maxCoefficientNeeded = 0;
  }

  public void updateMax(int k)
  {
    maxCoefficientNeeded = Math.max(maxCoefficientNeeded, k);
  }

  public int getMaxCoefficientNeeded()
  {
    return maxCoefficientNeeded;
  }
}
