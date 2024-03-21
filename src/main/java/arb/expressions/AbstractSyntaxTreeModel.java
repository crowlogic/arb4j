package arb.expressions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

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
    this.root = root;

  }

  ArrayList<Node<?, ?, ?>>                                                    nodes           =
                                                                                    new ArrayList<>();

  ConcurrentHashMap<Node<?, ?, ?>, OrderedPair<List<Node<?, ?, ?>>, Integer>> indexedBranches =
                                                                                              new ConcurrentHashMap<>();

  void indexBranches(Node<?, ?, ?> stem)
  {

    if (stem == null)
      return;

    nodes.add(stem);

    int leftIndex = nodes.size();
    for (var branch : stem.getBranches())
    {
      assert branch != null;
      indexBranches(branch);
    }
    int rightIndex = nodes.size();

    indexedBranches.put(stem,
                        new OrderedPair<>(nodes.subList(leftIndex, rightIndex),
                                          Integer.valueOf(stem.getBranches().size())));
  }

  Node<?, ?, ?> root;

  @Override
  public Node<?, ?, ?> getRoot()
  {
    if (nodes.isEmpty())
    {
      indexBranches(root);
    }
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