package arb.viz.gl.gui;

import static arb.viz.gl.Attributes.change;
import static arb.viz.gl.Attributes.getColour;
import static arb.viz.gl.Attributes.getFFrom;
import static arb.viz.gl.Attributes.getFPi;
import static arb.viz.gl.Attributes.getFTo;
import static arb.viz.gl.Attributes.getFVar;
import static arb.viz.gl.Attributes.getField;
import static arb.viz.gl.Attributes.getFrame;
import static arb.viz.gl.Attributes.getFrenet;
import static arb.viz.gl.Attributes.getFunction;
import static arb.viz.gl.Attributes.getXStep;
import static arb.viz.gl.Attributes.putColour;
import static arb.viz.gl.Attributes.putFFrom;
import static arb.viz.gl.Attributes.putFPi;
import static arb.viz.gl.Attributes.putFStep;
import static arb.viz.gl.Attributes.putFTo;
import static arb.viz.gl.Attributes.putFVar;
import static arb.viz.gl.Attributes.putFrenet;
import static arb.viz.gl.Attributes.putFunction;
import static arb.viz.gl.Attributes.redraw;

import org.joml.Vector3f;

import arb.viz.gl.GuiController;
import lwjgui.geometry.Insets;
import lwjgui.paint.Color;
import lwjgui.scene.Window;
import lwjgui.scene.control.Button;
import lwjgui.scene.control.CheckBox;
import lwjgui.scene.control.Label;
import lwjgui.scene.control.TextField;
import lwjgui.scene.layout.GridPane;

/**
 * A class describing elements of graphical user interface that represent curve
 * options menu
 */
public class CurveOptions extends
                          OptionsMenu
{

  private CheckBox  frenetCheckbox = new CheckBox("Frenet frame");
  private TextField variable       = createTextField(tfWidth, tfHeight);
  private TextField from           = createTextField(tfWidth, tfHeight);
  private TextField to             = createTextField(tfWidth, tfHeight);
  private TextField step           = createTextField(tfWidth, tfHeight);
  private CheckBox  π              = new CheckBox("*π");

  /**
   * Create content attached to certain window
   * 
   * @param window window to attach content to
   */
  public CurveOptions(Window window)
  {
    this.window = window;

    base.setMinSize(width, height);
    base.setBackgroundLegacy(Color.WHITE_SMOKE);

    GridPane functionDescribing = new GridPane();
    functionDescribing.setMinSize(width, height * 0.65625 + indent * 2);

    Label function = new Label("Function:");
    function.setPadding(new Insets(10,
                                   0,
                                   0,
                                   10));

    functionText.setMinSize(width - indent * 2, height * 0.59375);
    functionText.setPrompt("x+y");
    functionText.setFontSize(30);

    functionDescribing.add(createWrapper(function, "L", width, height * 0.0625), 1, 1);
    functionDescribing.add(createWrapper(functionText, "C", width, height * 0.59375 + indent * 2), 1, 2);

    GridPane otherOptions = new GridPane();
    otherOptions.setMinSize(width, height * 0.1875);

    Label    color        = new Label("Color:");

    GridPane colorOptions = new GridPane();
    colorOptions.setMinSize(width * 0.5, height * 0.1875);
    colorOptions.add(createWrapper(color, "C", width * 0.5, height * 0.1875 / 2), 1, 1);
    colorOptions.add(createWrapper(colorPicker, "C", width * 0.5, height * 0.1875 / 2), 1, 2);

    GridPane planeAndParaboloidOptions = new GridPane();
    planeAndParaboloidOptions.setMinSize(width * 0.5, height * 0.1875);
    planeAndParaboloidOptions.add(createWrapper(frenetCheckbox, "L", width * 0.5, height * 0.1875), 1, 1);

    otherOptions.add(colorOptions, 1, 1);
    otherOptions.add(planeAndParaboloidOptions, 2, 1);

    GridPane vars = new GridPane();
    vars.setMinSize(width, height * 0.21875);
    vars.add(createVariableOptions("Variable:", width, height * 0.21875 / 2, variable, from, to, step, π), 1, 1);

    analyse.setFontSize(20);
    analyse.setMinSize(100, 30);

    Button close = new Button("Close");
    close.setOnAction(event ->
    {
      GuiController.hideCurrentOptions();
      GuiController.setCurveOptions();
      GuiController.hideCurrentOptions();
    });
    close.setFontSize(20);
    close.setMinSize(100, 30);

    GridPane btns = new GridPane();
    btns.add(createWrapper(analyse, "C", width / 2, 40), 1, 1);
    btns.add(createWrapper(close, "C", width / 2, 40), 2, 1);

    base.add(functionDescribing, 1, 1);
    base.add(otherOptions, 1, 2);
    base.add(vars, 1, 3);
    base.add(/* createWrapper(close, "C", width, 40) */btns, 1, 4);
  }

  /**
   * Bind certain curve to this menu
   * 
   * @param index primary key of the curve
   */
  @Override
  public void bind(int index)
  {
    functionText.setOnTextChange(event ->
    {
      String t = functionText.getText();
      putFunction(index, t);
      getField(index).setText(t);
      redraw(index);
    });
    functionText.setText(getFunction(index));

    colorPicker.setOnAction(event ->
    {
      Color c = colorPicker.getColor();
      putColour(index,
                new Vector3f(c.getRedF(),
                             c.getGreenF(),
                             c.getBlueF()));
      getFrame(index).setBackgroundLegacy(c);
      change(index);
    });
    Vector3f colour = getColour(index);
    colorPicker.setColor(new Color(colour.x,
                                   colour.y,
                                   colour.z));

    frenetCheckbox.setOnAction(event ->
    {
      putFrenet(index, frenetCheckbox.isChecked());
      change(index);
    });
    frenetCheckbox.setChecked(getFrenet(index));

    variable.setOnTextChange(event ->
    {
      putFVar(index, variable.getText());
      redraw(index);
    });
    variable.setText(getFVar(index));

    from.setOnTextChange(event ->
    {
      float value = 0.0f;
      try
      {
        value = Float.parseFloat(from.getText());
      }
      catch (NumberFormatException exc)
      {
        value = 0.0f;
      }
      putFFrom(index, value);
      redraw(index);
    });
    from.setText(String.valueOf(getFFrom(index)));

    to.setOnTextChange(event ->
    {
      float value = 0.0f;
      try
      {
        value = Float.parseFloat(to.getText());
      }
      catch (NumberFormatException exc)
      {
        value = 0.0f;
      }
      putFTo(index, value);
      redraw(index);
    });
    to.setText(String.valueOf(getFTo(index)));

    step.setOnTextChange(event ->
    {
      float value = 0.0f;
      try
      {
        value = Float.parseFloat(step.getText());
      }
      catch (NumberFormatException exc)
      {
        value = 0.1f;
      }
      putFStep(index, value);
      redraw(index);
    });
    step.setText(String.valueOf(getXStep(index)));

    π.setOnAction(event ->
    {
      putFPi(index, π.isChecked());
      redraw(index);
    });
    π.setChecked(getFPi(index));

    analyse.setOnAction(event ->
    {
      if (functionText.getText().isEmpty())
      {
        return;
      }
      GuiController.hideCurrentAnalysis();
      GuiController.setCurveAnalysis();
      GuiController.bindCurrentAnalysis(index);
      GuiController.showCurrentAnalysis();

      GuiController.hideCurrentOptions();
      GuiController.setCurveOptions();
      GuiController.hideCurrentOptions();
    });
  }

}
