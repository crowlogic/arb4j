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

/**
 * The {@link InteractiveREPLShell} is intended to serve as a versatile and
 * enhanced replacement for {@link JShell} whose API it utilizes for executing
 * Java code snippets and extending its functionality with capabilities to
 * display sophisticated outputs such as LaTeX formatted formulas, 2D/3D graphs,
 * and more, catering to the needs of scientific and computational tasks in
 * arb4j.
 * 
 * <pre>
 * Copyright ©2023 Stephen A. Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 *
 * @see jdk.jshell.JShell
 * @see jdk.jshell.SnippetEvent
 */
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

  void evaluateInput(String input)
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
        e.exception().printStackTrace();
      }
    }
  }

  void displayResult(String result)
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

  TextField addNewInputField()
  {
    TextField inputField = new TextField();
    inputField.setPromptText("Enter Java code...");
    inputField.setOnAction(event ->
    {
      String input = inputField.getText();
      inputField.setEditable(false); // Disable the field after input
      evaluateInput(input);
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
