package arb.expressions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

  ArrayList<Node<?, ?, ?>>                    nodes           = new ArrayList<>();

  HashMap<Node<?, ?, ?>, List<Node<?, ?, ?>>> indexedBranches = new HashMap<>();

  void indexBranches(Node<?, ?, ?> stem)
  {
    if (stem == null)
      return;

    nodes.add(stem);

    int leftIndex = nodes.size();
    for (var branch : stem.getBranches())
    {
      indexBranches(branch);
    }
    int rightIndex = nodes.size();

    indexedBranches.put(stem, nodes.subList(leftIndex, rightIndex));
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
    return indexedBranches.get(parent).get(index);
  }

  @Override
  public int getNodeCount(Node<?, ?, ?> parent)
  {
    return indexedBranches.get(parent).size();
  }

  @Override
  public boolean isLeaf(Node<?, ?, ?> node)
  {
    return node.isLeaf();
  }

}