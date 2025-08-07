package arb.expressions.viz;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
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
  @Override
  public String toString()
  {
    return String.format("ExpressionTree[%s]", root.expression);
  }

  /**
   * Exports the expression tree to a DOT format file with field names as link
   * labels
   * 
   * @param filePath the path where to save the .dot file
   */
  public void saveToDotFile(String filePath)
  {
    StringBuilder dot = new StringBuilder();
    dot.append("digraph ExpressionTree {\n");
    dot.append("  rankdir=TB;\n"); // Top to Bottom direction
    dot.append("  node [shape=circle];\n\n");

    // Use a queue for breadth-first traversal
    Queue<Node<D, R, F>> queue = new LinkedList<>();
    queue.add(root);

    while (!queue.isEmpty())
    {
      var current = queue.poll();

      // Add node definition
      dot.append(String.format("  \"%s\" [label=\"%s\"];\n",
                               current.toString(),
                               current.toString()));

      // Process all branches
      List<Node<D, R, F>> branches = indexedBranches.get(current);
      if (branches != null)
      {
        for (var branch : branches)
        {
          queue.add(branch);

          // Get the field name if available
          String fieldName = "";
          if (branch instanceof Node arbNode)
          {
            fieldName = arbNode.getFieldName();
          }
          else
          {
            assert false : "wtf isnt a node" + branch;
          }
          // Add edge with field name as label, with reversed direction
          dot.append(String.format("  \"%s\" -> \"%s\" [label=\"%s\"];\n",
                                   branch.toString(), // child is now the source
                                   current.toString(), // current is now the target
                                   fieldName));
        }
      }
    }

    dot.append("}\n");

    // Save to file
    try ( PrintWriter out = new PrintWriter(filePath))
    {
      out.println(dot.toString());
    }
    catch (FileNotFoundException e)
    {
      throw new RuntimeException("Failed to write DOT file: " + e.getMessage(),
                                 e);
    }
  }

  public ExpressionTree(Node<D, R, F> root)
  {
    indexBranches(this.root = root);
  }

  public HashMap<Node<D, R, F>, List<Node<D, R, F>>> indexedBranches = new HashMap<>();

  void indexBranches(Node<D, R, F> stem)
  {
    if (stem == null)
      return;

    var branches = new ArrayList<Node<D, R, F>>(stem.getBranches());
    var existing = indexedBranches.get(stem);
//    assert existing != null : stem + " already indexed";
    indexedBranches.put(stem, branches);

    for (var branch : branches)
    {
      assert branch != null;
      indexBranches(branch);
    }

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
    List<Node<D, R, F>> list = indexedBranches.get(parent);

    return list.get(index);
  }

  @Override
  public int getNodeCount(Node<D, R, F> parent)
  {
    List<Node<D, R, F>> list = indexedBranches.get(parent);

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