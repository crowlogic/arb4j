package arb.viz;

import java.util.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.expressions.viz.Stylesheet;
import javafx.application.Application;
import javafx.beans.binding.Bindings;
import javafx.beans.binding.ObjectBinding;
import javafx.geometry.Bounds;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.input.*;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * TODO: strike a red line through a word if its not an alias for any character
 * on the keyboard
 * 
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
  public static final Character[]                      SYMBOLS           =
  { '⊂',
    '⊃',
    '∞',
    '✅',
    '❌',
    '±',
    'χ',
    'ϱ',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '9',
    '⁄',
    '/',
    '+',
    '-',
    '*',
    'π',
    'Γ',
    'ᵅ',
    'ⅈ',
    '∈',
    '₋',
    '₊',
    '⇒',
    '➔',
    '√',
    'π',
    '⌊',
    '⌋',
    '≀',
    '₍',
    '₎',
    '∫',
    'Π',
    '∏',
    'Σ',
    '∑',
    '½',
    '²',
    'ⁿ',
    '∀',
    '∃',
    'μ',
    'ν',
    'ξ',
    '⋰',
    'ℭ',
    'α',
    'β',
    '∂',
    'σ',
    '*',
    '×',
    'ₓ',
    '⋅' };

  private static final String                          STYLESHEET        = """
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

                .button, .text-field
                {
                     /* NO -fx-font-family line at all */
                     -fx-font-weight: normal;
                }
                  """;

  private static final HashMap<Character, Set<String>> CHARACTER_ALIASES = new HashMap<>();

  static
  {
    initializeAliases();
  }

  private static void initializeAliases()
  {
    associateAliases('⊂', "subset", "contained");
    associateAliases('⊃', "superset", "contains");

    associateAliases('∞', "infinity", "infty", "inf");
    associateAliases('❌', "x");
    associateAliases('✅', "check");
    associateAliases('ᵡ', "supchi");
    associateAliases('ʰ', "suph");
    associateAliases('ʲ', "supj");
    associateAliases('ʳ', "supr");
    associateAliases('ʷ', "supw");
    associateAliases('ʸ', "supy");
    associateAliases('ˡ', "supl");
    associateAliases('ˢ', "sups");
    associateAliases('ˣ', "supx");

    associateAliases('σ', "sigma");
    associateAliases('α', "alpha");
    associateAliases('β', "beta");

    associateAliases('⁄', "fraction", "slash", "div", "frac", "ratio");

    associateAliases('ⁱ', "supi");
    associateAliases('ⁿ', "supn");

    associateAliases('ₔ', "subschwa");

    associateAliases('ⱽ', "supV");

    // Basic operators
    associateAliases('*', "multiply", "times", "mult", "star", "asterisk");
    associateAliases('+', "plus", "add", "addition");
    associateAliases('-', "minus", "subtract", "dash", "hyphen");
    associateAliases('/', "divide", "div", "slash", "fraction");

    // Numbers 0-9
    associateAliases('0', "zero");
    associateAliases('1', "one");
    associateAliases('2', "two");
    associateAliases('3', "three");
    associateAliases('4', "four");
    associateAliases('5', "five");
    associateAliases('6', "six");
    associateAliases('7', "seven");
    associateAliases('8', "eight");
    associateAliases('9', "nine");

    // Superscript numbers
    associateAliases('⁰', "sup0", "power0", "superscript0", "0");
    associateAliases('¹', "sup1", "power1", "superscript1", "1");
    associateAliases('²', "sup2", "power2", "squared", "square", "2");
    associateAliases('³', "sup3", "power3", "cubed", "cube", "3");
    associateAliases('⁴', "sup4", "power4", "4'");
    associateAliases('⁵', "sup5", "power5", "5");
    associateAliases('⁶', "sup6", "power6", "6");
    associateAliases('⁷', "sup7", "power7", "7");
    associateAliases('⁸', "sup8", "power8", "8");
    associateAliases('⁹', "sup9", "power9", "9");

    // Subscript numbers
    associateAliases('₀', "sub0");
    associateAliases('₁', "sub1");
    associateAliases('₂', "sub2");
    associateAliases('₃', "sub3");
    associateAliases('₄', "sub4");
    associateAliases('₅', "sub5");
    associateAliases('₆', "sub6");
    associateAliases('₇', "sub7");
    associateAliases('₈', "sub8");
    associateAliases('₉', "sub9");

    // Fractions
    associateAliases('¼', "fourth", "quarter");
    associateAliases('½', "half", "halve");
    associateAliases('¾', "threefourths", "threequarters");
    associateAliases('⅐', "seventh", "7");
    associateAliases('⅑', "ninth", "9");
    associateAliases('⅒', "tenth", "10");
    associateAliases('⅓', "third", "3");
    associateAliases('⅔', "twothirds", "23");
    associateAliases('⅕', "fifth", "5");
    associateAliases('⅖', "twofifths", "25");
    associateAliases('⅗', "threefifths", "35");
    associateAliases('⅘', "fourfifths", "45");
    associateAliases('⅙', "sixth", "6");
    associateAliases('⅚', "fivesixths", "56");
    associateAliases('⅛', "eighth", "eight");
    associateAliases('⅜', "threeeighths", "38");
    associateAliases('⅝', "fiveeighths", "58");
    associateAliases('⅞', "seveneighths", "78");

    // Greek Letters (uppercase and lowercase together)
    associateAliases('Χ', "chi");
    associateAliases('χ', "chi");
    associateAliases('Γ', "gamma");
    associateAliases('γ', "gamma");
    associateAliases('Δ', "delta");
    associateAliases('δ', "delta");
    associateAliases('η', "eta");
    associateAliases('Θ', "theta");
    associateAliases('θ', "theta");
    associateAliases('Λ', "lambda");
    associateAliases('λ', "lambda");
    associateAliases('Ξ', "xi");
    associateAliases('ξ', "xi");
    associateAliases('Π', "pi");
    associateAliases('π', "pi");
    associateAliases('Σ', "sigma");
    associateAliases('σ', "sigma");
    associateAliases('Φ', "phi");
    associateAliases('φ', "phi");
    associateAliases('Ψ', "psi");
    associateAliases('ψ', "psi");
    associateAliases('Ω', "omega");
    associateAliases('ω', "omega");
    associateAliases('ζ', "zeta");
    associateAliases('μ', "mu");
    associateAliases('ν', "nu");
    associateAliases('ς', "finalsigma");
    associateAliases('ϑ', "theta");
    associateAliases('ϒ', "upsilon");
    associateAliases('ϕ', "phi");
    associateAliases('ϖ', "pi");
    associateAliases('ϰ', "kappa");
    associateAliases('ϱ', "rho");
    associateAliases((char) 0x1D70F, "tau");

    associateAliases('∫', "integral", "int");
    associateAliases('∂', "partial", "del");
    associateAliases('∀', "forall", "universal");
    associateAliases('∃', "exists", "existential");
    associateAliases('∈', "in", "element", "member");
    associateAliases('∏', "product", "prod");
    associateAliases('∑', "sum", "summation");
    associateAliases('√', "sqrt", "root", "radical");
    associateAliases('≀', "wreath");
    associateAliases('⋰', "dots", "diagonaldots", "ellipsis");
    associateAliases('⌊', "floor", "leftfloor");
    associateAliases('⌋', "floor", "rightfloor");
    associateAliases('⇒', "implies", "therefore", "rightarrow");
    associateAliases('➔', "arrow", "to", "rightarrow");

    // Superscript Latin letters
    associateAliases('ᴬ', "supA");
    associateAliases('ᴮ', "supB");
    associateAliases('ᴰ', "supD");
    associateAliases('ᴱ', "supE");
    associateAliases('ᴳ', "supG");
    associateAliases('ᴴ', "supH");
    associateAliases('ᴵ', "supI");
    associateAliases('ᴶ', "supJ");
    associateAliases('ᴷ', "supK");
    associateAliases('ᴸ', "supL");
    associateAliases('ᴹ', "supM");
    associateAliases('ᴺ', "supN");
    associateAliases('ᴼ', "supO");
    associateAliases('ᴾ', "supP");
    associateAliases('ᴿ', "supR");
    associateAliases('ᵀ', "supT");
    associateAliases('ᵁ', "supU");
    associateAliases('ᵂ', "supW");

    // Lowercase superscripts
    associateAliases('ᵃ', "supa");
    associateAliases('ᵅ', "supalpha");
    associateAliases('ᵇ', "supb");
    associateAliases('ᵈ', "supd");
    associateAliases('ᵉ', "supe");
    associateAliases('ᵋ', "supepsilon");
    associateAliases('ᵍ', "supg");
    associateAliases('ᵏ', "supk");
    associateAliases('ᵐ', "supm");
    associateAliases('ᵒ', "supo");
    associateAliases('ᵖ', "supp");
    associateAliases('ᵗ', "supt");
    associateAliases('ᵘ', "supu");
    associateAliases('ᵛ', "supv");
    associateAliases('ᵝ', "supbeta");
    associateAliases('ᵞ', "supgamma");
    associateAliases('ᵟ', "supdelta");
    associateAliases('ᵠ', "supphi");
    associateAliases('ᵡ', "supchi");
    associateAliases('ᶜ', "supc");
    associateAliases('ᶠ', "supf");
    associateAliases('ᶻ', "supz");
    associateAliases('ᶿ', "suptheta");

    // Subscript operators and letters
    associateAliases('₊', "subplus");
    associateAliases('₋', "subminus");
    associateAliases('₍', "subleftparen");
    associateAliases('₎', "subrightparen");
    associateAliases('ₐ', "suba");
    associateAliases('ₑ', "sube");
    associateAliases('ₒ', "subo");
    associateAliases('ₓ', "subx");
    associateAliases('ₕ', "subh");
    associateAliases('ₖ', "subk");
    associateAliases('ₗ', "subl");
    associateAliases('ₘ', "subm");
    associateAliases('ₙ', "subn");
    associateAliases('ₚ', "subp");
    associateAliases('ₛ', "subs");
    associateAliases('ₜ', "subt");

    // Complex numbers and special
    associateAliases('ⅈ', "i", "imaginary");
    associateAliases('ℭ', "complex", "mathcalc");
  }

  private static void associateAliases(Character character, String... aliasesToBeAssociated)
  {
    Set<String> associatedAliases = CHARACTER_ALIASES.computeIfAbsent(character,
                                                                      k -> new HashSet<String>());
    for (String alias : aliasesToBeAssociated)
    {
      associatedAliases.add(alias);
    }
  }

  private TextField                textField;
  private TextField                searchField;
  private FlowPane                 buttonPane;
  private Map<Button, Character>   buttonMap = new HashMap<>();

  public static TreeSet<Character> chars     = new TreeSet<>();

  static
  {
    chars.addAll(Parser.SUBSCRIPT_CHARACTERS);

    for (Character s : SYMBOLS)
    {
      chars.add(s);
    }

    for (Character s : Parser.greekAndBlackLetterChars)
    {
      chars.add(s);
    }
    chars.addAll(Parser.fractions.keySet());

    for (Character c : Parser.lowercaseSuperscriptAlphabet)
    {
      chars.add(c);
    }
    for (Character c : Parser.uppercaseSuperscriptAlphabet)
    {
      chars.add(c);
    }
    for (Character c : Parser.SUBSCRIPT_DIGITS_ARRAY)
    {
      chars.add(c);
    }
    for (Character c : Parser.SUPERSCRIPT_DIGITS_ARRAY)
    {
      chars.add(c);
    }
    for (Character s : Parser.superscripts)
    {
      chars.add(s);
    }

    System.out.println("chars=" + chars);
    characters = chars.toArray(new Character[chars.size()]);
  }

  public static Character[] characters;

  @Override
  public void start(Stage primaryStage)
  {
    // Create search field
    searchField = new TextField();
    searchField.setPromptText("Search characters...");
    searchField.textProperty()
               .addListener((observable, oldValue, newValue) -> highlightMatches(newValue));

    textField = new TextField();
    textField.setEditable(true);

    Button copyButton = new Button("Copy");
    copyButton.setOnAction(e -> copyToClipboard());

    Button clearButton = new Button("Clear");
    clearButton.setOnAction(e -> clearInput());

    buttonPane = new FlowPane();

    // Arrays.sort(characters, (a, b) -> a.compareTo(b));

    for (Character ch : characters)
    {
      Button button = new Button(String.valueOf(ch));
      button.setOnAction(e -> appendCharacter(ch));
      button.setMaxWidth(Double.MAX_VALUE);
      button.setMaxHeight(Double.MAX_VALUE);
      buttonPane.getChildren().add(button);
      buttonMap.put(button, ch);
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

    ObjectBinding<Font> fontSizeBinding =
                                        Bindings.createObjectBinding(() -> Font.font(scene.getHeight()
                                                      * 0.04), scene.heightProperty());
    textField.fontProperty().bind(fontSizeBinding);
    searchField.fontProperty().bind(fontSizeBinding);
    copyButton.fontProperty().bind(fontSizeBinding);

    buttonPane.getChildren().forEach(node ->
    {
      if (node instanceof Button button)
      {
        button.fontProperty().bind(fontSizeBinding);
      }
    });

    WindowManager.setStageIcon(primaryStage, "SymbolPalette.png");
    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(Stylesheet.DarkerStyle));
    scene.getStylesheets().add(Stylesheet.convertStylesheetToDataURI(STYLESHEET));

    scene.setOnKeyPressed(button ->
    {
      switch (button.getCode())
      {
      case KeyCode.F11:
        primaryStage.setFullScreenExitHint("Press escape or F11 to exit full-screen mode");
        primaryStage.setFullScreen(!primaryStage.isFullScreen());
        break;
      case KeyCode.ESCAPE:
        primaryStage.fireEvent(new WindowEvent(primaryStage,
                                               WindowEvent.WINDOW_CLOSE_REQUEST));
      default:
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
        if (node instanceof Button button)
        {
          button.setStyle(null);
        }
      });
      return;
    }

    String[] searchTerms = searchText.trim().toLowerCase().split("\\s+");

    buttonPane.getChildren().forEach(node ->
    {
      /**
       * TODO: this sucks, a better way to do it would be to have a hashmap from alias
       * to button
       */
      if (node instanceof Button button)
      {
        Character character = buttonMap.get(button);
        boolean   matches   = false;

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

  private void appendCharacter(Character character)
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

  static
  {
    initializeAliases();
    // Debug print to see what's missing
    chars.forEach(c ->
    {
      if (!CHARACTER_ALIASES.containsKey(c))
      {
        System.out.println("Missing alias for: " + c);
      }
    });
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
