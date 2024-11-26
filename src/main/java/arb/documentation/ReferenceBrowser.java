package arb.documentation;

import java.lang.reflect.Field;

import arb.documentation.references.Article;
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
import javafx.scene.control.skin.VirtualFlow;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ReferenceBrowser extends
                              Application
{
  private TableView<Article>      tableView;
  private ObservableList<Article> articleData = FXCollections.observableArrayList();

  @Override
  public void start(Stage primaryStage)
  {
    primaryStage.setTitle("References");

    BorderPane root = new BorderPane();
    root.setPadding(new Insets(10));

    createTableView();
    populateFromBibliography();
//    ArticleForm form = new ArticleForm(articleData,
//                                       tableView);

    root.setCenter(tableView);

    Scene scene = new Scene(root,
                            800,
                            600);
    WindowManager.setMoreConduciveStyle(scene);
    primaryStage.setScene(scene);
    primaryStage.show();

  }

  public VirtualFlow<?> flow;

  public VirtualFlow<?> getVirtualFlow()
  {
    return (flow == null) ? flow = WindowManager.getVirtualFlow(tableView.getSkin()) : flow;
  }

  private void createTableView()
  {
    tableView = new TableView<>();
    tableView.setEditable(true);

    // Create columns using record accessor methods
    TableColumn<Article, String> titleCol = new TableColumn<>("Title");
    titleCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().title()));
    titleCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Article, String> authorCol = new TableColumn<>("Author");
    authorCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().author()));
    authorCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Article, String> yearCol = new TableColumn<>("Year");
    yearCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().year()));
    yearCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Article, String> journalCol = new TableColumn<>("Journal");
    journalCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().journal()));
    journalCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Article, String> volumeCol = new TableColumn<>("Volume");
    volumeCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getVolume()));
    volumeCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Article, String> pagesCol = new TableColumn<>("Pages");
    pagesCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getPages()));
    pagesCol.setCellFactory(TextFieldTableCell.forTableColumn());

    TableColumn<Article, String> idCol = new TableColumn<>("Identifier");
    pagesCol.setCellValueFactory(data -> new SimpleStringProperty(data.getValue().getPages()));
    pagesCol.setCellFactory(TextFieldTableCell.forTableColumn());

    tableView.getColumns().addAll(titleCol, authorCol, yearCol, journalCol, volumeCol, pagesCol, idCol);
    tableView.setItems(articleData);

    tableView.skinProperty().addListener(listener ->
    {
      try
      {
        flow = getVirtualFlow();
        flow.setPannable(true);
      }
      catch (Throwable e)
      {
        e.printStackTrace();
      }

    });
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
        if (value instanceof Article article)
        {
          articleData.add(article);
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
