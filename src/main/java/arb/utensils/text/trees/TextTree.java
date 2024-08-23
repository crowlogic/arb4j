package arb.utensils.text.trees;

import java.io.PrintStream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTree<N>
{

  private TreeModel<N>       model;
  private boolean       showRoot = true;
  private StringBuilder sb;

  public TextTree(TreeModel<N> model)
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
    sb = new StringBuilder("\n");
    N root = model.getRoot();
    printNode(root, "", "", showRoot);
    return sb.toString();
  }

  /**
   * TODO: extend this so that instead of the generic \ character, actually put
   * the character that is represented by the operation joining the two nodes that
   * this conjunctive operation represents
   * 
   * @param node
   * @param prefix
   * @param bud
   * @param render
   */
  public void printNode(N node, String prefix, String bud, boolean render)
  {
    if (render)
    {
      sb.append(prefix);
      sb.append(bud);
      sb.append("━━ ");
      sb.append(node.toString());
      sb.append("\n");
    }
    String lastPrefix        = prefix + "   ";
    String innerPrefix       = prefix + "   ┃";
    String notRenderedPrefix = prefix + "";
    int    childCount        = model.getNodeCount(node);
    String indentation;
    String thisBud;

    for (int i = 0; i < childCount; i++)
    {
      if (i == childCount - 1)
      {
        indentation = lastPrefix;
        thisBud     = String.valueOf(model.getNodeSymbol(node));
      }
      else
      {
        indentation = innerPrefix;
        thisBud     = "";
      }
      String renderedPrefix = render ? indentation : notRenderedPrefix;
      String renderedBud    = render ? thisBud : "";
      printNode(model.getNode(node, i), renderedPrefix, renderedBud, true);
    }

  }

}
