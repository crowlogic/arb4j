package arb.documentation.references;

import java.util.LinkedHashMap;
import java.util.Map;

import arb.documentation.AbstractBibliography;

public record Miscellaneous(String title, String author, String year, String howpublished, String note, String url)
                           implements
                           Reference
{

  @Override
  public String cite(String by)
  {
    return AbstractBibliography.generateCitation(this, by, getFieldMapping());
  }

  private static Map<String, String> getFieldMapping()
  {
    Map<String, String> fields = new LinkedHashMap<>();
    fields.put("author", "author");
    fields.put("title", "title");
    fields.put("year", "year");
    fields.put("howpublished", "howpublished");
    fields.put("note", "note");
    fields.put("url", "url");
    return fields;
  }

  @Override
  public String getCitationType()
  {
    return "Misc";
  }

  @Override
  public Reference setVolume(String volume)
  {
    assert false : "not supported";
    return this;
  }

  @Override
  public Reference setPublisher(String string)
  {
    assert false : "not supported";
    return this;
  }

  @Override
  public Reference setAddress(String address)
  {
    assert false : "not supported";
    return this;
  }

  @Override
  public String getVolume()
  {
    return null;
  }

  @Override
  public String getNumber()
  {
    return null;
  }

  @Override
  public String getPages()
  {
    return null;
  }

  public Miscellaneous setURL(String string)
  {
    // TODO Auto-generated method stub
    return null;
  }
}
