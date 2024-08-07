package arb.viz;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * basic todo list
 * 
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class TODO
                  extends
                  Application
{

  public static final String EASIER_ON_THE_EYES_STYLESHEET = ".scroll-bar .thumb {\n"
                 + "    -fx-background-color: #808080; /* Change this to your desired thumb color */\n" + "}\n"
                 + "\n" + ".scroll-bar .increment-button, .scroll-bar .decrement-button {\n"
                 + "    -fx-background-color: #a9a9a9; /* Change this to your desired button color */\n"
                 + "}\n" + ".tree-table-view .column-resize-line {\n"
                 + "    -fx-background-color: #ff0000; /* Change this to your desired color */\n" + "}\n"
                 + "\n" + ".tree-table-view .tree-table-row-cell .tree-table-cell .text {\n"
                 + "    -fx-font-size: 18px; /* This specifically targets TreeTableView cells */\n"
                 + "    -fx-fill: #ffff00; /* Change this to your desired color */\n" + "}\n" + "\n"
                 + ".root {\n" + "    -fx-font-weight: bold; /* Make font bold */\n"
                 + "  -fx-font-size: 18px; /* Change this value to increase/decrease the font size */\n"
                 + "  -fx-base: #1f273f;\n" + "  -fx-default-button: #7f878f;\n"
                 + "  -fx-focus-color: #efefef;\n"
                 + "  -fx-focused-text-base-color: ladder(-fx-selection-bar, -fx-light-text-color 45%, -fx-dark-text-color\n"
                 + "    46%, -fx-dark-text-color 59%, -fx-mid-text-color 60%);\n"
                 + "  -fx-focused-mark-color: -fx-focused-text-base-color;\n" + "}\n" + "\n"
                 + ".text-input:focused {\n"
                 + "  -fx-highlight-text-fill: ladder(-fx-highlight-fill, -fx-light-text-color 45%, -fx-dark-text-color\n"
                 + "    46%, -fx-dark-text-color 59%, -fx-mid-text-color 60%);\n" + "}\n" + "\n"
                 + ".chart-legend-item {\n" + "  -fx-font-size: 20px;\n" + "  font-size: 20px;\n" + "}\n"
                 + "\n" + ".chart-datapoint-tooltip-label {\n" + "  -fx-font-size: 20px;\n"
                 + "  font-size: 20px;\n" + "}";
  
  private ObservableList<String> items      = FXCollections.observableArrayList();
  private ListView<String>       listView   = new ListView<>(items);
  private TextField              inputField = new TextField();

  public static String convertStylesheetToDataURI(String CSS_CONTENT)
  {
    String encoded = Base64.getEncoder().encodeToString(CSS_CONTENT.getBytes(StandardCharsets.UTF_8));
    return "data:text/css;base64," + encoded;
  }

  @Override
  public void start(Stage primaryStage)
  {
    Button addButton = new Button("Add");
    addButton.setOnAction(e -> addItem());

    Button editButton = new Button("Edit");
    editButton.setOnAction(e -> editItem());

    Button deleteButton = new Button("Delete");
    deleteButton.setOnAction(e -> deleteItem());

    Button saveButton = new Button("Save");
    saveButton.setOnAction(e -> saveItems());

    Button loadButton = new Button("Load");
    loadButton.setOnAction(e -> loadItems());

    Button clearButton = new Button("Clear");
    clearButton.setOnAction(e -> inputField.setText(""));

    HBox buttons = new HBox(10,
                            addButton,
                            editButton,
                            deleteButton,
                            saveButton,
                            loadButton,
                            clearButton);
    VBox layout  = new VBox(10,
                            inputField,
                            buttons,
                            listView);
    VBox.setVgrow(listView, javafx.scene.layout.Priority.ALWAYS);

    Scene scene = new Scene(layout,
                            800,
                            550);
    scene.getStylesheets()
         .add(convertStylesheetToDataURI(EASIER_ON_THE_EYES_STYLESHEET));

    Platform.runLater(this::loadItems);

    primaryStage.setTitle("To-Do List");
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  private void addItem()
  {
    String item = inputField.getText().trim();
    if (!item.isEmpty())
    {
      items.add(item);
      inputField.clear();
    }
  }

  private void editItem()
  {
    inputField.setText(listView.getSelectionModel().getSelectedItem());

  }

  private void deleteItem()
  {
    int selectedIndex = listView.getSelectionModel().getSelectedIndex();
    if (selectedIndex != -1)
    {
      items.remove(selectedIndex);
    }
  }

  private void saveItems()
  {
    try ( PrintWriter out = new PrintWriter("todoList.txt"))
    {
      items.forEach(out::println);
    }
    catch (FileNotFoundException e)
    {
      e.printStackTrace();
    }
  }

  private void loadItems()
  {
    try ( BufferedReader reader = new BufferedReader(new FileReader("todoList.txt")))
    {
      List<String> lines = reader.lines().collect(Collectors.toList());
      items.setAll(lines);
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
