package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

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
    String sanitized = sanitizeFieldName(functionName + "_" + argFingerprint + "_" + (isComplex ? "C" : "R"));
    this.jetFieldName         = "jetPoly_" + sanitized;
    this.argFieldName         = "argPoly_" + sanitized;
    this.stampFieldName       = "jetStamp_" + sanitized;
    this.structuralKey        = functionName + "_" + argFingerprint + "_" + (isComplex ? "C" : "R");
    this.maxCoefficientNeeded = 0;
  }

  /**
   * Replace characters that are illegal in JVM field names with safe
   * alternatives. The structural key retains the original characters for
   * semantic comparison; only the field names used in bytecode are sanitized.
   */
  private static String sanitizeFieldName(String raw)
  {
    StringBuilder sb = new StringBuilder(raw.length());
    for (int i = 0; i < raw.length(); i++)
    {
      char c = raw.charAt(i);
      switch (c)
      {
      case '(' -> sb.append("LP");
      case ')' -> sb.append("RP");
      case '[' -> sb.append("LB");
      case ']' -> sb.append("RB");
      case '/' -> sb.append("Sl");
      case '\\' -> sb.append("Bs");
      case '.' -> sb.append("Dt");
      case ';' -> sb.append("Sc");
      case '+' -> sb.append("Pl");
      case '-' -> sb.append("Mi");
      case '*' -> sb.append("Mu");
      case ' ' -> sb.append("Sp");
      case '=' -> sb.append("Eq");
      case '<' -> sb.append("Lt");
      case '>' -> sb.append("Gt");
      case '{' -> sb.append("LC");
      case '}' -> sb.append("RC");
      default -> sb.append(c);
      }
    }
    return sb.toString();
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
