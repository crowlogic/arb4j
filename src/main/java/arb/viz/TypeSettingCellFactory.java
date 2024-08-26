package arb.viz;

import java.awt.image.BufferedImage;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
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
public final class TypeSettingCellFactory implements
                                          Callback<TreeTableColumn<Node<?, ?, ?>, String>,
                                                        TreeTableCell<Node<?, ?, ?>, String>>
{
  public final class TypeSettingTextField extends
                                          TextFieldTreeTableCell<Node<?, ?, ?>, String>
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
  public TreeTableCell<Node<?, ?, ?>, String> call(TreeTableColumn<Node<?, ?, ?>, String> param)
  {
    return new TypeSettingTextField();
  }
}