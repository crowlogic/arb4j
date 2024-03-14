package arb.utensils.treetext;

import java.io.File;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
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

  @Override
  public int getNodeIndex(FileSystemTreeNode parent, FileSystemTreeNode child)
  {
    return 0;
  }

}
