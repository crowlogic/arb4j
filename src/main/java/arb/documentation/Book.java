package arb.documentation;

import java.util.concurrent.atomic.AtomicReference;

public record Book(String author,
                   String title,
                   String year,
                   AtomicReference<String> publisher,
                   AtomicReference<String> address)
                  implements
                  Reference
{

  public String cite(String by)
  {
    return String.format("@book{%s,\n author = {%s},\n title = {%s},\n year = {%s},\n publisher = {%s},\n address = {%s}\n}",
                         by,
                         author(),
                         title(),
                         year(),
                         publisher(),
                         address());
  }

  public Book(String author, String title, String year)
  {
    this(author,
         title,
         year,
         new AtomicReference<>(),
         new AtomicReference<>());
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

}
