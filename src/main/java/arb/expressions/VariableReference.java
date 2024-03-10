package arb.expressions;

import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class VariableReference<D, R, F extends Function<D, R>>
{

  @Override
  public String toString()
  {
    return index != null ? String.format("%s[%s]", name, index.typeset()) : name;

  }

  public Class<?> type;

  @Override
  public int hashCode()
  {
    return Objects.hash(index, name);
  }

  @SuppressWarnings("rawtypes")
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
    assert !name.isEmpty() : "name is empty";
    this.name  = name == null ? null : name.trim();
    this.index = null;
  }

  public VariableReference(String name, Node<D, R, F> index)
  {
    assert !name.isEmpty() : "name is empty";
    this.name  = name == null ? null : Utensils.subscriptToRegular(name.trim());
    this.index = index;
  }

  public VariableReference(String name, Node<D, R, F> index, Class<?> type)
  {
    this(name,
         index);
    this.type = type;
  }

  public String        name;

  public Node<D, R, F> index;

  public String typeset()
  {
    if (index != null)
    {
      return String.format("%s_{%s}", name, index);
    }
    else
    {
      return name;
    }
  }

  public Class<?> type()
  {
    return type;
  }

}