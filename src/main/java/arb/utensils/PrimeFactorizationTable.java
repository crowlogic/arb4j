package arb.utensils;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import javax.swing.tree.TreeModel;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PrimeFactorizationTable
{
  public static void
         main(String[] args)
  {
    int n = 100; // You can set this to any positive integer
    generatePrimeFactorizationTable(n);
  }

  /**
   * Create a {@link TreeModel} out of this somehow
   * 
   * @param n
   */
  private static void
          generatePrimeFactorizationTable(int n)
  {
    System.err.println("n | Prime Factorization");
    for (int i = 1; i <= n; i++)
    {
      List<int[]> primeFactorization = primeFactorization(i);
      PrintStream outputStream       = (primeFactorization.size() == 1 && primeFactorization.get(0)[1] == 1) ? System.err : System.out;

      outputStream.println(i + " | " + formatFactors(primeFactorization));

    }
  }

  private static List<int[]>
          primeFactorization(int x)
  {
    List<int[]> factors = new ArrayList<>();
    for (int p = 2; p <= x; p++)
    {
      int count = 0;
      while (x % p == 0)
      {
        x /= p;
        count++;
      }
      if (count > 0)
      {
        factors.add(new int[]
        {
          p, count
        });
      }
    }
    return factors;
  }

  private static String
          formatFactors(List<int[]> factors)
  {
    StringBuilder factorString = new StringBuilder();
    for (int[] factor : factors)
    {
      if (factor[1] > 1)
      {
        factorString.append(factor[0])
                    .append("^")
                    .append(factor[1])
                    .append(" ");
      }
      else
      {
        factorString.append(factor[0])
                    .append(" ");
      }
    }
    return factorString.toString()
                       .trim();
  }
}
