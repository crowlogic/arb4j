package arb.documentation.references;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.*;

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

//Add missing getter methods for consistency
  public String getPublisher()
  {
    return publisher.get();
  }

  public String getAddress()
  {
    return address.get();
  }

  // Define field mappings: BibTeX field name -> method name
  static Map<String, String> fieldMethods = new LinkedHashMap<>();
  static
  {
    fieldMethods.put("author", "author");
    fieldMethods.put("title", "title");
    fieldMethods.put("year", "year");
    fieldMethods.put("month", "getMonth");
    fieldMethods.put("journal", "journal");
    fieldMethods.put("volume", "getVolume");
    fieldMethods.put("pages", "getPages");
    fieldMethods.put("publisher", "getPublisher");
    fieldMethods.put("address", "getAddress");
    fieldMethods.put("number", "getNumber");
  }

  @Override
  public String cite(String by)
  {
    StringBuilder citation = new StringBuilder(String.format("@Article{%s,",by));

    Class<?>      clazz    = this.getClass();

    for (var entry : fieldMethods.entrySet())
    {
      try
      {
        Method method      = clazz.getMethod(entry.getValue());
        Object value       = method.invoke(this);
        String stringValue = (value != null) ? value.toString() : null;
        citation.append(Reference.conditionallyInsertField(entry.getKey(), stringValue));
      }
      catch (Exception e)
      {
        // Log error or handle gracefully - could use a logger here
        System.err.println("Error accessing method " + entry.getValue() + ": " + e.getMessage());
      }
    }

    citation.append("}");
    return citation.toString().replace(",}", "}");
  }

  public Article(String title, String author, String year, String journal, String volume, String pages)
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

}
