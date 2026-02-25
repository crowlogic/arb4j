package arb.expressions;

import java.text.Normalizer;
import java.util.*;

import arb.Fraction;
import arb.FractionConstants;
import arb.exceptions.CompilerException;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Parser
{
  public static String removeIndependentVariableSpecification(String expression)
  {
    int index = expression.indexOf('ⅈ');
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

  public static HashSet<Character> greekAndBlackLetterChars =
                                                            new HashSet<Character>(Arrays.asList('ℭ',
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
   * "1⁄16" to display 1/16 as a fraction glyph. The rendering declares the
   * fraction has ended when it encounters a character that cannot be part of a
   * fraction, i.e. something that is not an ASCII digit.
   *
   * Any zero-width, invisible character can be used to separate the "1" from the
   * "15" in an expression such as "15⁄16" because the rendering engine will
   * declare the fraction ended when it encounters a symbol such as U+2064
   * INVISIBLE PLUS, U+200C ZERO WIDTH NON-JOINER, U+2060 WORD JOINER or other
   * invisible character which produces the same result.
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
   * Checks whether a given character is a digit, a decimal point, or a fraction
   * glyph.
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
   * Checks whether a given character is a digit.
   *
   * @param ch The character to check
   * @return true if the character is a digit; false otherwise
   */
  static public boolean isDigit(int ch)
  {
    return ch >= '0' && ch <= '9';
  }

  /**
   * Checks whether a given code point is an identifying character for the
   * expression parser. Accepts {@code int} code points to support supplementary
   * Unicode characters such as U+107A5 (𐞥 MODIFIER LETTER SMALL Q).
   *
   * @param codePoint the Unicode code point to check
   * @param digit     whether digits should be accepted as identifying characters
   * @return true if the code point is an identifying character; false otherwise
   */
  static public boolean isIdentifyingCharacter(int codePoint, boolean digit)
  {
    boolean positiveCheck = isAlphabetical(codePoint) || isGreekOrBlackLetter(codePoint)
                  || codePoint == 'ⅈ' || codePoint == '√' || codePoint == '₀'
                  || isSuperscriptLetter(codePoint) || (digit && isDigit(codePoint))
                  || '_' == codePoint;
    boolean negativeCheck = codePoint != 'Σ';
    return positiveCheck && negativeCheck;
  }

  public static boolean isAlphabetical(int ch)
  {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
  }

  public static boolean isAlphabeticalLetter(char ch)
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
   * @return true if ch represents an upper or lowercase Greek or blackletter
   *         character
   */
  public static boolean isGreekOrBlackLetter(int ch)
  {
    return (ch >= 0x0391 && ch <= 0x03A9) || (ch >= 0x03B1 && ch <= 0x03C9) || (ch <= 0xFFFF
                  && greekAndBlackLetterChars.contains(Character.valueOf((char) ch)));
  }

  // -----------------------------------------------------------------------
  // Superscript run collapsing
  // -----------------------------------------------------------------------

  /**
   * Maps every superscript character that may appear <em>within</em> a run to its
   * normal equivalent. Covers:
   * <ul>
   * <li>Superscript letters (from {@link #superscripts} / {@link #normals})</li>
   * <li>Superscript digits ⁰–⁹ (may continue a letter-started run, e.g.
   * {@code tⁿ⁻¹} → {@code t^(n-1)})</li>
   * <li>Superscript operators ⁺ (U+207A) and ⁻ (U+207B)</li>
   * </ul>
   * Digits and operators are intentionally absent from
   * {@link #SUPERSCRIPT_RUN_STARTERS}: they can only continue a run, not start
   * one. This preserves the parser's existing direct handling of bare {@code ⁻¹}
   * sequences as multiplicative / compositional inverse notation.
   */
  public static final HashMap<String, String> SUPERSCRIPT_TO_NORMAL    = new HashMap<>();

  /**
   * Subset of {@link #SUPERSCRIPT_TO_NORMAL} keys that are allowed to
   * <em>start</em> a superscript run: superscript letters only.
   * <p>
   * Superscript digits and operators ({@code ⁺ ⁻}) may <em>continue</em> a run
   * but must not start one. This ensures that a bare {@code ⁻¹} after a regular
   * character (e.g. {@code a⁻¹} or {@code f⁻¹(x)}) is left untouched for the
   * parser's dedicated inverse-notation logic.
   */
  public static final HashSet<String>         SUPERSCRIPT_RUN_STARTERS = new HashSet<>();

  static
  {

    // Superscript digits — continue a run but cannot start one.
    // Left absent from SUPERSCRIPT_RUN_STARTERS so that bare ⁻¹ sequences
    // (e.g. a⁻¹, f⁻¹(x)) pass through to the parser unchanged.
    SUPERSCRIPT_TO_NORMAL.put("⁰", "0");
    SUPERSCRIPT_TO_NORMAL.put("¹", "1");
    SUPERSCRIPT_TO_NORMAL.put("²", "2");
    SUPERSCRIPT_TO_NORMAL.put("³", "3");
    SUPERSCRIPT_TO_NORMAL.put("⁴", "4");
    SUPERSCRIPT_TO_NORMAL.put("⁵", "5");
    SUPERSCRIPT_TO_NORMAL.put("⁶", "6");
    SUPERSCRIPT_TO_NORMAL.put("⁷", "7");
    SUPERSCRIPT_TO_NORMAL.put("⁸", "8");
    SUPERSCRIPT_TO_NORMAL.put("⁹", "9");

    // Superscript operators — continue a run but cannot start one
    SUPERSCRIPT_TO_NORMAL.put("\u207A", "+"); // ⁺ U+207A SUPERSCRIPT PLUS SIGN
    SUPERSCRIPT_TO_NORMAL.put("\u207B", "-"); // ⁻ U+207B SUPERSCRIPT MINUS
  }

  /**
   * Scans {@code expression} for contiguous superscript runs and collapses each
   * into a single {@code ^(...)} exponent group with normalized characters.
   * <p>
   * A run starts only on a superscript <em>letter</em> (present in
   * {@link #SUPERSCRIPT_RUN_STARTERS}). Once started, the run extends through any
   * adjacent superscript letter, digit, or operator present in
   * {@link #SUPERSCRIPT_TO_NORMAL}.
   * <p>
   * Superscript digits and the operators {@code ⁺} / {@code ⁻} cannot start a
   * run. Consequently, bare sequences such as {@code a⁻¹} or {@code f⁻¹(x)} pass
   * through this method unchanged and are handled by the parser's dedicated
   * inverse-notation logic.
   *
   * <pre>
   * tᵖ⁺𐞥   →  t^(p+q)
   * tⁿ⁻¹   →  t^(n-1)
   * tⁿ     →  t^(n)
   * a⁻¹    →  a⁻¹      (unchanged — parser handles as multiplicative inverse)
   * f⁻¹(x) →  f⁻¹(x)   (unchanged — parser handles as compositional inverse)
   * t²     →  t²        (unchanged — parseSuperscripts handles at parse time)
   * </pre>
   *
   * @param expression raw expression string after arrow/ellipsis substitution
   * @return expression with all letter-started superscript runs replaced by
   *         {@code ^(...)}
   */
  public static String collapseSuperscriptRuns(String expression)
  {
    StringBuilder result = new StringBuilder();
    int           len    = expression.length();
    int           i      = 0;

    while (i < len)
    {
      int    cp    = expression.codePointAt(i);
      String cpStr = new String(Character.toChars(cp));

      if (SUPERSCRIPT_RUN_STARTERS.contains(cpStr))
      {
        // A superscript letter starts the run. Accumulate letters, digits,
        // and operators until we hit a character not in SUPERSCRIPT_TO_NORMAL.
        StringBuilder run = new StringBuilder();
        while (i < len)
        {
          cp    = expression.codePointAt(i);
          cpStr = new String(Character.toChars(cp));
          String normal = SUPERSCRIPT_TO_NORMAL.get(cpStr);
          if (normal != null)
          {
            run.append(normal);
            i += Character.charCount(cp);
          }
          else
          {
            break;
          }
        }
        result.append("^(").append(run).append(")");
      }
      else
      {
        result.appendCodePoint(cp);
        i += Character.charCount(cp);
      }
    }
    return result.toString();
  }

  /**
   * Replaces the two character ASCII arrow version -> with ➔ used to declare the
   * independent variable or declare a multivariate function "(n,x)➔n*x". Also
   * replaces ... with …
   * <p>
   * Superscript letter-started runs (optionally containing superscript digits and
   * operators ⁺ ⁻) are collapsed into a single {@code ^(...)} group via
   * {@link #collapseSuperscriptRuns(String)}. Bare {@code ⁻¹} sequences not
   * preceded by a superscript letter are left untouched for the parser's
   * dedicated inverse-notation handling.
   *
   * @param expression The expression to transform.
   * @return The expression with the described substitutions made.
   */
  public static String transformToJavaAcceptableCharacters(String expression)
  {
    if ( expression == null )
    {
      return null;
    }
    expression = stripInvisibleUnicodeFormattingCharacters(expression.replace("->", "➔")
                                                                     .replace("⇒", "➔")
                                                                     .replace("⇒", "➔")
                                                                     .replace("→", "➔")
                                                                     .replace("...", "…")
                                                                     .replace("..", "…")
                                                                     .replaceAll("𝑖", "ⅈ")
                                                                     .replaceAll("I", "ⅈ"));

    expression = collapseSuperscriptRuns(expression);

    return Normalizer.normalize(expression, Normalizer.Form.NFD);
  }

  public static String hashString(String str)
  {
    str = str.replaceAll("\\.{2,}", "…")
             .replace(';', ',')
             .replace(" ", "")
             .replace("/", "⁄")
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

    if (!str.isEmpty())
    {
      str = (isDigit(str.charAt(0)) ? "_" : "") + str;
    }
    {
      return str;
    }
  }

  public static final HashSet<Character> SUBSCRIPT_CHARACTERS         =
                                                              new HashSet<Character>(Arrays.asList('₀',
                                                                                                   '₁',
                                                                                                   '₂',
                                                                                                   '₃',
                                                                                                   '₄',
                                                                                                   '₅',
                                                                                                   '₆',
                                                                                                   '₇',
                                                                                                   '₈',
                                                                                                   '₉',
                                                                                                   'ₐ',
                                                                                                   'ₑ',
                                                                                                   'ₒ',
                                                                                                   'ₓ',
                                                                                                   'ₔ',
                                                                                                   'ₕ',
                                                                                                   'ₖ',
                                                                                                   'ₗ',
                                                                                                   'ₘ',
                                                                                                   'ₙ',
                                                                                                   'ₚ',
                                                                                                   'ₛ',
                                                                                                   'ₜ'));

  public static final char[]             SUPERSCRIPT_DIGITS_ARRAY     = new char[]
  { '⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹' };

  public static final char[]             SUBSCRIPT_DIGITS_ARRAY       = new char[]
  { '₀', '₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉' };

  public static final char[]             SUBSCRIPT_CHARACTERS_ARRAY   =
  { 'ₐ', 'ₑ', 'ₒ', 'ₓ', 'ₔ', 'ₕ', 'ₖ', 'ₗ', 'ₘ', 'ₙ', 'ₚ', 'ₛ', 'ₜ' };

  /**
   * Lowercase superscript alphabet as {@code String[]} to support supplementary
   * Unicode characters such as U+107A5 (𐞥 MODIFIER LETTER SMALL Q) which cannot
   * be stored in a {@code char}.
   */
  public static String[]                 lowercaseSuperscriptAlphabet =
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
    "\uD801\uDFA5",                                                                                      // 𐞥
                                                                                                         // U+107A5
                                                                                                         // MODIFIER
                                                                                                         // LETTER
                                                                                                         // SMALL
                                                                                                         // Q
    "ʳ",
    "ˢ",
    "ᵗ",
    "ᵘ",
    "ᵛ",
    "ʷ",
    "ˣ",
    "ʸ",
    "ᶻ" };

  public static final HashSet<Character> lowercaseSubscriptAlphabet   =
                                                                    new HashSet<>(Arrays.asList('ₐ',
                                                                                                'ₑ',
                                                                                                'ₒ',
                                                                                                'ₓ',
                                                                                                'ₔ',
                                                                                                'ₕ',
                                                                                                'ₖ',
                                                                                                'ₗ',
                                                                                                'ₘ',
                                                                                                'ₙ',
                                                                                                'ₚ',
                                                                                                'ₛ',
                                                                                                'ₜ'));

  /**
   * Not all uppercase letters have UTF superscript representations. Widened to
   * {@code String[]} for consistency with the supplementary character support in
   * the rest of the parser.
   */
  public static String[]                 uppercaseSuperscriptAlphabet =
  { "ᴬ",
    "ᴮ",
    "ꟲ",
    "ᴰ",
    "ᴱ",
    "ᴳ",
    "ᴴ",
    "ᴵ",
    "ᴶ",
    "ᴷ",
    "ᴸ",
    "ᴹ",
    "ᴺ",
    "ᴼ",
    "ᴾ",
    "ᴿ",
    "ᵀ",
    "ᵁ",
    "ⱽ",
    "ᵂ" };

  /**
   * Superscript letters as {@code String[]} to support supplementary Unicode
   * characters. U+107A5 (𐞥 MODIFIER LETTER SMALL Q) is inserted between ᵖ and ʳ
   * at the position corresponding to 'q' in the Latin alphabet.
   */
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
    "\uD801\uDFA5",                                                                                      // 𐞥
                                                                                                         // U+107A5
                                                                                                         // MODIFIER
                                                                                                         // LETTER
                                                                                                         // SMALL
                                                                                                         // Q
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

  /**
   * Normal (base) letter equivalents corresponding 1:1 to {@link #superscripts}.
   * "q" is inserted between "p" and "r" to match the 𐞥 superscript entry.
   */
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

  static
  {
    // Superscript letters — may start AND continue a run
    for (int i = 0; i < superscripts.length; i++)
    {
      SUPERSCRIPT_TO_NORMAL.put(superscripts[i], normals[i]);
      SUPERSCRIPT_RUN_STARTERS.add(superscripts[i]); // letters only
    }
  }

  /**
   * Set of all superscript letter strings for fast membership lookup. Uses
   * {@code String} rather than {@code Character} to support supplementary Unicode
   * characters.
   */
  public static final HashSet<String> superscriptChars = new HashSet<>(Arrays.asList(superscripts));

  /**
   * Tests whether the given Unicode code point is a superscript letter. Accepts
   * {@code int} to support supplementary characters like U+107A5 (𐞥).
   *
   * @param codePoint the Unicode code point to test
   * @return true if the code point represents a superscript letter
   */
  public static boolean isSuperscriptLetter(int codePoint)
  {
    return superscriptChars.contains(new String(Character.toChars(codePoint)));
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
    String        numberStr = java.lang.Integer.toString(number);

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

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         parse(String className,
               String expressionString,
               Context context,
               Class<? extends D> domainClass,
               Class<? extends R> coDomainClass,
               Class<? extends F> functionClass,
               String functionName)
  {
    return parseExpression(className,
                           expressionString,
                           context,
                           domainClass,
                           coDomainClass,
                           functionClass,
                           functionName,
                           null,
                           true);
  }

  public static <D,
                C,
                F extends Function<? extends D, ? extends C>,
                PD,
                PC,
                PF extends Function<? extends PD, ? extends PC>>
         Expression<D, C, F>
         parseExpression(String className,
                         String expression,
                         Context context,
                         Class<? extends D> domainClass,
                         Class<? extends C> coDomainClass,
                         Class<? extends F> functionClass,
                         String functionName,
                         Expression<? extends PD, ? extends PC, ? extends PF> containingExpression,
                         boolean simplify)
  {
    int punctuationMarkIndex = expression.indexOf(":");
    if (punctuationMarkIndex != -1)
    {
      String inlineFunctionName = expression.substring(0, punctuationMarkIndex);
      if (functionName != null && !functionName.equals(inlineFunctionName))
      {
        throw new CompilerException(String.format("functionName='%s' specified via function argument != inlineFunctionName='%s'",
                                                  functionName,
                                                  inlineFunctionName));
      }
      functionName = inlineFunctionName;

      expression   = expression.substring(punctuationMarkIndex + 1, expression.length());
    }

    var expr = new Expression<D, C, F>(className,
                                       domainClass,
                                       coDomainClass,
                                       functionClass,
                                       expression,
                                       context,
                                       functionName,
                                       containingExpression);

    return expr.parse(simplify);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         parse(String expression,
               Context context,
               Class<? extends D> domainClass,
               Class<? extends R> coDomainClass,
               Class<? extends F> functionClass,
               String functionName)
  {
    String className = functionName != null ? functionName : hashString(expression);
    return parse(className,
                 expression,
                 context,
                 domainClass,
                 coDomainClass,
                 functionClass,
                 functionName);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         parse(String className,
               String expression,
               Context context,
               Class<? extends D> domainClass,
               Class<? extends R> coDomainClass,
               Class<? extends F> functionClass,
               boolean verbose)
  {
    return parse(className,
                 expression,
                 context,
                 domainClass,
                 coDomainClass,
                 functionClass,
                 className);
  }
}
