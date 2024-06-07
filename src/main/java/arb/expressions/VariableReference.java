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
public class VariableReference<D, R, F extends Function<? extends D, ? extends R>>
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

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    VariableReference<?,?,?> other = (VariableReference<?,?,?>) obj;
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
      return String.format("%s_{%s}", name, index.typeset());
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

  public boolean isElse()
  {
    return "else".equals(name) && index == null;
  }

  public boolean isHypergeometricFunction()
  {
    return "pFq".equals(name) || "F".equals(name);
  }

  public boolean isBinomialCoeffecient()
  {
    return "C".equals(name);
  }
  
  public <E, S, G extends Function<? extends E, ? extends S>>
         VariableReference<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new VariableReference<E, S, G>(name,
                                          index == null ? null : index.spliceInto(newExpression),
                                          type);
  }

}