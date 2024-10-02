package arb.expressions.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.application.Platform;
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
  private int       lastKnownCaretPosition = 0;

  public MiniSymbolPalette(TextField textField)
  {
    super(5);
    this.textField = textField;
    textField.focusedProperty().addListener((obs, oldVal, newVal) ->
    {
      if (newVal)
      {
        Platform.runLater(() ->
        {
          textField.deselect();
          textField.positionCaret(lastKnownCaretPosition);
        });
      }
    });
    // Store the caret position whenever it changes
    this.textField.caretPositionProperty().addListener((obs, oldVal, newVal) ->
    {
      if (newVal.intValue() != 0)
      {
        lastKnownCaretPosition = newVal.intValue();
      }
    });

    String[] symbols =
    { "+", "-", "*", "/", "^", "∑", "∏", "∫", "π", "√", "┴" };

    for (String symbol : symbols)
    {
      Button button = new Button(symbol);
      button.setOnAction(e -> insertSymbolAtCursor(symbol));
      getChildren().add(button);
    }
  }

  private void insertSymbolAtCursor(String symbol)
  {

    textField.insertText(lastKnownCaretPosition, symbol);

    textField.requestFocus();
    textField.positionCaret(lastKnownCaretPosition);
  }
}