package arb.viz;

import java.util.TreeSet;
import java.util.function.Consumer;
import java.util.function.Predicate;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.Parser;
import javafx.application.Application;
import javafx.beans.binding.Bindings;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.input.Clipboard;
import javafx.scene.input.ClipboardContent;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.Stage;

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

  public static int             columnsPerRow = 4;

  private TextField             textField;

  public static TreeSet<String> chars         = new TreeSet<>();

  static
  {
    chars.addAll(Parser.SUBSCRIPT_CHARACTERS.stream()
                                            .map(String::valueOf)
                                            .toList());
    for (String s : new String[]
    {
      "π", "Γ", "ᵅ", "ⅈ", "∈", "₋", "₊", "⇒", "➔", "√", "π", "⌊", "⌋", "≀", "₍", "₎", "∫", "Π", "∏", "Σ", "∑", "½", "²",
      "ⁿ", "∀", "∃", "μ", "ν", "ξ", "⋰", "ℭ", "α", "β"
    })
    {
      chars.add(s);
    }

    chars.addAll(Parser.greekChars);

    for (int c : Parser.lowercaseSuperscriptAlphabet)
    {
      chars.add(String.format("%c",
                              c));
    }
    for (int c : Parser.uppercaseSuperscriptAlphabet)
    {
      chars.add(String.format("%c",
                              c));
    }
    for (String s : Parser.superscripts)
    {
      chars.add(s);
    }
    characters    = chars.toArray(new String[chars.size()]);
    columnsPerRow = (int) Math.ceil(Math.sqrt(chars.size()));
    System.out.format("colsPerRow=%s\n",
                      columnsPerRow);
  }

  public static String[] characters;

  @Override
  public void
         start(Stage primaryStage)
  {
    System.out.println("cool beans: ∏Π➔➔√⌋₎");

    textField = new TextField();
    textField.setEditable(true);

    Button copyButton = new Button("Copy");
    copyButton.setOnAction(e -> copyToClipboard());

    Button clearButton = new Button("Clear");
    clearButton.setOnAction(e -> clearInput());

    GridPane gridPane = new GridPane();
    gridPane.setPadding(new Insets(10));
    gridPane.setHgap(0);
    gridPane.setVgap(0);

    int row = 0;
    int col = 0;
    for (String character : characters)
    {
      Button button = new Button(character);
      button.setOnAction(e -> appendCharacter(character));
      button.setMaxWidth(Double.MAX_VALUE);
      button.setMaxHeight(Double.MAX_VALUE);
      GridPane.setHgrow(button,
                        Priority.ALWAYS);
      GridPane.setVgrow(button,
                        Priority.ALWAYS);
      gridPane.add(button,
                   col,
                   row);
      col++;
      if (col == columnsPerRow)
      {
        col = 0;
        row++;
      }
    }

    VBox vbox = new VBox(0);
    vbox.setPadding(new Insets(0));
    ScrollPane scrollPane = new ScrollPane(gridPane);
    HBox       hbox       = new HBox();
    hbox.getChildren()
        .addAll(copyButton,
                clearButton,
                textField);
    vbox.getChildren()
        .addAll(scrollPane,
                hbox);
    VBox.setVgrow(gridPane,
                  Priority.ALWAYS);
    VBox.setVgrow(textField,
                  Priority.ALWAYS);

    Scene scene = new Scene(vbox,
                            columnsPerRow * 100,
                            columnsPerRow * 100);

    // Bind the font size to the scene height
    textField.fontProperty()
             .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight() * 0.04),
                                                scene.heightProperty()));
    copyButton.fontProperty()
              .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight() * 0.02),
                                                 scene.heightProperty()));
    Consumer<? super Node> action = node ->
                                  {

                                    ((Button) node).fontProperty()
                                                   .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight()
                                                                                                      * 0.04),
                                                                                      scene.heightProperty()));
                                  };
    Predicate<Node>        filter = node -> node instanceof Button;
    hbox.getChildren()
        .filtered(filter)
        .forEach(action);
    gridPane.getChildren()
            .filtered(filter)
            .forEach(action);

    primaryStage.setTitle(SymbolPalette.class.getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.show();

  }

  private void
          appendCharacter(String character)
  {
    textField.setText(textField.getText() + character);
  }

  private void
          copyToClipboard()
  {
    String           text      = textField.getText();
    Clipboard        clipboard = Clipboard.getSystemClipboard();
    ClipboardContent content   = new ClipboardContent();
    content.putString(text);
    clipboard.setContent(content);
  }

  private void
          clearInput()
  {
    textField.setText("");
  }

  public static void
         main(String[] args)
  {
    launch(args);

  }
}