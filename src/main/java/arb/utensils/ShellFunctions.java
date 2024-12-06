package arb.utensils;

import static arb.utensils.Utensils.wrapOrThrow;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Collection;
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
import arb.viz.WindowManager;
import javafx.application.Platform;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ShellFunctions
{

  public static FunctionPlotter plot(RealTwoDimensionalDataSet sequence)
  {
    WindowManager.initializeJavaFxIfNecessary();
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
    WindowManager.initializeJavaFxIfNecessary();
    AtomicReference<FunctionPlotter> ref = new AtomicReference<>();
    var                              sem = new Semaphore(0);

    Platform.runLater(() ->
    {
      var dataSet = new SequenceDataSet(sequence);

      try
      {
        var plotter = new FunctionPlotter();
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

  public static boolean javaFxInitialized = false;

  @SafeVarargs
  public static <R extends RealFunction> FunctionPlotter plot(double left, double right, int n, R... functions)
  {
    return plot(left, right, n, Arrays.asList(functions));
  }

  public static <R extends RealFunction>
         FunctionPlotter
         plot(double left, double right, int n, Collection<? extends R> functions)
  {
    AtomicReference<FunctionPlotter> ref = new AtomicReference<>();

    WindowManager.initializeJavaFxIfNecessary();

    var sem = new Semaphore(0);
    Platform.runLater(() ->
    {

      try
      {
        FunctionPlotter plotter = new FunctionPlotter();
        ref.set(plotter);

        plotter.createScene();
        plotter.chart.getDatasets().clear();

        var datasets = plotter.chart.getDatasets();
        for (var func : functions)
        {
          datasets.add(func.quantize(left, right, n));
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

  protected static FunctionPlotter waitForFunctionPlotterToBeReleased(AtomicReference<FunctionPlotter> ref,
                                                                      Semaphore sem)
  {
    try
    {
      sem.tryAcquire(10, TimeUnit.SECONDS);
    }
    catch (InterruptedException e)
    {
      wrapOrThrow(e);
    }
    var functionPlotter = ref.get();
    functionPlotter.show();
    return functionPlotter;
  }

  public static void inspect(Object obj)
  {
    var yaml = Utensils.newYaml();
    var pw   = new PrintWriter(System.out);
    yaml.dump(obj, pw);
  }

}
