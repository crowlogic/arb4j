package arb.documentation;

import java.lang.reflect.Field;

import arb.documentation.references.Reference;
import arb.viz.WindowManager;
import javafx.application.Application;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ReferenceBrowser extends
                              Application
{
  private TableView<Reference>      tableView;
  private ObservableList<Reference> citations = FXCollections.observableArrayList();

  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setTitle("References");

    BorderPane root = new BorderPane();
    root.setPadding(new Insets(10));

    createTableView();
    populateFromBibliography();

    root.setCenter(tableView);

    Scene scene = new Scene(root,
                            1600,
                            800);
    WindowManager.setMoreConduciveStyle(scene);
    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        primaryStage.fireEvent(new WindowEvent(primaryStage,
                                               WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });
    primaryStage.setScene(scene);
    primaryStage.show();

  }

  private void createTableView()
  {
    tableView = new TableView<>();
    tableView.setEditable(true);

    // Create columns using record accessor methods
    TableColumn<Reference, String> titleCol = new TableColumn<>("Title");
    titleCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().title()));
    titleCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Reference, String> authorCol = new TableColumn<>("Author");
    authorCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().author()));
    authorCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Reference, String> yearCol = new TableColumn<>("Year");
    yearCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().year()));
    yearCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Reference, String> journalCol = new TableColumn<>("Journal");
    journalCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().journal()));
    journalCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Reference, String> volumeCol = new TableColumn<>("Volume");
    volumeCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getVolume()));
    volumeCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Reference, String> pagesCol = new TableColumn<>("Pages");
    pagesCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getPages()));
    pagesCol.setCellFactory(TextFieldTableCell.forTableColumn());

    tableView.getColumns().addAll(titleCol, authorCol, yearCol, journalCol, volumeCol, pagesCol);
    tableView.setItems(citations);

    WindowManager.makeTableViewPannable(tableView);
  }

  private void populateFromBibliography()
  {
    Field[] fields = Bibliography.class.getDeclaredFields();
    for (Field field : fields)
    {
      field.setAccessible(true);
      try
      {
        Object value = field.get(null); // Get static field value
        if (value instanceof Reference citation)
        {
          citations.add(citation);
        }
      }
      catch (IllegalAccessException e)
      {
        e.printStackTrace();
      }
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
