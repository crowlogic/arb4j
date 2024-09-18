package arb.expressions.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MiniSymbolPalette extends
                               HBox
{

  private TextField textField;

  public MiniSymbolPalette(TextField textField)
  {
    super(5);
    this.textField = textField;

      String[] symbols =
    { "+", "-", "*", "/", "^", "∑", "∏", "∫", "π", "√" };

    for (String symbol : symbols)
    {
      Button button = new Button(symbol);
      button.setOnAction(e -> appendSymbol(symbol));
      getChildren().add(button);
    }
  }

  private void appendSymbol(String symbol)
  {
    textField.setText(textField.getText() + symbol);
  }
}