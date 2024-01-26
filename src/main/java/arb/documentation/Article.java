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
  public Reference setAddress(String address)
  {
    this.address.set(address);
    return this;
  }

  @Override
  public String cite(String by)
  {
    return String.format("@orthogonalPolynomialFourierTransforms{%s,%s\n title = {%s},\n year = {%s},\n publisher = {%s}\n%s}",
                         by,
                         author() == null ? "" : String.format("\n author = {%s},", author()),
                         title(),
                         year(),
                         publisher().get(),
                         address().get() == null ? "" : String.format("\n address = {%s}", address().get()));
  }

}
