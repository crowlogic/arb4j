package arb.utensils.text.trees;

import static arb.utensils.Utensils.throwOrWrap;

import java.io.PrintStream;
import java.lang.reflect.Field;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.ExpressionTree;
import arb.expressions.nodes.Node;
import arb.utensils.Utensils;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TextTree<N>
{

  private TreeModel<N>  tree;
  private boolean       showRoot = true;
  private StringBuilder sb;
  public Object         instance;

  public TextTree(TreeModel<N> tree)
  {
    this.tree = tree;
  }

  public TextTree(TreeModel<N> tree, Object f)
  {
    this.tree     = tree;
    this.instance = f;
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

    N root = tree.getRoot();
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
      if (node instanceof Node arbNode)
      {
        sb.append(node.toString() + "=");
        String fieldName = arbNode.getFieldName();
        if (fieldName == null)
        {
          if (tree instanceof ExpressionTree syntax)
          {
            System.err.println("fieldName is null for " + node + " " + syntax);

          }

        }

        sb.append(fieldName);

        try
        {
          String intermediateValueFieldName = arbNode.getFieldName();
          if (intermediateValueFieldName != null)
          {
            Field field;
            try
            {
              if (instance != null)
              {
                field = instance.getClass().getField(intermediateValueFieldName);
                field.setAccessible(true);
                sb.append("=" + field.get(instance));
              }
            }
            catch (NoSuchFieldException e)
            {
            }
          }
        }
        catch (SecurityException | IllegalArgumentException | IllegalAccessException e)
        {
          System.err.println(Utensils.stackTraceToString(e));
          System.err.flush();
          throwOrWrap(e);
        }
      }
      else
      {
        throw new RuntimeException(node + " is not a Node");
      }
      sb.append("\n");
    }
    String lastPrefix        = prefix + "   ";
    String innerPrefix       = prefix + "   ┃";
    String notRenderedPrefix = prefix + "";
    int    childCount        = tree.getNodeCount(node);
    String indentation;
    String thisBud;

    for (int i = 0; i < childCount; i++)
    {
      if (i == childCount - 1)
      {
        indentation = lastPrefix;
        thisBud     = String.valueOf(tree.getNodeSymbol(node));
      }
      else
      {
        indentation = innerPrefix;
        thisBud     = "";
      }
      String renderedPrefix = render ? indentation : notRenderedPrefix;
      String renderedBud    = render ? thisBud : "";
      printNode(tree.getNode(node, i), renderedPrefix, renderedBud, true);
    }

  }

}
