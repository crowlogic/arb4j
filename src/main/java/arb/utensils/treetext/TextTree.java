package arb.utensils.treetext;

import java.io.PrintStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTree<N>
{

  private Tree<N>       model;
  private boolean       showRoot = true;
  private StringBuilder sb;

  public TextTree(Tree<N> model)
  {
    this.model = model;
  }

  /**
   * @return <code>true</code> if this tree is set to show the root.
   */
  public boolean isShowRoot()
  {
    return showRoot;
  }

  /**
   * Sets wether to show the root node or not.
   * 
   * @param showRoot
   */
  public void setShowRoot(boolean showRoot)
  {
    this.showRoot = showRoot;
  }

  /**
   * Prints this tree to <code>System.out</code>.
   */
  public void printTree()
  {
    System.out.println(toString());
  }

  /**
   * Prints this tree to the given stream.
   * 
   * @param printStream
   */
  public void printTree(PrintStream printStream)
  {
    printStream.println(toString());
  }

  @Override
  public String toString()
  {
    sb = new StringBuilder();
    N root = model.getRoot();
    printNode(root, "", "", showRoot);
    return sb.toString();
  }

  private void printNode(N node, String pref, String bud, boolean render)
  {
    if (render)
    {
      sb.append(pref);
      sb.append(bud);
      sb.append("-- ");
      sb.append(node.toString());
      sb.append("\n");
    }
    String pref1      = pref + "   ";
    String pref2      = pref + "   |";
    String pref3      = pref + "";
    int    childCount = model.getNodeCount(node);
    String ind;
    String bud2;
    if (childCount > 0)
    {
      for (int i = 0; i < childCount; i++)
      {
        boolean lastElement = i == childCount - 1;
        if (lastElement)
        {
          ind  = pref1;
          bud2 = "`";
        }
        else
        {
          ind  = pref2;
          bud2 = "";
        }
        printNode(model.getNode(node, i), !render ? pref3 : ind, !render ? "" : bud2, true);
      }
    }
  }

}
