package arb.expressions;

import java.util.Objects;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class Reference
{

  @Override
  public String toString()
  {
    return String.format("Reference[name=%s, index=%s, type=%s]", type, name, index, type );  }

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
    Reference other = (Reference) obj;
    return Objects.equals(index, other.index) && Objects.equals(name, other.name);
  }


  public Reference(String name)
  {
    this.name  = name == null ? null : name.trim();
    this.index = null;
  }

  public Reference(String name, String index)
  {
    this.name  = name == null ? null : name.trim();
    this.index = index;
  }
  
  public Reference(String name, String index, Class<?> type)
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