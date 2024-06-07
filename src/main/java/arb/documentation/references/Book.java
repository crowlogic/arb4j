package arb.documentation.references;

import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;

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

  public String cite(String by)
  {
    return String.format("@Book{%s,%s%s%s%s%s%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("publisher", publisher.get()),
                         Reference.conditionallyInsertField("address", address.get()),
                         Reference.conditionallyInsertField("series", series.get()),
                         Reference.conditionallyInsertField("edition", edition.get()),
                         Reference.conditionallyInsertField("volume", volume.get()),
                         Reference.conditionallyInsertField("pages", getPages()),
                         Reference.conditionallyInsertField("isbn", isbn.get()))
                 .replace(",}", "}");
  }

  @Override
  public Book setPublisher(String string)
  {
    publisher.set(string);
    return this;
  }

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

}
