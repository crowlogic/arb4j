package arb.expressions;

import java.text.Normalizer;
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
  public static String removeIndependentVariableSpecification(String expression)
  {
    int index = expression.indexOf(ⅈ);
    return index == -1 ? expression : expression.substring(index);
  }

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

  public static HashSet<
                Character> greekAndBlackLetterChars = new HashSet<Character>(Arrays.asList('ℭ',
                                                                                           'Γ',
                                                                                           'Δ',
                                                                                           'Θ',
                                                                                           'Λ',
                                                                                           'Ξ',
                                                                                           'Π',
                                                                                           'Σ',
                                                                                           'Φ',
                                                                                           'Ψ',
                                                                                           'Ω',
                                                                                           'γ',
                                                                                           'δ',
                                                                                           'θ',
                                                                                           'λ',
                                                                                           'ξ',
                                                                                           'π',
                                                                                           'ς',
                                                                                           'φ',
                                                                                           'ψ',
                                                                                           'ω',
                                                                                           'ϑ',
                                                                                           'ϒ',
                                                                                           'ϖ',
                                                                                           'ϕ',
                                                                                           'ϱ',
                                                                                           'ϰ',
                                                                                           'ζ'));

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
   * "1\u204416" (without spaces) to display 1/16 as a fraction glyph. The rendering  declares the 
   * fraction has ended when it encounters a character that cannot be part of a fraction, i.e. 
   * something that is not an ASCII digit. 
   * 
   * Extending on that, in order to display one and fifteen sixteenths, rather than one hundred 
   * fifteen sixteenths, Any zero-width, invisible character can be used to separate the "1" from 
   * the "15" in an expression such as "15⁄16"  because the rendering engine will declare the fraction 
   * ended when it encounters a symbol such as U+2064 INVISIBLE PLUS, U+200C ZERO WIDTH NON-JOINER, 
   * U+2060 WORD JOINER or other invisible character which produces the same result
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
  static public boolean isAlphabeticalGreekSpecialOrBlackLetter(char ch, boolean digit)
  {
    boolean positiveCheck = isAlphabetical(ch) || isGreekOrBlackLetter(ch) || ch == ⅈ || ch == '√'
                  || ch == '₀' || isSuperscript(ch) || (digit && isDigit(ch));
    boolean negativeCheck = ch != 'Σ';
    return positiveCheck && negativeCheck;
  }

  public static boolean isAlphabetical(int ch)
  {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
  }

  public static boolean isAlphabetical(char ch)
  {
    return isAlphabetical((int) ch);
  }

  public static boolean isSubscript(char ch)
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
                  || greekAndBlackLetterChars.contains(Character.valueOf((char) ch));
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
  public static String transformToJavaAcceptableCharacters(String expression)
  {
    expression = stripInvisibleUnicodeFormattingCharacters(expression.replace("->", "➔")
                                                                     .replace("⇒", "➔")
                                                                     .replace("...", "…")
                                                                     .replace("..", "…")
                                                                     .replaceAll("𝑖", "ⅈ")
                                                                     .replaceAll("I", "ⅈ"));

    for (int i = 0; i < superscripts.length; i++)
    {
      expression = expression.replace(superscripts[i], String.format("^(%s)", normals[i]));
    }

    return Normalizer.normalize(expression, Normalizer.Form.NFD);
  }

  public static String expressionToUniqueClassname(String expression)
  {
    String str = expression.replaceAll("\\.{2,}", "…")
                           .replace(';', ',')
                           .replace(" ", "")
                           // .replace("+", "Plus")
                           // .replace("-", "Minus")
                           // .replace("*", "Times")
                           .replace("/", "⁄")
                           // .replace("^", "ToThePowerOf")
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
                           .replace("[", "［")
                           .replace("]", "］")
                           .replace("➔", "To");
    // .replace("½", "Half"

    if (!str.isEmpty())
    {
      str = (isDigit(str.charAt(0)) ? "_" : "") + str;
    }
    if (str.length() >= 250)
    {
      UUID uuid = UUID.nameUUIDFromBytes(str.getBytes());
      str = uuid.toString().replace("-", "_");
    }
    return str;
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

  public static final String[]           normals                      =
  { "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "α",
    "β",
    "γ",
    "δ",
    "ε",
    "θ",
    "φ",
    "χ" };

  public static final HashSet<Character> superscriptChars             = new HashSet<
                Character>(Arrays.asList(superscripts).stream().map(s -> s.charAt(0)).toList());

  public static boolean isSuperscript(char character)
  {
    return superscriptChars.contains(character);
  }

  public static String subscriptAndSuperscriptsToRegular(String input)
  {
    return input.replace("₀", "0")
                .replace("₁", "1")
                .replace("₂", "2")
                .replace("₃", "3")
                .replace("₄", "4")
                .replace("₅", "5")
                .replace("₆", "6")
                .replace("₇", "7")
                .replace("₈", "8")
                .replace("₉", "9")
                .replace("ₐ", "a")
                .replace("ₑ", "e")
                .replace("ₕ", "h")
                .replace("ᵢ", "i")
                .replace("ⱼ", "j")
                .replace("ₖ", "k")
                .replace("ₗ", "l")
                .replace("ₘ", "m")
                .replace("ₙ", "n")
                .replace("ₒ", "o")
                .replace("ₚ", "p")
                .replace("ᵣ", "r")
                .replace("ₛ", "s")
                .replace("ₜ", "t")
                .replace("ᵤ", "u")
                .replace("ᵥ", "v")
                .replace("ₓ", "x")
                .replace("⁽", "(")
                .replace("⁾", ")");
  }

  public static String toSuperscript(int number)
  {
    StringBuilder result    = new StringBuilder();
    String        numberStr = Integer.toString(number);

    for (int i = 0; i < numberStr.length(); i++)
    {
      result.append(Parser.digitToSuperscript(numberStr.charAt(i)));
    }

    return result.toString();
  }

  public static char digitToSuperscript(char digit)
  {
    switch (digit)
    {
    case '0':
      return '⁰';
    case '1':
      return '¹';
    case '2':
      return '²';
    case '3':
      return '³';
    case '4':
      return '⁴';
    case '5':
      return '⁵';
    case '6':
      return '⁶';
    case '7':
      return '⁷';
    case '8':
      return '⁸';
    case '9':
      return '⁹';
    default:
      throw new IllegalArgumentException("Not a digit: " + digit);
    }
  }

}