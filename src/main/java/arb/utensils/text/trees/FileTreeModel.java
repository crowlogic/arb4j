package arb.utensils.text.trees;

import java.io.File;
import java.io.FilenameFilter;
import java.util.Arrays;

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
  FilenameFilter filter = (dir, name) -> !name.startsWith(".");

  @Override
  public FileNode getNode(FileNode fileNode, int index)
  {
    File[]   files    = fileNode.f.listFiles(filter);
    Arrays.sort(files, (a, b) -> a.getAbsolutePath().compareTo(b.getAbsolutePath()));

    return new FileNode(files[index]);
  }

  @Override
  public int getNodeCount(FileNode fileNode)
  {
    if (!fileNode.f.isDirectory())
    {
      return 0;
    }
    return fileNode.f.listFiles(filter).length;
  }

  @Override
  public boolean isLeaf(FileNode node)
  {
    return !node.f.isDirectory();
  }

  @Override
  public char getNodeSymbol(FileNode node)
  {
    return '`';
  }

}
