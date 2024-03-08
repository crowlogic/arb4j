package arb.expressions;

import java.util.Arrays;
import java.util.HashSet;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class Parser
{

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

    return isAlphabetical(ch) || isGreek(ch) || ch == '√' || ch == '₀' || ch == 'ⁿ'
                  || (digit && (ch >= '0' && ch <= '9'));
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

  public static boolean isSymbolicSuperscript(char ch)
  {
    return ch == 'ⁿ';
  }

  /**
   * Replaces the two character ascii arrow version -> with ➔ used to declare the
   * independent variable or declare a multivariate function "(n,x)->n*x" for
   * instance becomes "(n,x)➔n*x" and replaces ... with …
   * 
   * @param expression
   * 
   * @return expression with with the described substitions made
   */
  public static String replaceArrowsAndEllipses(String expression)
  {
    return expression.replace("->", "➔").replace("...", "…");
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
                           // .replace('{', '_')
                           // .replace('}', '_')
                           // .replace('∏', '_')
                           // .replace('=', '_')
                           // .replace('…','_')
                           .replace('[', '_')
                           .replace(']', '_')
                           .replace("➔", "")
                           .replace("½", "half");
    return str;
  }

  public static boolean isSubscriptedParenthesis(char character)
  {
    return character == '₍' || character == '₎';
  }

  public static final HashSet<Character> SUBSCRIPT_CHARACTERS   = new HashSet<Character>(Arrays.asList(new Character[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ',
    'ₜ' }));

  public static final char[]             SUBSCRIPT_DIGITS_ARRAY = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉' };

  public static int[] lowercaseSuperscriptAlphabet =
  { 'ᵃ', 'ᵇ', 'ᶜ', 'ᵈ', 'ᵉ', 'ᶠ', 'ᵍ', 'ʰ', 'ⁱ', 'ʲ', 'ᵏ', 'ˡ', 'ᵐ', 'ⁿ', 'ᵒ', 'ᵖ', 0x107A5, 'ʳ', 'ˢ', 'ᵗ', 'ᵘ', 'ᵛ',
    'ʷ', 'ˣ', 'ʸ', 'ᶻ' };

}