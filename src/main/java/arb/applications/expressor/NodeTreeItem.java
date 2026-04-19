package arb.applications.expressor;

import static java.util.stream.Collectors.toCollection;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TreeItem;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NodeTreeItem<D, C, F extends Function<? extends D, ? extends C>> extends
                         TreeItem<Node<D, C, F>>
{

  private boolean isFirstTimeChildren = true;

  public NodeTreeItem(Node<D, C, F> node)
  {
    super(node);
  }

  @Override
  public boolean isLeaf()
  {
    // Must be a STRUCTURAL predicate — "no children" — not the toString()
    // parenthesization flag {@link Node#isAtomic()}. FunctionNode and its
    // subclasses (LommelPolynomialNode, HypergeometricFunctionNode,
    // JetNode, SphericalBesselFunctionNodeOfTheFirstKind, …) return
    // isAtomic() == true yet legitimately expose real children via
    // getBranches(); delegating to isAtomic() here prevents the
    // TreeTableView from rendering a disclosure arrow and silently hides
    // their subtrees (see #867).
    Node<D, C, F> value = getValue();
    if (value == null)
    {
      return true;
    }
    var branches = value.getBranches();
    return branches == null || branches.isEmpty();
  }

  @Override
  public ObservableList<TreeItem<Node<D, C, F>>> getChildren()
  {
    if (isFirstTimeChildren)
    {
      isFirstTimeChildren = false;
      super.getChildren().setAll(buildChildren(this));
    }
    return super.getChildren();
  }

  private ObservableList<TreeItem<Node<D, C, F>>> buildChildren(TreeItem<Node<D, C, F>> treeItem)
  {
    if (treeItem.getValue() == null || treeItem.getValue().getBranches() == null)
    {
      return FXCollections.observableArrayList();
    }
    ObservableList<TreeItem<Node<D, C, F>>> collect = treeItem.getValue()
                                                              .getBranches()
                                                              .stream()
                                                              .map(NodeTreeItem::new)
                                                              .collect(toCollection(FXCollections::observableArrayList));
    return collect;
  }
}
