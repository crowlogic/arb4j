package de.gsi.chart.samples;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.gsi.chart.XYChart;
import de.gsi.chart.axes.AxisLabelOverlapPolicy;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.plugins.Zoomer;
import de.gsi.chart.ui.geometry.Side;
import de.gsi.dataset.spi.DoubleDataSet;

/**
 * Simple example of how to rotate axis label and different label collision-avoidance schemes
 *
 * @author rstein
 */
public class RotatedAxisLabelSample extends Application {
    private static final Logger LOGGER = LoggerFactory.getLogger(RotatedAxisLabelSample.class);
    private static final int N_SAMPLES = 100; // default number of data points

    @Override
    public void start(final Stage primaryStage) {
        final DefaultNumericAxis xAxis0 = new DefaultNumericAxis("default x-axis");
        xAxis0.setSide(Side.TOP);
        final DefaultNumericAxis yAxis0 = new DefaultNumericAxis("default y-axis");
        yAxis0.setSide(Side.RIGHT);

        final XYChart chart = new XYChart(xAxis0, yAxis0);
        chart.getPlugins().add(new Zoomer()); // standard plugin, useful for most cases
        final DoubleDataSet dataSet1 = new DoubleDataSet("data set #1");
        chart.getDatasets().addAll(dataSet1);
        chart.setLegendVisible(false);

        // set additional axes
        for (AxisLabelOverlapPolicy policy : AxisLabelOverlapPolicy.values()) {
            final DefaultNumericAxis xAxis1 = getSynchedAxis(xAxis0, "x-axis (" + policy + ")");
            xAxis1.setSide(Side.BOTTOM);
            xAxis1.setOverlapPolicy(policy);

            final DefaultNumericAxis yAxis1 = getSynchedAxis(yAxis0, "y-axis (-90°, " + policy + ")");
            yAxis1.setSide(Side.LEFT);
            yAxis1.setTickLabelRotation(-90);
            yAxis1.setOverlapPolicy(policy);

            chart.getAxes().addAll(xAxis1, yAxis1);

            if (policy.equals(AxisLabelOverlapPolicy.SKIP_ALT)) {
                final DefaultNumericAxis xAxis2 = getSynchedAxis(xAxis0, "x-axis (" + policy + ") + extra label spacing");
                xAxis2.setSide(Side.BOTTOM);
                xAxis2.setOverlapPolicy(policy);
                xAxis2.setTickLabelSpacing(10);

                final DefaultNumericAxis yAxis2 = getSynchedAxis(yAxis0, "y-axis (-90°, " + policy + ") + extra label spacing");
                yAxis2.setSide(Side.LEFT);
                yAxis2.setTickLabelRotation(-90);
                yAxis2.setOverlapPolicy(policy);
                yAxis2.setTickLabelSpacing(10);

                chart.getAxes().addAll(xAxis2, yAxis2);
            }
        }

        final DefaultNumericAxis xAxis1 = getSynchedAxis(xAxis0, "x-axis (45°)");
        xAxis1.setSide(Side.BOTTOM);
        xAxis1.setOverlapPolicy(AxisLabelOverlapPolicy.DO_NOTHING);
        xAxis1.setTickLabelRotation(45);
        xAxis1.setMaxMajorTickLabelCount(40);

        final DefaultNumericAxis xAxis2 = getSynchedAxis(xAxis0, "x-axis (90°)");
        xAxis2.setSide(Side.BOTTOM);
        xAxis2.setOverlapPolicy(AxisLabelOverlapPolicy.DO_NOTHING);
        xAxis2.setTickLabelRotation(90);
        xAxis2.setMaxMajorTickLabelCount(40);

        chart.getAxes().addAll(xAxis1, xAxis2);

        final DefaultNumericAxis yAxis1 = getSynchedAxis(yAxis0, "y-axis (-45°)");
        yAxis1.setSide(Side.LEFT);
        yAxis1.setOverlapPolicy(AxisLabelOverlapPolicy.DO_NOTHING);
        yAxis1.setTickLabelRotation(-45);

        chart.getAxes().addAll(yAxis1);

        for (int n = 0; n < N_SAMPLES; n++) {
            dataSet1.add(12.34 * n, 1.33e3 * Math.cos(Math.toRadians(10.0 * n)));
        }

        final Scene scene = new Scene(new StackPane(chart), 800, 800);
        primaryStage.setTitle(getClass().getSimpleName());
        primaryStage.setScene(scene);
        primaryStage.show();
        primaryStage.setOnCloseRequest(evt -> Platform.exit());
        LOGGER.atInfo().addArgument(getClass().getSimpleName()).log("sample {} started");
    }

    private static DefaultNumericAxis getSynchedAxis(DefaultNumericAxis orig, String newAxisName) {
        final DefaultNumericAxis axis = new DefaultNumericAxis(newAxisName);
        axis.minProperty().bind(orig.minProperty());
        axis.maxProperty().bind(orig.maxProperty());
        axis.setTickLabelRotation(orig.getTickLabelRotation());

        return axis;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(final String[] args) {
        Application.launch(args);
    }
}
