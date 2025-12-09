package arb.utensils.text.trees;

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
public class FileTreeModel implements
                           TreeModel<FileNode>
{

  FileNode root;

  public FileTreeModel(File root)
  {
    this.root = new FileNode(root);
  }

  @Override
  public FileNode getRoot()
  {
    return root;
  }

  @Override
  public FileNode getNode(FileNode parent, int index)
  {
    FileNode fsObject = (FileNode) parent;
    File[]   files    = fsObject.f.listFiles();
    return new FileNode(files[index]);
  }

  @Override
  public int getNodeCount(FileNode parent)
  {
    FileNode fsObject = (FileNode) parent;
    if (!fsObject.f.isDirectory())
    {
      return 0;
    }
    return fsObject.f.list().length;
  }

  @Override
  public boolean isLeaf(FileNode node)
  {
    FileNode fsObject = (FileNode) node;
    return !fsObject.f.isDirectory();
  }

  @Override
  public char getNodeSymbol(FileNode node)
  {
    return '`';
  }

}
