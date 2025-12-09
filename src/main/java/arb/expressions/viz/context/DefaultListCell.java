package arb.expressions.viz.context;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.scene.Node;
import javafx.scene.control.ListCell;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DefaultListCell<T> extends
                            ListCell<T>
{
  @Override
  public void updateItem(T item, boolean empty)
  {
    super.updateItem(item, empty);

    if (empty)
    {
      setText(null);
      setGraphic(null);
    }
    else if (item instanceof Node)
    {
      setText(null);
      Node currentNode = getGraphic();
      Node newNode     = (Node) item;
      if (currentNode == null || !currentNode.equals(newNode))
      {
        setGraphic(newNode);
      }
    }
    else
    {
      setText(item == null ? "null" : item.toString());
      setGraphic(null);
    }
  }
}