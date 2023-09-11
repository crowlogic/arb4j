package arb.utensils;

import arb.*;
import arb.functions.real.RealFunction;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;

public class ShellFunctions
{

  /**
   * Plots the given SequenceDataSet
   *
   * @param sequence The Real sequence to be plotted.
   */
  public static void plot(Real sequence)
  {
    initializeJavaFxIfNecessary();
    Platform.runLater(() ->
    { // Create a SequenceDataSet from the Real sequence
      SequenceDataSet dataSet = new SequenceDataSet(sequence);

      try ( FunctionPlotter plotter = new FunctionPlotter())
      {
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
      }
    });
  }

  public static void initializeJavaFxIfNecessary()
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
  }

  public static void plot(double left, double right, RealFunction... functions)
  {
    initializeJavaFxIfNecessary();
    assert false : "todo: redo using RealFunction.quantize and change quantize to return a 2 column matrix and return the domain in one col and the range in the other col";

  }

}
