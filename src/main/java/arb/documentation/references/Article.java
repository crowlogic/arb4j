package arb.documentation.references;

import java.util.concurrent.atomic.AtomicReference;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 * {@link TheArb4jLibrary}
 */
public record Article(String title,
                      String author,
                      String year,
                      String journal,
                      AtomicReference<String> volume,
                      String pages,
                      AtomicReference<String> publisher,
                      AtomicReference<String> address,
                      AtomicReference<String> number)
                     implements
                     Reference
{

  @Override
  public String cite(String by)
  {
    // TODO: do this via reflection like is done for the Bibliography
    return String.format("@Article{%s,%s%s%s%s%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("journal", journal()),
                         Reference.conditionallyInsertField("volume", getVolume()),
                         Reference.conditionallyInsertField("pages", getPages()),
                         Reference.conditionallyInsertField("publisher", publisher.get()),
                         Reference.conditionallyInsertField("address", address.get()),
                         Reference.conditionallyInsertField("number", number.get()))
                 .replace(",}", "}");
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

}
