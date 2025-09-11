package arb.expressions.viz;

import java.awt.image.BufferedImage;
import java.util.concurrent.ConcurrentHashMap;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.Utensils;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.control.TreeTableCell;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.control.cell.TextFieldTreeTableCell;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.util.Callback;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class TypeSettingCellFactory<D, C, F extends Function<? extends D, ? extends C>>
                                         implements
                                         Callback<TreeTableColumn<Node<D, C, F>, String>,
                                                       TreeTableCell<Node<D, C, F>, String>>
{
  final static ConcurrentHashMap<String, Image> cache = new ConcurrentHashMap<>();

  public final class TypeSettingTextField extends
                                          TextFieldTreeTableCell<Node<D, C, F>, String>
  {
    private final ImageView imageView = new ImageView();

    @Override
    public void updateItem(String item, boolean empty)
    {
      super.updateItem(item, empty);
      if (item == null || empty)
      {
        setText(null);
        setGraphic(null);
      }
      else
      {
        try
        {
          Image image = cache.get(item);
          if (image == null)
          {
            BufferedImage bufferedImage = Utensils.renderFormula(item, 16);
            cache.put(item, image = SwingFXUtils.toFXImage(bufferedImage, null));
          }

          imageView.setImage(image);
          setGraphic(imageView);
          setText(null);
        }
        catch (Exception e)
        {
          setText("Error rendering formula: " + e.getMessage() + " for string '" + item + "'");
          System.err.format("formula for which the exception is being thrown is '%s'\n",
                            item);

          e.printStackTrace(System.err);
          setGraphic(null);

        }
      }
    }
  }

  @Override
  public TreeTableCell<Node<D, C, F>, String> call(TreeTableColumn<Node<D, C, F>, String> param)
  {
    return new TypeSettingTextField();
  }
}