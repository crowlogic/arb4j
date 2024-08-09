package arb.utensils;

import java.util.regex.Pattern;

/**
 * Compiled patterns that are helpful in increasing performance in e.g. the
 * eu.hoefel.units library.
 * 
 * @author Udo Hoefel
 */
public final class Regexes
{

  /** Hiding any public constructor. */
  private Regexes()
  {
    throw new IllegalStateException("This is a pure utility class!");
  }

  /** Compiled regex pattern for splitting at "^". */
  public static final Pattern EXPONENT                  = Pattern.compile("\\^");

  /**
   * Compiled regex pattern for splitting at spaces. Does <em>not</em> split at
   * non-breakable spaces!
   */
  public static final Pattern SPACE                     = Pattern.compile("\\s+");

  /**
   * Compiled regex pattern for splitting at spaces. Does split at non-breakable
   * spaces!
   */
  public static final Pattern ALL_SPACE                 = Pattern.compile("\\h+");

  /** Finds all surrounding spaces, including non-breakable spaces. */
  public static final Pattern ALL_SURROUNDING_SPACE     = Pattern.compile("(^\\h*)|(\\h*$)");

  /**
   * Compiled regex pattern for splitting at "e". Useful e.g. for splitting
   * numbers in scientific notation.
   */
  public static final Pattern E                         = Pattern.compile("e");

  /** See the documentation of {@link Double#valueOf(String)}. */
  private static final String IS_FLOATING_NUMBER_REGEXP = "[\\x00-\\x20]*[+-]?(((((\\p{Digit}+)(\\.)?((\\p{Digit}+)?)([eE][+-]?(\\p{Digit}+))?)|(\\.((\\p{Digit}+))([eE][+-]?(\\p{Digit}+))?)|(((0[xX](\\p{XDigit}+)(\\.)?)|(0[xX](\\p{XDigit}+)?(\\.)(\\p{XDigit}+)))[pP][+-]?(\\p{Digit}+)))[fFdD]?))[\\x00-\\x20]*";

  /** Compiled regex pattern for identifying floating point numbers. */
  static final Pattern        IS_FLOATING_NUMBER        = Pattern.compile(IS_FLOATING_NUMBER_REGEXP);
}
