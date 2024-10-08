package arb.expressions.viz.context;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.util.Callback;

/**
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ContextMenuListCell<T> extends
                                ListCell<T>
{

  public static <T> Callback<ListView<T>, ListCell<T>> forListView(ContextMenu contextMenu)
  {
    return forListView(contextMenu, null);
  }

  public static <T> Callback<ListView<T>, ListCell<T>> forListView(final ContextMenu contextMenu,
                                                                   final Callback<ListView<T>, ListCell<T>> cellFactory)
  {
    return listView ->
    {
      var cell = cellFactory == null ? new DefaultListCell<T>() : cellFactory.call(listView);
      cell.setContextMenu(contextMenu);
      return cell;
    };

  }

  public ContextMenuListCell(ContextMenu contextMenu)
  {
    setContextMenu(contextMenu);
  }
}