package arb.applications;

import javafx.animation.PauseTransition;
import javafx.application.Platform;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.Scene;
import javafx.scene.image.WritableImage;
import javafx.stage.Stage;
import javafx.util.Duration;

import javax.imageio.ImageIO;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Headless driver that boots a {@link RandomWaveSampler}, lets it render
 * its four-pane chart grid, snapshots the live JavaFX scene to a PNG, and
 * exits. Intended to be run under Xvfb so the Linux environment supplies
 * a real X server (chartfx/JavaFX 25 has no Monocle path here).
 *
 * <p>Output path is {@code workspace/sampler_screenshot.png} or whatever
 * is passed as the first argument.
 */
public class SamplerScreenshotDriver extends
                                     RandomWaveSampler
{

  private static String outputPath = "/home/user/workspace/sampler_screenshot.png";

  public static void main(String[] args)
  {
    if (args.length > 0)
    {
      outputPath = args[0];
    }
    launch(new String[0]);
  }

  @Override
  public void start(Stage stage)
  {
    System.out.println("[driver] start() entered");
    super.start(stage);
    System.out.println("[driver] super.start() returned, scene=" + stage.getScene());

    PauseTransition settle = new PauseTransition(Duration.seconds(2));
    settle.setOnFinished(event ->
    {
      System.out.println("[driver] pause finished, capturing snapshot");
      try
      {
        Scene          scene    = stage.getScene();
        WritableImage  image    = scene.snapshot(null);
        File           outFile  = new File(outputPath);
        Path           parent   = Paths.get(outFile.getAbsolutePath()).getParent();
        if (parent != null)
        {
          parent.toFile().mkdirs();
        }
        boolean ok = ImageIO.write(SwingFXUtils.fromFXImage(image, null), "png", outFile);
        System.out.println("snapshot written: " + outFile.getAbsolutePath() + " ok=" + ok
                            + " w=" + (image == null ? -1 : (int) image.getWidth())
                            + " h=" + (image == null ? -1 : (int) image.getHeight()));
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }
      finally
      {
        Platform.exit();
      }
    });
    settle.play();
    System.out.println("[driver] PauseTransition started");
  }

}
