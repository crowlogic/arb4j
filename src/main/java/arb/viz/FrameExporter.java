package arb.viz;

import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;

import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.dataset.EditableDataSet;
import io.fair_acc.dataset.spi.DefaultDataSet;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.Scene;
import javafx.scene.SnapshotParameters;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public final class FrameExporter extends
                                 Application
{

  /* Tunables ------------------------------------------------------------ */

  private static final int    WIDTH  = 800;  // snapshot width (px)
  private static final int    HEIGHT = 600;  // snapshot height (px)
  private static final double L_MIN  = -1.0; // λ grid start
  private static final double L_MAX  = 1.0;  // λ grid end
  private static final int    STEPS  = 40;   // frames ≈ GIF fps * duration
  private static final int    DELAY  = 80;   // GIF delay per frame (ms)

  /* -------------------------------------------------------------------- */

  public static void main(String[] args)
  {
    launch(args);
  }

  @Override
  public void start(Stage stage) throws Exception
  {

    // Directory boiler-plate
    Path outDir = Path.of("target", "frames");
    Files.createDirectories(outDir);

    List<BufferedImage> frames = new ArrayList<>();

    // Build & snapshot each chart
    for (int i = 0; i <= STEPS; i++)
    {
      double    λ     = L_MIN + i * (L_MAX - L_MIN) / STEPS;
      XYChart   chart = buildChart(λ);

      // Force layout once so snapshot size is valid
      StackPane root  = new StackPane(chart);
      Scene     scene = new Scene(root,
                                  WIDTH,
                                  HEIGHT);
      chart.setAnimated(false);
      root.applyCss();
      root.layout();

      BufferedImage bimg = SwingFXUtils.fromFXImage(root.snapshot(new SnapshotParameters(), null),
                                                    null);

      // Save numbered PNG
      String        idx  = String.format("%04d", i);
      ImageIO.write(bimg, "png", outDir.resolve("frame-" + idx + ".png").toFile());

      frames.add(bimg);
    }

    // Assemble the GIF once all frames exist
    try ( FileImageOutputStream out = new FileImageOutputStream(new File("target/sequence.gif"));
          GifSequenceWriter gif = new GifSequenceWriter(out,
                                                        BufferedImage.TYPE_INT_ARGB,
                                                        DELAY,
                                                        true))
    {
      for (BufferedImage f : frames)
        gif.write(f);
    }

    // Headless batch job – kill JavaFX thread
    Platform.exit();
  }

  /** Example synthetic dataset: e_i(x(t)) ≔ sin(λ · t) / t² */
  private static XYChart buildChart(double λ)
  {
    DefaultNumericAxis xAxis = new DefaultNumericAxis("t",
                                                      "s");
    DefaultNumericAxis yAxis = new DefaultNumericAxis("e_i(t)",
                                                      "");
    XYChart            chart = new XYChart(xAxis,
                                           yAxis);

    EditableDataSet    ds    = new DefaultDataSet("λ = "
                                                  + new DecimalFormat("+#0.000;-#0.000").format(λ));
    for (double t = 0.05; t <= 4.0; t += 0.02)
    {
      assert false : "...";        
      //ds.add(t, Math.sin(λ * t) / (t * t));
    }
    chart.getDatasets().add(ds);
    return chart;
  }
}