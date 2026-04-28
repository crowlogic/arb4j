package arb.applications;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import javafx.animation.PauseTransition;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.embed.swing.SwingFXUtils;
import javafx.scene.Scene;
import javafx.scene.image.WritableImage;
import javafx.stage.Stage;
import javafx.stage.Window;
import javafx.util.Duration;

/**
 * Generic headless driver. Launches any
 * {@link javafx.application.Application} subclass named on the command line,
 * lets the JavaFX toolkit boot, waits a settle interval for the first stage
 * to render, snapshots it to a PNG, and exits. Intended to be run under Xvfb
 * -- JavaFX 26's Linux glass backend is GTK and the openjfx Maven artifacts
 * ship no Monocle path, so a real X protocol stream is required.
 *
 * Usage:
 * <pre>
 *   xvfb-run -a -s "-screen 0 1920x1200x24" \
 *     java -cp arb4j.jar arb.applications.ScreenshotDriver \
 *          &lt;Application-FQCN&gt; &lt;out.png&gt; [settleSeconds]
 * </pre>
 *
 * The FQCN may be any class extending {@code javafx.application.Application}
 * shipped inside arb4j.jar, e.g. {@code arb.applications.Expressor},
 * {@code arb.applications.SymbolPalette},
 * {@code arb.applications.ReferenceBrowser},
 * {@code arb.applications.RandomWaveSampler},
 * {@code arb.applications.BandLimitedWhiteNoiseSampler},
 * {@code arb.applications.LemniscateLab},
 * {@code arb.applications.TODO},
 * {@code arb.applications.InverseShiftedPhasePullbackSampler}, or any
 * {@code StationaryGaussianProcessSampler} subclass.
 *
 * The driver does not subclass the target -- it uses
 * {@link Application#launch(Class, String...)} on a reflection-resolved
 * class and locates the resulting primary stage via
 * {@link Window#getWindows()} once the toolkit reports a showing stage.
 */
public class ScreenshotDriver
{

  public static void main(String[] args) throws ClassNotFoundException
  {
    if (args.length < 2)
    {
      System.err.println("Usage: ScreenshotDriver <Application-FQCN> <out.png> [settleSeconds]");
      System.exit(2);
    }
    String                          fqcn          = args[0];
    String                          outputPath    = args[1];
    double                          settleSeconds = args.length > 2 ? Double.parseDouble(args[2]) : 3.0;

    Class<? extends Application>    appClass      = Class.forName(fqcn).asSubclass(Application.class);

    // Application.launch() drives Platform.startup() itself, so we cannot
    // call Platform.startup() up front (it would IllegalStateException out
    // of the second call). Instead launch on a daemon thread and from this
    // (still-blocking) thread poll Platform.isFxApplicationThread state via
    // Platform.runLater, which queues onto the toolkit once it is up.
    Thread launcher = new Thread(() -> Application.launch(appClass, new String[0]),
                                 "arb4j-screenshot-launcher");
    launcher.setDaemon(true);
    launcher.start();

    // Spin until the toolkit accepts a runLater call (i.e. is initialised),
    // then schedule the polling/snapshot pipeline on the JavaFX thread.
    while (true)
    {
      try
      {
        Platform.runLater(() -> pollForStageThenSnapshot(outputPath, settleSeconds));
        break;
      }
      catch (IllegalStateException notReady)
      {
        try
        {
          Thread.sleep(50);
        }
        catch (InterruptedException ie)
        {
          Thread.currentThread().interrupt();
          return;
        }
      }
    }
    try
    {
      launcher.join();
    }
    catch (InterruptedException ie)
    {
      Thread.currentThread().interrupt();
    }
  }

  private static void pollForStageThenSnapshot(String outputPath, double settleSeconds)
  {
    PauseTransition poll = new PauseTransition(Duration.millis(200));
    poll.setOnFinished(event ->
    {
      Stage primary = firstShowingStage();
      if (primary == null)
      {
        poll.playFromStart();
        return;
      }
      System.out.println("[driver] primary stage detected: " + primary.getTitle()
                         + " scene=" + primary.getScene());
      PauseTransition settle = new PauseTransition(Duration.seconds(settleSeconds));
      settle.setOnFinished(e -> snapshotAndExit(primary, outputPath));
      settle.play();
    });
    poll.play();
  }

  private static Stage firstShowingStage()
  {
    for (Window w : Window.getWindows())
    {
      if (w instanceof Stage stage && stage.isShowing() && stage.getScene() != null)
      {
        return stage;
      }
    }
    return null;
  }

  private static void snapshotAndExit(Stage stage, String outputPath)
  {
    try
    {
      Scene         scene   = stage.getScene();
      WritableImage image   = scene.snapshot(null);
      File          outFile = new File(outputPath);
      Path          parent  = Paths.get(outFile.getAbsolutePath()).getParent();
      if (parent != null)
      {
        parent.toFile().mkdirs();
      }
      boolean ok = ImageIO.write(SwingFXUtils.fromFXImage(image, null), "png", outFile);
      System.out.println("snapshot written: " + outFile.getAbsolutePath() + " ok=" + ok
                         + " w=" + (int) image.getWidth() + " h=" + (int) image.getHeight());
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    finally
    {
      Platform.exit();
    }
  }

}
