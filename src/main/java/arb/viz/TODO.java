package arb.viz;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
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
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * basic todo list
 * 
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class TODO extends
                  Application
{
  boolean                        changed    = false;

  private ObservableList<String> items      = FXCollections.observableArrayList();
  private ListView<String>       listView   = new ListView<>(items);
  private TextField              inputField = new TextField();

  public static String convertStylesheetToDataURI(String CSS_CONTENT)
  {
    String encoded = Base64.getEncoder().encodeToString(CSS_CONTENT.getBytes(StandardCharsets.UTF_8));
    return "data:text/css;base64," + encoded;
  }

  public void setStageIcon(Stage primaryStage)
  {
    try
    {
      URL resourceUrl = getClass().getClassLoader().getResource("TODO.png");
      System.out.println("Resource URL: " + resourceUrl);

      if (resourceUrl != null)
      {
        primaryStage.getIcons().add(new Image(resourceUrl.toExternalForm()));
        System.out.println("Icon added successfully");
      }
      else
      {
        System.err.println("Could not find resource: TODO.png");
        // Print classpath and module path for debugging
        System.out.println("Classpath: " + System.getProperty("java.class.path"));
        System.out.println("Module path: " + System.getProperty("jdk.module.path"));
      }
    }
    catch (Throwable e)
    {
      System.err.println("Could not find resource: TODO.png");
      // Print classpath and module path for debugging
      System.out.println("Classpath: " + System.getProperty("java.class.path"));
      System.out.println("Module path: " + System.getProperty("jdk.module.path"));
      e.printStackTrace(System.err);
    }
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
    WindowManager.addEmacsKeybindings(inputField);

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
    WindowManager.setMoreConduciveStyle(scene);
    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.fireEvent(new WindowEvent(primaryStage,
                                               WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });

    primaryStage.setOnCloseRequest(evt ->
    {
      if (changed)
      {
        Alert alert = new Alert(AlertType.CONFIRMATION);
        alert.setTitle("Confirm Close");
        alert.setHeaderText("There are unsaved changes. Are you sure you want to close the program?");
        alert.showAndWait().filter(r -> r != ButtonType.OK).ifPresent(r -> evt.consume());
      }
    });

    scene.setOnKeyPressed(handler ->
    {
      if (handler.getCode() == KeyCode.F11)
      {
        primaryStage.setFullScreen(!primaryStage.isFullScreen());
      }
    });

    Platform.runLater(this::loadItems);

    setStageIcon(primaryStage);

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
      changed = true;
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
      changed = true;
    }
  }

  private void saveItems()
  {
    try ( PrintWriter out = new PrintWriter("todoList.txt"))
    {
      items.forEach(out::println);
      changed = false;
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
