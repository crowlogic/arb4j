package arb.expressions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.utensils.treetext.TextTree;
import arb.utensils.treetext.Tree;

/**
 * For structured pretty-printing of an {@link Expression}s parsed
 * AbstractSyntaxTree via {@link TextTree}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AbstractSyntaxTreeModel implements
                                     Tree<Node<?, ?, ?>>
{
  public AbstractSyntaxTreeModel(Node<?, ?, ?> root)
  {
    this.root = root;
    assert false : "TODO: recurse and flatten into indexed array";
  }

  Node<?, ?, ?> root;

  @Override
  public Node<?, ?, ?> getRoot()
  {
    return root;
  }

  @Override
  public Node<?, ?, ?> getNode(Node<?, ?, ?> parent, int index)
  {
    assert false : "TODO: implement";
    return null;
  }

  @Override
  public int getNodeCount(Node<?, ?, ?> parent)
  {
    assert false : "TODO: implement";
    return 0;
  }

  @Override
  public boolean isLeaf(Node<?, ?, ?> node)
  {
    return node.isLeaf();
  }

}