package arb.documentation;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import arb.documentation.references.Book;
import arb.documentation.references.Chapter;
import arb.documentation.references.Reference;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Referral implements Reference
{
  public Book book;

  public Referral(Book book, Stream<Chapter> stream)
  {
    this.book     = book;
    this.chapters = stream.collect(Collectors.toList());
  }

  public List<Chapter> chapters;

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
    assert false : "TODO";
    return null;
  }

  @Override
  public String author()
  {
    return book.author();
  }

  @Override
  public Reference setVolume(String volume)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Reference setPublisher(String string)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Reference setAddress(String address)
  {
    assert false : "TODO";
    return null;
  }
}
