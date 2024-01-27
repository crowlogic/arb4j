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

  public default String getVolume()
  {
    return null;
  }

  public default String getNumber()
  {
    return null;
  }

  public default String getPages()
  {
    return null;
  }

  Reference setVolume( String volume );
  
  Reference setPublisher(String string);

  Reference setAddress(String address);

  public static String conditionallyInsertField(String fieldName, String fieldValue)
  {
    return fieldValue == null ? "" : String.format("\n %s = {%s},", fieldName, fieldValue);
  }
}
