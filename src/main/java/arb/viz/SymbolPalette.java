package arb.viz;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Collectors;

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
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
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
  // Add this new data structure
  private static final Map<String, Set<String>> CHARACTER_ALIASES = new HashMap<>();

  static
  {
    // Initialize aliases for characters
    initializeAliases();
  }

  private static void initializeAliases()
  {
    // Basic operators
    addAliases("*", "multiply", "times", "mult");
    addAliases("+", "plus", "add");
    addAliases("-", "minus", "subtract");
    addAliases("/", "divide", "div");

    // Numbers and fractions
    addAliases("⁄", "fraction", "div");
    addAliases("¼", "fourth", "quarter");
    addAliases("½", "half");
    addAliases("¾", "threefourths", "quarters");

    // Superscripts
    addAliases("²", "squared", "power2");
    addAliases("³", "cubed", "power3");
    addAliases("¹", "power1");

    // Greek Letters (matching both cases)
    addAliases("Γ γ", "gamma");
    addAliases("Δ δ", "delta");
    addAliases("Θ θ", "theta");
    addAliases("Λ λ", "lambda");
    addAliases("Ξ ξ", "xi");
    addAliases("Π π", "pi", "mathpi");
    addAliases("Σ σ", "sigma", "sum");
    addAliases("Φ φ", "phi");
    addAliases("Ψ ψ", "psi");
    addAliases("Ω ω", "omega");

    // Additional Greek
    addAliases("ζ", "zeta");
    addAliases("μ", "mu");
    addAliases("ν", "nu");
    addAliases("ς", "finalsigma");
    addAliases("ϑ", "theta");
    addAliases("ϒ", "upsilon");
    addAliases("ϕ", "phi");
    addAliases("ϖ", "pi");
    addAliases("ϰ", "kappa");
    addAliases("ϱ", "rho");

    // Mathematical Symbols
    addAliases("∫", "integral", "int");
    addAliases("∂", "partial", "del");
    addAliases("∀", "forall", "universal");
    addAliases("∃", "exists", "existential");
    addAliases("∈", "in", "element", "member");
    addAliases("∏", "product", "prod");
    addAliases("∑", "sum", "summation");
    addAliases("√", "sqrt", "root");
    addAliases("≀", "wreath");
    addAliases("⋰", "dots", "diagonaldots");
    addAliases("⌊", "floor", "leftfloor");
    addAliases("⌋", "floor", "rightfloor");
    addAliases("⇒", "implies", "therefore");
    addAliases("➔", "arrow", "to");

    // Complex Numbers
    addAliases("ⅈ", "i", "imaginary");
    addAliases("ℭ", "complex", "mathcalc");

    // Subscripts and Superscripts
    for (char c = 'ᴬ'; c <= 'ᵂ'; c++)
    {
      addAliases(String.valueOf(c), "sup" + (char) (c - 'ᴬ' + 'A'));
    }
    for (char c = 'ᵃ'; c <= 'ᵣ'; c++)
    {
      addAliases(String.valueOf(c), "sup" + (char) (c - 'ᵃ' + 'a'));
    }

    // Subscript Numbers
    for (int i = 0; i <= 9; i++)
    {
      addAliases("₀₁₂₃₄₅₆₇₈₉".charAt(i), "sub" + i);
    }

    // Superscript Numbers
    for (int i = 0; i <= 9; i++)
    {
      addAliases("⁰¹²³⁴⁵⁶⁷⁸⁹".charAt(i), "sup" + i);
    }

    // Subscript Operators
    addAliases("₊", "subplus");
    addAliases("₋", "subminus");
    addAliases("₍", "subleftparen");
    addAliases("₎", "subrightparen");

    // Subscript Letters
    addAliases("ₐ", "suba");
    addAliases("ₑ", "sube");
    addAliases("ₒ", "subo");
    addAliases("ₓ", "subx");
    addAliases("ₕ", "subh");
    addAliases("ₖ", "subk");
    addAliases("ₗ", "subl");
    addAliases("ₘ", "subm");
    addAliases("ₙ", "subn");
    addAliases("ₚ", "subp");
    addAliases("ₛ", "subs");
    addAliases("ₜ", "subt");
  }

  private static void addAliases(char charAt, String string)
  {
    addAliases(String.valueOf(charAt), string);
  }

  private static void addAliases(String characters, String... aliases)
  {
    String[] chars = characters.split(" ");
    for (String character : chars)
    {
      Set<String> aliasSet = CHARACTER_ALIASES.computeIfAbsent(character, k -> new HashSet<>());
      aliasSet.add(character.toLowerCase());
      Collections.addAll(aliasSet, aliases);
    }
  }

  private TextField             textField;
  private TextField             searchField;
  private FlowPane              buttonPane;
  private Map<Button, String>   buttonMap = new HashMap<>();

  public static TreeSet<String> chars     = new TreeSet<>();

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
    System.out.println("chars=" + chars);
  }

  public static String[] characters;

  @Override
  public void start(Stage primaryStage)
  {
    // Create search field
    searchField = new TextField();
    searchField.setPromptText("Search characters...");
    searchField.textProperty().addListener((observable, oldValue, newValue) -> highlightMatches(newValue));

    textField = new TextField();
    textField.setEditable(true);

    Button copyButton = new Button("Copy");
    copyButton.setOnAction(e -> copyToClipboard());

    Button clearButton = new Button("Clear");
    clearButton.setOnAction(e -> clearInput());

    buttonPane = new FlowPane();

    for (String character : characters)
    {
      Button button = new Button(character);
      button.setOnAction(e -> appendCharacter(character));
      button.setMaxWidth(Double.MAX_VALUE);
      button.setMaxHeight(Double.MAX_VALUE);
      buttonPane.getChildren().add(button);
      buttonMap.put(button, character);
    }

    BorderPane root = new BorderPane();
    root.setPadding(new Insets(0));
    ScrollPane scrollPane = new ScrollPane(buttonPane);

    // Create top HBox for search field
    HBox       searchBox  = new HBox(5);
    searchBox.setPadding(new Insets(5));
    searchBox.getChildren().add(searchField);
    root.setTop(searchBox);

    HBox hbox = new HBox();
    hbox.getChildren().addAll(copyButton, clearButton, textField);
    root.setBottom(hbox);
    root.setCenter(scrollPane);
    scrollPane.setPannable(true);

    Scene scene = new Scene(root,
                            1800,
                            900);
    scrollPane.setFitToWidth(true);
    scrollPane.setFitToHeight(false);

    scrollPane.viewportBoundsProperty().addListener((observable, oldValue, newValue) ->
    {
      Bounds viewportBounds = newValue;
      buttonPane.setPrefWidth(viewportBounds.getWidth());
    });

    // Bind font sizes
    textField.fontProperty()
             .bind(Bindings.createObjectBinding(() -> Font.font(scene.getHeight() * 0.04), scene.heightProperty()));
    searchField.fontProperty()
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
    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI("""
                   .highlighted-button
                   {
                       -fx-background-color: rgba(255, 255, 0, 0.5);
                   }

                   .tooltip
                   {
                       -fx-font-size: 14px;
                       -fx-background-color: #333333;
                       -fx-text-fill: white;
                   }
                  .search-highlight
                  {
                       -fx-background-color: yellow;
                       -fx-background-radius: 3;
                  }
                    """));

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

  private void highlightMatches(String searchText)
  {
    if (searchText == null || searchText.trim().isEmpty())
    {
      // Clear all highlighting when search is empty
      buttonPane.getChildren().forEach(node ->
      {
        if (node instanceof Button button)
        {
          button.getStyleClass().remove("highlighted-button");
          button.setTooltip(null);
        }
      });
      return;
    }

    String searchLower = searchText.trim().toLowerCase();

    buttonPane.getChildren().forEach(node ->
    {
      if (node instanceof Button button)
      {
        String  character = buttonMap.get(button);
        boolean matches   = false;

        // Check exact character match
        if (character.toLowerCase().equals(searchLower))
        {
          matches = true;
        }
        else
        {
          // Check exact alias matches
          Set<String> aliases = CHARACTER_ALIASES.get(character);
          if (aliases != null)
          {
            matches = aliases.stream().anyMatch(alias ->
            {
              // Split alias on spaces to match whole words
              String[] words = alias.toLowerCase().split("\\s+");
              for (String word : words)
              {
                if (word.equals(searchLower))
                {
                  return true;
                }
              }
              return false;
            });
          }
        }

        if (matches)
        {
          button.getStyleClass().add("highlighted-button");
          updateTooltip(button, character, searchText);
        }
        else
        {
          button.getStyleClass().remove("highlighted-button");
          button.setTooltip(null);
        }
      }
    });
  }

  private void updateTooltip(Button button, String character, String searchText)
  {
    Set<String> aliases = CHARACTER_ALIASES.get(character);
    if (aliases != null)
    {
      String searchLower     = searchText.trim().toLowerCase();
      String matchingAliases = aliases.stream().filter(alias ->
                             {
                               String[] words = alias.toLowerCase().split("\\s+");
                               for (String word : words)
                               {
                                 if (word.equals(searchLower))
                                 {
                                   return true;
                                 }
                               }
                               return false;
                             }).collect(Collectors.joining(", "));

      if (!matchingAliases.isEmpty())
      {
        Tooltip tooltip = new Tooltip("Matches: " + matchingAliases);
        button.setTooltip(tooltip);
      }
    }
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
