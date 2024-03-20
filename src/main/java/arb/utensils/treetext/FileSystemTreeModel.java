package arb.utensils.treetext;

import java.io.File;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * The node is not supposed to be any specific type, so you could make Trees out
 * of classes that cant be extended or whatever
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FileSystemTreeModel implements
                                 Tree<FileSystemTreeNode>
{

  FileSystemTreeNode root;

  public FileSystemTreeModel(File root)
  {
    this.root = new FileSystemTreeNode(root);
  }

  @Override
  public FileSystemTreeNode getRoot()
  {
    return root;
  }

  @Override
  public FileSystemTreeNode getNode(FileSystemTreeNode parent, int index)
  {
    FileSystemTreeNode fsObject = (FileSystemTreeNode) parent;
    File[]             files    = fsObject.f.listFiles();
    return new FileSystemTreeNode(files[index]);
  }

  @Override
  public int getNodeCount(FileSystemTreeNode parent)
  {
    FileSystemTreeNode fsObject = (FileSystemTreeNode) parent;
    if (!fsObject.f.isDirectory())
    {
      return 0;
    }
    return fsObject.f.list().length;
  }

  @Override
  public boolean isLeaf(FileSystemTreeNode node)
  {
    FileSystemTreeNode fsObject = (FileSystemTreeNode) node;
    return !fsObject.f.isDirectory();
  }


}
