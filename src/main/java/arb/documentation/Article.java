package arb.documentation;

import java.util.concurrent.atomic.AtomicReference;

public record Article(String author,
                      String title,
                      String year,
                      String journal,
                      String volume,
                      String pages,
                      AtomicReference<String> publisher,
                      AtomicReference<String> address)
                     implements
                     Reference
{

  @Override
  public String cite(String by)
  {
    // TODO: do this via reflection like is done for the Bibliography
    return String.format("@Article{%s,%s%s%s%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("journal", journal()),
                         Reference.conditionallyInsertField("volume", volume()),
                         Reference.conditionallyInsertField("pages", pages()),
                         Reference.conditionallyInsertField("publisher", publisher.get()),
                         Reference.conditionallyInsertField("address", address.get()))
                 .replace(",}", "}");
  }

  public Article(String author, String title, String year, String journal, String volume, String address)
  {
    this(author,
         title,
         year,
         journal,
         volume,
         address,
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

}
