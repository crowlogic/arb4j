package arb.viz;

import java.util.List;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import jdk.jshell.JShell;
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

    addNewInputField();

    Scene scene = new Scene(scrollPane,
                            800,
                            600);
    primaryStage.setTitle("ARB4J Interactive REPL Console with JShell");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  private void evaluateJavaInput(String input)
  {
    List<SnippetEvent> events = jshell.eval(input);
    for (SnippetEvent e : events)
    {
      if (e.value() != null)
      {
        displayResult(e.value());
      }
      else if (e.exception() != null)
      {
        displayResult("Exception: " + e.exception().getMessage());
      }
    }
  }

  private void displayResult(String result)
  {
    Platform.runLater(() ->
    {
      Text output = new Text(result);
      mainContainer.getChildren().add(output);
      // Ensure that the focus is set on the newly added TextField
      TextField newInputField = addNewInputField();
      newInputField.requestFocus();
    });
  }

//Modified addNewInputField to return the new TextField
  private TextField addNewInputField()
  {
    TextField inputField = new TextField();
    inputField.setPromptText("Enter Java code...");
    inputField.setOnAction(event ->
    {
      String input = inputField.getText();
      inputField.setEditable(false); // Disable the field after input
      evaluateJavaInput(input);
      addNewInputField();
    });
    mainContainer.getChildren().add(inputField);
    return inputField;
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
