package de.gsi.chart.samples;

import java.util.concurrent.TimeUnit;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;

import de.gsi.chart.XYChart;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.plugins.EditAxis;
import de.gsi.chart.plugins.Zoomer;
import de.gsi.chart.utils.FXUtils;
import de.gsi.dataset.spi.CircularDoubleErrorDataSet;
import de.gsi.math.Math;

/**
 * Auto grow-ranging example.
 *
 * @author ennerf
 * @author akrimm
 */

public class PaddedAutoGrowAxisSample extends Application {
    @Override
    public void start(Stage primaryStage) throws Exception {
        var xAxis = new DefaultNumericAxis();
        var yAxis = new DefaultNumericAxis();
        var chart = new XYChart(xAxis, yAxis);
        chart.getPlugins().add(new EditAxis());
        chart.getPlugins().add(new Zoomer());

        yAxis.setAutoRangePadding(0.05);
        yAxis.setAutoRanging(false);
        yAxis.setAutoGrowRanging(true);
        yAxis.set(0, 10);

        var ds = new CircularDoubleErrorDataSet("", 150);
        chart.getDatasets().addAll(ds);
        new Thread(() -> {
            while (true) {
                ds.reset();
                try {
                    TimeUnit.MILLISECONDS.sleep(100);
                    FXUtils.runAndWait(() -> {
                        yAxis.set(0, 10);
                        yAxis.getAutoRange().clear();
                    });
                    TimeUnit.MILLISECONDS.sleep(100);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                for (int i = 0; i < 500; i++) {
                    ds.add(i, 40 * Math.sin(i * 0.1) + 100 * Math.sin(i * 0.02), 0, 0);
                    try {
                        TimeUnit.MILLISECONDS.sleep(40);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }).start();

        Scene scene = new Scene(chart, 800, 600);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(final String[] args) {
        Application.launch(args);
    }
}
