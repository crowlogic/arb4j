package arb.utensils;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.Arrays;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import arb.Real;
import arb.RealDataSet;
import arb.SequenceDataSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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

        plotter.stage.show();

        plotter.stage.toFront();
        plotter.stage.requestFocus();
      }
    });
  }

  /**
   * Plots the given SequenceDataSet
   *
   * @param sequence The Real sequence to be plotted.
   * @return
   */
  public static FunctionPlotter plot(Real sequence)
  {
    initializeJavaFxIfNecessary();
    AtomicReference<FunctionPlotter> ref  = new AtomicReference<>();
    Object                           sync = new Object();
    Platform.runLater(() ->
    {
      synchronized (sync)
      {
        // Create a SequenceDataSet from the Real sequence
        SequenceDataSet dataSet = new SequenceDataSet(sequence);

        FunctionPlotter plotter = new FunctionPlotter();
        ref.set(plotter);

        plotter.createScene();

        // Clear existing datasets if needed
        plotter.chart.getDatasets().clear();

        // Add the new dataset to FunctionPlotter's internal list
        plotter.chart.getDatasets().add(dataSet);

        // Create and show the scene if not already displayed

        plotter.stage.show();
        sync.notify();
      }
    });
    try
    {
      synchronized (sync)
      {
        sync.wait();
      }
    }
    catch (InterruptedException e)
    {
      wrapOrThrow(e);
    }
    return ref.get();
  }

  private static boolean javaFxInitialized = false;

  public static void initializeJavaFxIfNecessary()
  {
    if (!javaFxInitialized)
    {
      javaFxInitialized = true;
      try
      {
        Platform.startup(() ->
        {
          Platform.setImplicitExit(false);
        });
      }
      catch (Exception e)
      {
        e.printStackTrace(System.err);
      }
    }
  }

  public static FunctionPlotter plot(double left, double right, int n, RealFunction... functions)
  {
    return plot(left, right, n, Arrays.asList(functions));
  }

  public static FunctionPlotter plot(double left, double right, int n, Iterable<RealFunction> functions)
  {
    AtomicReference<FunctionPlotter> ref = new AtomicReference<FunctionPlotter>();

    initializeJavaFxIfNecessary();

    Semaphore sem = new Semaphore(0);
    Platform.runLater(() ->
    {

      try
      {
        FunctionPlotter plotter = new FunctionPlotter();
        ref.set(plotter);

        plotter.createScene();
        plotter.chart.getDatasets().clear();

        for (RealFunction func : functions)
        {
          RealDataSet sample = func.quantize(left, right, n);
          plotter.chart.getDatasets().add(sample);
        }

        plotter.show();
        functions.forEach(plotter.functions::add);
      }
      finally
      {
        sem.release();
      }

    });

    try
    {
      sem.tryAcquire(10, TimeUnit.SECONDS); 
    }
    catch (InterruptedException e)
    {
      wrapOrThrow(e);
    }
    return ref.get();

  }

}
