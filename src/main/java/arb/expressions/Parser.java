package arb.expressions;

import java.util.Arrays;
import java.util.HashSet;
import java.util.UUID;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.LiteralConstant;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class Parser
{

  public static double[]        vulgarFractionValues = new double[]
  {
    1.0 / 4.0, 1.0 / 2.0, 3.0 / 4.0, 1.0 / 7.0, 1.0 / 9.0, 1.0 / 10.00, 1.0 / 3.0, 2.0 / 3.0, 1.0 / 3.0, 2.0 / 5.0, 3.0
                                                                                                                    / 5.0,
    4.0 / 5.0, 1.0 / 6.0, 5.0 / 6.0, 1.0 / 8.0, 3.0 / 8.0, 5.0 / 8.0, 7.0 / 8.0
  };

  public static char[]          vulgarFractions      =
  {
    '¼', '½', '¾', '⅐', '⅑', '⅒', '⅓', '⅔', '⅕', '⅖', '⅗', '⅘', '⅙', '⅚', '⅛', '⅜', '⅝', '⅞'
  };

  public static char[]          vulgarFractions2     =
  {
    '½'
  };

  public static char[]          vulgarFractions3     =
  {
    '⅓', '⅔',
  };

  public static char[]          vulgarFractions4     = new char[]
  {
    '¼', '¾'
  };

  public static char[]          vulgarFractions5     = new char[]
  {
    '⅕', '⅖', '⅗', '⅘'
  };

  public static char[]          vulgarFractions6     = new char[]
  {
    '⅙', '⅚'
  };

  public static char[]          vulgarFractions7     = new char[]
  {
    '⅐'
  };

  public static char[]          vulgarFractions8     = new char[]
  {
    '⅛', '⅜', '⅝', '⅞'
  };

  public static char[]          vulgarFractions9     = new char[]
  {
    '⅑'
  };

  public static char[]          vulgarFractions10    = new char[]
  {
    '⅒'
  };

  public static HashSet<String> greekChars           = new HashSet<String>(Arrays.asList("Γ",
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

  public static char
         subscriptedDigitToRegular(char c)
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

  public static String
         stripInvisibleUnicodeFormattingCharacters(String input)
  {
    return input.replaceAll("\\p{Cf}",
                            ""); // Cf is the Unicode category for invisible formatting characters
  }

  /**
   * Checks whether a given character is a digit, a decimal point, or '½'
   * 
   * @param ch The character to check
   * @return true if the character is a digit or a decimal point; false otherwise
   */
  static boolean
         isNumeric(char ch)
  {
    ch = subscriptedDigitToRegular(ch);

    return (ch >= '0'
            && ch <= '9')
           || ch == '.'
           || ch == '½';
  }

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean
         isDigit(int ch)
  {
    return ch >= '0'
           && ch <= '9';
  }

  public static final char ⅈ = LiteralConstant.ⅈ.charAt(0);

  /**
   * Checks whether a given character is a Latin or Greek alphabet character.
   * 
   * @param ch The character to check
   * @return true if the character is a Latin or Greek alphabet character; false
   *         otherwise
   */
  static public boolean
         isLatinGreekOrSpecial(char ch,
                               boolean digit)
  {
    // TODO: support the rest of the alphabet here
    boolean is = isAlphabetical(ch)
                 || isGreek(ch)
                 || ch == ⅈ
                 || ch == '√'
                 || ch == '₀'
                 || ch == 'ⁿ'
                 || (digit
                     && (ch >= '0'
                         && ch <= '9'));
    return is;
  }

  public static boolean
         isAlphabetical(int ch)
  {
    return (ch >= 'a'
            && ch <= 'z')
           || (ch >= 'A'
               && ch <= 'Z');
  }

  public static boolean
         isAlphabetical(char ch)
  {
    return isAlphabetical((int)ch);
  }

  public static boolean
         isAlphabeticalOrNumericSubscript(char ch)
  {
    return SUBSCRIPT_CHARACTERS.contains(ch);
  }

  /**
   * 
   * @param ch
   * @return true if ch represents an upper or lowercase GreekRegistration
   */
  public static boolean
         isGreek(int ch)
  {
    return (ch >= 0x0391
            && ch <= 0x03A9)
           || (ch >= 0x03B1
               && ch <= 0x03C9);
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
  public static String
         replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(String expression)
  {
    expression = stripInvisibleUnicodeFormattingCharacters(expression.replace("->",
                                                                              "➔")
                                                                     .replace("...",
                                                                              "…"));

    for (int i = 0; i < superscripts.length; i++)
    {
      expression = expression.replace(superscripts[i],
                                      caretNormals[i]);
    }

    return expression;
  }

  public static String
         expressionToUniqueClassname(String expression)
  {
    String str = expression.replaceAll("\\.{2,}",
                                       "…")
                           .replace(';',
                                    ',')
                           .replace(" ",
                                    "")
                           .replace("+",
                                    "Plus")
                           .replace("-",
                                    "Minus")
                           .replace("*",
                                    "Times")
                           .replace("/",
                                    "Over")
                           .replace("^",
                                    "ToThePowerOf")
                           .replace(".",
                                    "_")
                           .replace("{",
                                    "Where")
                           .replace("}",
                                    "")
                           .replace("₍",
                                    "")
                           .replace("₎",
                                    "")
                           .replace(">",
                                    "")
                           .replace("=",
                                    "Eq")
                           .replace("ₙ",
                                    "N")
                           .replace("…",
                                    "To")
                           .replace("!",
                                    "Bang")
                           .replace("[",
                                    "{")
                           .replace("]",
                                    "}")
                           .replace("➔",
                                    "")
                           .replace("½",
                                    "Half");
    str = (isDigit(str.charAt(0)) ? "_" : "") + str;
    if (str.length() >= 250)
    {
      UUID uuid = UUID.nameUUIDFromBytes(str.getBytes());
      str = uuid.toString()
                .replace("-",
                         "_");
    }
    return str;
  }

  public static boolean
         isSubscriptedParenthesis(char character)
  {
    return character == '₍'
           || character == '₎';
  }

  public static final HashSet<Character> SUBSCRIPT_CHARACTERS         = new HashSet<Character>(Arrays.asList(
                                                                                                             new Character[]
                                                                                                             {
                                                                                                               '₀', '₁',
                                                                                                               '₂', '₃',
                                                                                                               '₄', '₅',
                                                                                                               '₆', '₇',
                                                                                                               '₈', '₉',
                                                                                                               'ₐ', 'ₑ',
                                                                                                               'ₒ', 'ₓ',
                                                                                                               'ₔ', 'ₕ',
                                                                                                               'ₖ', 'ₗ',
                                                                                                               'ₘ', 'ₙ',
                                                                                                               'ₚ', 'ₛ',
                                                                                                               'ₜ'
                                                                                                             }));

  public static final char[]             SUBSCRIPT_DIGITS_ARRAY       = new char[]
  {
    '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉'
  };

  public static int[]                    lowercaseSuperscriptAlphabet =
  {
    'ᵃ', 'ᵇ', 'ᶜ', 'ᵈ', 'ᵉ', 'ᶠ', 'ᵍ', 'ʰ', 'ⁱ', 'ʲ', 'ᵏ', 'ˡ', 'ᵐ', 'ⁿ', 'ᵒ', 'ᵖ', 0x107A5, 'ʳ', 'ˢ', 'ᵗ', 'ᵘ', 'ᵛ',
    'ʷ', 'ˣ', 'ʸ', 'ᶻ'
  };

  /**
   * Not all uppercase letters have UTF superscript representations
   */
  public static int[]                    uppercaseSuperscriptAlphabet =
  {
    'ᴬ', 'ᴮ', 'ᴰ', 'ᴱ', 'ᴳ', 'ᴴ', 'ᴵ', 'ᴶ', 'ᴷ', 'ᴸ', 'ᴹ', 'ᴺ', 'ᴼ', 'ᴾ', 'ᴿ', 'ᵀ', 'ᵁ', 'ⱽ', 'ᵂ'
  };

  public static final String[]           superscripts                 =
  {
    "ᵃ", "ᵇ", "ᶜ", "ᵈ", "ᵉ", "ᶠ", "ᵍ", "ʰ", "ⁱ", "ʲ", "ᵏ", "ˡ", "ᵐ", "ⁿ", "ᵒ", "ᵖ", String.format("%c",
                                                                                                  0x107A5), "ʳ", "ˢ",
    "ᵗ", "ᵘ", "ᵛ", "ʷ", "ˣ", "ʸ", "ᶻ", "ᵅ", "ᵝ", "ᵞ", "ᵟ", "ᵋ", "ᶿ", "ᵠ", "ᵡ"
  };

  public static final String[]           caretNormals                 =
  {
    "^a", "^b", "^c", "^d", "^e", "^f", "^g", "^h", "^i", "^j", "^k", "^l", "^m", "^n", "^o", "^p", "^q", "^r", "^s",
    "^t", "^u", "^v", "^w", "^x", "^y", "^z", "^α", "^β", "^γ", "^δ", "^ε", "^θ", "^φ", "^χ"
  };

  public static final HashSet<Character> superscriptChars             = new HashSet<Character>(Arrays.asList(
                                                                                                             superscripts)
                                                                                                     .stream()
                                                                                                     .map(s -> s.charAt(0))
                                                                                                     .toList());

  public static boolean
         isAlphabeticalSuperscript(char character)
  {
    return superscriptChars.contains(character);
  }

}