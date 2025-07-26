package arb.documentation.references;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TheoremReference implements
                              Reference
{

  @Override
  public String toString()
  {
    return String.format("Theorem %s in %s by %s", reference, book.title(), book.author());
  }

  public Book   book;
  public String reference;

  public TheoremReference(Book book, String reference)
  {
    this.book      = book;
    this.reference = reference;
  }

  @Override
  public String year()
  {
    return book.year();
  }

  @Override
  public String title()
  {
    return book.title();
  }

  @Override
  public String cite(String by)
  {
    return book.cite(by);
  }

  @Override
  public String getCitationType()
  {
    return book.getCitationType(); // Delegates to the underlying book
  }

  @Override
  public String author()
  {
    return book.author();
  }

  @Override
  public Reference setVolume(String volume)
  {
    return book.setVolume(volume);
  }

  @Override
  public Reference setPublisher(String string)
  {
    return book.setPublisher(string);
  }

  @Override
  public Reference setAddress(String address)
  {
    return book.setAddress(address);
  }

  @Override
  public String getVolume()
  {
    return book.getVolume();
  }

  @Override
  public String getNumber()
  {
    return book.getNumber();
  }

  @Override
  public String getPages()
  {
    return book.getPages();
  }

}
