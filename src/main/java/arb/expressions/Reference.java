package arb.expressions;

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
    return index == null ? name : String.format("%s[%s]", name, index);
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
  public boolean isTuple()
  {
    return name.startsWith("(") && name.endsWith(")");
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
}