package arb.expressions;

import java.util.Objects;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 */
public class VariableReference
{

  @Override
  public String toString()
  {
    return String.format("Reference[name=%s, index=%s, type=%s]", name, index, type != null ? type.getName() : null);
  }

  public Class<?> type;

  @Override
  public int hashCode()
  {
    return Objects.hash(index, name);
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
    VariableReference other = (VariableReference) obj;
    return Objects.equals(index, other.index) && Objects.equals(name, other.name);
  }

  public VariableReference(String name)
  {
    this.name  = name == null ? null : name.trim();
    this.index = null;
  }

  public VariableReference(String name, String index)
  {
    this.name  = name == null ? null : name.trim();
    this.index = index;
  }

  public VariableReference(String name, String index, Class<?> type)
  {
    this.name  = name == null ? null : name.trim();
    this.index = index;
    this.type  = type;
  }

  public String name;

  public String index;

  public String typeset()
  {
    if (index != null)
    {
      return String.format("%s[%s]", name, index);
    }
    else
    {
      return name;
    }
  }

  /**
   * 
   * @return true if this{@link #name} starts with ( and ends with )
   */
  public boolean isMultivariate()
  {
    return name.startsWith("(") && name.endsWith(")");
  }

  public Class<?> type()
  {
    return type;
  }

}