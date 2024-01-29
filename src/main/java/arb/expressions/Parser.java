package arb.expressions;

import arb.functions.real.BesselFunctionOfTheFirstKind;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 */
public class Parser
{

  /**
   * Checks whether a given character is a digit, a decimal point, or '½'
   * 
   * @param ch The character to check
   * @return true if the character is a digit or a decimal point; false otherwise
   */
  static boolean isNumeric(int ch)
  {
    return (ch >= '0' && ch <= '9') || ch == '.' || ch == '½';
  }

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean isDigit(int ch)
  {
    return ch >= '0' && ch <= '9';
  }

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean isLatinOrGreek(int ch, boolean digit)
  {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || isGreek(ch) || ch == '√' || ch == '₀'
                  || (digit && (ch >= '0' && ch <= '9'));
  }

  /**
   * 
   * @param ch
   * @return true if ch represents an upper or lowercase GreekRegistration
   */
  public static boolean isGreek(int ch)
  {
    return (ch >= 0x0391 && ch <= 0x03A9) || (ch >= 0x03B1 && ch <= 0x03C9);
  }

  /**
   * 
   * @param ch
   * @return true if ch represents a caret or a UTF superscript digit except 0 or
   *         1 because it doesn't make sense to raise anything to the 0th power
   *         because thats just equal to 1 and it doesn't make sense to raise
   *         something to the 1st power because thats the identity operation
   * 
   */
  public static boolean isExponent(int ch)
  {
    return ch == '^' || ch == '⁰' || ch == '¹' || ch == '²' || ch == '³' || (ch >= '⁴' && ch <= '⁹');
  }

  /**
   * Replaces the two character ascii arrow version -> with ➔ used to declare the
   * independent variable or declare a multivariate function "(n,x)->n*x" for
   * instance becomes "(n,x)➔n*x"
   * 
   * @param expression
   * 
   * @return expression with 0-9 substituted in place of ₀-₉
   */
  public static String replaceArrow(String expression)
  {
    return expression.replace("->", "➔");
  }

  static String expressionToUniqueClassname(String expression)
  {
    return expression.replace(",", "")
                     .replace(" ", "")
                     .replace("+", "Plus")
                     .replace("-", "Minus")
                     .replace("*", "Times")
                     .replace("/", "DividedBy")
                     .replace("^", "ToThePowerOf")
                     .replace("(", "")
                     .replace(")", "")
                     .replace("1", "One")
                     .replace("2", "Two")
                     .replace("3", "Three")
                     .replace("4", "Four")
                     .replace("5", "Five")
                     .replace("6", "Six")
                     .replace("7", "Seven")
                     .replace("8", "Eight")
                     .replace("9", "Nine")
                     .replace("0", "Zero")
                     .replace(".", "Point")
                     .replace('[', '_')
                     .replace(']', '_')
                     .replace("➔", "")
                     .replace("½", "half");
  }

}
