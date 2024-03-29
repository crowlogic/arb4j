package arb.expressions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import arb.OrderedPair;
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

  public ArrayList<Node<?, ?, ?>>                                   nodes           =
                                                                          new ArrayList<>();

  public HashMap<Node<?, ?, ?>, OrderedPair<List<Node<?, ?, ?>>, Integer>> indexedBranches =
                                                                                    new HashMap<>();

  void indexBranches(Node<?, ?, ?> stem)
  {
    if (stem == null)
      return;

    nodes.add(stem);

    for (var branch : stem.getBranches())
    {
      assert branch != null;
      indexBranches(branch);
    }

    indexedBranches.put(stem,
                        new OrderedPair<>(new ArrayList<>(stem.getBranches()),
                                          Integer.valueOf(stem.getBranches().size())));
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
    return indexedBranches.get(parent).getKey().get(index);
  }

  @Override
  public int getNodeCount(Node<?, ?, ?> parent)
  {
    return indexedBranches.get(parent).getValue();
  }

  @Override
  public boolean isLeaf(Node<?, ?, ?> node)
  {
    return node.isLeaf();
  }

}