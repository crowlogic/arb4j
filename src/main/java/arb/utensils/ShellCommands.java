package arb.utensils;

import arb.FloatInterval;
import arb.Real;
import arb.functions.real.RealFunction;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;
import javafx.stage.Stage;

public class ShellCommands
{

  public static Real eval(RealFunction func, double x)
  {
    Real y = Real.valueOf(x);
    return func.evaluate(y, 1, 128, y);
  }

  static Stage stage = null;

  public static void plot(double left, double right, RealFunction... functions)
  {
    plot(stage, left, right, functions);
  }

  public static void plot(Stage primaryStage, double left, double right, RealFunction... functions)
  {
    if (primaryStage == null)
    {
      primaryStage = Utensils.startChart();
    }

    stage = primaryStage;
    Platform.runLater(() ->
    {
      FunctionPlotter plotter = new FunctionPlotter();
      for (RealFunction function : functions)
      {
        plotter.functions.add(function);
      }
      plotter.domain = new FloatInterval(left,
                                         right);
      plotter.createScene(stage).toFront();
    });
  }
}
