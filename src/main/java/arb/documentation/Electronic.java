package arb.documentation;

public record Electronic(String title, String author, String year, String url, String note) implements
                           Reference
{

  @Override
  public String cite(String by)
  {
    // TODO: do this via reflection like is done for the Bibliography
    return String.format("@Electronic{%s,%s%s%s%s%s}",
                         by,
                         Reference.conditionallyInsertField("author", author()),
                         Reference.conditionallyInsertField("title", title()),
                         Reference.conditionallyInsertField("year", year()),
                         Reference.conditionallyInsertField("url",
                                                            url),
                         Reference.conditionallyInsertField("note", note))
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

}
