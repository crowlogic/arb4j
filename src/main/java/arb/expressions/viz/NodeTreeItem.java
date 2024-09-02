package arb.expressions.viz;

import java.util.stream.Collectors;

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
    return getValue().isLeaf();
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
    ObservableList<TreeItem<Node<D,
                  C,
                  F>>> collect =
                               treeItem.getValue()
                                       .getBranches()
                                       .stream()
                                       .map(NodeTreeItem::new)
                                       .collect(Collectors.toCollection(FXCollections::observableArrayList));
    return collect;
  }
}
