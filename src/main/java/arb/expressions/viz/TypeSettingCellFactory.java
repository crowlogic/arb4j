package arb.expressions.viz;

import java.awt.image.BufferedImage;

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
                                         Callback<TreeTableColumn<Node<D,C,F>, String>,
                                                       TreeTableCell<Node<D,C,F>, String>>
{
  public final class TypeSettingTextField extends
                                          TextFieldTreeTableCell<Node<D,C,F>, String>
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
          BufferedImage bufferedImage = Utensils.renderFormula(item);
          Image         image         = SwingFXUtils.toFXImage(bufferedImage, null);
          imageView.setImage(image);
          setGraphic(imageView);
          setText(null);
        }
        catch (Exception e)
        {
          setText("Error rendering formula: " + e.getMessage() + " for string '" + item + "'");
          e.printStackTrace(System.err);
          setGraphic(null);
        }
      }
    }
  }

  @Override
  public TreeTableCell<Node<D,C,F>, String> call(TreeTableColumn<Node<D,C,F>, String> param)
  {
    return new TypeSettingTextField();
  }
}