package de.gsi.chart.samples;

import java.util.Objects;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.image.Image;
import javafx.scene.layout.HBox;
import javafx.scene.paint.Color;
import javafx.scene.paint.Paint;
import javafx.stage.Stage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import de.gsi.chart.renderer.spi.hexagon.Hexagon;
import de.gsi.chart.renderer.spi.hexagon.HexagonMap;
import de.gsi.chart.renderer.spi.hexagon.NoPathFoundException;

public class HexagonSamples extends Application {
    private static final Logger LOGGER = LoggerFactory.getLogger(HexagonSamples.class);
    private Paint oldHexColour;

    @Override
    public void start(Stage primaryStage) throws Exception {
        final Image image = new Image(Objects.requireNonNull(HexagonSamples.class.getResourceAsStream("./testdata/EU.png")));
        // Convert the image to hexagons
        final HexagonMap map = new HexagonMap(6, image, 80, (q, r, imagePixelColor, map1) -> {
            if (imagePixelColor.getBlue() > 0.6) {
                final Hexagon h = new Hexagon(q, r);
                if (imagePixelColor.getRed() < 0.1) {
                    h.setFill(Color.DARKBLUE);
                    h.setStroke(Color.WHITE);
                    h.setIsBlockingPath(false);
                } else {
                    h.setFill(Color.LIGHTGRAY);
                    h.setStroke(Color.GRAY);
                    h.setIsBlockingPath(true);
                }

                h.setStrokeWidth(0.5);
                map1.addHexagon(h);
            }
        });

        // Try some path finding
        final Hexagon start = map.getHexagon(18, 54);
        final Hexagon destination = map.getHexagon(4, 57);
        try {
            for (final Hexagon hexagon : start.getPathTo(destination)) {
                hexagon.setFill(Color.RED);
            }
        } catch (final NoPathFoundException e) {
            LOGGER.atInfo().log("could not find path for given start/destination coordinates" + e);
        }

        map.setOnHexagonClickedCallback(hexagon -> {
            hexagon.setBackgroundColor(Color.BLUE);
            LOGGER.atInfo().log("clicked on " + hexagon);
        });

        map.setOnHexagonEnteredCallback(hexagon -> {
            oldHexColour = hexagon.getFill();
            hexagon.setFill(Color.YELLOW.darker());
        });
        map.setOnHexagonExitCallback(hexagon -> {
            if (oldHexColour != null) {
                hexagon.setFill(oldHexColour);
            }
        });

        final Group hexagonGroup = new Group();
        // Render on screen
        map.setRenderCoordinates(false);
        map.render(hexagonGroup);

        final Canvas canvas = new Canvas();
        canvas.setWidth(850);
        canvas.setHeight(700);
        map.render(canvas);
        map.registerCanvasMouseLiner(canvas);

        final Scene hexScene = new Scene(new HBox(hexagonGroup, canvas), 2 * 850, 700);
        primaryStage.setTitle(HexagonSamples.class.getSimpleName());
        primaryStage.setScene(hexScene);
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