package arb.expressions;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.UUID;

import arb.Fraction;
import arb.FractionConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.LiteralConstantNode;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class Parser
{
  public static char[]                       commonFractions            =
  { '¼', '½', '¾', '⅐', '⅑', '⅒', '⅓', '⅔', '⅕', '⅖', '⅗', '⅘', '⅙', '⅚', '⅛', '⅜', '⅝', '⅞' };

  public static String[]                     fractionConstantFieldNames =
  { "oneQuarter",
    "oneHalf",
    "threeQuarters",
    "oneSeventh",
    "oneNineth",
    "oneTenth",
    "oneThird",
    "twoThird",
    "oneFifth",
    "twoFifths",
    "threeFifths",
    "fourFifths",
    "oneSixth",
    "fiveSixths",
    "oneEight",
    "threeEights",
    "fiveEights",
    "sevenEights" };

  public static HashMap<Character, Fraction> fractions                  = new HashMap<>();

  public static HashMap<Character, String>   fractionFieldNames         = new HashMap<>();

  static
  {
    for (int i = 0; i < commonFractions.length; i++)
    {
      fractionFieldNames.put(commonFractions[i], fractionConstantFieldNames[i]);
    }

    fractions.put('½', FractionConstants.oneHalf);
    fractions.put('¼', FractionConstants.oneQuarter);
    fractions.put('¾', FractionConstants.threeQuarters);
    fractions.put('⅐', FractionConstants.oneSeventh);
    fractions.put('⅑', FractionConstants.oneNineth);
    fractions.put('⅒', FractionConstants.oneTenth);
    fractions.put('⅓', FractionConstants.oneThird);
    fractions.put('⅔', FractionConstants.twoThirds);
    fractions.put('⅕', FractionConstants.oneFifth);
    fractions.put('⅖', FractionConstants.twoFifths);
    fractions.put('⅗', FractionConstants.threeFifths);
    fractions.put('⅘', FractionConstants.fourFifths);
    fractions.put('⅙', FractionConstants.oneSixth);
    fractions.put('⅚', FractionConstants.fiveSixths);
    fractions.put('⅛', FractionConstants.oneEight);
    fractions.put('⅜', FractionConstants.threeEights);
    fractions.put('⅝', FractionConstants.fiveEights);
    fractions.put('⅞', FractionConstants.sevenEights);
  }

  public static HashSet<String> greekAndBlackLetterChars = new HashSet<String>(Arrays.asList("ℭ",
                                                                                             "Γ",
                                                                                             "Δ",
                                                                                             "Θ",
                                                                                             "Λ",
                                                                                             "Ξ",
                                                                                             "Π",
                                                                                             "Σ",
                                                                                             "Φ",
                                                                                             "Ψ",
                                                                                             "Ω",
                                                                                             "γ",
                                                                                             "δ",
                                                                                             "θ",
                                                                                             "λ",
                                                                                             "ξ",
                                                                                             "π",
                                                                                             "ς",
                                                                                             "φ",
                                                                                             "ψ",
                                                                                             "ω",
                                                                                             "ϑ",
                                                                                             "ϒ",
                                                                                             "ϖ",
                                                                                             "ϕ",
                                                                                             "ϱ",
                                                                                             "ϰ"));

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
   * <pre>
   * Ok, let's say you write 1 \u2044 16 (without spaces) as an attempt to display
   * 1/16 as a fraction glyph. How does the rendering engine know that the fraction 
   * ends after 16 and not after 1.  That is, how does it know that it's 1/16 and not 
   * 1/1 followed by a 6? 
   * 
   * The fraction ends once the text renderer encounters a character that cannot
   * be part of a fraction, i.e. something that is not an ASCII digit. – 
   * 
   * To extend on that question, what if I want to display one and fifteen
   * sixteenths, rather than one hundred fifteen sixteenths? Is there a unicode character I
   * can use to  separate the "1" from the "15" so that the rendering engine knows that the
   * "1" is separate  from the "15⁄16"?  
   * 
   * Any zero-width, invisible character will do the trick. 
   * I personally prefer using U+2064 INVISIBLE PLUS because it was
   * encoded to represent exactly this type of semantic concept, but something
   * like U+200C ZERO WIDTH NON-JOINER or U+2060 WORD JOINER will also work
   * </pre>
   * 
   * @param input
   * @return
   */
  public static String stripInvisibleUnicodeFormattingCharacters(String input)
  {
    return input.replaceAll("\\p{Cf}", ""); // Cf is the Unicode category for invisible formatting
                                            // characters
  }

  /**
   * Checks whether a given character is a digit, a decimal point, or '½'
   * 
   * @param ch The character to check
   * @return true if the character is a digit or a decimal point; false otherwise
   */
  static boolean isNumeric(char ch)
  {
    ch = subscriptedDigitToRegular(ch);

    boolean isDigit = ch >= '0' && ch <= '9';
    return isDigit || ch == '.' || ch == '∞' || Parser.fractions.containsKey(ch);
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

  public static final char ⅈ = LiteralConstantNode.ⅈ.charAt(0);

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean isLatinGreekSpecialOrBlackLetter(char ch, boolean digit)
  {
    return isAlphabetical(ch) || isGreekOrBlackLetter(ch) || ch == ⅈ || ch == '√' || ch == '₀'
                  || superscriptChars.contains(ch) || (digit && (ch >= '0' && ch <= '9'));
  }

  public static boolean isAlphabetical(int ch)
  {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
  }

  public static boolean isAlphabetical(char ch)
  {
    return isAlphabetical((int) ch);
  }

  public static boolean isAlphabeticalOrNumericSubscript(char ch)
  {
    return SUBSCRIPT_CHARACTERS.contains(ch);
  }

  /**
   * 
   * @param ch
   * @return true if ch represents an upper or lowercase GreekRegistration
   */
  public static boolean isGreekOrBlackLetter(int ch)
  {
    return (ch >= 0x0391 && ch <= 0x03A9) || (ch >= 0x03B1 && ch <= 0x03C9)
                  || greekAndBlackLetterChars.contains(String.valueOf((char) ch));
  }

  /**
   * Replaces the two character ASCII arrow version -> with ➔ used to declare the
   * independent variable or declare a multivariate function "(n,x)➔n*x" for
   * instance becomes "(n,x)➔n*x" and replaces ... with … Also replaces
   * superscript alphabetical characters with '^' followed by their normal ASCII
   * counterparts.
   *
   * @param expression The expression to transform.
   *
   * @return The expression with the described substitutions made.
   */
  public static String replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(String expression)
  {
    expression = stripInvisibleUnicodeFormattingCharacters(expression.replace("->", "➔")
                                                                     .replace("⇒", "➔")
                                                                     .replace("...", "…"));

    for (int i = 0; i < superscripts.length; i++)
    {
      expression = expression.replace(superscripts[i], caretNormals[i]);
    }

    return expression;
  }

  public static String expressionToUniqueClassname(String expression)
  {
    String str = expression.replaceAll("\\.{2,}", "…")
                           .replace(';', ',')
                           .replace(" ", "")
                           .replace("+", "Plus")
                           .replace("-", "Minus")
                           .replace("*", "Times")
                           .replace("/", "Over")
                           .replace("^", "ToThePowerOf")
                           .replace(".", "_")
                           .replace("{", "Where")
                           .replace("}", "")
                           .replace("₍", "")
                           .replace("₎", "")
                           .replace(">", "")
                           .replace("=", "Eq")
                           .replace("ₙ", "N")
                           .replace("…", "To")
                           .replace("!", "Bang")
                           .replace("[", "{")
                           .replace("]", "}")
                           .replace("➔", "")
                           .replace("½", "Half");
    str = (isDigit(str.charAt(0)) ? "_" : "") + str;
    if (str.length() >= 250)
    {
      UUID uuid = UUID.nameUUIDFromBytes(str.getBytes());
      str = uuid.toString().replace("-", "_");
    }
    return str;
  }

  public static boolean isSubscriptedParenthesis(char character)
  {
    return character == '₍' || character == '₎';
  }

  public static final HashSet<
                Character>               SUBSCRIPT_CHARACTERS         = new HashSet<
                              Character>(Arrays.asList('₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ', 'ₜ'));

  public static final char[]             SUPERSCRIPT_DIGITS_ARRAY     = new char[]
  { '⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹' };

  public static final char[]             SUBSCRIPT_DIGITS_ARRAY       = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉' };

  public static final char[]             SUBSCRIPT_CHARACTERS_ARRAY   =
  { 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ', 'ₜ' };

  public static int[]                    lowercaseSuperscriptAlphabet =
  { 'ᵃ',
    'ᵇ',
    'ᶜ',
    'ᵈ',
    'ᵉ',
    'ᶠ',
    'ᵍ',
    'ʰ',
    'ⁱ',
    'ʲ',
    'ᵏ',
    'ˡ',
    'ᵐ',
    'ⁿ',
    'ᵒ',
    'ᵖ',
    0x107A5,
    'ʳ',
    'ˢ',
    'ᵗ',
    'ᵘ',
    'ᵛ',
    'ʷ',
    'ˣ',
    'ʸ',
    'ᶻ' };

  public static final HashSet<
                Character>               lowercaseSubscriptAlphabet   = new HashSet<
                              Character>(Arrays.asList('ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ', 'ₜ'));
  /**
   * Not all uppercase letters have UTF superscript representations
   */
  public static int[]                    uppercaseSuperscriptAlphabet =
  { 'ᴬ', 'ᴮ', 'ᴰ', 'ᴱ', 'ᴳ', 'ᴴ', 'ᴵ', 'ᴶ', 'ᴷ', 'ᴸ', 'ᴹ', 'ᴺ', 'ᴼ', 'ᴾ', 'ᴿ', 'ᵀ', 'ᵁ', 'ⱽ', 'ᵂ' };

  public static final String[]           superscripts                 =
  { "ᵃ",
    "ᵇ",
    "ᶜ",
    "ᵈ",
    "ᵉ",
    "ᶠ",
    "ᵍ",
    "ʰ",
    "ⁱ",
    "ʲ",
    "ᵏ",
    "ˡ",
    "ᵐ",
    "ⁿ",
    "ᵒ",
    "ᵖ",
    String.format("%c", 0x107A5),
    "ʳ",
    "ˢ",
    "ᵗ",
    "ᵘ",
    "ᵛ",
    "ʷ",
    "ˣ",
    "ʸ",
    "ᶻ",
    "ᵅ",
    "ᵝ",
    "ᵞ",
    "ᵟ",
    "ᵋ",
    "ᶿ",
    "ᵠ",
    "ᵡ" };

  public static final String[]           caretNormals                 =
  { "^a",
    "^b",
    "^c",
    "^d",
    "^e",
    "^f",
    "^g",
    "^h",
    "^i",
    "^j",
    "^k",
    "^l",
    "^m",
    "^n",
    "^o",
    "^p",
    "^q",
    "^r",
    "^s",
    "^t",
    "^u",
    "^v",
    "^w",
    "^x",
    "^y",
    "^z",
    "^α",
    "^β",
    "^γ",
    "^δ",
    "^ε",
    "^θ",
    "^φ",
    "^χ" };

  public static final HashSet<Character> superscriptChars             = new HashSet<
                Character>(Arrays.asList(superscripts).stream().map(s -> s.charAt(0)).toList());

  public static boolean isAlphabeticalSuperscript(char character)
  {
    return superscriptChars.contains(character);
  }

}