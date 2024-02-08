package arb.documentation.references;

import java.util.concurrent.atomic.AtomicReference;

public record Book(String title,
                   String author,
                   String year,
                   AtomicReference<String> volume,
                   AtomicReference<String> publisher,
                   AtomicReference<String> address,
                   AtomicReference<String> series,
                   AtomicReference<String> edition,
                   AtomicReference<String> isbn)
                  implements
                  Reference
{

  public Book(String author, String title, String year)
  {
    this(author,
         title,
         year,
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>());
  }

  public String cite(String by)
  {
    return String.format("@Book{%s,%s%s%s%s%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("publisher", publisher.get()),
                         Reference.conditionallyInsertField("address", address.get()),
                         Reference.conditionallyInsertField("series", series.get()),
                         Reference.conditionallyInsertField("edition", edition.get()),
                         Reference.conditionallyInsertField("volume", volume.get()),
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

}
