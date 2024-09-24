package arb.expressions.viz;

import arb.Integer;
import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.scene.control.cell.TextFieldListCell;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.util.StringConverter;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ContextFieldListCell<D, C, F extends Function<D,C>> extends
                                       TextFieldListCell<Named>
{
  /**
   * 
   */
  private final ExpressionAnalyzer<D, C, F> analyzer;
  private final StringConverter<Named>      converter;
  private Spinner<java.lang.Integer>        spinner;
  private HBox                              layout;
  private Label                             representationLabel;

  public ContextFieldListCell(ExpressionAnalyzer<D, C, F> expressionAnalyzer,
                              StringConverter<Named> converter)
  {
    super(converter);
    analyzer       = expressionAnalyzer;
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
        representationLabel = new Label();
        layout.getChildren().add(representationLabel);
        HBox.setHgrow(representationLabel, Priority.ALWAYS);
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
          spinner.setPrefWidth(100); // Increased width
          spinner.setMaxWidth(100); // Set max width
          spinner.valueProperty().addListener((obs, oldValue, newValue) ->
          {
            integerItem.set(newValue);
            updateRepresentation(item);
          });
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
    String itemString = converter.toString(item);
    representationLabel.setText(itemString);
  }
}