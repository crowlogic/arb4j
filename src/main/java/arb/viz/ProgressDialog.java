package arb.viz;

import java.util.concurrent.atomic.AtomicBoolean;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.stage.Window;

/**
 * Modal progress dialog with a {@link ProgressBar}, percent label, and
 * Cancel button. Auto-dismissed by {@link #close()}; cancel sets the
 * cancellation flag and the worker is expected to honor it. Implements
 * {@link ProgressReporter} so callers can pass {@code this} straight
 * into worker code.
 *
 * <p>Threading: the dialog must be constructed on the JavaFX Application
 * Thread but {@link #setFraction(double)}, {@link #setMessage(String)},
 * and {@link #isCancelled()} are safe to call from any thread.
 *
 * <p>Lifecycle:
 * <pre>
 *   ProgressDialog dlg = new ProgressDialog(owner, "Generating sample path");
 *   dlg.show();
 *   Thread worker = new Thread(() -> {
 *     try { ... worker calls dlg.setFraction(...) ... }
 *     finally { Platform.runLater(dlg::close); }
 *   });
 *   worker.setDaemon(true);
 *   worker.start();
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne \u00a9 terms of the
 *      {@link TheArb4jLibrary}
 */
public class ProgressDialog implements
                            ProgressReporter
{
  private final Stage         stage;
  private final ProgressBar   bar;
  private final Label         percentLabel;
  private final Label         messageLabel;
  private final AtomicBoolean cancelled = new AtomicBoolean(false);

  public ProgressDialog(Window owner, String title)
  {
    stage = new Stage(StageStyle.UTILITY);
    if (owner != null)
    {
      stage.initOwner(owner);
      stage.initModality(Modality.WINDOW_MODAL);
    }
    stage.setTitle(title);
    stage.setResizable(false);

    bar = new ProgressBar(0.0);
    bar.setPrefWidth(320);
    percentLabel = new Label("0%");
    percentLabel.setMinWidth(48);

    HBox barRow = new HBox(8, bar, percentLabel);
    barRow.setAlignment(Pos.CENTER_LEFT);

    messageLabel = new Label(title);
    messageLabel.setStyle("-fx-font-size: 11px;");

    Button cancel = new Button("Cancel");
    cancel.setOnAction(e ->
    {
      cancelled.set(true);
      cancel.setDisable(true);
      cancel.setText("Cancelling...");
    });

    HBox btnRow = new HBox(cancel);
    btnRow.setAlignment(Pos.CENTER_RIGHT);

    VBox root = new VBox(10, messageLabel, barRow, btnRow);
    root.setPadding(new Insets(14));

    Scene scene = new Scene(root);
    stage.setScene(scene);

    // Closing the window via the title bar / OS counts as cancel.
    stage.setOnCloseRequest(e -> cancelled.set(true));
  }

  /** Show non-blocking; caller's worker thread runs while this is up. */
  public void show()
  {
    stage.show();
  }

  /** Hide and release. Safe to call from any thread. */
  public void close()
  {
    if (Platform.isFxApplicationThread())
    {
      stage.close();
    }
    else
    {
      Platform.runLater(stage::close);
    }
  }

  @Override
  public void setFraction(double fraction)
  {
    final double f = Math.max(0.0, Math.min(1.0, fraction));
    if (Platform.isFxApplicationThread())
    {
      bar.setProgress(f);
      percentLabel.setText(String.format("%d%%", (int) Math.round(f * 100.0)));
    }
    else
    {
      Platform.runLater(() ->
      {
        bar.setProgress(f);
        percentLabel.setText(String.format("%d%%", (int) Math.round(f * 100.0)));
      });
    }
  }

  @Override
  public void setMessage(String message)
  {
    if (Platform.isFxApplicationThread())
    {
      messageLabel.setText(message);
    }
    else
    {
      Platform.runLater(() -> messageLabel.setText(message));
    }
  }

  @Override
  public boolean isCancelled()
  {
    return cancelled.get();
  }
}
