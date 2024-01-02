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
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import jdk.jshell.JShell;
import jdk.jshell.JShellException;
import jdk.jshell.Snippet.Status;
import jdk.jshell.SnippetEvent;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * 
 * The {@link PhilosopherStone} class in the arb4j project stands out as a
 * sophisticated tool for visually evaluating mathematical expressions,
 * effectively leveraging the strengths of Java and JShell. It extends beyond
 * standard text-based expression evaluation, utilizing Java's capabilities to
 * render complex mathematical formulas, charts, and other expressions where
 * plain text falls short. This class is intended to embody a seamless
 * integration of Java's computational power with advanced visual rendering,
 * making it an invaluable resource for those seeking a more dynamic and
 * illustrative approach to understanding and interacting with mathematical
 * concepts.
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
                            1280,
                            1024);
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
      handleException(e);
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
        handleRejection(e);
      }
      if (e.exception() != null)
      {
        handleException(e);
      }
      else
      {
        displayResult("Unknown error occurred", true);
      }
    }
  }

  public void handleRejection(SnippetEvent e)
  {
    displayResult("Error: Snippet Rejected - " + e.snippet().source());

    String diagMessages = jshell.diagnostics(e.snippet())
                                .map(diag -> diag.toString())
                                .collect(Collectors.joining("\n"));
    displayResult("Error: " + diagMessages);
  }

  public void handleException(SnippetEvent event)
  {
    JShellException ex = event.exception();
    handleException(ex);
  }

  public void handleException(Exception ex)
  {
    StringWriter sw = new StringWriter();
    PrintWriter  pw = new PrintWriter(sw);
    ex.printStackTrace(pw);
    displayResult("Exception: " + ex.toString() + "\nStack Trace:\n" + sw.toString(), true);
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
      showLatexResut(result);
    }
    else
    {
      showPlaintextResult(result, error);
    }
  }

  public void showPlaintextResult(String result, boolean error)
  {
    Text output = new Text("output: " + result);
    if (error)
    {
      output.setFill(Color.RED);
    }
    output.setFont(new Font(16));
    mainContainer.getChildren().add(output);
  }

  public void showLatexResut(String result)
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

  TextField addNewInputField()
  {
    TextField inputField = new TextField();
    inputField.setPromptText("Enter Java code...");
    inputField.setFont(new Font(16));
    inputField.setOnAction(event ->
    {
      String input = inputField.getText();
      inputField.setEditable(false);
      evaluateInput(input);
      scroll.add(input);
      cursor = scroll.size();
    });

    inputField.addEventFilter(KeyEvent.KEY_PRESSED, keyPressEventFilter(inputField));

    mainContainer.getChildren().add(inputField);
    return inputField;
  }

  public EventHandler<? super KeyEvent> keyPressEventFilter(TextField inputField)
  {
    return event ->
    {
      switch (event.getCode())
      {
      case ESCAPE:
        System.exit(1);
        break;
      case UP:
        scrollBack(inputField);
        event.consume();
        break;
      case DOWN:
        scrollForward(inputField, event);
        event.consume();
        break;
      default:
        break;
      }
    };

  }

  public void scrollForward(TextField inputField, KeyEvent event)
  {
    if (cursor < scroll.size() - 1)
    {
      cursor++;
      inputField.setText(scroll.get(cursor));
    }
    else
    {
      inputField.clear();
    }
  }

  public void scrollBack(TextField inputField)
  {
    if (cursor > 0)
    {
      cursor--;
      inputField.setText(scroll.get(cursor));
    }
  }

  ArrayList<String> scroll = new ArrayList<>();
  int               cursor = 0;

  public static void main(String[] args)
  {
    launch(args);
  }
}
