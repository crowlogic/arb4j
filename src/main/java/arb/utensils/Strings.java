package arb.utensils;

import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Convenience methods that help with operations on strings.
 * 
 * @author Udo Hoefel
 */
public final class Strings
{

  /** Hiding any public constructor. */
  private Strings()
  {
    throw new IllegalStateException("This is a pure utility class!");
  }

  /** Non-breakable space. This is removed via {@link String#trim()}. */
  public static final String    NON_BREAKABLE_SPACE       = " ";

  /**
   * Non-breakable small space. Be aware that this is <em>not</em> removed via
   * {@link String#trim()}.
   */
  public static final String    SMALL_NON_BREAKABLE_SPACE = "\u202F";

  /** Helper array to optimize {@link #ordinalNumeral(int)}. */
  private static final String[] ORDINAL_NUMERAL           =
  { "th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th" };

  /**
   * Gets the ordinal numeral (i.e., for 1 you would get a "1st", for 2 you would
   * get a "2nd", for 3 a "3rd" and so on).
   * 
   * @param i the number
   * @return the corresponding ordinal numeral
   */
  public static final String ordinalNumeral(int i)
  {
    return switch (i % 100)
    {
    case 11, 12, 13 -> i + "th";
    default -> i + ORDINAL_NUMERAL[i % 10];
    };
  }

  /**
   * Capitalizes the first letter of a string.
   * 
   * @param str the string, e.g. "car"
   * @return the capitalized string, e.g. "Car"
   */
  public static final String capitalize(String str)
  {
    return str.substring(0, 1).toUpperCase(Locale.ENGLISH) + str.substring(1);
  }

  /**
   * Puts the given strings into a map (as keys, the values are empty Strings).
   * 
   * @param strs the to-be keys for the map
   * @return a map with the given strings as keys and empty strings as values
   */
  public static final Map<String, String> mapOf(String... strs)
  {
    return Stream.of(strs).filter(Objects::nonNull).collect(Collectors.toMap(s -> s, s -> ""));
  }

  /**
   * Trims <em>all</em> surrounding space, including small non-breakable spaces.
   * 
   * @param s the string to trim
   * @return the trimmed space
   */
  public static final String trim(String s)
  {
    return Regexes.ALL_SURROUNDING_SPACE.matcher(s).replaceAll("");
  }
}
