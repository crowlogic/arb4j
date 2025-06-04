package arb.utensils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Objects;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.zip.ZipInputStream;

/**
 * Input/Output convenience methods.
 * 
 * @author Udo Hoefel
 */
public final class IOs
{

  /** Hiding any public constructor. */
  private IOs()
  {
    throw new IllegalStateException("This is a pure utility class!");
  }

  /**
   * Creates the directory if necessary/possible.
   * 
   * @param directory the directory to create
   */
  public static final void mkdir(String directory)
  {
    File f = new File(directory);
    if (f.isDirectory() && f.exists())
      return;

    if (!f.mkdir() && !f.isDirectory() || !f.exists())
    {
      throw new IllegalAccessError("Directory '" + f.getParent() + "' does not exist and we cannot create it.");
    }
  }

  /**
   * Writes the specified text to the specified file.
   * 
   * @param file the file to write to
   * @param text the text to write
   */
  public static final void writeToFile(File file, String text)
  {
    mkdir(file.getParent());
    try ( FileOutputStream fOut = new FileOutputStream(file.getAbsoluteFile()))
    {
      fOut.write(text.getBytes(StandardCharsets.UTF_8));
    }
    catch (IOException e)
    {
      throw new UncheckedIOException(e);
    }
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
   * Gets the specified input stream from the resources.
   * 
   * @param fileName the resource to find
   * @param clazz    the class of which to get the resources
   * @return the input stream of the file
   */
  public static final String getStringFromResources(String fileName, Class<?> clazz)
  {
    return getStringFromResourceLocation("src/main/resources/", fileName, clazz);
  }

  /**
   * Gets the specified input stream from the test resources.
   * 
   * @param fileName the resource to find
   * @param clazz    the class of which to get the resources
   * @return the input stream of the file
   */
  public static final String getStringFromTestResources(String fileName, Class<?> clazz)
  {
    return getStringFromResourceLocation("src/test/resources/", fileName, clazz);
  }

  /**
   * Gets the specified input stream from the resources (particularly, one can
   * choose between the src/main/resources/ and src/test/resources/).
   * 
   * @param resource the folder in which to look for the resource
   * @param fileName the resource to find
   * @param clazz    the class of which to get the resources
   * @return the content of the file
   */
  public static final String getStringFromResourceLocation(String resource, String fileName, Class<?> clazz)
  {
    // loading from within jar - not sure if this still works with modularization?
    try ( InputStream is = clazz.getResourceAsStream(resource + fileName))
    {
      if (is == null)
      {
        // loading within editor (e.g. eclipse)
        String folder = new File(resource + clazz.getPackage().getName()).getAbsolutePath().replace(".", "/") + "/";
        try ( InputStream is2 = new FileInputStream(folder + fileName))
        {
          return readStream(is2, fileName);
        }
      }
      return readStream(is, fileName);
    }
    catch (IOException e)
    {
      throw new UncheckedIOException("Found no file with that filename!",
                                     e);
    }
  }

  /**
   * Reads the stream.
   * 
   * @param is       the input stream
   * @param fileName the filename
   * @return the string as read from the stream
   * @throws IOException if the filename is a zip-file and there is an issue with
   *                     getting the next entry
   */
  public static final String readStream(InputStream is, String fileName) throws IOException
  {
    if (fileName.endsWith(".zip"))
    {
      is = new ZipInputStream(is);
      ((ZipInputStream) is).getNextEntry();
    }

    StringBuilder textBuilder = new StringBuilder();
    try ( Scanner sc = new Scanner(is))
    {
      while (sc.hasNextLine())
      {
        textBuilder.append(sc.nextLine() + "\n");
      }
      return textBuilder.toString();
    }
  }
}
