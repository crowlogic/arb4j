package arb.documentation.references;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import arb.documentation.AbstractBibliography;

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
    return AbstractBibliography.generateCitation(this, by, getFieldMapping());
  }

  private static Map<String, String> getFieldMapping()
  {
    Map<String, String> fields = new LinkedHashMap<>();
    fields.put("author", "author");
    fields.put("title", "title");
    fields.put("booktitle", "booktitle");
    fields.put("year", "year");
    fields.put("editor", "getEditor");
    fields.put("publisher", "getPublisher");
    fields.put("address", "getAddress");
    fields.put("pages", "getPages");
    fields.put("volume", "getVolume");
    fields.put("number", "getNumber");
    fields.put("series", "getSeries");
    fields.put("isbn", "getIsbn");
    fields.put("doi", "getDoi");
    return fields;
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

  public String getEditor()
  {
    return editor.get();
  }

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

  public String getIsbn()
  {
    return isbn.get();
  }

  public String getDoi()
  {
    return doi.get();
  }
}
