package arb.documentation;

import arb.documentation.references.Article;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ArticleForm extends
                         GridPane
{
  private TextField titleField     = new TextField();
  private TextField authorField    = new TextField();
  private TextField yearField      = new TextField();
  private TextField journalField   = new TextField();
  private TextField volumeField    = new TextField();
  private TextField pagesField     = new TextField();
  private TextField publisherField = new TextField();

  public ArticleForm(ObservableList<Article> articleData, TableView<Article> tableView)
  {
    setPadding(new Insets(10));
    setHgap(10);
    setVgap(5);

    // Add form fields
    addFormFields();

    // Add buttons
    Button addButton   = new Button("Add Article");
    Button clearButton = new Button("Clear Form");

    addButton.setOnAction(e ->
    {
      Article article = createArticleFromForm();
      articleData.add(article);
      clearForm();
    });

    clearButton.setOnAction(e -> clearForm());

    add(addButton, 0, 7);
    add(clearButton, 1, 7);
  }

  private void addFormFields()
  {
    add(new Label("Title:"), 0, 0);
    add(titleField, 1, 0);

    add(new Label("Author:"), 0, 1);
    add(authorField, 1, 1);

    add(new Label("Year:"), 0, 2);
    add(yearField, 1, 2);

    add(new Label("Journal:"), 0, 3);
    add(journalField, 1, 3);

    add(new Label("Volume:"), 0, 4);
    add(volumeField, 1, 4);

    add(new Label("Pages:"), 0, 5);
    add(pagesField, 1, 5);

    add(new Label("Publisher:"), 0, 6);
    add(publisherField, 1, 6);
  }

  private Article createArticleFromForm()
  {
    return new Article(titleField.getText(),
                       authorField.getText(),
                       yearField.getText(),
                       journalField.getText(),
                       volumeField.getText(),
                       pagesField.getText(),
                       publisherField.getText());
  }

  private void clearForm()
  {
    titleField.clear();
    authorField.clear();
    yearField.clear();
    journalField.clear();
    volumeField.clear();
    pagesField.clear();
    publisherField.clear();
  }
}
