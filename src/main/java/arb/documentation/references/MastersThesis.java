package arb.documentation.references;

import java.util.concurrent.atomic.AtomicReference;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MastersThesis implements
                           Reference
{
  private final String                  title;
  private final String                  author;
  private final String                  year;
  private final AtomicReference<String> university = new AtomicReference<>();
  private final AtomicReference<String> degree     = new AtomicReference<>();
  private final AtomicReference<String> department = new AtomicReference<>();
  private String                        address;

  public MastersThesis(String title, String author, String year)
  {
    this.title  = title;
    this.author = author;
    this.year   = year;
  }

  // Implementations for Reference interface methods
  @Override
  public String year()
  {
    return year;
  }

  @Override
  public String title()
  {
    return title;
  }

  @Override
  public String author()
  {
    return author;
  }

  @Override
  public String cite(String key)
  {
    return String.format("@MastersThesis{%s,\n"
                         + "  author = {%s},\n"
                         + "  title = {%s},\n"
                         + "  school = {%s},\n"
                         + "  year = {%s},\n"
                         + "  address = {%s},\n"
                         + "  note = {Department: %s, Degree: %s}\n"
                         + "}",
                         key,
                         author(),
                         title(),
                         university.get(),
                         year(),
                         address,
                         department.get(),
                         degree.get());
  }

  // Setter methods for mutable fields
  public MastersThesis setUniversity(String university)
  {
    this.university.set(university);
    return this;
  }

  public MastersThesis setDegree(String degree)
  {
    this.degree.set(degree);
    return this;
  }

  public MastersThesis setDepartment(String department)
  {
    this.department.set(department);
    return this;
  }

  // Implementing abstract methods from Reference interface
  @Override
  public MastersThesis setVolume(String volume)
  {
    // Not applicable for Thesis, but must be implemented
    return this;
  }

  @Override
  public MastersThesis setPublisher(String publisher)
  {
    // Not applicable for Thesis, but must be implemented
    return this;
  }

  @Override
  public MastersThesis setAddress(String address)
  {
    this.address = address;
    return this;
  }
}
