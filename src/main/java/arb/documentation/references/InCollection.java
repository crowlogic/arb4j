package arb.documentation.references;

import java.util.concurrent.atomic.AtomicReference;

public record InCollection(String title,
                           String author,
                           String year,
                           String booktitle,
                           AtomicReference<String> publisher,
                           AtomicReference<String> address,
                           String pages,
                           AtomicReference<String> editor,
                           AtomicReference<String> volume,
                           AtomicReference<String> number,
                           AtomicReference<String> series,
                           AtomicReference<String> isbn,
                           AtomicReference<String> doi)
                          implements
                          Reference
{

  @Override
  public String cite(String by)
  {
    return String.format("@InCollection{%s,%s%s%s%s%s%s%s%s%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("booktitle", booktitle()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("editor", editor.get()),
                         Reference.conditionallyInsertField("publisher", publisher.get()),
                         Reference.conditionallyInsertField("address", address.get()),
                         Reference.conditionallyInsertField("pages", pages()),
                         Reference.conditionallyInsertField("volume", volume.get()),
                         Reference.conditionallyInsertField("number", number.get()),
                         Reference.conditionallyInsertField("series", series.get()),
                         Reference.conditionallyInsertField("isbn", isbn.get()),
                         Reference.conditionallyInsertField("doi", doi.get()))
                 .replace(",}", "}");
  }

  public InCollection(String title, String author, String year, String booktitle, String pages)
  {
    this(title,
         author,
         year,
         booktitle,
         new AtomicReference<>(),
         new AtomicReference<>(),
         pages,
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>());
  }

  @Override
  public InCollection setPublisher(String publisher)
  {
    this.publisher.set(publisher);
    return this;
  }

  @Override
  public InCollection setAddress(String address)
  {
    this.address.set(address);
    return this;
  }

  @Override
  public InCollection setVolume(String volume)
  {
    this.volume.set(volume);
    return this;
  }

  public InCollection setEditor(String editor)
  {
    this.editor.set(editor);
    return this;
  }

  public InCollection setNumber(String number)
  {
    this.number.set(number);
    return this;
  }

  public InCollection setSeries(String series)
  {
    this.series.set(series);
    return this;
  }

  public InCollection setIsbn(String isbn)
  {
    this.isbn.set(isbn);
    return this;
  }

  public InCollection setDoi(String doi)
  {
    this.doi.set(doi);
    return this;
  }

  @Override
  public String getVolume()
  {
    return volume.get();
  }

  @Override
  public String getNumber()
  {
    return number.get();
  }

  @Override
  public String getPages()
  {
    return pages();
  }
}
