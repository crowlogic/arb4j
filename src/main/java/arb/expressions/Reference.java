package arb.expressions;

public class Reference
{
  @Override
  public int hashCode()
  {
    final int prime  = 31;
    int       result = 1;
    result = prime * result + ((index == null) ? 0 : index.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Reference other = (Reference) obj;
    if (index == null)
    {
      if (other.index != null)
        return false;
    }
    else if (!index.equals(other.index))
      return false;
    if (name == null)
    {
      if (other.name != null)
        return false;
    }
    else if (!name.equals(other.name))
      return false;
    return true;
  }

  @Override
  public String toString()
  {
    return String.format("Reference[name=%s, index=%s]", name, index);
  }

  public Reference(String identifier, String index)
  {
    this.name  = identifier;
    this.index = index;
  }

  public String name;

  public String index;
}