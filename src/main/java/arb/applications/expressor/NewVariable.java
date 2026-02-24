package arb.applications.expressor;

public record NewVariable(String name, Class<?> type)
{
  public Class<?> getType()
  {
    return type;
  }

  public String getName()
  {
    return name;
  }
}