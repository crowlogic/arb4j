package arb.viz;

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
public class NodeTreeItem<D, R, F extends Function<? extends D, ? extends R>> extends
                         TreeItem<Node<D, R, F>>
{

  private boolean isLeaf;
  private boolean isFirstTimeChildren = true;

  public NodeTreeItem(Node<D, R, F> node)
  {
    super(node);
  }

  @Override
  public boolean
         isLeaf()
  {
    return getValue().isLeaf();
  }

  @Override
  public ObservableList<TreeItem<Node<D, R, F>>>
         getChildren()
  {
    if (isFirstTimeChildren)
    {
      isFirstTimeChildren = false;
      super.getChildren().setAll(buildChildren(this));
    }
    return super.getChildren();
  }

  private ObservableList<TreeItem<Node<D, R, F>>>
          buildChildren(TreeItem<Node<D, R, F>> treeItem)
  {
    if (treeItem.getValue() == null
        || treeItem.getValue()
                   .getBranches() == null)
    {
      return FXCollections.observableArrayList();
    }
    return treeItem.getValue()
                   .getBranches()
                   .stream()
                   .map(NodeTreeItem<D, R, F>::new)
                   .collect(Collectors.toCollection(FXCollections::observableArrayList));
  }
}
