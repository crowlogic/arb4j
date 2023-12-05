package arb.viz;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import java.util.stream.Collectors;

import org.scilab.forge.jlatexmath.LaTeXAtom;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import jdk.jshell.JShell;
import jdk.jshell.Snippet.Status;
import jdk.jshell.SnippetEvent;

/**
 * TODO: render {@link TeXIcon}s with {@link TeXFormula}s for latex outputs
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class VisualShell extends
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

    mainContainer.heightProperty()
                 .addListener((observable, oldHeight, newHeight) -> scrollPane.setVvalue((Double) newHeight));

    addNewInputField();

    Scene scene = new Scene(scrollPane,
                            800,
                            600);
    // scene.getStylesheets().add("dark-theme.css");

    primaryStage.setTitle("arb4j Interactive REPL Console with JShell");
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

  void displayResult(String result, boolean error)
  {
    Text output = new Text("output: " + result);

    if (error)
    {
      output.setFill(Color.RED);
    }
    output.setFont(new Font(16));
    mainContainer.getChildren().add(output);
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
    });
    mainContainer.getChildren().add(inputField);
    return inputField;
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
