package arb.documentation.references;

public record Miscellaneous(String title, String author, String year, String howpublished, String note, String url)
                           implements
                           Reference
{

  @Override
  public String cite(String by)
  {
    // TODO: do this via reflection like is done for the Bibliography
    return String.format("@Misc{%s,%s%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("howpublished", howpublished),
                         Reference.conditionallyInsertField("note", note),
                         Reference.conditionallyInsertField("url", url))
                 .replace(",}", "}");
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

  public Miscellaneous setURL(String string)
  {
    // TODO Auto-generated method stub
    return null;
  }

}
