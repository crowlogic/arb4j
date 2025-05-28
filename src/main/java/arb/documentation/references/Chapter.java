package arb.documentation.references;

import java.util.LinkedHashMap;
import java.util.Map;

import arb.documentation.AbstractBibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Chapter implements Reference
{
  private final Book book;
  private final String index;

  public Chapter(Book book, String index)
  {
    super();
    this.book = book;
    this.index = index;
  }
  
  @Override
  public String toString()
  {
    return String.format("Chapter[book=%s, index=%s]", book, index);
  }

  @Override
  public String cite(String by)
  {
    return AbstractBibliography.generateCitation(this, by, getFieldMapping());
  }

  private static Map<String, String> getFieldMapping() {
    Map<String, String> fields = new LinkedHashMap<>();
    fields.put("author", "author");
    fields.put("title", "title");
    fields.put("booktitle", "getBookTitle");
    fields.put("chapter", "getChapter");
    fields.put("year", "year");
    fields.put("publisher", "getPublisher");
    fields.put("address", "getAddress");
    fields.put("pages", "getPages");
    return fields;
  }

  @Override
  public String getCitationType() {
    return "InBook"; // BibTeX type for chapter references
  }

  @Override
  public String year() {
    return book.year();
  }

  @Override
  public String title() {
    return book.title();
  }

  @Override
  public String author() {
    return book.author();
  }

  public String getBookTitle() {
    return book.title();
  }

  public String getChapter() {
    return index;
  }

  public String getPublisher() {
    return book.getPublisher();
  }

  public String getAddress() {
    return book.getAddress();
  }

  @Override
  public String getVolume() {
    return book.getVolume();
  }

  @Override
  public String getNumber() {
    return book.getNumber();
  }

  @Override
  public String getPages() {
    return book.getPages();
  }

  @Override
  public Reference setVolume(String volume) {
    return book.setVolume(volume);
  }

  @Override
  public Reference setPublisher(String publisher) {
    return book.setPublisher(publisher);
  }

  @Override
  public Reference setAddress(String address) {
    return book.setAddress(address);
  }

  // Getters for the private fields
  public Book getBook() {
    return book;
  }

  public String getIndex() {
    return index;
  }
}
