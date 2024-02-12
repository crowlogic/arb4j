package arb.expressions;

import java.util.Objects;

import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 * @param <F>
 */
public class VariableReference<D, R, F extends Function<D, R>>
{

  @Override
  public String toString()
  {
    return index != null ? String.format("%s[%s]", name, index) : name;

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

  public boolean isMultivariate()
  {
    return name.startsWith("(") && name.endsWith(")");
  }

  public Class<?> type()
  {
    return type;
  }

}