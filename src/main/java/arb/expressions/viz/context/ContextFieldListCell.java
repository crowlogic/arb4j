package arb.expressions.viz.context;

import java.lang.reflect.Field;

import arb.Integer;
import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.viz.ExpressionAnalyzer;
import arb.functions.Function;
import arb.utensils.Utensils;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.TextFieldListCell;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.util.StringConverter;

/**
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextFieldListCell<D, C, F extends Function<D, C>> extends
                                       TextFieldListCell<Named>
{

  final ExpressionAnalyzer<D, C, F> analyzer;
  final StringConverter<Named>      converter;
  Spinner<java.lang.Integer>        spinner;
  HBox                              layout;
  Label                             nameLabel;
  boolean                           emacsKeyBindingsAdded;

  @Override
  public void startEdit()
  {
    super.startEdit();
    if (!isEditing())
    {
      return;
    }
    if (!emacsKeyBindingsAdded)
    {
      addEmacsKeybindingsToTextField(getTextField());
      emacsKeyBindingsAdded = true;
    }
  }

  public TextField getTextField()
  {
    try
    {
      return (TextField) textFieldField.get(this);
    }
    catch (IllegalArgumentException | IllegalAccessException e)
    {
      Utensils.throwOrWrap(e);
      return null;
    }
  }

  public ContextFieldListCell(ExpressionAnalyzer<D, C, F> expressionAnalyzer, StringConverter<Named> converter)
  {
    super(converter);
    this.analyzer  = expressionAnalyzer;
    this.converter = converter;
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
      createLayoutIfItDoesntAlreadyExist();

      updateRepresentation(item);

      if (item instanceof Integer)
      {
        Integer integerItem = (Integer) item;
        if (spinner == null)
        {
          spinner = new Spinner<>(new SpinnerValueFactory.IntegerSpinnerValueFactory(java.lang.Integer.MIN_VALUE,
                                                                                     java.lang.Integer.MAX_VALUE,
                                                                                     integerItem.getSignedValue()));
          spinner.setEditable(true);
          spinner.maxWidthProperty().bind(widthProperty().multiply(0.5)); // 30% of cell width
          spinner.prefWidthProperty().bind(spinner.maxWidthProperty());
          spinner.valueProperty().addListener((obs, oldValue, newValue) ->
          {
            integerItem.set(newValue);
            updateRepresentation(item);
            analyzer.evaluate();
          });
          spinner.setOnScroll(event ->
          {
            if (event.getDeltaY() < 0)
            {
              spinner.decrement();
            }
            else if (event.getDeltaY() > 0)
            {
              spinner.increment();
            }
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
          HBox.setHgrow(spinner, Priority.ALWAYS);
        }
      }


      setText(null);
      setGraphic(layout);
    }
  }

  public void removeSpinner()
  {
    layout.getChildren().remove(1);
  }

  public void createLayoutIfItDoesntAlreadyExist()
  {
    if (layout == null)
    {
      layout = new HBox(5);
      layout.setAlignment(Pos.CENTER_LEFT);
      // layout.prefWidthProperty().bind(widthProperty().subtract(5)); // Subtract
      // padding
      nameLabel = new Label();
      layout.getChildren().add(nameLabel);
    }
  }

  static Field textFieldField;

  static
  {
    try
    {
      textFieldField = TextFieldListCell.class.getDeclaredField("textField");
      textFieldField.setAccessible(true);
    }
    catch (NoSuchFieldException | SecurityException e)
    {
      e.printStackTrace();
    }
  }

  private void addEmacsKeybindingsToTextField(TextField textField)
  {

    analyzer.addEmacsKeybindings(textField);

  }

  private void updateRepresentation(Named item)
  {
    analyzer.getCurrentContext().variables.put(item.getName(), item);

    if (item instanceof Integer)
    {
      nameLabel.setText(item.getClass().getSimpleName() + ": " + item.getName() + "=");
      nameLabel.setMaxWidth(USE_PREF_SIZE);
    }
    else
    {
      String itemString = converter.toString(item);
      nameLabel.setText(itemString);
      nameLabel.setMaxWidth(Double.MAX_VALUE);
      HBox.setHgrow(nameLabel, Priority.ALWAYS);
    }
  }

  @Override
  public void cancelEdit()
  {
    super.cancelEdit();
    updateItem(getItem(), false);
  }

}