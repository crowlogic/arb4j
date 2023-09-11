package arb.utensils;

import arb.*;
import arb.functions.real.RealFunction;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;

public class ShellFunctions
{

  /**
   * Plots the given SequenceDataSet using the existing FunctionPlotter.
   *
   * @param sequence The Real sequence to be plotted.
   */
  public static void plot(Real sequence)
  {
    try
    {
      Platform.startup(() ->
      {
      });
    }
    catch (Exception e)
    {

    }
    Platform.runLater(() ->
    { // Create a SequenceDataSet from the Real sequence
      SequenceDataSet dataSet = new SequenceDataSet(sequence);

      FunctionPlotter plotter = new FunctionPlotter();

      plotter.createScene();

      // Clear existing datasets if needed
      plotter.chart.getDatasets().clear();

      // Add the new dataset to FunctionPlotter's internal list
      plotter.chart.getDatasets().add(dataSet);

      // Create and show the scene if not already displayed
      if (plotter.stage == null)
      {
        plotter.stage.show();
      }
      else
      {
        plotter.stage.show();

        plotter.stage.toFront();
      }
    });
  }

  public static Real eval(RealFunction func, double x)
  {
    Real y = Real.valueOf(x);
    return func.evaluate(y, 1, 128, y);
  }

  public static void plot(double left, double right, RealFunction... functions)
  {
    Platform.runLater(() ->
    {

      try ( FunctionPlotter plotter = new FunctionPlotter())
      {
        for (RealFunction function : functions)
        {
          plotter.functions.add(function);
        }
        plotter.domain = new FloatInterval(left,
                                           right);
        plotter.createScene().toFront();
      }
    });
  }

}
