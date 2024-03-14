package arb.utensils.treetext;

import java.io.File;

import javax.swing.tree.TreeModel;

import org.junit.Test;

import arb.utensils.treetext.FileSystemTreeModel;
import arb.utensils.treetext.FileSystemTreeNode;
import arb.utensils.treetext.TextTree;
import junit.framework.TestCase;

/**
 * 
 * @author Daniel Orr
 * 
 */
public class TextTreeTest extends TestCase
{

  public void testPrintTree()
  {
    var tm = new FileSystemTreeModel(new File("./target"));
    TextTree <FileSystemTreeNode> tt = new TextTree(tm);
    System.out.println(tt);
  }

}
