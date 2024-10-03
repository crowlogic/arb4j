package arb.utensils;

import static arb.utensils.Utensils.wrapOrThrow;

import java.util.Arrays;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import arb.Real;
import arb.RealTwoDimensionalDataSet;
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

  public static FunctionPlotter plot(RealTwoDimensionalDataSet sequence)
  {
    Utensils.initializeJavaFxIfNecessary();
    AtomicReference<FunctionPlotter> ref = new AtomicReference<>();
    Semaphore                        sem = new Semaphore(0);

    Platform.runLater(() ->
    {
      RealTwoDimensionalDataSet dataSet = sequence;

      try 
      {
        FunctionPlotter plotter = new FunctionPlotter();
        ref.set(plotter);
        plotter.createScene();
        plotter.chart.getDatasets().clear();
        plotter.chart.getDatasets().add(dataSet);
        plotter.stage.show();
      }
      finally
      {
        sem.release();
      }

    });

    return waitForFunctionPlotterToBeReleased(ref, sem);
  }

  public static FunctionPlotter plot(Real sequence)
  {
    Utensils.initializeJavaFxIfNecessary();
    AtomicReference<FunctionPlotter> ref = new AtomicReference<>();
    Semaphore                        sem = new Semaphore(0);

    Platform.runLater(() ->
    {
      SequenceDataSet dataSet = new SequenceDataSet(sequence);

      try
      {
        FunctionPlotter plotter = new FunctionPlotter();
        ref.set(plotter);
        plotter.createScene();
        plotter.chart.getDatasets().clear();
        plotter.chart.getDatasets().add(dataSet);
        plotter.stage.show();
      }
      finally
      {
        sem.release();
      }
    });
    return waitForFunctionPlotterToBeReleased(ref, sem);

  }

  static boolean javaFxInitialized = false;

  public static FunctionPlotter plot(double left, double right, int n, RealFunction... functions)
  {
    return plot(left, right, n, Arrays.asList(functions));
  }

  public static FunctionPlotter plot(double left, double right, int n, Iterable<RealFunction> functions)
  {
    AtomicReference<FunctionPlotter> ref = new AtomicReference<>();

    Utensils.initializeJavaFxIfNecessary();

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
          RealTwoDimensionalDataSet sample = func.quantize(left, right, n);
          plotter.chart.getDatasets().add(sample);
        }

        plotter.stage.show();
        functions.forEach(plotter.functions::add);
      }
      finally
      {
        sem.release();
      }

    });

    return waitForFunctionPlotterToBeReleased(ref, sem);

  }

  public static FunctionPlotter waitForFunctionPlotterToBeReleased(AtomicReference<FunctionPlotter> ref, Semaphore sem)
  {
    try
    {
      sem.tryAcquire(10, TimeUnit.SECONDS);
    }
    catch (InterruptedException e)
    {
      wrapOrThrow(e);
    }
    FunctionPlotter functionPlotter = ref.get();
    functionPlotter.show();
    return functionPlotter;
  }

}
