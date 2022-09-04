package de.gsi.math.samples;

import javafx.application.Application;
import javafx.scene.Node;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.gsi.chart.renderer.ErrorStyle;
import de.gsi.chart.renderer.LineStyle;
import de.gsi.dataset.DataSet;
import de.gsi.dataset.spi.DoubleErrorDataSet;
import de.gsi.dataset.utils.LimitedQueue;
import de.gsi.math.DataSetMath;
import de.gsi.math.functions.SigmoidFunction;
import de.gsi.math.samples.utils.AbstractDemoApplication;
import de.gsi.math.samples.utils.DemoChart;

/**
 * Sample to illustrate averaging over several data sets with an IIR and FIR low-pass filter
 * 
 * @author rstein
 */
public class DataSetAverageSample extends AbstractDemoApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(DataSetAverageSample.class);
    private static final int N_GRAPHS = 20;
    private static final int N_SAMPLES = 100;
    private DataSet oldAverageDataSet;
    private final DataSet oldAverageDataSet2 = new DoubleErrorDataSet("var2");

    @Override
    public Node getContent() {
        final DemoChart chart = new DemoChart(2);
        chart.getRenderer(0).setPolyLineStyle(LineStyle.NONE);
        chart.getRenderer(0).setErrorType(ErrorStyle.NONE);
        chart.getRenderer(1).setErrorType(ErrorStyle.ERRORSURFACE);
        chart.getYAxis(1).setAutoRanging(false);
        chart.getYAxis().maxProperty().bindBidirectional(chart.getYAxis(1).maxProperty());
        chart.getYAxis().minProperty().bindBidirectional(chart.getYAxis(1).minProperty());
        chart.getYAxis().tickUnitProperty().bindBidirectional(chart.getYAxis(1).tickUnitProperty());

        LimitedQueue<DataSet> lastDataSets = new LimitedQueue<>(N_GRAPHS);
        for (int i = 0; i < 20 * N_GRAPHS; i++) {
            SigmoidFunction sigmoidFunction = new SigmoidFunction("sigmoid") {
                @Override
                public double getValue(final double x) {
                    return 10.0 + super.getValue(x) + 0.05 * RANDOM.nextGaussian();
                }
            };

            DataSet dataSet = sigmoidFunction.getDataSetEstimate(-10.0, +10.0, N_SAMPLES);
            dataSet.setStyle("strokeColor=darkblue;fillColor=darkblue;strokeWidth=0.5");
            lastDataSets.add(dataSet);

            oldAverageDataSet = DataSetMath.averageDataSetsIIR(oldAverageDataSet, oldAverageDataSet2, dataSet,
                    N_GRAPHS);
        }

        chart.getRenderer(0).getDatasets().setAll(lastDataSets);
        DataSet filteredFIR = DataSetMath.averageDataSetsFIR(lastDataSets, N_GRAPHS);
        filteredFIR.setStyle("strokeColor=red;fillColor=red;strokeWidth=1");
        oldAverageDataSet.setStyle("strokeColor=darkOrange;fillColor=darkOrange;strokeWidth=2");

        chart.getRenderer(1).getDatasets().addAll(filteredFIR, oldAverageDataSet);

        LOGGER.atInfo().log("value at zero = " + filteredFIR.get(DataSet.DIM_Y, 0));

        return chart;
    }

    public static void main(final String[] args) {
        Application.launch(args);
    }
}
