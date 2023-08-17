package arb.viz;

import arb.functions.real.FunctionSampler;
import arb.utensils.ShellCommands;
import de.gsi.chart.XYChart;
import de.gsi.chart.axes.AxisMode;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.plugins.*;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

public class FunctionPlotter extends
                             FunctionSampler
{

  @Override
  public void close()
  {
    super.close();
    stage.close();
  }

  private Stage              stage;
  private StackPane          root;
  private Scene              scene;
  public boolean             darkStyle = true;

  private DefaultNumericAxis xAxis     = new DefaultNumericAxis();
  private DefaultNumericAxis yAxis     = new DefaultNumericAxis();
  public final XYChart       chart     = new XYChart(xAxis,
                                                     yAxis);

  public Stage createScene(Stage primaryStage)
  {
    initialize();
    root = new StackPane();
    configureChartPlugins();
    root.getChildren().add(chart);
    scene = new Scene(root,
                      1500,
                      750);
    if (darkStyle)
    {
      scene.getStylesheets().add("dark-theme.css");
    }
    Platform.runLater(() ->
    {
      set(primaryStage, evt ->
      {
        if (ShellCommands.stage == primaryStage)
        {
          System.out.println("Closing " + ShellCommands.stage);
          stage               = null;
          ShellCommands.stage = null;
        }
      });
    });
    return primaryStage;
  }

  public void configureChartPlugins()
  {
    chart.getPlugins().addAll(new EditAxis(AxisMode.XY), new DataPointTooltip(), new Zoomer());
  }

  public void initialize()
  {
    refreshFunctionDatasets();
    resampleFunctions(false);
  }

  public void set(Stage primaryStage, javafx.event.EventHandler<WindowEvent> onCloseRequestHandler)
  {
    primaryStage.setTitle(this.getClass().getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.setOnCloseRequest(onCloseRequestHandler);
    primaryStage.show();
  }

  private void updateLegend()
  {
    chart.getLegend().updateLegend(chart.getDatasets(), chart.getRenderers(), true);
  }

  @Override
  public void refreshFunctionDatasets()
  {
    super.refreshFunctionDatasets();
    chart.getDatasets().addAll(dataSets);
  }

}
