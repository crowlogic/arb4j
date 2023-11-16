package arb.viz;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import jdk.jshell.JShell;
import jdk.jshell.Snippet.Status;
import jdk.jshell.SnippetEvent;

public class InteractiveREPLShell extends
                                  Application
{

  private VBox       mainContainer;
  private ScrollPane scrollPane;
  private JShell     jshell;

  @Override
  public void start(Stage primaryStage)
  {
    jshell        = JShell.create();
    mainContainer = new VBox(5);    // Spacing between children
    mainContainer.setFillWidth(true);

    scrollPane = new ScrollPane(mainContainer);
    scrollPane.setFitToWidth(true);
    scrollPane.setPrefHeight(600);

    // Add listener to VBox's height property
    mainContainer.heightProperty().addListener(new ChangeListener<Number>()
    {
      @Override
      public void changed(ObservableValue<? extends Number> observable, Number oldHeight, Number newHeight)
      {
        scrollPane.setVvalue((Double) newHeight);
      }
    });

    addNewInputField();

    Scene scene = new Scene(scrollPane,
                            800,
                            600);
    primaryStage.setTitle("ARB4J Interactive REPL Console with JShell");
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
      String stackTrace = sw.toString(); // Stack trace as a string

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
        displayResult("Error: " + e.snippet().source() + " is not valid.");
      }
      else if (e.exception() != null)
      {
        displayResult("Exception: " + e.exception().getMessage());
        e.exception().printStackTrace();
      }
      else
      {
        displayResult("Unknown error occurred.");
      }
    }
  }

  void displayResult(String result)
  {
    Text output = new Text("output: " + result);
    mainContainer.getChildren().add(output);
  }

  TextField addNewInputField()
  {
    TextField inputField = new TextField();
    inputField.setPromptText("Enter Java code...");
    inputField.setOnAction(event ->
    {
      String input = inputField.getText();
      inputField.setEditable(false); // Disable the field after input
      evaluateInput(input);
    });
    mainContainer.getChildren().add(inputField);
    return inputField;
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
