package arb.expressions;

import arb.functions.real.BesselFunctionOfTheFirstKind;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
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
  public static boolean isPowerCharacter(int ch)
  {
    return ch == '^' || ch == '⁰' || ch == '¹' || ch == '²' || ch == '³' || (ch >= '⁴' && ch <= '⁹');
  }

  /**
   * Replaces UTF subscripts ₀-₉ with 0-9, so that J₀ can be parsed as a
   * {@link BesselFunctionOfTheFirstKind} and other similar expressions likewise
   * 
   * @param expression
   * 
   * @return expression with 0-9 substituted in place of ₀-₉
   */
  public static String replaceSubscripts(String expression)
  {
    return expression.replace('₀', '0')
                     .replace('₁', '1')
                     .replace('₂', '2')
                     .replace('₃', '3')
                     .replace('₄', '4')
                     .replace('₅', '5')
                     .replace('₆', '6')
                     .replace('₇', '7')
                     .replace('₈', '8')
                     .replace('₉', '9');
  }

  static String expressionToUniqueClassname(String expression)
  {
    return expression.replace(" ", "")
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
                     .replace("➔", "");
  }

}
