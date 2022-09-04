package de.gsi.chart.samples;

import java.util.Collections;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ToolBar;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.CycleMethod;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Paint;
import javafx.scene.paint.Stop;
import javafx.stage.Stage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.gsi.chart.XYChart;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.plugins.EditAxis;
import de.gsi.chart.plugins.Zoomer;
import de.gsi.chart.renderer.ErrorStyle;
import de.gsi.chart.renderer.spi.ErrorDataSetRenderer;
import de.gsi.chart.renderer.spi.utils.DefaultRenderColorScheme;
import de.gsi.dataset.spi.DoubleErrorDataSet;

/**
 * Example illustrating the various colour scheme options
 * 
 * @author rstein
 */
public class CustomColourSchemeSample extends Application {
    private static final Logger LOGGER = LoggerFactory.getLogger(CustomColourSchemeSample.class);
    private static final int N_SAMPLES = 2000; // default number of data points
    private static final int N_DATA_SETS_MAX = 10;

    @Override
    public void start(final Stage primaryStage) {
        final XYChart chart = new XYChart(new DefaultNumericAxis("x-Axis"), new DefaultNumericAxis("y-Axis"));
        chart.getPlugins().add(new Zoomer()); // standard plugins, useful for most cases
        chart.getPlugins().add(new EditAxis()); // for editing axes
        VBox.setVgrow(chart, Priority.ALWAYS);
        ErrorDataSetRenderer renderer = (ErrorDataSetRenderer) chart.getRenderers().get(0);

        for (int i = 0; i < N_DATA_SETS_MAX; i++) {
            DoubleErrorDataSet dataSet = new DoubleErrorDataSet("Set#" + i); // NOPMD
            for (int n = 0; n < N_SAMPLES; n++) {
                dataSet.add(n, 0.5 * i + Math.cos(Math.toRadians(1.0 * n)), 0.15, 0.15);
            }
            chart.getDatasets().add(dataSet);
        }

        ComboBox<DefaultRenderColorScheme.Palette> strokeStyleCB = new ComboBox<>();
        strokeStyleCB.getItems().setAll(DefaultRenderColorScheme.Palette.values());
        strokeStyleCB.getSelectionModel().select(
                DefaultRenderColorScheme.Palette.getValue(DefaultRenderColorScheme.strokeColorProperty().get()));
        strokeStyleCB.getSelectionModel().selectedItemProperty().addListener((ch, o, n) -> {
            DefaultRenderColorScheme.strokeColorProperty().set(n.getPalette());
            chart.requestLayout();
            chart.getLegend().updateLegend(chart.getDatasets(), Collections.singletonList(renderer), true);
            LOGGER.atInfo().log("updated stroke colour scheme to " + n.name());
        });

        ComboBox<DefaultRenderColorScheme.Palette> fillStyleCB = new ComboBox<>();
        fillStyleCB.getItems().setAll(DefaultRenderColorScheme.Palette.values());
        fillStyleCB.getSelectionModel()
                .select(DefaultRenderColorScheme.Palette.getValue(DefaultRenderColorScheme.fillColorProperty().get()));
        fillStyleCB.getSelectionModel().selectedItemProperty().addListener((ch, o, n) -> {
            DefaultRenderColorScheme.fillColorProperty().set(n.getPalette());
            DefaultRenderColorScheme.fillStylesProperty().clear();
            DefaultRenderColorScheme.fillStylesProperty().set(DefaultRenderColorScheme.getStandardFillStyle());
            chart.requestLayout();
            chart.getLegend().updateLegend(chart.getDatasets(), Collections.singletonList(renderer), true);
            LOGGER.atInfo().log("updated fill colour scheme to " + n.name());
        });

        ComboBox<ErrorStyle> errorStyleCB = new ComboBox<>();
        errorStyleCB.getItems().setAll(ErrorStyle.values());
        errorStyleCB.getSelectionModel().select(renderer.getErrorType());
        errorStyleCB.getSelectionModel().selectedItemProperty().addListener((ch, o, n) -> {
            renderer.setErrorType(n);
            chart.requestLayout();
            LOGGER.atInfo().log("updated error style to " + n.name());
        });

        Button customFill = new Button("custom fill");
        customFill.setOnAction(evt -> {
            final ObservableList<Paint> values = FXCollections.observableArrayList();
            for (Color colour : DefaultRenderColorScheme.fillColorProperty()) {
                Stop[] stops = new Stop[] { new Stop(0, colour.brighter().interpolate(Color.TRANSPARENT, 0.4)), // NOPMD
                    new Stop(1, colour.brighter().interpolate(Color.TRANSPARENT, 0.95)) }; // NOPMD
                LinearGradient gradient = new LinearGradient(0.0, 0.0, 1.0, 0.0, true, CycleMethod.REPEAT, stops); // NOPMD
                values.add(gradient);
            }
            DefaultRenderColorScheme.fillStylesProperty().clear();
            DefaultRenderColorScheme.fillStylesProperty().set(values);
            chart.requestLayout();
            chart.getLegend().updateLegend(chart.getDatasets(), Collections.singletonList(renderer), true);
            LOGGER.atInfo().log("updated to custom filling scheme");
        });

        ToolBar toolBar = new ToolBar(new Label("stroke colour: "), strokeStyleCB, new Label("fill colour: "),
                fillStyleCB, new Label("error style: "), errorStyleCB, customFill);
        final Scene scene = new Scene(new VBox(toolBar, chart), 800, 600);
        primaryStage.setTitle(getClass().getSimpleName());
        primaryStage.setScene(scene);
        primaryStage.show();
        primaryStage.setOnCloseRequest(evt -> Platform.exit());
    }

    /**
     * @param args the command line arguments
     */
    public static void main(final String[] args) {
        Application.launch(args);
    }
}
