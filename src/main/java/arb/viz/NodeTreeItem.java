package arb.viz;

import java.util.stream.Collectors;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.TreeItem;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NodeTreeItem
                          extends
                          TreeItem<Node<?, ?, ?>>
{

  private boolean isFirstTimeChildren = true;

  public NodeTreeItem(Node<?, ?, ?> node)
  {
    super(node);
  }

  @Override
  public boolean isLeaf()
  {
    return getValue().isLeaf();
  }

  @Override
  public ObservableList<TreeItem<Node<?, ?, ?>>> getChildren()
  {
    if (isFirstTimeChildren)
    {
      isFirstTimeChildren = false;
      super.getChildren().setAll(buildChildren(this));
    }
    return super.getChildren();
  }

  private ObservableList<TreeItem<Node<?, ?, ?>>> buildChildren(TreeItem<Node<?, ?, ?>> treeItem)
  {
    if (treeItem.getValue() == null || treeItem.getValue().getBranches() == null)
    {
      return FXCollections.observableArrayList();
    }
    ObservableList<TreeItem<Node<?, ?, ?>>> collect = treeItem.getValue()
                                                              .getBranches()
                                                              .stream()
                                                              .map(NodeTreeItem::new)
                                                              .collect(Collectors.toCollection(FXCollections::observableArrayList));
    return collect;
  }
}
