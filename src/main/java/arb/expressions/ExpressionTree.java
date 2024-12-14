package arb.expressions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.text.trees.TextTree;
import arb.utensils.text.trees.TreeModel;

/**
 * For structured pretty-printing of an {@link Expression}s parsed
 * {@link ExpressionTree} via {@link TextTree}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTree<D, R, F extends Function<? extends D, ? extends R>> implements
                            TreeModel<Node<D, R, F>>
{
  public ExpressionTree(Node<D, R, F> root)
  {
    indexBranches(this.root = root);
  }

  public ArrayList<Node<D, R, F>>                    nodes           = new ArrayList<>();

  public HashMap<Node<D, R, F>, List<Node<D, R, F>>> indexedBranches = new HashMap<Node<D, R, F>,
                List<Node<D, R, F>>>();

  void indexBranches(Node<D, R, F> stem)
  {
    if (stem == null)
      return;

    nodes.add(stem);

    for (var branch : stem.getBranches())
    {
      assert branch != null;
      indexBranches(branch);
    }

    indexedBranches.put(stem, new ArrayList<>(stem.getBranches()));
  }

  Node<D, R, F> root;

  @Override
  public Node<D, R, F> getRoot()
  {
    return root;
  }

  @Override
  public Node<D, R, F> getNode(Node<D, R, F> parent, int index)
  {
    List<Node<D, R, F>> list      = indexedBranches.get(parent);
    String              parentStr = parent.toString();
    if (list == null)
    {
      for (var branch : indexedBranches.entrySet())
      {
        if (branch.getKey().toString().equals(parentStr))
        {
          return branch.getValue().get(index);
        }
        // err.println( branch.getKey() + "\n" + parent + "\n" );
      }
    }
    assert list != null : "list is null for " + parent + " indexedBranches=" + indexedBranches;

    return list.get(index);
  }

  @Override
  public int getNodeCount(Node<D, R, F> parent)
  {
    List<Node<D, R, F>> list      = indexedBranches.get(parent);
    String              parentStr = parent.toString();
    if (list == null)
    {
      for (var branch : indexedBranches.entrySet())
      {
        if (branch.getKey().toString().equals(parentStr))
        {
          return branch.getValue().size();
        }
        // err.println( branch.getKey() + "\n" + parent + "\n" );
      }
    }
    assert list != null : "list is null for " + parent + " indexedBranches=" + indexedBranches;

    return list.size();
  }

  @Override
  public boolean isLeaf(Node<D, R, F> node)
  {
    return node.isLeaf();
  }

  @Override
  public char getNodeSymbol(Node<D, R, F> node)
  {
    return node.symbol();
  }

}