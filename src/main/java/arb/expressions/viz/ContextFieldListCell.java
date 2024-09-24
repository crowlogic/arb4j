package arb.expressions.viz;

import arb.Integer;
import arb.Field;
import arb.Named;
import arb.functions.Function;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.TextFieldListCell;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.util.StringConverter;

public final class ContextFieldListCell<D, C, F extends Function<D, C>> extends
                                       TextFieldListCell<Named>
{

  private final ExpressionAnalyzer<D, C, F> analyzer;
  private final StringConverter<Named>      converter;
  private Spinner<java.lang.Integer>        spinner;
  private HBox                              layout;
  private Label                             nameLabel;
  private boolean                           emacsKeybindingsAdded = false;

  public ContextFieldListCell(ExpressionAnalyzer<D, C, F> expressionAnalyzer,
                              StringConverter<Named> converter)
  {
    super(converter);
    this.analyzer  = expressionAnalyzer;
    this.converter = converter;
  }

  @Override
  public void startEdit()
  {
    super.startEdit();
    if (!emacsKeybindingsAdded)
    {
      addEmacsKeybindingsToTextField();
      emacsKeybindingsAdded = true;
    }

    synchronizeText();
  }

  public void synchronizeText()
  {
    // Ensure full information is available when editing
    if (getItem() instanceof Integer)
    {
      String fullRepresentation = converter.toString(getItem());
      try
      {
        java.lang.reflect.Field textField = TextFieldListCell.class.getDeclaredField("textField");
        textField.setAccessible(true);
        TextField tf = (TextField) textField.get(this);
        if (tf != null)
        {
          tf.setText(fullRepresentation);
        }
      }
      catch (NoSuchFieldException | IllegalAccessException e)
      {
        e.printStackTrace();
      }
    }
  }

  private void addEmacsKeybindingsToTextField()
  {
    try
    {
      java.lang.reflect.Field textField = TextFieldListCell.class.getDeclaredField("textField");
      textField.setAccessible(true);
      TextField tf = (TextField) textField.get(this);
      analyzer.addEmacsKeybindings(tf);
    }
    catch (NoSuchFieldException | IllegalAccessException e)
    {
      e.printStackTrace();
    }
  }

  @Override
  public void updateItem(Named item, boolean empty)
  {
    super.updateItem(item, empty);
    if (empty || item == null)
    {
      setText(null);
      setGraphic(null);
    }
    else
    {
      if (layout == null)
      {
        layout = new HBox(5);
        layout.setAlignment(Pos.CENTER_LEFT);
        nameLabel = new Label();
        layout.getChildren().add(nameLabel);
        HBox.setHgrow(nameLabel, Priority.ALWAYS);
      }

      updateRepresentation(item);

      if (item instanceof Integer)
      {
        Integer integerItem = (Integer) item;
        if (spinner == null)
        {
          spinner =
                  new Spinner<>(new SpinnerValueFactory.IntegerSpinnerValueFactory(java.lang.Integer.MIN_VALUE,
                                                                                   java.lang.Integer.MAX_VALUE,
                                                                                   integerItem.getSignedValue()));
          spinner.setEditable(true);
          spinner.setPrefWidth(100);
          spinner.setMaxWidth(100);
          spinner.valueProperty().addListener((obs, oldValue, newValue) ->
          {
            integerItem.set(newValue);
            updateRepresentation(item);
            synchronizeText();
          });
          analyzer.addEmacsKeybindings(spinner.getEditor());
          layout.getChildren().add(spinner);
        }
        else
        {
          spinner.getValueFactory().setValue(integerItem.getSignedValue());
        }
        if (!layout.getChildren().contains(spinner))
        {
          layout.getChildren().add(spinner);
        }
      }
      else if (layout.getChildren().size() > 1)
      {
        layout.getChildren().remove(1);
      }

      setText(null);
      setGraphic(layout);
    }
  }

  private void updateRepresentation(Named item)
  {
    analyzer.getCurrentContext().variables.put(item.getName(),item);
    
    if (item instanceof Integer)
    {
      // For Integer types, only show the name in the label
      nameLabel.setText(item.getClass().getSimpleName() + ": " + item.getName() + "=");
    }
    else
    {
      // For other types, show the full representation
      String itemString = converter.toString(item);
      nameLabel.setText(itemString);
    }
  }

  @Override
  public void cancelEdit()
  {
    super.cancelEdit();
    updateItem(getItem(), false);
  }
}