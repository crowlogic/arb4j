package arb.expressions.viz;

import java.lang.reflect.Field;

import arb.Integer;
import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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

/**
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextFieldListCell<D, C, F extends Function<D, C>> extends
                                       TextFieldListCell<Named>
{

  private final ExpressionAnalyzer<D, C, F> analyzer;
  private final StringConverter<Named>      converter;
  private Spinner<java.lang.Integer>        spinner;
  private HBox                              layout;
  private Label                             nameLabel;
  private boolean                           emacsKeybindingsAdded = false;


  @Override
  public void startEdit()
  {
    super.startEdit();
    if (!emacsKeybindingsAdded)
    {
      addEmacsKeybindingsToTextField();
      emacsKeybindingsAdded = true;
    }
  }
  
  public ContextFieldListCell(ExpressionAnalyzer<D, C, F> expressionAnalyzer,
                              StringConverter<Named> converter)
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
      if (layout == null)
      {
        layout = new HBox(5);
        layout.setAlignment(Pos.CENTER_LEFT);
        //layout.prefWidthProperty().bind(widthProperty().subtract(5)); // Subtract padding
        nameLabel = new Label();
        layout.getChildren().add(nameLabel);
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
          spinner.maxWidthProperty().bind(widthProperty().multiply(0.5)); // 30% of cell width
          spinner.prefWidthProperty().bind(spinner.maxWidthProperty());
          spinner.valueProperty().addListener((obs, oldValue, newValue) ->
          {
            integerItem.set(newValue);
            updateRepresentation(item);
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
      else if (layout.getChildren().size() > 1)
      {
        layout.getChildren().remove(1);
      }

      setText(null);
      setGraphic(layout);
    }
  }

  private void addEmacsKeybindingsToTextField()
  {
    try
    {
      Field textField = TextFieldListCell.class.getDeclaredField("textField");
      textField.setAccessible(true);
      TextField tf = (TextField) textField.get(this);
      analyzer.addEmacsKeybindings(tf);
    }
    catch (NoSuchFieldException | IllegalAccessException e)
    {
      e.printStackTrace();
    }
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