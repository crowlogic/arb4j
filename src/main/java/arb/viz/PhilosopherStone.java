package arb.viz;

import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;

import javafx.application.Application;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import jdk.jshell.JShell;
import jdk.jshell.Snippet.Status;
import jdk.jshell.SnippetEvent;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 * 
 * The {@link PhilosopherStone} class in the arb4j project stands out as a
 * sophisticated tool for visually evaluating mathematical expressions,
 * effectively leveraging the strengths of Java and JShell. It extends beyond
 * standard text-based expression evaluation, utilizing Java's capabilities to
 * render complex mathematical formulas, charts, and other expressions where
 * plain text falls short. This class embodies a seamless integration of Java's
 * computational power with advanced visual rendering, making it an invaluable
 * resource for those seeking a more dynamic and illustrative approach to
 * understanding and interacting with mathematical concepts.
 * 
 * <h3>Meaning</h3>
 * 
 * <h4>The Philosopher's Stone and Alchemy</h4>
 * <p>
 * The philosopher's stone, rooted in the ancient practice of alchemy, is a
 * legendary substance allegedly capable of turning base metals such as mercury
 * into gold or silver. Beyond material transformation, it is also famed as the
 * elixir of life, associated with rejuvenation and the quest for immortality.
 * Central to the mystique of alchemical lore, the stone symbolizes the ultimate
 * pursuit of transmuting the mundane into the sublime.
 * </p>
 *
 * <p>
 * Alchemy itself, from its Greek root meaning 'to pour' or 'to mingle', evolved
 * from a blend of philosophical, mystical, and experimental practices. It is
 * seen as a forerunner to modern chemistry, yet it encompasses a broader
 * spectrum of transformations, including philosophical and spiritual
 * dimensions. In medieval times, alchemy was not just a pursuit of material
 * wealth but also a symbolic journey towards spiritual enlightenment and
 * understanding of the natural world.
 * </p>
 *
 * <p>
 * The concept extends beyond the literal to encompass transformative processes
 * in broader contexts, such as the 'alchemy' of human relationships or the
 * 'magical' transformation of ideas into tangible reality.
 * </p>
 *
 * <p>
 * <i>Historical Context:</i>
 * <ul>
 * <li>Alchemy as an art of transmutation, both material and spiritual.</li>
 * <li>The Philosopher's Stone as an allegorical symbol in alchemical
 * tradition.</li>
 * </ul>
 * </p>
 *
 * <p>
 * <i>References:</i>
 * <ol>
 * <li>Alchemy's historical and cultural significance.</li>
 * <li>The Philosopher's Stone in myth and literature.</li>
 * </ol>
 * </p>
 * 
 * 
 * @author ©2023 Stephen Crowley
 */
public class PhilosopherStone extends
                              Application
{

  VBox       mainContainer;
  ScrollPane scrollPane;
  JShell     jshell;

  @Override
  public void start(Stage primaryStage)
  {
    jshell        = JShell.create();
    mainContainer = new VBox(5);    // Spacing between children
    mainContainer.setFillWidth(true);

    scrollPane = new ScrollPane(mainContainer);
    scrollPane.setFitToWidth(true);
    scrollPane.setPrefHeight(600);

    mainContainer.heightProperty()
                 .addListener((observable, oldHeight, newHeight) -> scrollPane.setVvalue((Double) newHeight));

    addNewInputField();

    Scene scene = new Scene(scrollPane,
                            800,
                            600);
     scene.getStylesheets().add("dark-theme.css");

    primaryStage.setTitle("The Philosopher's Stone");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  void evaluateInput(String input)
  {
    try
    {
      displayResults(jshell.eval(input));
    }
    catch (Exception e)
    {
      StringWriter sw = new StringWriter();
      PrintWriter  pw = new PrintWriter(sw);
      e.printStackTrace(pw);
      String stackTrace = sw.toString();

      displayResult("Error: " + e.getMessage() + "\nStack Trace:\n" + stackTrace);
    }
    addNewInputField().requestFocus();
  }

  public void displayResults(List<SnippetEvent> events)
  {
    for (SnippetEvent e : events)
    {
      if (e.status() == Status.VALID)
      {
        if (e.value() != null)
        {
          displayResult(e.value());
        }
      }
      else if (e.status() == Status.REJECTED)
      {
        displayResult("Error: Snippet Rejected - " + e.snippet().source());

        String diagMessages = jshell.diagnostics(e.snippet())
                                    .map(diag -> diag.toString())
                                    .collect(Collectors.joining("\n"));
        displayResult("Error: " + diagMessages);

      }
      else if (e.exception() != null)
      {
        // More detailed error for exceptions
        StringWriter sw = new StringWriter();
        PrintWriter  pw = new PrintWriter(sw);
        e.exception().printStackTrace(pw);
        displayResult("Exception: " + e.exception().toString() + "\nStack Trace:\n" + sw.toString(), true);
      }
      else
      {
        displayResult("Unknown error occurred", true);
      }
    }
  }

  void displayResult(String result)
  {
    displayResult(result, false);
  }

  boolean isLaTeX(String str)
  {
    str = str.replace("\"", "");
    System.out.println("isLatex " + str);
    // Implement logic to determine if 'str' is a LaTeX expression
    return str.startsWith("$") && str.endsWith("$");
  }

  void displayResult(String result, boolean error)
  {
    if (isLaTeX(result))
    {
      result = result.replace("\"", "");
      TeXFormula    formula       = new TeXFormula(result);

      BufferedImage bufferedImage = (BufferedImage) formula.createBufferedImage(TeXConstants.STYLE_DISPLAY,
                                                                                30,
                                                                                java.awt.Color.BLACK,
                                                                                java.awt.Color.WHITE);

      Image         image         = SwingFXUtils.toFXImage(bufferedImage, null);
      ImageView     imageView     = new ImageView(image);
      mainContainer.getChildren().add(imageView);
    }
    else
    {
      Text output = new Text("output: " + result);
      if (error)
      {
        output.setFill(Color.RED);
      }
      output.setFont(new Font(16));
      mainContainer.getChildren().add(output);
    }
  }

  TextField addNewInputField()
  {
    TextField inputField = new TextField();
    inputField.setPromptText("Enter Java code...");
    inputField.setFont(new Font(16));
    inputField.setOnAction(event ->
    {
      String input = inputField.getText();
      inputField.setEditable(false); // Disable the field after input
      evaluateInput(input);
      controlInputHistory.add(input); // Add command to history
      historyIndex = controlInputHistory.size(); // Reset history index
    });

    // Capture key events for history navigation
    inputField.addEventFilter(KeyEvent.KEY_PRESSED, keyPressEventFilter(inputField));

    mainContainer.getChildren().add(inputField);
    return inputField;
  }

  public EventHandler<? super KeyEvent> keyPressEventFilter(TextField inputField)
  {
    return event ->
    {
      if (event.getCode() == KeyCode.UP)
      {
        if (historyIndex > 0)
        {
          historyIndex--;
          inputField.setText(controlInputHistory.get(historyIndex));
        }
        event.consume(); // Prevent default behavior
      }
      else if (event.getCode() == KeyCode.DOWN)
      {
        if (historyIndex < controlInputHistory.size() - 1)
        {
          historyIndex++;
          inputField.setText(controlInputHistory.get(historyIndex));
        }
        else
        {
          inputField.clear();
        }
        event.consume(); // Prevent default behavior
      }
    };
  }

  ArrayList<String> controlInputHistory = new ArrayList<>();
  int               historyIndex        = 0;

  public static void main(String[] args)
  {
    launch(args);
  }
}
