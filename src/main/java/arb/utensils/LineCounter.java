package arb.utensils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LineCounter
{
  public static void main(String[] args) throws IOException
  {
    long count = Files.walk(Paths.get(System.getProperty("user.home") + "/git/arb4j")).filter(p -> p.toString().endsWith(".java")).filter(p ->
    {
      try
      {
        boolean filtered = Files.lines(p)
                                .noneMatch(line -> line.contains("This file was automatically generated by SWIG"));
      
        return filtered;
      }
      catch (IOException e)
      {
        return false;
      }
    }).mapToLong(p ->
    {
      try
      {
        return Files.lines(p).count();
      }
      catch (IOException e)
      {
        return 0;
      }
    }).sum();

    System.out.println("Total Java lines (excluding SWIG files): " + count);
  }
}
