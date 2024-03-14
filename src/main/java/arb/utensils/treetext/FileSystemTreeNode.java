package arb.utensils.treetext;

import java.io.File;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FileSystemTreeNode
{
  File f;

  public FileSystemTreeNode(File f)
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
