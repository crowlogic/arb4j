package arb.expressions;

import java.util.Arrays;
import java.util.HashSet;

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

  public static char subscriptedCharToRegular(char c)
  {
    return switch (c)
    {
    case '₀' -> '0';
    case '₁' -> '1';
    case '₂' -> '2';
    case '₃' -> '3';
    case '₄' -> '4';
    case '₅' -> '5';
    case '₆' -> '6';
    case '₇' -> '7';
    case '₈' -> '8';
    case '₉' -> '9';
    // Alphabetical subscripts
    case 'ₐ' -> 'a';
    case 'ₑ' -> 'e';
    case 'ₕ' -> 'h';
    case 'ᵢ' -> 'i';
    case 'ⱼ' -> 'j';
    case 'ₖ' -> 'k';
    case 'ₗ' -> 'l';
    case 'ₘ' -> 'm';
    case 'ₙ' -> 'n';
    case 'ₒ' -> 'o';
    case 'ₚ' -> 'p';
    case 'ᵣ' -> 'r';
    case 'ₛ' -> 's';
    case 'ₜ' -> 't';
    case 'ᵤ' -> 'u';
    case 'ᵥ' -> 'v';
    case 'ₓ' -> 'x';
    default -> c;
    };
  }

  public static char subscriptedDigitToRegular(char c)
  {
    return switch (c)
    {
    case '₀' -> '0';
    case '₁' -> '1';
    case '₂' -> '2';
    case '₃' -> '3';
    case '₄' -> '4';
    case '₅' -> '5';
    case '₆' -> '6';
    case '₇' -> '7';
    case '₈' -> '8';
    case '₉' -> '9';
    default -> c;
    };
  }

  /**
   * Checks whether a given character is a digit, a decimal point, or '½'
   * 
   * @param ch The character to check
   * @return true if the character is a digit or a decimal point; false otherwise
   */
  static boolean isNumeric(char ch)
  {
    char desubscripted = subscriptedDigitToRegular(ch);

    return (ch >= '0' && ch <= '9') || ch == '.' || ch == '½' || (desubscripted >= '0' && desubscripted <= '9');
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
  static public boolean isLatinOrGreek(char ch, boolean digit)
  {

    return isAlphabetical(ch) || isGreek(ch) || ch == '√' || ch == '₀' || (digit && (ch >= '0' && ch <= '9'));
  }

  public static boolean isAlphabetical(char ch)
  {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
  }

  public static boolean isAlphaNumericSubscript(char ch)
  {
    return SUBSCRIPT_CHARACTERS.contains(ch);
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
  public static boolean isExponent(char ch)
  {
    return ch == '^' || isNumericSuperscript(ch);
  }

  private static boolean isNumericSuperscript(char ch)
  {
    return ch == '⁰' || ch == '¹' || ch == '²' || ch == '³' || (ch >= '⁴' && ch <= '⁹');
  }

  /**
   * Replaces the two character ascii arrow version -> with ➔ used to declare the
   * independent variable or declare a multivariate function "(n,x)->n*x" for
   * instance becomes "(n,x)➔n*x" and replaces ... with …
   * 
   * @param expression
   * 
   * @return expression with 0-9 substituted in place of ₀-₉
   */
  public static String replaceArrowsAndEllipses(String expression)
  {
    return expression.replace("->", "➔").replace("..", "…");
  }

  static String expressionToUniqueClassname(String expression)
  {
    String str = expression.replaceAll("\\.{2,}", "…")
                           .replace(",", "")
                           .replace(" ", "")
                           .replace("+", "Plus")
                           .replace("-", "Minus")
                           .replace("*", "Times")
                           .replace("/", "DividedBy")
                           .replace("^", "ToThePowerOf")
                           .replace("(", "")
                           .replace(")", "")
                           .replace(".", "•")                           
                           //.replace('{', '_')
                          // .replace('}', '_')
                        //   .replace('∏', '_')
                        //   .replace('=', '_')
                         //  .replace('…','_')
                           .replace('[', '_')
                           .replace(']', '_')
                           .replace("➔", "")
                           .replace("½", "half");
    return  str;
  }

  public static boolean isSubscriptedParenthesis(char character)
  {
    return character == '₍' || character == '₎';
  }

  public static final HashSet<Character> SUBSCRIPT_CHARACTERS       = new HashSet<Character>(Arrays.asList(new Character[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ',
    'ₜ' }));
  public static final char[]             SUBSCRIPT_CHARACTERS_ARRAY = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ',
    'ₜ' };
  public static final char[]             SUBSCRIPT_DIGITS_ARRAY     = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉' };

}