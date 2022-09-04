package de.gsi.misc.samples;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.stage.Stage;

import de.gsi.chart.XYChart;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.plugins.EditAxis;
import de.gsi.chart.plugins.Zoomer;
import de.gsi.chart.renderer.ErrorStyle;
import de.gsi.chart.renderer.spi.ErrorDataSetRenderer;
import de.gsi.chart.ui.HiddenSidesPane;
import de.gsi.dataset.spi.DoubleErrorDataSet;
import de.gsi.math.MathBaseFast;

/**
 * Sample to illustrate limits
 *
 * @author rstein
 */
public class LimitsSample extends Application {
    private static final int N_SAMPLES = 100;
    private static final int WIDTH = 1200;
    private static final int HEIGHT = 600;

    @Override
    public void start(final Stage primaryStage) {
        var xAxis = new DefaultNumericAxis("time", "s");
        var yAxis = new DefaultNumericAxis("y-value", "a.u.");
        var chart = new XYChart(xAxis, yAxis);
        final HiddenSidesPane hiddenSidePane = chart.getPlotArea();
        hiddenSidePane.setTriggerDistance(0);

        chart.getPlugins().add(new Zoomer());
        chart.getPlugins().add(new EditAxis());
        ErrorDataSetRenderer rendererValue = (ErrorDataSetRenderer) chart.getRenderers().get(0);
        rendererValue.setDrawMarker(true);
        var rendererLimits = new ErrorDataSetRenderer();
        rendererLimits.setErrorType(ErrorStyle.ERRORSURFACE);
        rendererLimits.setDrawMarker(false);
        chart.getRenderers().add(rendererLimits);

        var upperLimit = new DoubleErrorDataSet("upper limit");
        upperLimit.setStyle("showInLegend=false; strokeColor=darkgreen");
        var lowerLimit = new DoubleErrorDataSet("lower limit");
        lowerLimit.setStyle("showInLegend=false; strokeColor=darkred");
        var dataSet = new DoubleErrorDataSet("some dataset");
        dataSet.setStyle("markerSize=3; markerColor=violet; markerType=diamond");
        rendererValue.getDatasets().add(dataSet);
        rendererLimits.getDatasets().addAll(upperLimit, lowerLimit);

        for (var i = 0; i < N_SAMPLES; i++) {
            final double time = i * 0.01;
            final double value = MathBaseFast.sin(2.0 * Math.PI * time);
            final double confidenceInterval = 0.2 * MathBaseFast.cos(2.0 * Math.PI * time);

            dataSet.add(time, value, confidenceInterval, confidenceInterval);
            upperLimit.add(time, value + 2, 0, Double.POSITIVE_INFINITY);
            lowerLimit.add(time, value - 2, Double.POSITIVE_INFINITY, 0);
        }

        final var scene = new Scene(chart, WIDTH, HEIGHT);

        primaryStage.setTitle(LimitsSample.class.getSimpleName());
        primaryStage.setOnCloseRequest(evt -> Platform.exit());
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
