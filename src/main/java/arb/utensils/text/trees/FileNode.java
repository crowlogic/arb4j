package arb.utensils.text.trees;

import java.io.File;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FileNode
{
  File f;

  public FileNode(File f)
  {
    this.f = f;
  }

  @Override
  public String toString()
  {
    String s = f.getName();
    if (f.isDirectory())
    {
      s += "/";
    }
    return s;
  }
}
