package arb.viz;

import java.util.*;
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
 * A virtual keyboard to generate the UTF characters used by the
 * {@link Expression} {@link Compiler}
 * 
 * <pre>
    1. Complete alias mapping for every symbol
    2. Multi-term search with space separation
    3. Proper real-time highlighting that updates on both typing and backspace
    4. Case-insensitive matching
    5. Clean visual feedback
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SymbolPalette extends
                           Application
{
  private static final String                   STYLESHEET        = """
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
                  """;
  private static final Map<String, Set<String>> CHARACTER_ALIASES = new HashMap<>();

  static
  {
    initializeAliases();
  }

  private static void initializeAliases()
  {
    // Basic operators
    addAliases("*", "multiply", "times", "mult", "star", "asterisk");
    addAliases("+", "plus", "add", "addition");
    addAliases("-", "minus", "subtract", "dash", "hyphen");
    addAliases("/", "divide", "div", "slash", "fraction");

    // Numbers 0-9
    addAliases("0", "zero");
    addAliases("1", "one");
    addAliases("2", "two");
    addAliases("3", "three");
    addAliases("4", "four");
    addAliases("5", "five");
    addAliases("6", "six");
    addAliases("7", "seven");
    addAliases("8", "eight");
    addAliases("9", "nine");

    // Superscript numbers
    addAliases("⁰", "sup0", "power0", "superscript0");
    addAliases("¹", "sup1", "power1", "superscript1");
    addAliases("²", "sup2", "power2", "squared");
    addAliases("³", "sup3", "power3", "cubed");
    addAliases("⁴", "sup4", "power4");
    addAliases("⁵", "sup5", "power5");
    addAliases("⁶", "sup6", "power6");
    addAliases("⁷", "sup7", "power7");
    addAliases("⁸", "sup8", "power8");
    addAliases("⁹", "sup9", "power9");

    // Subscript numbers
    addAliases("₀", "sub0");
    addAliases("₁", "sub1");
    addAliases("₂", "sub2");
    addAliases("₃", "sub3");
    addAliases("₄", "sub4");
    addAliases("₅", "sub5");
    addAliases("₆", "sub6");
    addAliases("₇", "sub7");
    addAliases("₈", "sub8");
    addAliases("₉", "sub9");

    // Fractions
    addAliases("¼", "fourth", "quarter");
    addAliases("½", "half");
    addAliases("¾", "threefourths", "threequarters");
    addAliases("⅐", "seventh");
    addAliases("⅑", "ninth");
    addAliases("⅒", "tenth");
    addAliases("⅓", "third");
    addAliases("⅔", "twothirds");
    addAliases("⅕", "fifth");
    addAliases("⅖", "twofifths");
    addAliases("⅗", "threefifths");
    addAliases("⅘", "fourfifths");
    addAliases("⅙", "sixth");
    addAliases("⅚", "fivesixths");
    addAliases("⅛", "eighth");
    addAliases("⅜", "threeeighths");
    addAliases("⅝", "fiveeighths");
    addAliases("⅞", "seveneighths");

    // Greek Letters (uppercase and lowercase together)
    addAliases("Γ γ", "gamma");
    addAliases("Δ δ", "delta");
    addAliases("Θ θ", "theta");
    addAliases("Λ λ", "lambda");
    addAliases("Ξ ξ", "xi");
    addAliases("Π π", "pi");
    addAliases("Σ σ", "sigma");
    addAliases("Φ φ", "phi");
    addAliases("Ψ ψ", "psi");
    addAliases("Ω ω", "omega");
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
    addAliases("√", "sqrt", "root", "radical");
    addAliases("≀", "wreath");
    addAliases("⋰", "dots", "diagonaldots", "ellipsis");
    addAliases("⌊", "floor", "leftfloor");
    addAliases("⌋", "floor", "rightfloor");
    addAliases("⇒", "implies", "therefore", "rightarrow");
    addAliases("➔", "arrow", "to", "rightarrow");

    // Superscript Latin letters
    addAliases("ᴬ", "supA");
    addAliases("ᴮ", "supB");
    addAliases("ᴰ", "supD");
    addAliases("ᴱ", "supE");
    addAliases("ᴳ", "supG");
    addAliases("ᴴ", "supH");
    addAliases("ᴵ", "supI");
    addAliases("ᴶ", "supJ");
    addAliases("ᴷ", "supK");
    addAliases("ᴸ", "supL");
    addAliases("ᴹ", "supM");
    addAliases("ᴺ", "supN");
    addAliases("ᴼ", "supO");
    addAliases("ᴾ", "supP");
    addAliases("ᴿ", "supR");
    addAliases("ᵀ", "supT");
    addAliases("ᵁ", "supU");
    addAliases("ᵂ", "supW");

    // Lowercase superscripts
    addAliases("ᵃ", "supa");
    addAliases("ᵅ", "supalpha");
    addAliases("ᵇ", "supb");
    addAliases("ᵈ", "supd");
    addAliases("ᵉ", "supe");
    addAliases("ᵋ", "supepsilon");
    addAliases("ᵍ", "supg");
    addAliases("ᵏ", "supk");
    addAliases("ᵐ", "supm");
    addAliases("ᵒ", "supo");
    addAliases("ᵖ", "supp");
    addAliases("ᵗ", "supt");
    addAliases("ᵘ", "supu");
    addAliases("ᵛ", "supv");
    addAliases("ᵝ", "supbeta");
    addAliases("ᵞ", "supgamma");
    addAliases("ᵟ", "supdelta");
    addAliases("ᵠ", "supphi");
    addAliases("ᵡ", "supchi");
    addAliases("ᶜ", "supc");
    addAliases("ᶠ", "supf");
    addAliases("ᶻ", "supz");
    addAliases("ᶿ", "suptheta");

    // Subscript operators and letters
    addAliases("₊", "subplus");
    addAliases("₋", "subminus");
    addAliases("₍", "subleftparen");
    addAliases("₎", "subrightparen");
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

    // Complex numbers and special
    addAliases("ⅈ", "i", "imaginary");
    addAliases("ℭ", "complex", "mathcalc");
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
    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(Stylesheet.DarkerStyle));
    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(STYLESHEET));

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
      buttonPane.getChildren().forEach(node ->
      {
        if (node instanceof Button)
        {
          Button button = (Button) node;
          button.setStyle(null); // <-- This was the problem
        }
      });
      return;
    }

    String[] searchTerms = searchText.trim().toLowerCase().split("\\s+");

    buttonPane.getChildren().forEach(node ->
    {
      if (node instanceof Button)
      {
        Button  button    = (Button) node;
        String  character = buttonMap.get(button);
        boolean matches   = false;

        for (String term : searchTerms)
        {
          Set<String> aliases = CHARACTER_ALIASES.get(character);
          if (aliases != null && aliases.contains(term))
          {
            matches = true;
            break;
          }
        }

        if (matches)
        {
          button.setStyle("-fx-background-color: rgba(255, 255, 0, 0.5);");
        }
        else
        {
          button.setStyle(null);
        }
      }
    });
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
