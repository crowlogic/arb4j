package arb.expressions;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import arb.utensils.Utensils;

/**
 * A class to organize a set of {@link SerializedExpression}s in a dir
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class Catalog
{

  List<Path> files;

  public static void main(String args[])
  {
    var catalog = new Catalog();
  }

  public Catalog()
  {
    try
    {
      files = new ArrayList<>(Files.list(Path.of("expressions"))
                                   .filter(file -> file.toString().endsWith(".yaml"))
                                   .toList());
      files.sort((a, b) -> a.toString().compareTo(b.toString()));
    }
    catch (IOException e)
    {
      Utensils.throwOrWrap(e);
    }
    for (Path file : files)
    {
      System.out.println("File: " + file);
    }
  }

}
