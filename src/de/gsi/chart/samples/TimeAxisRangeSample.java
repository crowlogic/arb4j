package de.gsi.chart.samples;

import java.util.Objects;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import de.gsi.chart.Chart;
import de.gsi.chart.axes.AxisLabelOverlapPolicy;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.axes.spi.format.DefaultTimeTickUnitSupplier;

/**
 * Small example for testing different time axis ranges
 *
 * @author rstein
 */
public class TimeAxisRangeSample extends Application {
    private static final String CHART_CSS = Objects.requireNonNull(Chart.class.getResource("chart.css")).toExternalForm();

    @Override
    public void start(final Stage primaryStage) {
        final double now = System.currentTimeMillis() / 1000.0; // [s]
        final VBox root = new VBox();
        root.setAlignment(Pos.CENTER);

        final TimeAxis xAxis1 = new TimeAxis("standard time axis", now - 3600, now, 3600 / 12);
        root.getChildren().add(xAxis1);

        final TimeAxis xAxis2 = new TimeAxis("inverted time axis", now - 3600, now, 3600 / 12);
        xAxis2.invertAxis(true);
        root.getChildren().add(xAxis2);

        final double[] ranges = { 0.1, 1.0, 10.0, 30.0, 3600.0, 3600 * 24, 3600 * 24 * 31 * 3, 3600 * 24 * 31 * 60 };
        for (double range : ranges) {
            final TimeAxis axis = new TimeAxis("time axis - range = " + range + " s", now - range, now, range / 10); // NOPMD
            root.getChildren().add(axis);
        }

        // example for dynamic scaling with metric prefix and unit
        final TimeAxis xAxisDyn = new TimeAxis("dynamic time axis", now - 1e-3, now, 1);
        xAxisDyn.setMinorTickCount(10);
        xAxisDyn.setAutoRangeRounding(false);
        root.getChildren().add(xAxisDyn);

        final Label xAxis9Text = new Label();
        root.getChildren().add(xAxis9Text);

        final Timer timer = new Timer("sample-update-timer", true);
        final TimerTask task = new TimerTask() {
            private int counter;
            private boolean directionUpwards = true;

            @Override
            public void run() {
                if (directionUpwards) {
                    counter++;
                } else {
                    counter--;
                }
                Platform.runLater(() -> {
                    final double range = DefaultTimeTickUnitSupplier.TICK_UNIT_DEFAULTS[counter];
                    xAxisDyn.minProperty().set(now - range);
                    final String text = "actual range [s]: " + String.format("%#.3f", range) + " ("
                                      + String.format("%#.1f", range / 3600 / 24) + " days)";
                    xAxisDyn.setTickUnit(range / 12);
                    xAxisDyn.forceRedraw();
                    xAxis9Text.setText(text);
                });
                if (counter >= DefaultTimeTickUnitSupplier.TICK_UNIT_DEFAULTS.length - 1 || counter <= 0) {
                    directionUpwards = !directionUpwards;
                }
            }
        };
        timer.scheduleAtFixedRate(task, 0, TimeUnit.SECONDS.toMillis(2));

        final Scene scene = new Scene(root, 1200, 1100);
        scene.getStylesheets().setAll(CHART_CSS);

        primaryStage.setTitle(this.getClass().getSimpleName());
        primaryStage.setScene(scene);
        primaryStage.setOnCloseRequest(evt -> Platform.exit());
        primaryStage.show();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(final String[] args) {
        Application.launch(args);
    }

    protected static class TimeAxis extends DefaultNumericAxis {
        public TimeAxis(String label, final double min, final double max, final double tick) {
            super(label, min, max, tick);
            this.setAutoRangeRounding(true);
            this.setTimeAxis(true);
            this.setOverlapPolicy(AxisLabelOverlapPolicy.SHIFT_ALT);
            VBox.setMargin(this, new Insets(5, 50, 30, 50));
            VBox.setVgrow(this, Priority.ALWAYS);
        }
    }
}
