package arb.expressions.viz;

import javafx.event.EventHandler;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class EmacsKeybindingsEventHandler implements
                                                EventHandler<KeyEvent>
{
  private final TextField textField;

  public EmacsKeybindingsEventHandler(TextField textField)
  {
    this.textField = textField;
  }

  @Override
  public void handle(KeyEvent event)
  {
    if (event.isControlDown())
    {
      switch (event.getCode())
      {
      case A:
        textField.home();
        event.consume();
        break;
      case E:
        textField.end();
        event.consume();
        break;
      case D:
        int caretPosition = textField.getCaretPosition();
        if (caretPosition < textField.getText().length())
        {
          textField.deleteNextChar();
        }
        event.consume();
        break;
      case K:
        caretPosition = textField.getCaretPosition();
        textField.deleteText(caretPosition, textField.getText().length());
        event.consume();
        break;
      case Y:
        textField.paste();
        event.consume();
        break;
      case W:
        textField.cut();
        event.consume();
        break;
      default:
      }
    }
    else if (event.isAltDown())
    {
      switch (event.getCode())
      {
      case W:
        textField.copy();
        event.consume();
      default:
      }
    }
  }
}