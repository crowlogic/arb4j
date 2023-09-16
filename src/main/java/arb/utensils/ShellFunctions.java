package arb.utensils;

import arb.*;
import arb.functions.real.RealFunction;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;

public class ShellFunctions
{

  public static void plot(RealDataSet sequence)
  {
    initializeJavaFxIfNecessary();
    Platform.runLater(() ->
    { // Create a SequenceDataSet from the Real sequence
      RealDataSet dataSet = sequence;

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

  public static void plot(double left, double right, int n, RealFunction... functions)
  {
    initializeJavaFxIfNecessary();
    Platform.runLater(() ->
    { // Create a SequenceDataSet from the Real sequence

      try ( FunctionPlotter plotter = new FunctionPlotter())
      {
        plotter.createScene();

        // Clear existing datasets if needed
        plotter.chart.getDatasets().clear();

        for (RealFunction func : functions)
        {
          RealDataSet sample = func.quantize(left, right, n);
          plotter.chart.getDatasets().add(sample);
        }

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

}
