package arb.documentation.references;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import arb.documentation.AbstractBibliography;
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
    return AbstractBibliography.generateCitation(this, key, getFieldMapping());
  }

  private static Map<String, String> getFieldMapping() {
    Map<String, String> fields = new LinkedHashMap<>();
    fields.put("author", "author");
    fields.put("title", "title");
    fields.put("school", "getUniversity");
    fields.put("year", "year");
    fields.put("address", "getAddress");
    fields.put("type", "getDegree");
    return fields;
  }

  @Override
  public String getCitationType() {
    return "MastersThesis";
  }

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

  @Override
  public MastersThesis setVolume(String volume)
  {
    return this;
  }

  @Override
  public MastersThesis setPublisher(String publisher)
  {
    return this;
  }

  @Override
  public MastersThesis setAddress(String address)
  {
    this.address = address;
    return this;
  }

  @Override
  public String getVolume() {
    return null;
  }

  @Override
  public String getNumber() {
    return null;
  }

  @Override
  public String getPages() {
    return null;
  }

  public String getUniversity() {
    return university.get();
  }

  public String getDegree() {
    return degree.get();
  }

  public String getDepartment() {
    return department.get();
  }

  public String getAddress() {
    return address;
  }
}
