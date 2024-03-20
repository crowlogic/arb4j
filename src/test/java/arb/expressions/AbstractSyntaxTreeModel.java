package arb.expressions;

import java.util.ArrayList;

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
    indexBranches(this.root = root);
  }

  ArrayList<Node<?, ?, ?>> nodes = new ArrayList<>();

  void indexBranches(Node<?, ?, ?> stem)
  {
    if (stem == null)
      return;

    nodes.add(stem);

    for (var branch : stem.getBranches())
    {
      indexBranches(branch);
    }

    assert false : "TODO: use ArrayList.subList to set slices of the main index onto each of the"
                  + " branches in order then make getNode() do a hashmap lookup of the requested "
                  + "node into a map from hashed nodes to indices and then add the index to that "
                  + "offset to retrieve the node from the main root index rather than requring each"
                  + " node to maintain its own index of subnodes which most likely will never need "
                  + "to be traversed in isolation";
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