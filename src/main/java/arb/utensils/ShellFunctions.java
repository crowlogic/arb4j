package arb.utensils;

import static arb.utensils.Utensils.wrapOrThrow;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.IntFunction;
import java.util.stream.IntStream;

import arb.Real;
import arb.RealDataSet;
import arb.RealPolynomial;
import arb.SequenceDataSet;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.utensils.text.trees.FileNode;
import arb.utensils.text.trees.FileTreeModel;
import arb.utensils.text.trees.TextTree;
import arb.viz.FunctionPlotter;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.Chart;
import io.fair_acc.chartfx.utils.WriteFxImage;
import javafx.application.Platform;
import javafx.scene.image.WritableImage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ShellFunctions
{

  public static void ls(String path)
  {
    if (path.contains("~"))
    {
      path = path.replaceAll("~", System.getProperty("user.home"));
    }
    var fs = new FileTreeModel(new File(path));
    var tt = new TextTree<FileNode>(fs);
    System.out.println(tt);
  }

  public static <A> List<A> seq(int m, int n, IntFunction<A> f)
  {
    return IntStream.rangeClosed(m, n).mapToObj(f).toList();
  };

  @SuppressWarnings("unchecked")
  public static <A> A[] array(List<A> list, Class<A> type)
  {
    return (A[]) list.toArray((A[]) Array.newInstance(type, list.size()));
  }

  public static List<Real> coeffs(List<RealPolynomial> s)
  {
    return s.stream().map(p -> p.getCoeffs()).toList();
  };

  public static void matrix(List<RealPolynomial> s)
  {
    s.forEach(h ->
    {
      h.getCoeffs().forEach(g -> g.printPrecision = false);
      System.out.format("#%s=%s\n\n", h.getLength(), h.coeffs);
    });
  }

  public static RealPolynomial[] rarray(List<RealPolynomial> list)
  {
    return array(list, RealPolynomial.class);
  }

  public static Integer[] iarray(List<Integer> list)
  {
    return array(list, Integer.class);
  }

  public static RealFunction[] rfarray(List<RealFunction> funcs)
  {
    return array(funcs, RealFunction.class);
  }

  public static FunctionPlotter plot(RealDataSet sequence)
  {
    WindowManager.initializeJavaFxIfNecessary();
    AtomicReference<FunctionPlotter> ref = new AtomicReference<>();
    Semaphore                        sem = new Semaphore(0);

    Platform.runLater(() ->
    {
      RealDataSet dataSet = sequence;

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

  public static void saveImage(FunctionPlotter plotter, String filename)
  {
    saveImage(plotter.chart, filename);
  }

  public static void saveImage(Chart chart, String filename)
  {
    Platform.runLater(() ->
    {

      WritableImage image = chart.snapshot(null, null);
      try
      {
        WriteFxImage.savePng(image, new File(filename));
      }
      catch (IOException e)
      {
        Utensils.wrapOrThrow(e);
      }
    });

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
  public static <R extends RealFunction>
         FunctionPlotter
         plot(double left, double right, int n, R... functions)
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

  protected static FunctionPlotter
            waitForFunctionPlotterToBeReleased(AtomicReference<FunctionPlotter> ref, Semaphore sem)
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

  public static ImageViewer showFormula(Typesettable formula)
  {
    return showFormula(formula, 24);
  }

  public static ImageViewer showFormula(Typesettable formula, int size)
  {

    var imageViewer = new ImageViewer(formula.toString(),
                                      Utensils.renderFormula(formula.typeset(), size));
    imageViewer.setVisible(true);
    return imageViewer;
  }

}
