package arb.utensils;

import java.util.Random;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RandomJibberishGenerator
{

  // Generates a random string of a given length
  private static String generateRandomString(int length)
  {
    String        characters = "abcdefghijklmnopqrstuvwxyz";
    StringBuilder result     = new StringBuilder();
    Random        random     = new Random();
    for (int i = 0; i < length; i++)
    {
      result.append(characters.charAt(random.nextInt(characters.length())));
    }
    return result.toString();
  }

  // Generates random jibberish in the specified format
  public static String generateJibberish()
  {
    String name        = generateRandomString(8);  // Generate a random name
    String surname     = generateRandomString(10); // Generate a random surname
    String emailUser   = generateRandomString(10); // Generate a random email username
    String emailDomain = generateRandomString(10); // Generate a random email domain
    return name + " " + surname + " <" + emailUser + "@" + emailDomain + ".com>";
  }

  public static void main(String[] args)
  {
    System.out.println(generateJibberish());
    System.out.println(generateJibberish());

  }
}
