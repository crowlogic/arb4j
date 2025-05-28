package arb.documentation.references;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Stream;

import arb.documentation.*;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public record Book(String title,
                   String author,
                   String year,
                   String pages,
                   AtomicReference<String> volume,
                   AtomicReference<String> publisher,
                   AtomicReference<String> address,
                   AtomicReference<String> series,
                   AtomicReference<String> edition,
                   AtomicReference<String> isbn)
                  implements
                  Reference
{

  @Override
  public String getPages()
  {
    return pages;
  }

  public Referral referToChapters(String... chapters)
  {
    return new Referral(this,
                        Stream.of(chapters)
                              .map(chapter -> new Chapter(this,
                                                          chapter)));
  }

  public Book(String title, String author, String year, String pages)
  {
    this(title,
         author,
         year,
         pages,
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>());
  }

  public Book(String title, String author, String year)
  {
    this(title,
         author,
         year,
         null);
  }

  @Override
  public String cite(String by)
  {
    return AbstractBibliography.generateCitation(this, by, getFieldMapping());
  }

  private static Map<String, String> getFieldMapping()
  {
    Map<String, String> fields = new LinkedHashMap<>();
    fields.put("author", "author");
    fields.put("title", "title");
    fields.put("year", "year");
    fields.put("publisher", "getPublisher");
    fields.put("address", "getAddress");
    fields.put("series", "getSeries");
    fields.put("edition", "getEdition");
    fields.put("volume", "getVolume");
    fields.put("pages", "getPages");
    fields.put("isbn", "getIsbn");
    return fields;
  }

  @Override
  public Book setPublisher(String string)
  {
    publisher.set(string);
    return this;
  }

  @Override
  public Book setAddress(String string)
  {
    address.set(string);
    return this;
  }

  public Book setSeries(String string)
  {
    series.set(string);
    return this;
  }

  public Book setEdition(String string)
  {
    edition.set(string);
    return this;
  }

  @Override
  public Book setVolume(String string)
  {
    volume.set(string);
    return this;
  }

  public Book setIsbn(String string)
  {
    isbn.set(string);
    return this;
  }

  public TheoremReference referToTheorem(String string)
  {
    return new TheoremReference(this,
                                string);
  }

  // Missing getter methods for AtomicReference fields
  public String getPublisher()
  {
    return publisher.get();
  }

  public String getAddress()
  {
    return address.get();
  }

  public String getSeries()
  {
    return series.get();
  }

  public String getEdition()
  {
    return edition.get();
  }

  @Override
  public String getVolume()
  {
    return volume.get();
  }

  public String getIsbn()
  {
    return isbn.get();
  }

  @Override
  public String getNumber()
  {
    return null; // Books don't typically have numbers
  }
}
