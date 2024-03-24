package arb.documentation;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import arb.documentation.references.Book;
import arb.documentation.references.Chapter;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ChapterReferral
{
  public Book book;

  public ChapterReferral(Book book, Stream<Chapter> stream)
  {
    this.book     = book;
    this.chapters = stream.collect(Collectors.toList());
  }

  public List<Chapter> chapters;
}
