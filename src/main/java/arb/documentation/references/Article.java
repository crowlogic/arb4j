package arb.documentation.references;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import arb.documentation.AbstractBibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Noun;
import arb.language.Phrase;
import arb.language.Word;

/**
 * In grammar, an article is any member of a class of dedicated {@link Word}s
 * that are used with {@link Noun} {@link Phrase}s to mark the identifiability
 * of the referents of the noun phrases. The category of articles constitutes a
 * part of speech. In English, both "the" and "a(n)" are articles, which combine
 * with nouns to form noun phrases.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public record Article(String title,
                      String author,
                      String year,
                      String journal,
                      AtomicReference<String> volume,
                      String pages,
                      AtomicReference<String> publisher,
                      AtomicReference<String> address,
                      AtomicReference<String> number,
                      AtomicReference<String> month)
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
    var fields = new LinkedHashMap<String, String>();
    fields.put("author", "author");
    fields.put("title", "title");
    fields.put("year", "year");
    fields.put("month", "getMonth");
    fields.put("journal", "journal");
    fields.put("volume", "getVolume");
    fields.put("pages", "getPages");
    fields.put("publisher", "getPublisher");
    fields.put("address", "getAddress");
    fields.put("number", "getNumber");
    return fields;
  }

  public Article(String title,
                 String author,
                 String year,
                 String journal,
                 String volume,
                 String pages)
  {
    this(title,
         author,
         year,
         journal,
         new AtomicReference<>(volume),
         pages,
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>());
  }

  public Article(String title,
                 String author,
                 String year,
                 String journal,
                 String volume,
                 String pages,
                 String publisher)
  {
    this(title,
         author,
         year,
         journal,
         new AtomicReference<>(volume),
         pages,
         new AtomicReference<>(publisher),
         new AtomicReference<>(),
         new AtomicReference<>(),
         new AtomicReference<>());
  }

  @Override
  public Article setPublisher(String publisher)
  {
    this.publisher.set(publisher);
    return this;
  }

  @Override
  public Article setAddress(String address)
  {
    this.address.set(address);
    return this;
  }

  @Override
  public Article setVolume(String string)
  {
    volume.set(string);
    return this;
  }

  @Override
  public String getVolume()
  {
    return volume.get();
  }

  @Override
  public String getPages()
  {
    return pages();
  }

  @Override
  public String getNumber()
  {
    return number.get();
  }

  public Article setNumber(String string)
  {
    number.set(string);
    return this;
  }

  public String getMonth()
  {
    return month.get();
  }

  public Article setMonth(String string)
  {
    month.set(string);
    return this;
  }

  public String getPublisher()
  {
    return publisher.get();
  }

  public String getAddress()
  {
    return address.get();
  }
}
