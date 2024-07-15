package arb.viz;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
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

  private ObservableList<String> items      = FXCollections.observableArrayList();
  private ListView<String>       listView   = new ListView<>(items);
  private TextField              inputField = new TextField();

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
    //scene.getStylesheets().add(getClass().getResource("style.css").toExternalForm());

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
