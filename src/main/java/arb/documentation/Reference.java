package arb.documentation;

public interface Reference
{
  public String year();

  public String title();

  public String cite(String by);
  
  public default String journal()
  {
    return null;
  }

  public String author();

  public default String volume()
  {
    return null;
  }

  public default String number()
  {
    return null;
  }

  public default String pages()
  {
    return null;
  }

  Reference setPublisher(String string);

  Reference setAddress(String address);
  
}
