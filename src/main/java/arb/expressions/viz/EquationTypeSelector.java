package arb.expressions.viz;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;
import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Control;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class EquationTypeSelector extends
                                  Control
{

  private final ObjectProperty<Class<?>> domainTypeProperty   = new SimpleObjectProperty<>(this,
                                                                                           "domainType",
                                                                                           Real.class);
  private final ObjectProperty<Class<?>> codomainTypeProperty = new SimpleObjectProperty<>(this,
                                                                                           "codomainType",
                                                                                           Real.class);
  private final ObjectProperty<Class<?>> functionTypeProperty = new SimpleObjectProperty<>(this,
                                                                                           "functionType",
                                                                                           RealFunction.class);

  private ComboBox<Class<?>>             domainTypeBox;
  private ComboBox<Class<?>>             codomainTypeBox;
  private ComboBox<Class<?>>             functionTypeBox;

  public EquationTypeSelector()
  {
    getStyleClass().add("equation-type-selector");
    createContent();
  }

  private void createContent()
  {
    domainTypeBox   = new ComboBox<>();
    codomainTypeBox = new ComboBox<>();
    functionTypeBox = new ComboBox<>();

    setupTypeBoxes();

    HBox layout = new HBox(10,
                           new Label("Domain:"),
                           domainTypeBox,
                           new Label("Codomain:"),
                           codomainTypeBox,
                           new Label("Function Type:"),
                           functionTypeBox);

    getChildren().add(layout);
  }

  private void setupTypeBoxes()
  {
    domainTypeBox.getItems().addAll(Real.class, Complex.class, Integer.class /* ... */);
    codomainTypeBox.getItems().addAll(Real.class, Complex.class, Integer.class /* ... */);
    functionTypeBox.getItems().addAll(RealFunction.class, ComplexFunction.class /* ... */);

    domainTypeBox.valueProperty().bindBidirectional(domainTypeProperty);
    codomainTypeBox.valueProperty().bindBidirectional(codomainTypeProperty);
    functionTypeBox.valueProperty().bindBidirectional(functionTypeProperty);
  }

  public ObjectProperty<Class<?>> domainTypeProperty()
  {
    return domainTypeProperty;
  }

  public ObjectProperty<Class<?>> codomainTypeProperty()
  {
    return codomainTypeProperty;
  }

  public ObjectProperty<Class<?>> functionTypeProperty()
  {
    return functionTypeProperty;
  }

  public Class<?> getDomainType()
  {
    return domainTypeProperty.get();
  }

  public void setDomainType(Class<?> domainType)
  {
    domainTypeProperty.set(domainType);
  }

  public Class<?> getCodomainType()
  {
    return codomainTypeProperty.get();
  }

  public void setCodomainType(Class<?> codomainType)
  {
    codomainTypeProperty.set(codomainType);
  }

  public Class<?> getFunctionType()
  {
    return functionTypeProperty.get();
  }

  public void setFunctionType(Class<?> functionType)
  {
    functionTypeProperty.set(functionType);
  }

  public EquationTypeInfo getSelectedTypes()
  {
    return new EquationTypeInfo(getDomainType(),
                                getCodomainType(),
                                getFunctionType());
  }
}