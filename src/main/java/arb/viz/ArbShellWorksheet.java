package arb.viz;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import jdk.jshell.JShell;
import jdk.jshell.SnippetEvent;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ArbShellWorksheet extends
                               Application
{

  public JShell    shell;

  public VBox      contentBox;

  public int       expressionIndex = 0;

  public TextField inputField;

  public void
         handleInputAction(ActionEvent event)
  {
    var input = inputField.getText();
    if (!input.isEmpty())
    {
      inputField.setEditable(false);
      evaluateExpression(input);
      addInputField();
    }
  }

  @Override
  public void
         start(Stage primaryStage) throws Exception
  {
    shell      = JShell.builder()
                       .executionEngine(new ArbShellExecutionController.EnhancedExecutionControlProvider(), null)
                       .build();

    contentBox = new VBox(5);
    ScrollPane scrollPane = new ScrollPane(contentBox);
    scrollPane.setFitToWidth(true);
    scrollPane.setVvalue(1.0); // Auto-scroll to the bottom

    addInputField();

    VBox  root  = new VBox(scrollPane);
    Scene scene = new Scene(root,
                            800,
                            600);

    primaryStage.setTitle(ArbShellWorksheet.class.getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  private void
          addInputField()
  {
    inputField = new TextField();
    //inputField.setfont
    //inputField.setFont(null);
    inputField.setPromptText("$ ");
    inputField.setOnAction(this::handleInputAction);
    contentBox.getChildren()
              .add(inputField);
    focusInputField();

  }

  public void
         focusInputField()
  {
    Platform.runLater(() -> inputField.requestFocus());
  }

  private void
          evaluateExpression(String expression)
  {
    expressionIndex++;
    TextArea resultArea = new TextArea();
    resultArea.setEditable(false);
    resultArea.setWrapText(true);
    resultArea.setMaxHeight(inputField.getHeight());
    resultArea.setMinHeight(inputField.getHeight());

    shell.eval(expression)
         .forEach(event ->
         {
           String result = formatResult(event);
           resultArea.setText(result);
         });

    if (resultArea.getText()
                  .isEmpty())
    {
      resultArea.setText("No output available.");
    }

    contentBox.getChildren()
              .add(resultArea);
  }

  private String
          formatResult(SnippetEvent event)
  {
    if (event.value() != null && event.status()
                                      .isActive())
    {
      return "Result " + expressionIndex + ": " + event.value();
    }
    else if (event.exception() != null)
    {
      return "Error " + expressionIndex + ": " + event.exception()
                                                      .getMessage();
    }
    else
    {
      return "Error/Invalid input at " + expressionIndex + ": event=" + event.toString();
    }
  }

  @Override
  public void
         stop() throws Exception
  {
    if (shell != null)
    {
      shell.close();
    }
  }

  public static void
         main(String[] args)
  {
    launch(args);
  }
}
