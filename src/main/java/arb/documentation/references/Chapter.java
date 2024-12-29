package arb.documentation.references;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Chapter
{
  public Chapter(Book book, String index)
  {
    super();
    this.book  = book;
    this.index = index;
  }
  
  @Override
  public String toString()
  {
    return String.format("Chapter[book=%s, index=%s]", book, index);
  }

  Book   book;
  String index;
}
