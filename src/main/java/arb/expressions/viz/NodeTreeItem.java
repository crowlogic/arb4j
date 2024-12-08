package arb.expressions.viz;

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
    if (getValue() == null || getValue().getBranches() == null)
    {
      return FXCollections.observableArrayList();
    }
    return getValue().getBranches()
                     .stream()
                     .map(NodeTreeItem::new)
                     .collect(toCollection(FXCollections::observableArrayList));
  }
}
