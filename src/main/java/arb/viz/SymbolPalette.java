package arb.viz;

import java.util.TreeSet;
import java.util.function.Consumer;
import java.util.function.Predicate;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.expressions.viz.Stylesheet;
import javafx.application.Application;
import javafx.beans.binding.Bindings;
import javafx.geometry.Bounds;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.input.Clipboard;
import javafx.scene.input.ClipboardContent;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Font;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * An application to generate the UTF characters used by the {@link Expression}
 * {@link Compiler}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SymbolPalette extends
                           Application
{

  private TextField             textField;

  public static TreeSet<String> chars = new TreeSet<>();

  static
  {
    chars.addAll(Parser.SUBSCRIPT_CHARACTERS.stream().map(String::valueOf).toList());
    for (String s : new String[]
    { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "9", "⁄", "/", "+", "-", "*", "π", "Γ", "ᵅ", "ⅈ", "∈", "₋", "₊",
      "⇒", "➔", "√", "π", "⌊", "⌋", "≀", "₍", "₎", "∫", "Π", "∏", "Σ", "∑", "½", "²", "ⁿ", "∀", "∃", "μ", "ν", "ξ", "⋰",
      "ℭ", "α", "β", "∂" })
    {
      chars.add(s);
    }

    chars.addAll(Parser.greekAndBlackLetterChars);

    chars.addAll(Parser.fractions.keySet().stream().map(String::valueOf).toList());

    for (int c : Parser.lowercaseSuperscriptAlphabet)
    {
      chars.add(String.format("%c", c));
    }
    for (int c : Parser.uppercaseSuperscriptAlphabet)
    {
      chars.add(String.format("%c", c));
    }
    for (char c : Parser.SUBSCRIPT_DIGITS_ARRAY)
    {
      chars.add(String.valueOf(c));
    }
    for (char c : Parser.SUPERSCRIPT_DIGITS_ARRAY)
    {
      chars.add(String.valueOf(c));
    }
    for (String s : Parser.superscripts)
    {
      chars.add(s);
    }

    chars.add("π");

    characters = chars.toArray(new String[chars.size()]);
    // columnsPerRow = (int) Math.ceil(Math.sqrt(chars.size()));
    System.out.println("chars=" + chars);
  }

  public static String[] characters;

  @Override
  public void start(Stage primaryStage)
  {

    textField = new TextField();
    textField.setEditable(true);

    Button copyButton = new Button("Copy");
    copyButton.setOnAction(e -> copyToClipboard());

    Button clearButton = new Button("Clear");
    clearButton.setOnAction(e -> clearInput());

    FlowPane buttonPane = new FlowPane();

    for (String character : characters)
    {
      Button button = new Button(character);
      button.setOnAction(e -> appendCharacter(character));
      button.setMaxWidth(Double.MAX_VALUE);
      button.setMaxHeight(Double.MAX_VALUE);

      buttonPane.getChildren().add(button);

    }

    BorderPane root = new BorderPane();
    root.setPadding(new Insets(0));
    ScrollPane scrollPane = new ScrollPane(buttonPane);
    HBox       hbox       = new HBox();
    hbox.getChildren().addAll(copyButton, clearButton, textField);
    root.setBottom(hbox);
    root.setCenter(scrollPane);
    scrollPane.setPannable(true);

    Scene scene = new Scene(root,
                            1800,
                            900);
    scrollPane.setFitToWidth(true); // Automatically fit the width
    scrollPane.setFitToHeight(false); // Allow height to expand as needed
    // Bind FlowPane's width to ScrollPane's viewport width (taking scrollbar into
    // account)
    scrollPane.viewportBoundsProperty().addListener((observable, oldValue, newValue) ->
    {
      Bounds viewportBounds = newValue;
      // Set the FlowPane width to the viewport width
      buttonPane.setPrefWidth(viewportBounds.getWidth());
    });

    // Bind the font size to the scene height
    textField.fontProperty()
             .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight() * 0.04), scene.heightProperty()));
    copyButton.fontProperty()
              .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight() * 0.02), scene.heightProperty()));
    Consumer<? super Node> action = node ->
                                  {

                                    ((Button) node).fontProperty()
                                                   .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight()
                                                                 * 0.04), scene.heightProperty()));
                                  };
    Predicate<Node>        filter = node -> node instanceof Button;
    hbox.getChildren().filtered(filter).forEach(action);
    buttonPane.getChildren().filtered(filter).forEach(action);
    WindowManager.setStageIcon(primaryStage, "SymbolPalette.png");
    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(Stylesheet.EASIER_ON_THE_EYES_STYLESHEET));

    scene.setOnKeyPressed(button ->
    {
      if (button.getCode() == KeyCode.F11)
      {
        primaryStage.setFullScreenExitHint("Press escape or F11 to exit full-screen mode");
        primaryStage.setFullScreen(!primaryStage.isFullScreen());
      }
      if (button.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.fireEvent(new WindowEvent(primaryStage,
                                               WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });
    primaryStage.setOnCloseRequest(evt ->
    {

      Alert alert = new Alert(AlertType.CONFIRMATION);
      alert.setTitle("Confirm Close");
      alert.setHeaderText("Close program?");
      alert.showAndWait().filter(r -> r != ButtonType.OK).ifPresent(r -> evt.consume());

    });
    primaryStage.setTitle(SymbolPalette.class.getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.show();

  }

  private void appendCharacter(String character)
  {
    textField.setText(textField.getText() + character);
  }

  private void copyToClipboard()
  {
    String           text      = textField.getText();
    Clipboard        clipboard = Clipboard.getSystemClipboard();
    ClipboardContent content   = new ClipboardContent();
    content.putString(text);
    clipboard.setContent(content);
  }

  private void clearInput()
  {
    textField.setText("");
  }

  public static void main(String[] args)
  {
    launch(args);

  }
}