package arb.documentation;

public interface Reference
{
  public String year();

  public String title();

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

  
}
